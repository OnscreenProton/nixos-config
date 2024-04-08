{ pkgs, inputs, outputs, lib, config, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/kde.nix
    ../common/optional/plymouth.nix
    ../common/optional/grub.nix
    ../common/optional/pipewire.nix
    ../common/optional/gcc.nix
    ../common/optional/printing.nix
    ../common/users/onscreenproton

  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
    nameservers = [ "129.146.16.52" "129.146.16.52"]; # hehehehaw
    firewall.enable = true;
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

  hardware = {
    nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };

      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    opentabletdriver.enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
