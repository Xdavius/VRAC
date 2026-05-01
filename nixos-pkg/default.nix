{
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  
  environment.systemPackages = [
  # Add your stable apps here (exemple: pkgs.btop)
  pkgs.nh
  pkgs.tachyfy
  # Add your unstable apps here (exemple: pkgs-unstable.btop)


  ];

 # --- OPTIONS DE DÉSACTIVATION (décommenter pour désactiver) / DISABLE OPTIONS (uncomment to disable) ---
# Après modification, appliquer avec : `glf-update` / After editing, apply with: `glf-update`

# Désactiver Firefox / Disable Firefox
  # glf.firefox.enable = lib.mkForce false;

# Désactiver le pack gaming (manettes, Steam, Lutris, Faugus, Heroic, Oversteer/Wine, Piper, etc.) / Disable gaming pack (controllers, Steam, Lutris, Faugus, Heroic, Oversteer/Wine, Piper, etc.)
  # glf.gaming.enable = lib.mkForce false;

# Désactiver le pilote NVIDIA (utile en cas de passage vers une carte AMD) / Disable NVIDIA driver (useful when switching to an AMD GPU)
  # glf.nvidia.enable = lib.mkForce false;

# Désactiver la compatibilité et les outils d'impression / Disable printing compatibility and tools
  # glf.printing.enable = lib.mkForce false;

# ⚠️ Désactiver les mises à jour automatiques (attention : risque pour la sécurité) / ⚠️ Disable automatic updates (warning: security risk)
  glf.autoUpgrade = false;


  # Add your custom configuration here ↓
  
  virtualisation.vmware.guest.enable = true;
  
  services.pcscd.enable = true;
  
  nixpkgs.overlays = import ./overlays.nix;
  

}
