{ pkgs, config, ... }:
{
  #xdg.configFile."scripts/start.sh".source = ./scripts/start.sh;

  #exec-once = sh -c "sleep 1" && swww img /home/rahul/.dotfiles/system/assets/walls/nix-default.jpg
  #exec-once = swww init
  #exec-once = dunst
  wayland.windowManager.hyprland.extraConfig = ''
    exec-once = nm-applet --indicator
  '';
}
