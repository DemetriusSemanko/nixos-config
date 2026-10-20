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

  home.packages = with pkgs; [
    signal-desktop
    tinymist
    rustc
  ];
}
