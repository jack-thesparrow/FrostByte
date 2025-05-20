{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    disfetch
    lolcat
    cowsay
    sl
    fastfetch
    htop
    hollywood
    unzip
    hwinfo
    tree
    ttyper
  ];
}
