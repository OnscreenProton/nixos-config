{ inputs, outputs, config, pkgs, ...}: {
  imports = [ ../common ./apps.nix ];
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
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
        "gsconnect@andyholmes.github.io"
        "blur-my-shell@aunetx"
        "desktop-cube@schneegans.github.com"
        "burn-my-windows@schneegans.github.com"
        "gnome-fuzzy-app-search@Czarlie.gitlab.com"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "default";
      enable-hot-corners = false;
    };
    "org/gnome/Console" = {
      theme = "day";
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
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
    "org/gnome/desktop/peripherals/mouse" ={
      accel-profile = "flat";
      speed = "-0.19844357976653693";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/shell/extensions/desktop-cube" = {
        last-first-gap = false;
    };
  };
  home.packages = with pkgs; [
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.gsconnect
    gnomeExtensions.blur-my-shell
    gnomeExtensions.desktop-cube
    gnomeExtensions.burn-my-windows
    gnome.gnome-tweaks
    xdg-desktop-portal-gnome
  ];
}
