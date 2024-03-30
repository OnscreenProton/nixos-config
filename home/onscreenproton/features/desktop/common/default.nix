{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./mpv.nix
    ./libreoffice.nix
  ];

  home.packages = with pkgs; [
      alacritty
      bitwarden
      blender
      bottles
      cider
      freecad
      gnome.gnome-disk-utility
      helvum
      inkscape
      nextcloud-client
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
