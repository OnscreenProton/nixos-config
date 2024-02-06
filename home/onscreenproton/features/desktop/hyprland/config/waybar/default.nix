{ config, lib, pkgs, ... }:

let
  waybar_config = import ./catppuccin/config.nix;
  waybar_style = import ./catppuccin/style.nix;
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    #settings = waybar_config;
    #style = waybar_style;
  };
}
