{ config, inputs, pkgs, lib, ... }: {
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };
}