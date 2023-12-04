{ pkgs, inputs, ... }:
{
  imports = [ inputs.nix-doom-emacs.hmModule ];

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;

    emacsPackagesOverlay = self: super: with pkgs.emacsPackages; {
      gitignore-mode = git-modes;
      gitconfig-mode = git-modes;
    };
  };
}