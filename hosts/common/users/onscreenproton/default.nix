{ pkgs, config, ... }: {
  users.users.onscreenproton = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "networkmanager"
      "uinput"
    ];

    packages = [ pkgs.home-manager ];
  };
}