{ config, lib, pkgs, ... }:

{
  services.sunshine = {
    enable = true;
    package = pkgs.sunshine.override { cudaSupport = true; };
    capSysAdmin = true;
    openFirewall = true;
    applications = {
      env = {
        PATH = "$(PATH):$(HOME)/.local/bin";
      };
      apps = [
        {
          name = "Desktop";
          image-path = "desktop.png";
        }
        {
          name = "Steam Big Picture";
          detached = [
            "setsid steam steam://open/bigpicture"
          ];
          image-path = "steam.png";
        }
      ];
    };
  };
}
