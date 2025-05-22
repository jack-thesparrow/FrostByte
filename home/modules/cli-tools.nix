{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    asciiquarium
    disfetch
    lolcat
    cowsay
    sl
    fastfetch
    htop
    highlight
    hollywood
    python313Packages.pygments
    unzip
    hwinfo
    tree
    ttyper
  ];
}
