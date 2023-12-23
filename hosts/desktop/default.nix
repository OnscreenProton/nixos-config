{ pkgs, inputs, lib, config, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/gnome.nix
    ../common/optional/grub.nix
    ../common/optional/pipewire.nix
    ../common/optional/gcc.nix
    ../common/optional/printing.nix
    ../common/users/onscreenproton

    outputs.nixosModules.sunshine
  ];

  networking = {
    hostName = "nixos";
    useDHCP = lib.mkDefault true;
    nameservers = [ "129.146.16.52" "129.146.16.52"]; # hehehehaw
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    bootspec.enable = true;
    kernelParams = [
      "quiet"
      "splash"
      "module_blacklist=i915"
    ];
  };

  programs = {
    dconf.enable = true;
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
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
    opentabletdriver.enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  services.sunshine.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
