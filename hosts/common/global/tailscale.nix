{
  config,
  pkgs,
  outputs,
  ...
}: {
  imports = [outputs.nixosModules.tailscale-autoconnect];

  services.tailscale.enable = true;
  networking.firewall = {
    checkReversePath = "loose";
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };


  services.tailscaleAutoconnect = {
    enable = true;
    
    authkeyFile = config.sops.secrets.tailscale_key.path;
    loginServer = "https://vpn.onsc.us.to"; #hehehehaw
    advertiseExitNode = false;
  };

  sops.secrets.tailscale_key = {
    sopsFile = ./secrets.yaml;
  };
}