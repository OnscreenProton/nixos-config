{ config, lib, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    alegreya
    alegreya-sans
    jetbrains-mono
    overpass
    julia-mono
    ibm-plex
  ];
}
