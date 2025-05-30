{
  config,
  pkgs,
  variables,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      playerctl
      brightnessctl
    ];
    systemd.user.targets.hyprland-session.Unit.Wants = [
      "xdg-desktop-autostart.target"
    ];

    wayland.windowManager.hyprland = {
      enable = true;

      systemd = {
        enable = true;
        enableXdgAutostart = true;
        variables = [ "--all" ];
      };

      xwayland.enable = true;

      settings = {
        general = {
          "$mainMod" = "SUPER";

          layout = "dwindle";
          border_size = 2;
          gaps_in = 5;
          gaps_out = 20;
          resize_on_border = false;
        };

        decoration = {
          blur.enabled = true;
          shadow.enabled = true;
          rounding = 5;
          rounding_power = 4.0;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
      };
      #      extraConfig = ''
      #        exec-once = ~/.dotfiles/home/modules/wm/hypr/scripts/start.sh
      #      '';
    };
  };
}
