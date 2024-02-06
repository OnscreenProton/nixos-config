# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{ pkgs, ... }: {
  # example = pkgs.callPackage ./example { };
  aerial-sddm-theme = pkgs.libsForQt5.callPackage ./aerial-sddm-theme {  };
}
