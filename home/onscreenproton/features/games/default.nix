{ pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./steam.nix
  ];
  home = {
    packages = with pkgs; [
      gamescope
      glfw-wayland-minecraft
      jdk17
      osu-lazer-bin
      prismlauncher-qt5
    ];
  };
}
