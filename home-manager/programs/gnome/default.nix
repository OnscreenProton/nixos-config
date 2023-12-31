{
  pkgs,
  outputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
  };
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "thunderbird.desktop"
        "vencorddesktop.desktop"
        "steam.desktop"
        "net.lutris.Lutris.desktop"
        "code.desktop"
        "org.gnome.Console.desktop"
        "org.gnome.Nautilus.desktop"
      ];

      disable-user-extensions = false;

      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
        "dash-to-panel@jderose9.github.com"
        "blur-my-shell@aunetx"
        "desktop-cube@schneegans.github.com"
        "burn-my-windows@schneegans.github.com"
        "gnome-fuzzy-app-search@Czarlie.gitlab.com"
        "flypie@schneegans.github.com"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      icon-theme = "Colloid-dark";
      gtk-theme = "Colloid-Dark";
    };
    "org/gnome/desktop/background" = {
      picture-uri = "https://github.com/NixOS/nixos-artwork/raw/master/wallpapers/nix-wallpaper-nineish.png";
      picture-uri-dark = "https://github.com/NixOS/nixos-artwork/raw/master/wallpapers/nix-wallpaper-nineish-dark-gray.png";
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.png";
      primary-color = "#3465a4";
      secondary-color = "#000000";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/shell/extensions/desktop-cube" = {
        last-first-gap = false;
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Colloid-Dark";
    };
    "org/gnome/shell/extensions/dash-to-panel" = {
      appicon-margin = 4;
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-panel
    gnomeExtensions.blur-my-shell
    gnomeExtensions.desktop-cube
    gnomeExtensions.burn-my-windows
    gnomeExtensions.fuzzy-app-search
    gnome.gnome-tweaks
    colloid-gtk-theme
    colloid-icon-theme
  ];
}
