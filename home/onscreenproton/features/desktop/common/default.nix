{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./mpv.nix
    ./libreoffice.nix
  ];

  home.packages = (with pkgs; [
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
      qbittorrent
      setzer
      tuba
      vscodium
      xournalpp
  ]) ++ (with pkgs.unstable; [
      #firefox-bin
      thunderbird-bin
      prusa-slicer
      vesktop
      r2modman
      sidequest
      alvr
  ]);
}
