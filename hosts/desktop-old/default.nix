{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./sops.nix
    ./tailscale.nix
  ];
}