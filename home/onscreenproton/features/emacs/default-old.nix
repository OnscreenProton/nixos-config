{ pkgs, inputs, ... }:
{
  imports = [ inputs.nix-doom-emacs.hmModule ];

  programs.doom-emacs = {
    enable = true;
    emacsPackage = pkgs.emacs29;
    doomPrivateDir = pkgs.callPackage ./doom.d {};
    #doomPrivateDir = ./doom.d-old;

    emacsPackagesOverlay = self: super: with pkgs.emacsPackages; {
      gitignore-mode = git-modes;
      gitconfig-mode = git-modes;
    };
  };
}
