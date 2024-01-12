{ inputs, outputs, config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
  ];

  home-manager.users.onscreenproton = {
    home.packages = with pkgs; [
      wslu
      wsl-open
      emacs29-pgtk
    ];

    home.stateVersion = "23.05";
  };

  wsl = {
    enable = true;
    defaultUser = "onscreenproton";
    startMenuLaunchers = true;
    nativeSystemd = true;
  };

  system.stateVersion = "23.05";
}
