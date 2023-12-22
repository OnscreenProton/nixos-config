{ pkgs, ... }:

{
  home.packages = with pkgs.unstable; [
    sunshine
  ];
}
