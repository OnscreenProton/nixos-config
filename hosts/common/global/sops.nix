{ inputs, lib, config, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    age.keyFile = "/home/onscreenproton/.config/sops/age/keys.txt";
  };
}