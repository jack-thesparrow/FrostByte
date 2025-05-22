{ config, pkgs, ... }:
let
  aliases = {
    ".." = "cd ..";
    "cls" = "clear";
    "dots" = "cd && cd .dotfiles";
    "dost" = "dots";
    "vim" = "nvim";
  };
in
{
  programs = {
    fish = {
      shellAliases = aliases;
    };
    bash = {
      shellAliases = aliases;
    };
  };
}
