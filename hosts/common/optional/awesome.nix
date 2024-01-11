{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "none+awesome";
      startx.enable = true;
    };
    windowManager.awesome = {
      enable = true;
    };
    desktopManager.gnome.enable = false;
  };
}
