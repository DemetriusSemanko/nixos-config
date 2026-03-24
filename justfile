# https://just.systems
_default:
    just -l

# Switches system to whatever was built (using `nh`)
switch:
    nh os switch -k .#delphi

# Builds but doesn't switch (using `nh`)
build:
    nh os build -k .#delphi

# Updates flake.lock file
update:
    nh os build -k --update .#delphi

# Collects garbage using nh
gc:
    nh clean all --keep 10 --ask
