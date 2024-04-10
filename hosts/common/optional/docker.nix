{ pkgs, ... }: {
  virtualisation = {
    docker = {
      enable = true;
      package = pkgs.docker_25;
      enableNvidia = true;
    };
    containers.cdi.dynamic.nvidia.enable = true;
  };
  environment.systemPackages = with pkgs; [
    docker-buildx
    docker-compose
  ];
}
