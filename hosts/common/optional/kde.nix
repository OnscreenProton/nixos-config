{ config, pkgs, ... }:

{
  services ={
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };
    desktopManager.plasma6.enable = true;
  };

  programs.dconf.enable = true;
}
