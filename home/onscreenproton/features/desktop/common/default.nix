{ pkgs, ... }: {
  imports = [
    ./mpv.nix
    ./libreoffice.nix
  ];

  home.packages = (with pkgs; [
      alacritty
      bitwarden
      bottles
      cider
      freecad
      helvum
      inkscape
      mediawriter
      qbittorrent
      setzer
      tuba
      vscodium
      xournalpp
  ]) ++ (with pkgs.unstable; [
      firefox-bin
      thunderbird-bin
      prusa-slicer
      vesktop
      r2modman
  ]);
}
