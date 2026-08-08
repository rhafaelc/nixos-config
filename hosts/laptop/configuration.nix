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
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
