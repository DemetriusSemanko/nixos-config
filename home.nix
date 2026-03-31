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

  # Compilers, whatever
  # dev tools?
  programs.gcc.enable = true;
  programs.java.enable = true;
  programs.cargo.enable = true;
  programs.npm.enable = true;

  # Nix-specific
  # nix helper
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
    }; # programs.nh.clean
  }; # programs.nh

  home.packages = [
    pkgs.nix-inspect
    pkgs.nerd-fonts.fira-code
    pkgs.newcomputermodern
    pkgs.ghc
    pkgs.haskellPackages.QuickCheck
  ];
}
