{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
      	"firefox.desktop"
      	"org.gnome.Console.desktop"
      	"org.gnome.Nautilus.desktop"
      ];

      disable-user-extensions = false;

      enabled-extensions = [
      	"trayIconsReloaded@selfmade.pl"
      	"Vitals@CoreCoding.com"
      	"sound-output-device-chooser@kgshank.net"
      	"space-bar@luchrioh"
      ]
    };
  	"org/gnome/desktop/interface" = {
  	  color-scheme = "prefer-dark";
  	};
  	"org/gnome/desktop/wm/preferences" = {
  	  workspace-names = [ "Main" ];
  	};
  	"org/gnome/desktop/background" = {
  	  picture-uri = pkgs.fetchUrl {
  	  	url = "https://github.com/NixOS/nixos-artwork/raw/master/wallpapers/nix-wallpaper-nineish.src.svg";
  	  	hash = "";
  	  };
  	  picture-uri-dark = pkgs.fetchUrl {
  	  	url = "https://github.com/NixOS/nixos-artwork/raw/master/wallpapers/nix-wallpaper-nineish-dark-gray.svg";
  	  	hash = "";
  	  };
  	};
  	"org/gnome/desktop/screensaver" = {
  	  picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.png";
  	  primary-color = "#3465a4";
  	  secondary-color = "#000000";
  	};
  };

  home.packages = with pkgs; [
  	gnomeExtensions.tray-icons-reloaded
  	gnomeExtensions.vitals
  	gnomeExtensions.sound-output-device-chooser
  	gnomeExtensions.space-bar
  ];
}
