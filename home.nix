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
    pkgs.signal-desktop
  ];
}
