{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
  programs.firefox = {
    enable = true;
    policies = {
      AppAutoUpdate = false;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = false;
      DisableAccounts = false;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"

      /* ---- EXTENSIONS ---- */
      # Check about:support for extension/add-on ID strings.
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = {
        #"*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };

        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          installation_mode = "force_installed";
        };
        "addon@fastforward.team" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/fastforwardteam/latest.xpi";
          installation_mode = "force_installed";
        };
        "leechblockng@proginosko.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/leechblock-ng/latest.xpi";
          installation_mode = "force_installed";
        };
        "{61a05c39-ad45-4086-946f-32adb0a40a9d}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/linkding-extension/latest.xpi";
          installation_mode = "force_installed";
        };
        "{3c078156-979c-498b-8990-85f7987dd929}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
          installation_mode = "force_installed";
        };
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
        };
        "{c607c8df-14a7-4f28-894f-29e8722976af}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/temporary-containers/latest.xpi";
          installation_mode = "force_installed";
        };
        "{6b733b82-9261-47ee-a595-2dda294a4d08}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/yomitan/latest.xpi";
          installation_mode = "force_installed";
        };
        "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/violentmonkey/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      Preferences = {
        /* Essentially https://github.com/yokoffing/Betterfox */

        /* GENERAL */
        "content.notify.interval" = 100000;
        "webextensions.storage.sync.enabled" = lock-true;

        /* VAAPI/GFX */
        "gfx.canvas.accelerated.cache-items" = 4096;
        "gfx.canvas.accelerated.cache-size" = 512;
        "gfx.content.skia-font-cache-size" = 20;

        /* DISK CACHE */
        "browser.cache.jsbc_compression_level" = 3;

        /* MEDIA CACHE */
        "media.memory_cache_max_size" = 65536;
        "media.cache_readahead_limit" = 7200;
        "media.cache_resume_threshold" = 3600;

        /* IMAGE CACHE */
        "image.mem.decode_bytes_at_a_time" = 32768;

        /* NETWORK */
        "network.buffer.cache.size" = 262144;
        "network.buffer.cache.count" = 128;
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.pacing.requests.enabled" = lock-false;
        "network.dnsCacheExpiration" = 3600;
        "network.dns.max_high_preiority_threads" = 8;
        "network.ssl_tokens_cache_capacity" = 10240;

        /* SPECULATIVE LOADING */
        "network.dns.disablePrefetch" = lock-true;
        "network.prefetch-next" = lock-false;
        "network.predictor.enabled" = lock-false;

        /* EXPERIMENTAL FEATURES */
        "layout.css.grid-template-masonry-value.enabled" = lock-true;
        "dom.enable_web_task_scheduling" = lock-true;
        "layout.css.has-selector.enabled" = lock-true;
        "dom.security.sanitizer.enabled" = lock-true;

        "browser.contentblocking.category" = "strict";
        "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
        "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
        "network.cookie.sameSite.noneRequiresSecure" = lock-true;
        "browser.download.start_downloads_in_tmp_dir" = lock-true;
        "browser.helperApps.deleteTempFileOnExit" = lock-true;
        "browser.uitour.enabled" = lock-false;
        "privacy.globalprivacycontrol.enabled" = lock-true;
        "privacy.globalprivacycontrol.functionality.enabled" = lock-true;

        /* OCSP & CERTS / HPKP */
        "security.OCSP.enabled" = 0;
        "security.remote_settings.crlite_filters.enabled" = lock-true;
        "security.pki.crlite_mode" = 2;

        /* SSL / TLS */
        "security.ssl.treat_unsafe_negotiation_as_broken" = lock-true;
        "browser.xul.error_pages.expert_bad_cert" = lock-true;
        "security.tls.enable_0rtt_data" = lock-false;

        /* DISK AVOIDANCE */
        "browser.privatebrowsing.forceMediaMemoryCache" = lock-true;
        "browser.sessionstore.interval" = 60000;

        /* SHUTDOWN & SANITIZING */
        "privacy.history.custom" = lock-true;

        /* SEARCH / URL BAR */
        "browser.search.separatePrivateDefault.ui.enabled" = lock-true;
        "browser.urlbar.update2.engineAliasRefresh" = lock-true;
        "browser.search.suggest.enabled" = lock-true;
        "browser.urlbar.suggest.quicksuggest.sponsored" = lock-false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = lock-true;
        "browser.formfill.enable" = lock-false;
        "security.insecure_connection_text.enabled" = lock-true;
        "security.insecure_connection_text.pbmode.enabled" = lock-true;
        "network.IDN_show_punycode" = lock-true;

        /* HTTPS-FIRST POLICY */
        "dom.security.https_first" = lock-true;

        /* PASSWORDS */
        "signon.rememberSignons" = lock-false;
        "signon.formlessCapture.enabled" = lock-false;
        "signon.privateBrowsingCapture.enabled" = lock-false;
        "network.auth.subresource-http-auth-allow" = 1;
        "editor.truncate_user_pastes" = lock-false;

        /* ADDRESS + CREDIT CARD MANAGER */
        "extensions.formautofill.addresses.enabled" = lock-false;
        "extensions.formautofill.creditCards.enabled" = lock-false;

        /* MIXED CONTENT + CROSS-SITE */
        "security.mixed_content.block_display_content" = lock-true;
        "security.mixed_content.upgrade_display_content" = lock-true;
        "security.mixed_content.upgrade_display_content.image" = lock-true;
        "pdfjs.enableScripting" = lock-false;
        "extensions.postDownloadThirdPartyPrompt" = lock-false;

        /* HEADERS / REFERERS */
        "network.http.referer.XOriginTrimmingPolicy" = 2;

        /* CONTAINERS */
        "privacy.userContext.ui.enabled" = lock-true;

        /* WEBRTC */
        "media.peerconnection.ice.proxy_only_if_behind_proxy" = lock-true;
        "media.peerconnection.ice.default_address_only" = lock-true;

        /* SAFE BROWSING */
        "browser.safebrowsing.downloads.remote.enabled" = lock-false;

        /* MOZILLA */
        "permissions.default.desktop-notification" = 2;
        "permissions.default.geo" = 2;
        "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
        "permissions.manager.defaultsUrl" = "";
        "webchannel.allowObject.urlWhitelist" = "";

        /* TELEMETRY */
        "datareporting.policy.dataSubmissionEnabled" = lock-false;
        "datareporting.healthreport.uploadEnabled" = lock-false;
        "toolkit.telemetry.unified" = lock-false;
        "toolkit.telemetry.enabled" = lock-false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = lock-false;
        "toolkit.telemetry.newProfilePing.enabled" = lock-false;
        "toolkit.telemetry.shutdownPingSender.enabled" = lock-false;
        "toolkit.telemetry.updatePing.enabled" = lock-false;
        "toolkit.telemetry.bhrPing.enabled" = lock-false;
        "toolkit.telemetry.firstShutdownPing.enabled" = lock-false;
        "toolkit.telemetry.coverage.opt-out" = lock-true;
        "toolkit.coverage.opt-out" = lock-true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = lock-false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = lock-false;
        "browser.newtabpage.activity-stream.telemetry" = lock-false;

        /* EXPERIMENTS */
        "app.shield.optoutstudies.enabled" = lock-false;
        "app.normandy.enabled" = lock-false;
        "app.normandy.api_url" = "";

        /* CRASH REPORTS */
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = lock-false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = lock-false;

        /* DETECTION */
        "captivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = lock-false;
        "network.connectivity-service.enabled" = lock-false;

        /* MOZILLA UI */
        "browser.privatebrowsing.vpnpromourl" = "";
        "extensions.getAddons.showPane" = lock-false;
        "extensions.htmlaboutaddons.recommendations.enabled" = lock-false;
        "browser.discovery.enabled" = lock-false;
        "browser.shell.checkDefaultBrowser" = lock-false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = lock-false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = lock-false;
        "browser.preferences.moreFromMozilla" = lock-false;
        "browser.tabs.tabmanager.enabled" = lock-false;
        "browser.aboutConfig.showWarning" = lock-false;
        "browser.aboutwelcome.enabled" = lock-false;

        /* THEME ADJUSTMENTS */
        "toolkit.legacyUserProfileCustomizations.stylesheets" = lock-true;
        "browser.compactmode.show" = lock-true;
        "browser.display.focus_ring_on_anything" = lock-true;
        "browser.display.focus_ring_style" = 0;
        "browser.display.focus_ring_width" = 0;
        "layout.css.prefers-color-scheme.content-override" = 2;
        "browser.privateWindowSeparation.enabled" = lock-false; /* WINDOWS */

        /* COOKIE BANNER HANDLING */
        "cookiebanners.service.mode" = 1;
        "cookiebanners.service.mode.privateBrowsing" = 1;
        "cookiebanners.service.enableGlobalRules" = lock-true;

        /* FULLSCREEN NOTICE */
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.delay" = -1;
        "full-screen-api.warning.timeout" = 0;

        /* URL BAR */
        "browser.urlbar.suggest.calculator" = lock-true;
        "browser.urlbar.unitConversion.enabled" = lock-true;
        "browser.urlbar.trending.featureGate" = lock-false;

        /* NEW TAB PAGE */
        "browser.newtabpage.activity-stream.feeds.topsites" = lock-false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;

        /* POCKET */
        "extensions.pocket.enabled" = lock-false;

        /* DOWNLOADS */
        "browser.download.useDownloadDir" = lock-false;
        "browser.download.always_ask_before_handling_new_types" = lock-true;
        "browser.download.manager.addToRecentDocs" = lock-false;

        /* PDF */
        "browser.download.open_pdf_attachments_inline" = lock-true;

        /* TAB BEHAVIOR */
        "browser.bookmarks.openInTabClosesMenu" = lock-false;
        "browser.menu.showViewImageInfo" = lock-true;
        "findbar.highlightAll" = lock-true;
        "layout.word_select.eat_space_to_next_word" = lock-false;
      };
    };
  };
}
