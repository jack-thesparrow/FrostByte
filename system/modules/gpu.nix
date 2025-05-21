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
    # Disable legacy driver
    boot.blacklistedKernelModules = [ "i915" ];

    # Load xe driver later in boot, not in initrd
    boot.kernelModules = [ "xe" ];
    boot.kernelParams = [ "xe.force_probe=*" ];

    services.xserver.enable = false;
    services.xserver.videoDrivers = [ "xe" ];

    # Use updated graphics options
    hardware.graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        intel-vaapi-driver
        libvdpau-va-gl
        vulkan-loader
        vulkan-tools
        mesa
      ];

      extraPackages32 = with pkgs; [
        driversi686Linux.intel-media-driver
        driversi686Linux.mesa
      ];
    };

    environment.systemPackages = with pkgs; [ linux-firmware ];

    # Wayland cursor fix for Intel GPUs
    environment.variables.WLR_NO_HARDWARE_CURSORS = "1";
  };
}
