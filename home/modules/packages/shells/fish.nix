{ pkgs, lib, ... }:

{
  imports = [
    ./shell-aliases.nix
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Environment tweaks
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      set -gx PAGER less

      # Less annoying terminal behavior
      set -gx LESS '-R'

      # Add user scripts to PATH
      set -U fish_user_paths $HOME/.local/bin $fish_user_paths
    '';

    shellAbbrs = {
      rebuild = "home-manager switch --flake ~/.dotfiles#rahul@nixos";
      lg = "lazygit";
      gs = "git status";
      update = "nix flake update ~/.dotfiles";
    };

    plugins = with pkgs.fishPlugins; [
      {
        name = "tide";
        inherit (tide) src;
      }
      {
        name = "z";
        inherit (z) src;
      }
      {
        name = "done";
        inherit (done) src;
      }
      {
        name = "pisces";
        inherit (pisces) src;
      }
    ];
  };

  # Tide prompt auto-configure
  home.activation.configure-tide = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.fish}/bin/fish -c "
      tide configure --auto \
        --style=Lean \
        --prompt_colors='True color' \
        --show_time=No \
        --lean_prompt_height='Two lines' \
        --prompt_connection=Solid \
        --prompt_connection_andor_frame_color=Dark \
        --prompt_spacing=Sparse \
        --icons='Many icons' \
        --transient=Yes
    "
  '';
}
