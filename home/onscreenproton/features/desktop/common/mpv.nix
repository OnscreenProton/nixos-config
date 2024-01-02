{ pkgs, ... }:

{
  home.packages = with pkgs; [
    yt-dlp
  ];

  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
    ];
    scriptOpts = {
      thumbfast = {
        network = "yes";
        hwdec = "yes";
      };
    };
  };
}
