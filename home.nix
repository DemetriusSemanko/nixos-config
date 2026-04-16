{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./homeManagerModules
  ];

  home.stateVersion = "26.05";

  programs.plasma = {
    enable = true;
  };

  home.packages = [
    pkgs.nix-inspect
    pkgs.ghc
    pkgs.haskellPackages.QuickCheck
    pkgs.signal-desktop
  ];
}
