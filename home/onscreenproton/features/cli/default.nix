{ pkgs, ... }: {
  imports = [
    ./git.nix
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
    nix-inspect
  ]
}