{ lib, config, pkgs, ... }:

{
  # Add your custom configuration here ↓ 

  ## VIRTUALBOX
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest = {
      enable = true;
      dragAndDrop = true;
      clipboard = true;
    };
  };

  users.extraGroups.davius.members = [ "user-with-access-to-virtualbox" ];  
  ## PODMAN

  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.users.davius = {
    extraGroups = [ "podman" "vboxusers" ];
    subGidRanges = [
    # Nécessaire pour distrobox
      {
        count = 65536;
        startGid = 100000;
      }
    ];
    subUidRanges = [
      {
        count = 65536;
        startUid = 100000;
      }
    ];
  };

  ## DISTROBOX
  environment.systemPackages = [ pkgs.distrobox pkgs.zenity ];
  boot.binfmt.emulatedSystems = [ "aarch64-linux" "i386-linux" ]; # Si tu as besoin d'utiliser des architectures arm et i386
}
