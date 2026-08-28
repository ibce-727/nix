  {config,lib,pkgs, ...}:

{
    environment.systemPackages = with pkgs; [

	discord
	opentabletdriver
	micro
	osu-lazer-bin
	vencord
	protonup-qt
	openrazer-daemon
	polychromatic
	gamemode
];

	programs = {
		steam.enable = true;
		obs-studio.enable = true;
	};


#enable openrazer + OTD

hardware.openrazer.enable = true;
hardware.opentabletdriver.enable = true;
hardware.uinput.enable = true;
boot.kernelModules = ["uinput"];






}
