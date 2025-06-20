{ config, pkgs, ... }:

{
  imports = [
    ./shell-aliases.nix
  ];

  programs.bash = {
    enable = true;
    initExtra = ''
      # Direnv Hook
      eval "$(direnv hook bash)"
      #source "$(devenv activate bash)"
    '';
  };
}
