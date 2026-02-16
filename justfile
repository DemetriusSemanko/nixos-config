# https://just.systems
default:
    just -l

# Switches system to whatever was built
switch:
    sudo nixos-rebuild switch --flake .#delphi

# Builds but doesn't switch
build:
    sudo nixos-rebuild build --flake .#delphi

# Creates test generation
test:
    sudo nixos-rebuild switch -p test --flake .#delphi

# Updates flake.lock file
update:
    nix flake update

# Collects garbage using nh
gc:
    nh clean all --keep 10 --ask
