{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./modulerinos/nvidia.nix
    ./modulerinos/hyprland.nix
    ./modulerinos/fish.nix
    ./modulerinos/shadowplay.nix
  ];
  # FLAKES
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Kernel zen (focado em desktop/jogos)
  boot.kernelPackages = pkgs.linuxPackages_zen;
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

  # collect garbage e store
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  # chaveiro de senhas
  services.gnome.gnome-keyring.enable = true;

  # Enable SWAP
  zramSwap.enable = true;

  # earlyoom: só mata algo quando o pc está quase travando
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 2;
    freeSwapThreshold = 2;
    enableNotifications = true;
    extraArgs = ["--avoid" "^(Hyprland|waybar)$"];
  };

  # não travar o desligamento esperando processo (steam, discord...)
  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
  systemd.user.settings.Manager.DefaultTimeoutStopSec = "10s";

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
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Flatpak
  services.flatpak.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # user
  users.users.boszko = {
    isNormalUser = true;
    description = "boszko";
    extraGroups = [
      "networkmanager"
      "input"
      "wheel"
      "gamemode"
      "libvirtd"
    ];
    packages = with pkgs; [
      kdePackages.kate
      gnome-software
    ];
  };

  #PROGRAMAS
  programs = {
    firefox.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
    };
    #gamemode baldurs gate?
    gamemode.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Torrent
    deluge
    # proton2
    protonup-ng
    wireguard-tools
    proton-vpn
    # P2P file transfer i think
    croc
  ];

  ########minecraft hamachi floss???? n entendi
  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "1c33c1ced078f7d7"
    ];
  };
  ###############################
  ###############################

  # PRO PROTONVPN FUNCIONAR
  networking.firewall.checkReversePath = "loose";

  #não mexer
  system.stateVersion = "25.05";
}
