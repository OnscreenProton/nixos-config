{ config, lib, pkgs, ... }:

{
  home.activation = {
    installConfig = ''
      if [ ! -d "${config.home.homeDirectory}/.config/awesome" ]; then
        ${pkgs.git}/bin/git clone --depth 1 --branch aura https://github.com/chadcat7/crystal ${config.home.homeDirectory}/.config/awesome
      fi
    '';
  };
  home.packages = with pkgs; [
    wl-clipboard
    sway-contrib.grimshot
    trash-cli
    xss-lock
    playerctl
    mpc-cli
    ffmpeg_5-full
    xdg-desktop-portal
    imagemagick
    xorg.xev
    redshift
    mpdris2
    pavucontrol
    fzf
  ];
}
