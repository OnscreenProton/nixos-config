{ pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./osu.nix
    ./prism-launcher.nix
    ./steam.nix
  ];
  home = {
    packages = with pkgs; [
      gamescope
      osu-lazer-bin
      prismlauncher-qt5
    ];
  };
}
