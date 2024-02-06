{ inputs, lib, config, pkgs, ... }:

{ 
  programs = {
    dconf.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
  };
}
