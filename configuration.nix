{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./puter/hardware-configuration.nix
    ./modulerinos/nvidia.nix
    ./modulerinos/fish.nix
    ./modulerinos/hyprland.nix
  ];
  # FLAKES
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "flakey-burrow"; # hostname.
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Enable SWAP
  zramSwap.enable = true;

  # Enable Virtual Machines
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  # user
  users.users.boszko = {
    isNormalUser = true;
    description = "boszko";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
      flatpak
      gnome-software
    ];
  };

  #PROGRAMAS
  programs = {
    firefox.enable = true;
    steam.enable = true;
    fish.enable = true;
    #gamemode baldurs gate?
    gamemode.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # File Explorer
    nautilus
    # Terminal
    kitty
    # Torrent
    deluge
    # proton2
    protonup-ng
    wireguard-tools
    proton-vpn
    croc
  ];

  # PRO PROTONVPN FUNCIONAR
  networking.firewall.checkReversePath = "loose";

  #não mexer
  system.stateVersion = "25.05";
}
