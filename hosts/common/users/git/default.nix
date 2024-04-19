{ pkgs, config, ... }: {
  users.users.git = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = [
      "docker"
    ];
  };
}
