{ config, pkgs, ... }: {
  programs = {
    zsh = {
      initExtra = ''
        eval "$(atuin init zsh)"
      '';
    };
  };

  home.packages = with pkgs.unstable; [
    atuin
  ];

  xdg.configFile."atuin/config.toml".text = ''
    sync_address = "https://atuin.onscreenproton.us.to"
  '';
}
