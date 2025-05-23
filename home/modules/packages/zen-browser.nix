{
  pkgs,
  inputs,
  system,
  ...
}@args:
{
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${system}.default
  ];
}
