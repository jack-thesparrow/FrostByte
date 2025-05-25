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
    };
    spiceUSBRedirection.enable = true;
  };

  boot.kernelModules = [
    "kvm"
    "kvm-intel"
  ];
}
