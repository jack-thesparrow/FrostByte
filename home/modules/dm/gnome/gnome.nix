{
  config,
  pkgs,
  lib,
  ...
}:

let
  # List of GNOME extensions to install and link
  gnomeExts = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
    user-themes
  ];
in
{
  imports = [
    ./dconf.nix
  ];

  programs.gnome-shell.enable = true;

  # GTK + icon theme
  gtk = {
    enable = true;
    theme = {
      name = "Orchis";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Tela";
      package = pkgs.tela-icon-theme;
    };
  };

  # Install themes, tweaks, and GNOME extensions
  home.packages =
    with pkgs;
    [
      orchis-theme
      tela-icon-theme
      gnome-tweaks
    ]
    ++ gnomeExts;

  # Symlink GNOME extensions to ~/.local so GNOME shell can see them
  home.activation.linkGnomeExtensions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ~/.local/share/gnome-shell/extensions
    ${builtins.concatStringsSep "\n" (
      map (ext: ''
        if [ -d "${ext}/share/gnome-shell/extensions" ]; then
          for d in ${ext}/share/gnome-shell/extensions/*; do
            ln -sf "$d" "$HOME/.local/share/gnome-shell/extensions/$(basename $d)"
          done
        fi
      '') gnomeExts
    )}
  '';
}
