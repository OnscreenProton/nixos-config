{ config, lib, inputs, pkgs, ... }:

{
  imports = [
    ../common

    ./environment.nix
    ./keybinds.nix
    ./settings.nix
    ./packages.nix

    #./config/waybar

    ./anyrun.nix

    inputs.anyrun.homeManagerModules.default
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;

    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

    plugins = [
      #inputs.hycov.packages.${pkgs.system}.hycov
      #inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
  };

  systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];

  xdg.configFile = {
    "hypr/mako" = {
      source = ./config/mako;
      recursive = true;
    };
    "hypr/scripts" = {
      source = ./config/scripts;
      recursive = true;
    };
    "hypr/waybar" = {
      source = ./config/waybar;
      recursive = true;
    };
    "hypr/wlogout" = {
      source = ./config/wlogout;
      recursive = true;
    };

    "mpd" = {
      source = ./config/mpd;
      recursive = true;
    };
  };
}
