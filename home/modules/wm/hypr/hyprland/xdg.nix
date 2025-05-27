{ pkgs, config, ... }:
{
  #xdg.configFile."scripts/start.sh".source = ./scripts/start.sh;

  wayland.windowManager.hyprland.extraConfig = ''
    exec-once = swww init
    exec-once = sh -c "sleep 1" && swww img /home/rahul/.dotfiles/system/assets/walls/nix-default.jpg
    exec-once = nm-applet --indicator
    exec-once = waybar
    exec-once = dunst
  '';
}
