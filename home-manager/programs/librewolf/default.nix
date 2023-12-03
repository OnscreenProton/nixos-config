{ config, pkgs, ... }:

{
  programs.librewolf = {
  	enable = true;
    profiles = {
  	  onscreenproton = {
  	    id = 0;
  	    name = "OnscreenProton";
  	    search = {
  	    	force = true;
  	    	default = "";
  	    };
  	    userChrome = builtins.readFile(pkgs.fetchurl {
  	      url = "https://github.com/OnscreenProton/firefox-css/raw/main/userChrome.css";
  	      hash = "sha256-zs8qkNcPsFhsPeRp9UiHVIUDN6mpUW18ALZpCvw/r4I=";
  	    });
  	    extensions = with config.nur.repos.rycee.firefox-addons; [
  	      bitwarden
  	      clearurls
  	      fastforwardteam
  	      multi-account-containers
  	      languagetool
  	      mal-sync
  	      sidebery
  	      sponsorblock
  	      temporary-containers
  	      ublock-origin
  	      violentmonkey
  	      videospeed
  	    ];
        };
  	  };
    };
  };
}
