{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/gnome.nix
    ../common/optional/grub.nix
    ../common/users/onscreenproton
  ];

  networking = {
    hostName = "nixos-server";
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    bootspec.enable = true;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };

      prime = {
        sync.enable = true;
      };

      open = false;
      nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  system.stateVersion = "23.05";
}
