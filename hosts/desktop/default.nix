{ pkgs, inputs, lib, config, ... }: {
  imports = [
    #inputs.hardware.nixosModules.common-cpu-intel
    #inputs.hardware.nixosModules.common-gpu-nvidia
    #inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/optional/gnome.nix
    ../common/optional/grub.nix
    ../common/optional/pipewire.nix
    ../common/optional/gcc.nix
    ../common/optional/printing.nix
    ../common/users/onscreenproton
  ];

  networking = {
    hostName = "nixos";
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        1701 9001 # Weylus
      ];
    };
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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
