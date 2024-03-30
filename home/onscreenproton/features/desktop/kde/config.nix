{ config, inputs, pkgs, ... }:

{
  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

  home.packages = with pkgs; [
    bibata-cursors
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      cursorTheme = "Bibata-Modern-Classic";
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        height = 46;
        floating = true;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config.General.icon = "nix-snowflake";
          }
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General.launchers = [
                "applications:firefox.desktop"
                "applications:thunderbird.desktop"
                "applications:bitwarden.desktop"
                "applications:emacs.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:org.kde.dolphin.desktop"
              ];
            };
          }
          "org.kde.plasma.pager"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.notifications"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    spectacle.shortcuts = {
      launch = "Meta+S";
    };

    shortcuts = {
      ksmserver = {
        "Lock Session" = [ "Screensaver" "Meta+Ctrl+Alt+L" ];
      };
    };

    configFile = {
      "kwinrc"."plugins"."wobblywindowsEnabled" = true;
      "kwinrc"."Effect-wobblywindows"."Drag" = 85;
      "kwinrc"."Effect-wobblywindows"."Stiffness" = 10;
      "kwinrc"."Effect-wobblywindows"."WobblynessLevel" = 1;
    };
  };
}
