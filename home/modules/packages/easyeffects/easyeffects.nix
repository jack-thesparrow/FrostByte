{
  config,
  pkgs,
  lib,
  ...
}:

let
  presetName = "AutoIRS";
  homeDir = config.home.homeDirectory;

  # Define the wrapper script once
  easyeffectsLauncher = pkgs.writeShellScriptBin "easyeffects-launch" ''
    ${pkgs.easyeffects}/bin/easyeffects --gapplication-service &
    sleep 2
    ${pkgs.easyeffects}/bin/easyeffects -l "${presetName}"
  '';
in
{
  home.packages = [
    pkgs.easyeffects
    easyeffectsLauncher
  ];

  # IRS file
  home.file."easyeffects/irs/SoundUpgrade.irs" = {
    source = ./irs/SoundUpgrade.irs;
  };

  # Convolver preset with IRS
  home.file."easyeffects/output/${presetName}.json" = {
    text = builtins.toJSON {
      "convolver" = {
        "input-gain" = 0.0;
        "irs" = [
          {
            "path" = "${homeDir}/.config/easyeffects/irs/SoundUpgrade.irs";
            "enabled" = true;
          }
        ];
        "output-gain" = 0.0;
        "mix" = 1.0;
        "mode" = "Stereo";
      };
      "plugin-settings-version" = 1;
    };
  };

  # Systemd user service with the preset
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
      Type = "simple";
      ExecStart = "${easyeffectsLauncher}/bin/easyeffects-launch";
      ExitOnSession = true;
      KillMode = "mixed";
      TimeoutStopSec = "5s";
      ExecStopPost = "${pkgs.coreutils}/bin/echo EasyEffects stopped cleanly";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
