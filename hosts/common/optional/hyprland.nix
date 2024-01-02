{ inputs, lib, config, pkgs, ... }:

{ 
  programs = {
    dconf.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };

  security = {
    pam.services.swaylock.text = "auth include login";

    rtkit.enable = true;
  };

  services.greetd = let
    session = {
      command = "${lib.getExe config.programs.hyprland.package}";
      user = "mihai";
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
