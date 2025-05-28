{ pkgs, variables, ... }:
{
  # Styling Options
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    image = variables.stylixImage; # Fixed line
    polarity = "dark";
    opacity = {
      applications = 0.8;
      desktop = 0.0;
      terminal = 0.75;
      popups = 0.75;
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
    targets = {
      gtk.enable = true;
      qt.enable = true;
      nixos-icons.enable = true;
      ghostty.enable = true;

      fish.enable = true;
      waybar = {
        enable = true;
        addCss = true;
        #        enableLeftBackColors = false;
        #        enableCenterBackColors = false;
        #        enableRightBackColors = false;
      };
    };
  };
}
