{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true; # Use 'y' in bash!
  };
}
