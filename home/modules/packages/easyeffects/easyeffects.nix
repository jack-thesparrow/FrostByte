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
    After = [ "graphical-session.target" "pipewire.service" "pipewire-pulse.service" ];
    Requires = [ "pipewire.service" ];
  };

  Service = {
    ExecStartPre = "${pkgs.coreutils}/bin/sleep 3"; # delay to ensure pipewire is ready
    ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
    Restart = "on-failure";
  };

  Install = {
    WantedBy = [ "default.target" ];
  };
};

}
