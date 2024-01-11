{ config, lib, pkgs, ... }:

{
  systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };
}
