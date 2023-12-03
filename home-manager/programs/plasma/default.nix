{ pkgs, plasma-manager, ... }:

{
  imports = [ plasma-manager.homeManagerModules.plasma-manager ];
  
  programs.plasma = {
    enable = true;

    # Some high-level settings:
    workspace.clickItemTo = "select";

    hotkeys.commands."Launch Konsole" = {
      key = "Meta+Alt+K";
      command = "konsole";
    };

    # Some mid-level settings:
    shortcuts = {
      ksmserver = {
        "Lock Session" = [ "Screensaver" "Meta+Ctrl+Alt+L" ];
      };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    };
    configFile = {
      kwinrc = {
        plugins = {
          "fallapartEnabled" = true;
          "wobblywindowsEnabled" = true;
        };

        "Effect-wobblywindows" = {
          "Drag" = 97;
          "MoveFactor" = 25;
          "Stiffness" = 1;
          "WobblynessLevel" = 4;
        };
      };
      plasmarc = {
        "Wallpapers" = {
          "usersWallpapers" = builtins.fetchurl {
            url = "https://github.com/NixOS/nixos-artwork/raw/master/wallpapers/nix-wallpaper-nineish-dark-gray.png";
            sha256 = "07zl1dlxqh9dav9pibnhr2x1llywwnyphmzcdqaby7dz5js184ly";
          };
        };
      };
    };
  };
}