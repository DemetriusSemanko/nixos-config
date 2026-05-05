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

  home.packages = with pkgs; [
    signal-desktop
    tinymist
    rustc
  ];
}
