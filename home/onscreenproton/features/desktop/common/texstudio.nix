{ pkgs, ... }:

{
  home.packages = with pkgs; [
    texstudio
    texlive.combined.scheme-full
  ];
 }
