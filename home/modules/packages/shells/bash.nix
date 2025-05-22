{ config, pkgs, ... }:
{
  imports = [
    ./shell-aliases.nix
  ];
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
