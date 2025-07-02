{ pkgs, config, ... }:
{
  programs.waybar.settings = [
    {
      margin = "5 20 0 20";
      modules-left = [
        "custom/updates"
        "custom/spotify"
        "custom/cava"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "network"
        "pulseaudio"
        "backlight"
        "battery"
        "custom/ytube"
        "tray"
        "custom/recorder"
      ];

      "custom/updates" = {
        format = "   ";
        interval = 7200;
        on-click = "dolphin";
        signal = 8;
      };

      "custom/spotify" = {
        format = "  {}";
        interval = 5;
        on-click = "spotify";
        exec = "${./scripts/spotify.sh}";
      };

      "clock" = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%a | %d %b | %I:%M %p}";
      };

      "custom/cava" = {
        format = "{}";
        exec = "${./scripts/cava.sh}";
      };

      "network" = {
        format-wifi = "󰤨  {essid} ({signalStrength}%)";
        format-ethernet = "󰈁 Ethernet";
        format-disconnected = "󰤭 Disconnected";
        on-click = "${./scripts/nmtui.sh}";
      };

      "pulseaudio" = {
        reverse-scrolling = true;
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        format-muted = " {format_source}";
        format-source-muted = "Mute 🚫";
        format-icons = {
          headphone = "";
          default = [
            "🕨"
            "🕩"
            "🕪"
          ];
        };
        on-click = "pavucontrol";
        min-length = 13;
      };

      "backlight" = {
        device = "intel_backlight";
        format = "{percent}% {icon}";
        format-icons = [
          "🌑"
          "🌒"
          "🌓"
          "🌔"
          "🌕"
        ];
        min-length = 5;
      };

      "battery" = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = " {capacity}% {icon} ";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = [
          "▁"
          "▂"
          "▃"
          "▄"
          "▅"
        ];
      };

      "tray" = {
        icon-size = 16;
        spacing = 4;
      };

      "custom/recorder" = {
        exec = "${./scripts/record-status.sh}";
        interval = 1;
        on-click = "${./scripts/toggle-record.sh}";
        return-type = "json";
      };
    }
  ];
}
