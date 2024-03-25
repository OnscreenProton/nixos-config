{ config, pkgs, ... }:

{
  services ={
    xserver = {
      enable = true;
      displayManager = {
        defaultSession = "plasma";
        sddm.enable = true;
      };
    };
    plasma6.enable = true;
  };

  programs.dconf.enable = true;
}
