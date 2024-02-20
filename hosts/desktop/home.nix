{ ... }:
{
  imports = [ ../../home/home.nix ];

  # We make the nix environments machine specific, as the hardware is very
  # different and may require different libraries.
  home.file = {
    "Code/R/shell.nix".text = (import ../../home/environments/R.nix { });
    "Code/julia/shell.nix".text = (import ../../home/environments/julia.nix { });
    "Code/nix/shell.nix".text = (import ../../home/environments/nix.nix { });
    "Code/python/shell.nix".text = (import ../../home/environments/python.nix { rocmSupport = true; });
  };
}
