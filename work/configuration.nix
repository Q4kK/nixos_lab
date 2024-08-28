{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
      ../nixoshomeconfigs/packages/helix.nix
      ../nixoshomeconfigs/packages/bash.nix
      ../nixoshomeconfigs/packages/git.nix
      ../nixoshomeconfigs/packages/fish.nix
      ../nixoshomeconfigs/packages/samba.nix
      ../nixoshomeconfigs/packages/workuser.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.blacklistedKernelModules = ["hyperv_fb"];

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

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
  services.desktopManager.plasma6.enable = true;
  services.xserver = {
    displayManager = {
      gdm = {
        enable = true;
        # wayland = false;
        banner = "get that bread";
      };
    };
    enable = true;
    xkb = {
    variant = "";
    layout = "us";
    };
  };


  networking.interfaces = {
  	eth0.ipv4.addresses = [ {
		address = "10.168.44.4";
		prefixLength = 28;
		}
		];
	};
networking.defaultGateway = "10.168.44.1";
networking.nameservers = ["199.17.166.187" "199.17.166.186"];

  # Define a user account. Don't forget to set a password with ‘passwd’.
environment.systemPackages = with pkgs; [tea ripgrep nmap nixd python310 firefox yaml-language-server ansible-language-server];

  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.openFirewall = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
