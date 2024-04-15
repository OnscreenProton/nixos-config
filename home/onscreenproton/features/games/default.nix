{ pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./steam.nix
  ];
  home = {
    packages = with pkgs; [
      gamescope
      glfw-wayland-minecraft
      osu-lazer-bin
      prismlauncher-qt5
    ];
  };
}
