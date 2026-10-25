= Useful Things
I want to use Linux. There are things I just do not know exist.
It feels like people assume I should know something; it frustrates me.

For my knowledge, I am keeping a list of commands/tools/info I have found
useful or ones that people have shared with me.

== df
"report file system space usage"
```sh
df -h`
```

== neovim
"put something into a new buffer"
```
:new
```

We can put notifications into the buffer like:
```
:new | put =execute('Notifications')
```

== nixos-option
I can use this to explore the options set/available
in my configuration.

I have to be in the same directory as my flake, and I need to say
where to find my flake:
```
nixos-option --flake .
```

I can then pass different options to look for:
```
nixos-option --flake . services.logind.settings.Login
```

== services.logind
I was looking into power management in NixOs.
`services.logind.settings.Login.KillUserProcesses` is
"defaulted to false in nixpkgs because many tools that rely on persistent user processes
would break by the systemd-default behavior."
