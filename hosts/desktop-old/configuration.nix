{ config, pkgs, lib, inputs, ... }: {
  # Autoupgrade
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # Clean up system weekly
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Use GRUB 2 with custom theme
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    configurationLimit = 5;
    gfxmodeEfi = "1920x1080";
    theme = pkgs.fetchzip {
      url = "https://github.com/AdisonCavani/distro-grub-themes/raw/master/themes/nixos.tar";
      hash = "sha256-KQAXNK6sWnUVwOvYzVfolYlEtzFobL2wmDvO8iESUYE=";
      stripRoot = false;
    };
  };

  boot.supportedFilesystems = [ "ext4" "btrfs" "fat" "ntfs" ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    liveRestore = false;
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [ "--all" ];
    };
  };

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # NetworkManager
  networking = {
    hostName = "nixos";
    firewall.checkReversePath = false;
    networkmanager.enable = true;
  };

  # Set localization and timezone
  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}