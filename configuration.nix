# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  #Bluetooth

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
 # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services = {
   libinput.enable = true;
   
dbus.enable = true;
gvfs.enable = true;
};


services.xserver.enable = true;
services.displayManager.sddm.enable = true;
services.displayManager.defaultSession = "hyprland";








  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.abir = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "abir";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    github-cli
pywal
stow
pamixer
brightnessctl
playerctl
rofi-wayland
hyprlock
hyprpaper
yazi
neovim
neofetch
bottom
networkmanager
bluez
wl-clipboard
glib
dolphin
git
unzip
rustup
zsh
gcc
gvfs
dbus
libdbusmenu
libdbusmenu-gtk3
cairo
glibc
rustup
gtk-layer-shell
firefox
eza
fzf
jq
socat
thefuck
hypridle
hyprshot
nodejs 
kitty
#  wget
blueberry
zoxide
gcc
xdg-utils
xdg-desktop-portal
xdg-desktop-portal-gtk
qt5.qtwayland
qt6.qmake
qt6.qtwayland
adwaita-qt
adwaita-qt6
tmux
btop
psmisc
ripgrep
pulseaudio
glib
pkg-config
gtk3
stdenv
waybar  
];




fonts.packages = with pkgs; [

mononoki
(nerdfonts.override { fonts = ["FiraCode" "IBMPlexMono" "JetBrainsMono" "Hermit"];})


];

programs.zsh.enable = true;

 # Hyprland
 programs.hyprland = {
  enable = true;
  xwayland.enable = true;
 };
 environment.sessionVariables = {
  WLR_NO_HARDWARE_CURSORS = "1";
  NIXOS_OZONE_WL = "1";

 };
 hardware.opengl = {
  enable = true;

 };

services.xserver.videoDrivers = ["nvidia"];
hardware.nvidia = {
 modesetting.enable = true;
 package = config.boot.kernelPackages.nvidiaPackages.stable;
};


 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
 #Enable sound with pipewire.

 sound.enable = true;
 security.rtkit.enable = true;
 services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  jack.enable = true;
};


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
