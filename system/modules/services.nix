{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    aria2
    catimg
    file
    dconf
    evtest
    fzf
    gzip
    killall
    ntfs3g
    networkmanagerapplet
    pciutils
    ripgrep
    syncthing
    unzip
    vulkan-tools
    vulkan-validation-layers
    xdg-utils
    zip
  ];
  # This prevents the generating man-cache while nixos-rebuild switch
  documentation.man.generateCaches = false;

  imports = [ ./tlp.nix ];
  services = {
    # Bluetooth
    blueman.enable = true;
    # Enable CUPS for printing
    printing.enable = true;

    #Enable dconf services
    dbus.enable = true;

    # Enable sound with pipewire
    pulseaudio.enable = false;
    # Sound though pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    # Enable OpenSSH Daemon
    openssh.enable = true;

    # Enable syncing
    syncthing = {
      enable = true;
      user = "rahul";
      dataDir = "/home/rahul/Documents/";
      configDir = "/home/rahul/.config/syncthing";
    };

    logind = {
      powerKey = "suspend";
    };
    # Swap escape and capslock
    xserver = {
      xkb = {
        layout = "us";
        options = "caps:swapescape";
      };
    };

    # Virt manager

    # Firewall
    #    jelllyfin = {
    #      enable = true;
    #      openFirewall = true;
    #    };
  };
  #hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
}
