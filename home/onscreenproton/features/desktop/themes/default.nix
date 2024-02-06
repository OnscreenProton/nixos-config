{ config, inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./gtk.nix
  ];

  # Use self defined color scheme from palettes directory
  colorscheme = inputs.nix-colors.colorSchemes.catppuccin-latte;
}
