{ config, pkgs, ... }:
let
  aliases = {
    ".." = "cd ..";
    "cls" = "clear";
    "dots" = "cd && cd .dotfiles";
    "dost" = "dots";
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
