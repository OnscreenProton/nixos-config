{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./mpv.nix
    ./libreoffice.nix
  ];

  home.packages = with pkgs; [
      alacritty
      bitwarden
      bottles
      cider
      freecad
      gnome.gnome-disk-utility
      helvum
      inkscape
      mediawriter
      mumble
      planify
      prusa-slicer
      qbittorrent
      setzer
      thunderbird-bin
      tuba
      vesktop
      vscode
      xournalpp
  ];
}
