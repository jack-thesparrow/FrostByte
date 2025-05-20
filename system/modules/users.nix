# users.nix
{ config, pkgs, ... }:
{
  users.users.rahul = {
    isNormalUser = true;
    description = "Rahul Tudu";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };
  environment.shells = with pkgs; [ fish ];
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
}
