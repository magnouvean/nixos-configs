{ ... }:
{
  imports = [ ../../home/home.nix ];

  # Sets up the nix environments.
  home.file = {
    "Code/R/shell.nix".text = (import ../../home/environments/R.nix { });
    "Code/julia/shell.nix".text = (import ../../home/environments/julia.nix { });
    "Code/nix/shell.nix".text = (import ../../home/environments/nix.nix { });
    "Code/python/shell.nix".text = (import ../../home/environments/python.nix { rocmSupport = false; });
  };
}
