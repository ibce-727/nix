{config,pkgs,...}: {
  hardware.graphics.enable = true;
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
	modesetting.enable = true;
	
	nvidiaSettings = true;

	package = config.boot.kernelPackages.nvidiaPackages.latest;

	open = true;

	powerManagement.enable = false;
	powerManagement.finegrained = false;
  };
  # see the note above
services.xserver = {
  enable = true;

  # Explicitly force VRR off in the device/screen section
  config = ''
    Section "Device"
        Identifier     "Device0"
        Driver         "nvidia"
        VendorName     "NVIDIA Corporation"
    EndSection

    Section "Screen"
        Identifier     "Screen0"
        Device         "Device0"
        Monitor        "Monitor0"
        Option         "VariableRefresh" "False"
    EndSection
  '';
};


}
