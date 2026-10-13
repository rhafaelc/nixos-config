{
  pkgs,
  variables,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../nixos/hyprland
    ../../nixos/gaming
    ../../nixos/fcitx5
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.settings.auto-optimise-store = true;
  nix.settings.extra-substituters = [ "https://noctalia.cachix.org" ];
  nix.settings.extra-trusted-public-keys = [
    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = variables.hostname;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [
    "root"
    variables.username
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = variables.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = variables.locale;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez5-experimental;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true; # Enable experimental features
          FastConnectable = true; # Improve connection speed
          JustWorksRepairing = "always";
          controllerMode = "bredr"; # Allow low energy mode?
          MultiProfile = "multiple"; # Allow multiple profiles
          AutoEnable = true;
        };
      };
    };
  };

  services.blueman.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${variables.username} = {
    isNormalUser = true;
    description = variables.fullName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "docker"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Work around the pnpm dependency hash in the pinned nixpkgs package.
  # Stop applying the override once nixpkgs changes the affected hash.
  nixpkgs.overlays = [
    (_final: prev: {
      typescript-language-server =
        if
          prev.typescript-language-server.pnpmDeps.outputHash
          == "sha256-MUSxDMlbG21KSesGdEvqa2kEpuVfLlXRUX1qV/FGsSo="
        then
          prev.typescript-language-server.overrideAttrs (old: {
            pnpmDeps = old.pnpmDeps.overrideAttrs {
              outputHash = "sha256-xR/EF60lVBsITKgH7wCM2wHM46PFQevD51KfCENSUH4=";
            };
          })
        else
          prev.typescript-language-server;
    })
  ];

  environment.systemPackages = with pkgs; [ vim ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  system.stateVersion = "26.05";
}
