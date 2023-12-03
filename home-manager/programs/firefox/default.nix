{ config, pkgs, ... }:

{
  programs.firefox = {
  	enable = true;
  	package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
  	  extraPolicies = {
  	  	CaptivePortal = false
  	  	DisableFirefoxStudies = true;
  	  	DisablePocket = true;
  	  	DisableTelemetry = true
  	  	DisableFirefoxAccounts = false;
  	  	OfferToSaveLogins = false
  	  	OfferToSaveLoginsDefault = false
  	  	PasswordManagerEnabled = false;
  	  	FirefoxHome = {
  	  	  Search = true;
  	  	  Pocket = false;
  	  	  Snippets = false;
  	  	  TopSites = false;
  	  	  Highlights = false;
  	  	};
  	  	UserMessaging = {
  	  	  ExtensionRecommendations = false;
  	  	  SkipOnboarding = true;
  	  	};
  	  };
  	};
  	extensions = with pkgs.nur.repos.rycee.firefox-addons; [
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
  	profiles = {
  	  onscreenproton = {
  	  	id = 0;
  	  	name = "OnscreenProton";
  	  	search = {
  	  		force = true;
  	  		default = ""
  	  	};
  	  	settings = {
  	  	  "general.smoothScroll" = true;

  	  	  # Hardware acceleration
  	  	  "gfx.webrender.all" = true;
  	  	  "media.ffmpeg.vaapi.enabled" = true;
  	  	  "media.rdd-vpx.enabled" = true;
  	  	  "widget.dmabuf.force-enabled" = true;

  	  	  # Enable reader button all the time
  	  	  "reader.parse-on-load.force-enabled" = true;
  	  	};
  	  	userChrome = pkgs.fetchurl = {
  	  	  url = "https://github.com/OnscreenProton/firefox-css/raw/main/userChrome.css";
  	  	  hash = "";
  	  	};
  	  }
  	}
  }
}
