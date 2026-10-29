# https://just.systems
set default-list

alias s := switch
# Switches system to whatever was built (using `nh`)
switch:
    nh os switch -k .#delphi

alias b := build
# Builds but doesn't switch (using `nh`)
build:
    nh os build -k .#delphi

# Private, generic command to make new revset with a message
_mk-new-rev message:
    jj new -m "{{ message }}"

msg := "flake: update"
alias u := update
# Updates flake.lock file (using `nh`)
update: (_mk-new-rev msg)
    nh os build -k --update .#delphi

# Collects garbage (using `nh`)
gc:
    nh clean all --keep 10 --ask

# Private, generic push recipe
_push remote:
    jj git push --remote {{ remote }}

alias pg := push-github
gh := "github"
# Push to GitHub
push-github: (_push gh)
    jj git push --remote github

alias pt := push-tangled
tg := "tangled"
# Push to Tangled
push-tangled: (_push tg)
    jj git push --remote tangled

alias p := push-all
# Push to both github and tangled remotes
push-all: push-github push-tangled
