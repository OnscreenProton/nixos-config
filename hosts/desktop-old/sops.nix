{
  sops-nix,
  lib,
  config,
  ...
}: {
  imports = [
    sops-nix.nixosModules.sops
  ];

  sops = {
    age.keyFile = "~/.config/sops/age/keys.txt"
  };
}