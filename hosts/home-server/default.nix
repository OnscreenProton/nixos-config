{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/forgejo.nix
    ../common/optional/gnome.nix
    ../common/optional/grub.nix
    ../common/optional/docker.nix
    ../common/optional/vscode-server.nix
    ../common/users/onscreenproton
    ../common/users/git
  ];

  networking = {
    hostName = "nixos-server";
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 80 443 548 ];
    };
    nameservers = [ "129.146.16.52" "129.146.16.52"]; # hehehehaw
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    bootspec.enable = true;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };

  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.login1.suspend" ||
        action.id == "org.freedesktop.login1.suspend-multiple-sessions" ||
        action.id == "org.freedesktop.login1.hibernate" ||
        action.id == "org.freedesktop.login1.hibernate-multiple-sessions")
      {
        return polkit.Result.NO;
      }
    });
  '';
  
  hardware = {
    nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };

      prime = {
        sync.enable = true;

        nvidiaBusId = "PCI:1:00:0";
        intelBusId = "PCI:0:02:0";
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
  }; 

  services.logind.lidSwitchExternalPower = "ignore";
  services.xserver.videoDrivers = [ "nvidia" ];

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.netatalk = {
    enable = true;

    settings = {
      onsc-time-machine = {
        "time machine" = "yes";
        path = "/hdd/time-machine";
        "valid users" = "onscreenproton";
      };
    };
  };
  
  services.avahi = {
    enable = true;
    nssmdns4 = true;

    publish = {
      enable = true;
      userServices = true;
    };
  };

  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "24h";
  };

  services.samba = {
  	enable = true;
  	securityType = "user";
  	openFirewall = true;
  	shares = {
  	  private = {
  		path = "/hdd/smb";
  		browseable = "yes";
  		"read only" = "no";
  		"guest ok" = "no";
  		"create mask" = "0644";
  		"directory mask" = "0755";
  	  };
  	};
  };

  users.users.smb_user = {
  	isNormalUser = true;
  	createHome = false;
  };

  environment.systemPackages = [
  	pkgs.borgbackup
  ];

  users.users."onscreenproton".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFyLuBYz8glRYmVD0ZKC4CBdh+qks0zVggXpaXPRaHxZ user"
  ];

  system.stateVersion = "23.05";
}
