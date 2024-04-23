{ pkgs, ... }:

{
  imports = [
    ../common
    ./config.nix
  ];

  home.packages = with pkgs; [
    kdePackages.kleopatra
  ];
}
