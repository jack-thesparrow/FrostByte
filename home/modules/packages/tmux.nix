{ pkgs, ... }:
{

  programs.tmux = {
    enable = true;
    terminal = "xterm-256color"; # Important
    keyMode = "vi";

    extraConfig = ''
      # Enable truecolor support
      set -as terminal-overrides ",*:Tc"

      # Set status bar lengths
      set -g status-left-length 100
      set -g status-right-length 100

      # Load plugins
      run-shell ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/tmux-resurrect/resurrect.tmux
      run-shell ${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/tmux-sensible/sensible.tmux
    '';

  };

  home.packages = with pkgs; [
    tmuxPlugins.resurrect
    tmuxPlugins.sensible
  ];

}
