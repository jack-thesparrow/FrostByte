{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.xe.driver.enable = lib.mkEnableOption "Enable Intel Xe GPU drivers for Arc A530M";

  config = lib.mkIf config.xe.driver.enable {
    boot.blacklistedKernelModules = [ "i915" ];
    boot.kernelModules = [ "xe" ];
    boot.kernelParams = [ "xe.force_probe=*" ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    services.xserver.videoDrivers = [ "xe" ];

    environment.systemPackages =
      with pkgs;
      [
        linux-firmware
        intel-media-driver
        intel-compute-runtime
        intel-vaapi-driver
        libvdpau-va-gl
        vulkan-loader
        vulkan-tools
        mesa
        fish
      ]
      ++ lib.optionals pkgs.stdenv.isx86_64 [
        driversi686Linux.intel-media-driver
        driversi686Linux.mesa
      ];

    environment.variables.WLR_NO_HARDWARE_CURSORS = "1";

    systemd.services.detect-arc-pci = {
      description = "Detect Intel Arc GPU PCI ID and write xe modprobe config";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.fish}/bin/fish -c ''
          set pci_id (lspci -nn | grep -i VGA | grep 8086: | string match -r -o '[0-9a-fA-F]{4}:[0-9a-fA-F]{4}' | head -n1)
          echo \"options xe force_probe=$pci_id\" | tee /etc/modprobe.d/xe-force-probe.conf
        ''";
      };
    };
  };
}
