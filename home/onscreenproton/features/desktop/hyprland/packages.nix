{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar # status bar
    swaybg # wallpaper
    swayidle # idle timeout
    swaylock # locking the screen
    wlogout # logout menu
    wl-clipboard # copy/paste

    polkit_gnome # elevating permissions

    grim # taking screenshots
    slurp # selecting region to screenshot

    mako # notification daemon

    alsa-utils
    networkmanagerapplet
  ];
}
