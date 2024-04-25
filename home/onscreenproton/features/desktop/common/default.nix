{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./mpv.nix
    ./libreoffice.nix
  ];

  home.packages = with pkgs; [
    anki-bin
    bitwarden
    blender
    bottles
    cider
    freecad
    gnome.gnome-disk-utility
    helvum
    inkscape
    krita
    nextcloud-client
    mediawriter
    mumble
    obsidian
    planify
    prusa-slicer
    qbittorrent
    thunderbird-bin
    vesktop
    vscode
    xournalpp
  ];
}
