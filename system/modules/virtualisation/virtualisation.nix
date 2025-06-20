{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
    libvirt
    virt-viewer
    spice
    spice-gtk
    dnsmasq
  ];
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu_kvm;
      #networks.default = {
      #  forwardMode = "nat";
      #  dhcp.range = {
      #    start = "192.168.122.2";
      #    end = "192.168.122.245";
      #  };
      #  domain = "default";
      #};
    };
    spiceUSBRedirection.enable = true;
  };

  boot.kernelModules = [
    "kvm"
    "kvm-intel"
  ];
}
