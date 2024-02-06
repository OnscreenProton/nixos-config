{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    "$terminal" = "alacritty";
    "$volume" = "~/.config/hypr/scripts/volume";
    "$screenshot" = "~/.config/hypr/scripts/screenshot";
    "$lockscreen" = "~/.config/hypr/scripts/lockscreen";
    "$wlogout" = "~/.config/hypr/scripts/wlogout";
    "$files" = "thunar";
    "$browser" = "firefox";

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];

    bind = [
      "$mod SHIFT, E, exec, pkill Hyprland"
      "$mod, Q, killactive,"
      "$mod, F, fullscreen,"
      "$mod, G, togglegroup,"
      "$mod SHIFT, N, changegroupactive, f"
      "$mod SHIFT, P, changegroupactive, b"
      "$mod, R, togglesplit,"
      "$mod, T, togglefloating,"
      "$mod, P, pseudo,"
      "$mod ALT, ,resizeactive,"

      # screenshots
      "$mod SHIFT, S, exec, $screenshot --area"

      # utility
      # terminal
      "$mod, Return, exec, $terminal"
      # logout menu
      "$mod SHIFT, L, exec, $wlogout"
      # lock screen
      "$mod, L, exec, $lockscreen"

      # hyconv overview
      #"$mod, tab, hycov:toggleoverview"
      #"ALT, left, hycov:movefocus, l"
      #"ALT, right, hycov:movefocus, r"
      #"ALT, up, hycov:movefocus, u"
      #"ALT, down, hycov:movefocus, d"

      # move focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # cycle workspaces
      "$mod, bracketleft, workspace, m-1"
      "$mod, bracketright, workspace, m+1"

      # cycle monitors
      "$mod SHIFT, bracketleft, focusmonitor, l"
      "$mod SHIFT, bracketright, focusmonitor, r"

      # send focused workspace to left/right monitors
      "$mod SHIFT ALT, bracketleft, movecurrentworkspacetomonitor, l"
      "$mod SHIFT ALT, bracketright, movecurrentworkspacetomonitor, r"

      # open nm applet
      "$mod, N, exec, nm-connection-editor"
    ];
    bindr = [
      # launcher
      "$mod, SUPER_L, exec, pkill .anyrun-wrapped || anyrun"
    ];

    bindl = [
      # media controls
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"

      # volume
      ", XF86AudioMute, exec, $volume --toggle"
      ", XF86AudioMicMute, exec, $volume --toggle-mic"
    ];

    bindle = [
      # volume
      ", XF86AudioRaiseVolume, exec, $volume --inc"
      ", XF86AudioLowerVolume, exec, $volume --dec"
    ];
  };
}
