{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./features/emacs
    ./features/games
    ./features/desktop/gnome
    #./features/sunshine
  ];
}
