{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    xe.driver.enable = lib.mkEnableOption "Enable Intel Xe GPU drivers for Arc A530M";
  };

  config = lib.mkIf config.xe.driver.enable {
    boot.blacklistedKernelModules = [ "i915" ];
    boot.initrd.kernelModules = [ "xe" ];
    boot.kernelParams = [ "xe.force_probe=*" ];
    services.xserver.enable = false;
    services.xserver.videoDrivers = [ "xe" ];
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    hardware.graphics.extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      intel-vaapi-driver
      libvdpau-va-gl
    ];
    environment.systemPackages = with pkgs; [ linux-firmware ];
    environment.variables.WLR_NO_HARDWARE_CURSORS = "1";
  };
}

