{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    killall
    ntfs3g
    pciutils
  ];

  services = {
    # Enable CUPS for printing
    printing.enable = true;

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
  security.rtkit.enable = true;
}
