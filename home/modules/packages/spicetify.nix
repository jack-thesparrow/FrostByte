{ pkgs, inputs, ... }:

let
  # get spicetify-nix packages for the current system
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  # import the flake's module for your system
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    # let Stylix set the theme
    # theme = spicePkgs.themes.catppuccin;
    # colorScheme = "mocha";
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      keyboardShortcut # vimium-like navigation
      copyLyrics # copy lyrics with selection
      # autoVolume
      # showQueueDuration
      # fullAppDisplay
      # hidePodcasts
    ];
    # enabledCustomApps = with spicePkgs.apps; [
    #   reddit
    #   lyricsPlus
    #   marketplace
    #   localFiles
    #   ncsVisualizer
    # ];
  };
}

