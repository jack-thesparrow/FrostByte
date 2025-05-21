{ config, pkgs, ... }:

let
  irsSourceDir = ./irs;
in
{
  home.packages = [
    pkgs.easyeffects
  ];

  # Symlink IRS files
  xdg.configFile."easyeffects/irs".source = irsSourceDir;

  # Start EasyEffects in background on login
  systemd.user.services.easyeffects = {
    Unit = {
      Description = "EasyEffects background service";
      After = [
        "graphical-session.target"
        "pipewire.service"
        "pipewire-pulse.service"
      ];
      Requires = [ "pipewire.service" ];
    };

    Service = {
      Type = "dbus";
      BusName = "com.github.wwmm.easyeffects";
      ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
      Restart = "on-failure";
      KillMode = "mixed";
      ExitOnSession = true;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
