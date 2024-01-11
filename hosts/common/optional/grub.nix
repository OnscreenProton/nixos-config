{ config, pkgs, lib, inputs, outputs, ... }: {
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
}