{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./features/emacs
    ./features/games
    ./features/nextcloud
    #./features/desktop/gnome
    ./features/desktop/kde
    #./features/desktop/hyprland
    ./features/desktop/themes
    #./features/sunshine
  ];
}
