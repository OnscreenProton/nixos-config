# Doesn't work right now...

{ config, lib, ... }: let
  cfg = config.network.dns-settings;
in {
  options.network.dns-settings = {
    enable = lib.mkEnableOption "dns-settings";
    server = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    networking = {
      nameservers = [ "127.0.0.1" "::1" ];
      dhcpcd.extraConfig = "nohook resolv.conf";
      networkmanager.dns = "none";
    };

    services.dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;

        static.privatedns = cfg.server;
      };
    };

    systemd.services.dnscrypt-proxy2.serviceConfig = {
      StateDirectory = "dnscrypt-proxy";
    };
  };
}
