{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./features/emacs
    ./features/games
    ./features/nextcloud
    ./features/desktop/gnome
    #./features/sunshine
  ];
}
