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

  programs.obs-studio.enable = true;

  home.packages = [
    pkgs.signal-desktop
    pkgs.tinymist
  ];
}
