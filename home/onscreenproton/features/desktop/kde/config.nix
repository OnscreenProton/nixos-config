{ config, inputs, pkgs, ... }:

{
  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.breeze.desktop";
      cursorTheme = "Bibata-Modern-Classic";
      iconTheme = "Breeze";
      wallpaper = "${pkgs.libsForQt5.plasma-workspace-wallpapers}/share/wallpapers/summer_1am/contents/images/2560x1440.jpg";
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        height = 46;
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
                "applications:emacs.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:org.kde.dolphin.desktop"
              ];
            };
          }
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.pager"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    configFile = {
      "kwinrc"."plugins"."wobblywindowsEnabled" = true;
      "kwinrc"."Effect-wobblywindows"."Drag" = 85;
      "kwinrc"."Effect-wobblywindows"."Stiffness" = 10;
      "kwinrc"."Effect-wobblywindows"."WobblynessLevel" = 1;
      "kscreenlockerrc"."Greeter"."WallpaperPlugin" = "org.kde.potd";
    };
  };
}
