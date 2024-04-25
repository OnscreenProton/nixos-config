{ pkgs, ... }: {
  home.packages = with pkgs; [
    binutils
    (ripgrep.override { withPCRE2 = true; })
    gnutls
    fd
    sqlite
    marksman
    editorconfig-core-c
    ispell
    unzip
    imagemagick
    emacs29-pgtk
    emacsPackages.vterm
    emacsPackages.nerd-icons
    libvterm
  ];
}
