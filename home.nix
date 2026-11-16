{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nvf.homeModules.default
    ./homeManagerModules
  ];

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    signal-desktop
    tinymist
    rustc
    rustfmt
  ];
}
