{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
  ];
  systemd.user.timers.obsidian-autogit = {
    wantedBy = {
      "timers.target" = true;
    };
    timerConfig = {
      onCalendar = "*:0/10";
      Persistent = true;
    };
  };

  systemd.user.services.obsidian-autogit = {
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c '${./obsidian-autogit.sh}'";
    };
  };
}
