= Useful Commands
I want to use Linux. There are commands I just do not know exist.
It feels like people assume I should know something; it frustrates me.
For my knowledge, I am keeping a list of commands I have found
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
