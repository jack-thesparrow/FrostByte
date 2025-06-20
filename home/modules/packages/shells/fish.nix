{ pkgs, lib, ... }:

{
  imports = [
    ./shell-aliases.nix
  ];

  programs.fish = {
    enable = true;

    #plugins = with pkgs.fishPlugins; [
    #  tide
    #  z
    #  done
    #  pisces
    #];

    shellInit = ''
      set -g fish_greeting "Welcome back $USER"
    '';

    interactiveShellInit = ''
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      set -gx PAGER less
      set -gx LESS '-R'
      set -U fish_user_paths $HOME/.local/bin $fish_user_paths

      # Direnv Hook
      direnv hook fish | source
      #source (devenv activate fish)
    '';

    shellAbbrs = {
      rebuild = "home-manager switch --flake ~/.dotfiles#rahul@nixos";
      lg = "lazygit";
      gs = "git status";
      update = "nix flake update ~/.dotfiles";
    };
  };
}
