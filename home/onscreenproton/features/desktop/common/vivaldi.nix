{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    vivaldi
    # vivaldi-ffmpeg-codecs
  ];
}
