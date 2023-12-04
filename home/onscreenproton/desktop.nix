{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./features/games
    ./features/desktop/gnome
  ];
}