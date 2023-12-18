{ pkgs, ... }: {
  home.packages = with pkgs; [
    pika-backup
    newsflash
    shortwave
    gnome-podcasts
    lollypop
    pinentry-gnome
  ];
}
