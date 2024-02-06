_: {
  mainBar = {
    position = "top";
    layer = "top";
    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
      "temperature"
      "backlight"
    ];
    modules-center = [
      "hyprland/window"
      "clock"
    ];
    modules-right = [
      "pulseaudio"
      "battery"
      "network"
      "idle_inhibitor"
      "tray"
      "custom/powermenu"
    ];

    "hyprland/workspaces" = {
      format = "icon";
      on-click = "activate";
      format-icons = {
        active = "";
        default = "";
      };
    };

    clock = {
      interval = "60";
      align = "0";
      rotate = "0";
      tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
      format = " {:%H:%M}";
      format-alt = " {:%a %b %d, %G}";
    };

    "custom/launcher" = {
      format = "\uf313 ";
      on-click = "$HOME/.config/hypr/scripts/menu";
      tooltip = "false";
    };

    "custom/powermenu" = {
      format = "\uf011";
      on-click = "$HOME/.config/hypr/scripts/wlogout";
      tooltip = false;
    };

    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        "activated" = "\uf06e";
        "deactivated" = "\uf070";
      };
      tooltip = "false";
    };

    network = {
      interval = "5";
      # "interface" = "wlan*"; // (Optional) To force the use of this interface, set it for netspeed to work
      format-wifi = " {essid}";
      format-ethernet = " {ipaddr}/{cidr}";
      format-linked = " {ifname} (No IP)";
      format-disconnected = "睊 Disconnected";
      format-disabled = "睊 Disabled";
      format-alt = " {bandwidthUpBytes} |  {bandwidthDownBytes}";
      tooltip-format = " {ifname} via {gwaddr}";
      on-click-middle = "nm-connection-editor";
      on-click-right = "alacritty nmtui";
    };

    pulseaudio = {
      # format = "{volume}% {icon} {format_source}"''
      format = "{icon} {volume}%";
      format-muted = " Mute";
      format-bluetooth = " {volume}% {format_source}";
      format-bluetooth-muted = " Mute";
      format-source = " {volume}%";
      format-source-muted = "";
      format-icons = {
        "headphone" = "";
        "hands-free" = "";
        "headset" = "";
        "phone" = "";
        "portable" = "";
        "car" = "";
        "default" = [
          ""
          ""
          ""
        ];
      };
      scroll-step = "5.0";
      # Commands to execute on events
      on-click = "amixer set Master toggle";
      on-click-right = "pavucontrol";
      smooth-scrolling-threshold = "1";
    };

    backlight = {
      format = "{icon} {percent}%";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
      ];
    };

    tray = {
      icon-size = "15";
      spacing = "5";
    };

    battery = {
      bat = "BAT0";
      adapter = "ADP0";
      interval = "60";
      states = {
        warning = "30";
        critical = "15";
      };
      max-length = "20";
      format = "{icon} {capacity}%";
      format-warning = "{icon} {capacity}%";
      format-critical = "{icon} {capacity}%";
      format-charging = "<span font-family='Font Awesome 6 Free'></span> {capacity}%";
      format-plugged = " {capacity}%";
      format-alt = "{icon} {time}";
      format-full = " {capacity}%";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
    };
  };
}
