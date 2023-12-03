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
        "org.gnome.Console.desktop"
        "org.gnome.Nautilus.desktop"
      ];

      disable-user-extensions = false;

      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
        "dash-to-panel@jderose9.github.com"
        "space-bar@luchrioh"
        "blur-my-shell@aunetx"
        "desktop-cube@schneegans.github.com"
        "burn-my-windows@schneegans.github.com"
        "gnome-fuzzy-app-search@Czarlie.gitlab.com"
        #"flypie@schneegans.github.com"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
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
    "org/gnome/shell/extensions/user-theme" = {
      name = "adwaita";
    };
    "org/gnome/shell/extensions/dash-to-panel" = {
      intellihide = true;
    };
    "org/gnome/shell/extensions/desktop-cube" = {
      last-first-gap = false;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
  };

  home.packages = with pkgs.unstable; [
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-panel
    gnomeExtensions.space-bar
    gnomeExtensions.blur-my-shell
    gnomeExtensions.desktop-cube
    gnomeExtensions.burn-my-windows
    gnomeExtensions.fuzzy-app-search
    #gnomeExtensions.allow-locked-remote-desktop
  ];
}
