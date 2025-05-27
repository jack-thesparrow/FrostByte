{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    aria2
    file
    dconf
    evtest
    fzf
    killall
    ntfs3g
    networkmanagerapplet
    pciutils
    ripgrep
    syncthing
    vulkan-tools
    vulkan-validation-layers
    xdg-utils
  ];
  # This prevents the generating man-cache while nixos-rebuild switch
  documentation.man.generateCaches = false;

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
