{ pkgs, ... }: {
  home.packages = with pkgs; [
    binutils
    (ripgrep.override { withPCRE2 = true; })
    gnutls
    fd
    sqlite
    editorconfig-core-c
    ispell
    unzip
    imagemagick
    emacs29-gtk3
    emacsPackages.vterm
    emacsPackages.adwaita-dark-theme
    emacsPackages.nerd-icons
    python3Minimal
    python311Packages.pygments
  ];
}
