# pill
**P**rocess k**IL**ler for **L**inux, for those pesky little processes that 
just love to eat up memory.
This is basically just an automated `ps aux` and `kill [pid]`, but that's why
it's useful. :)

# how to use
There isn't much to say here... but first let's set it up for global access.
This just clones our script into `/usr/bin` which allows us to call it from
any directory.
> sudo ./setup.sh

Now this is how you run it. The search will just use `grep` to search the 
ps aux command output for any pids. Then you'll be walked through the program.
> pill [process to search for]
