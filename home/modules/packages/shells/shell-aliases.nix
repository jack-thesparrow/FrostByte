{ config, pkgs, ... }:
let
  aliases = {
    ".." = "cd ..";
    "cls" = "clear";
    "hcat" = "highlight -O ansi --force";
    "dots" = "cd && cd .dotfiles";
    "dost" = "dots";
    "ref" = "cd && cd references";
    "vim" = "nvim";
    "nivm" = "nvim";
    "pj" = "cd && cd .projects";
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
