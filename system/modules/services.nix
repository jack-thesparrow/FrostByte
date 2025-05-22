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
    pciutils
    vulkan-tools
    vulkan-validation-layers
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
