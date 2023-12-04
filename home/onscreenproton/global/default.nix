{ inputs, lib, pkgs, config, outputs, ... }: {
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = "onscreenproton";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.05";
    sessionPath = [ "$HOME/.local.bin" ];
  };
}