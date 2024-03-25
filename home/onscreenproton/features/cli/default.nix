{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./helix.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    bc
    bottom
    ncdu
    eza
    ripgrep
    fd
    httpie
    diffsitter
    jq
    micro

    nil
    nixfmt
    wl-clipboard

    tectonic
  ];
}
