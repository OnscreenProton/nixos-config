{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./helix.nix
    ./tectonic.nix
    ./zsh.nix
  ];
  home.packages = (with pkgs; [
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
  ]) ++ (with pkgs.unstable; [
      inshellisense
  ]);
}
