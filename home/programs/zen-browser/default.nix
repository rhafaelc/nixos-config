{
  inputs,
  ...
}:

let
  system = "x86_64-linux";
  zenPackages = inputs.zen-browser.packages.${system};
  unwrapped = zenPackages.zen-browser-unwrapped;
  # The flake's 1.23.3b hash differs from the official release asset digest.
  # Stop applying the correction once the flake changes the affected hash.
  correctedUnwrapped =
    if unwrapped.src.outputHash == "sha256-d9cHicsaxIhxd0FpzxdQdy6J62cfSiWHJO9F1pyIbxU=" then
      unwrapped.override {
        hash = "sha256-uyBF0+IWVNQP6EElAJLurf0sH8gx7vtQkiJ3PIvcoUk=";
      }
    else
      unwrapped;
in
{
  home.packages = [
    (zenPackages.default.override {
      zen-browser-unwrapped = correctedUnwrapped;
    })
  ];
}
