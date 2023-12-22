{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/gnome.nix
    ../common/optional/grub.nix
    ../common/optional/docker.nix
    ../common/users/onscreenproton
  ];

  networking = {
    hostName = "nixos-server";
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = false;
    };
    nameservers = [ "129.146.16.52" "129.146.16.52"];
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
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dig
    sunshine
  ];

  system.stateVersion = "23.05";
}
