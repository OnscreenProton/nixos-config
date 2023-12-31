# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  pkgs,
  outputs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./programs
    ./themes
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "onscreenproton";
    homeDirectory = "/home/onscreenproton";
  };

  home.packages = with pkgs; [
    # Apps
    vscode
    firefox-bin
    lutris
    vesktop
    bottles
    bitwarden
    qbittorrent
    xclip
    thunderbird
    cartridges
    cinny-desktop

    # Utils
    rustup
    wlr-randr
    gnumake
    dunst
    appimage-run
    curl
    catimg
    wget
    bat
    nnn

    slurp
    wl-clipboard
    neovim
    btop
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
  	enable = true;
  	lfs.enable = true;
  	userName = "onscreenproton";
  	userEmail = "onscreenproton@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
