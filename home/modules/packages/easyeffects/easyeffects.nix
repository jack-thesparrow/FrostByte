{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = [
    pkgs.easyeffects
  ];

  systemd.user.services.easyeffects = {
    Unit = {
      Description = "EasyEffects Background Service";
      After = [
        "graphical-session.target"
        "pipewire.service"
        "pipewire-pulse.service"
      ];
      Requires = [ "pipewire.service" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "dbus";
      BusName = "com.github.wwmm.easyeffects";
      ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";

      ExitOnSession = true;
      KillMode = "mixed";
      TimeoutStopSec = "5s";

      # Optional: log a message on stop
      ExecStopPost = "${pkgs.coreutils}/bin/echo EasyEffects stopped cleanly";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
