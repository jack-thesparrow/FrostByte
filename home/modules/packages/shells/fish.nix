{ pkgs, ... }:
{
  imports = [
    ./shell-aliases.nix
  ];
  programs.fish = {
    enable = true;
  };
}
