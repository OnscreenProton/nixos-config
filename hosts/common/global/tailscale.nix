{
  config,
  pkgs,
  outputs,
  ...
}: {
  imports = [outputs.nixosModules.tailscale-autoconnect];

  services.tailscaleAutoconnect = {
    enable = true;

    authkeyFile = config.sops.secrets.tailscale_key.path;
    loginServer = "https://vpn.onsc.us.to";
    advertiseExitNode = false;
  };

  sops.secrets.tailscale_key = {
    sopsFile = ./secrets.yaml;
  };
}