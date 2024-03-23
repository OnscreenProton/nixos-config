{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        #theme = "aerial-sddm-theme";
      };
    };
  };
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    #(pkgs.aerial-sddm-theme.override {
    #  themeConfig.General = {
    #    day_time_start = "7";
    #    day_time_end = "19";
    #    background_vid_day = "${pkgs.aerial-sddm-theme}/share/sddm/themes/aerial-sddm-theme/playlists/day.m3u";
    #    background_vid_night = "${pkgs.aerial-sddm-theme}/share/sddm/themes/aerial-sddm-theme/playlists/night.m3u";
    #    displayFont = "Misc Fixed";
    #    passwordLeftMargin = "15";
    #    relativePositionX = "0.5";
    #    relativePositionY = "0.75";
    #    showLoginButton = "false";
    #    type = "color";
    #    usernameLeftMargin = "15";
    #    showTopBar = "true";
    #    autofocusInput = "true";
    #  };
    #})
  ];
}
