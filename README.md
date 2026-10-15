# Choose Your Own Adventure

A terminal adventure game written in x86-64 GNU assembly for Linux. It uses
Linux system calls directly and has no runtime library dependencies.
There are 18 endings: some routes resolve in two choices, standard routes take
three, and extended branches take four. Both good and bad outcomes are possible.

## Build and run

```sh
gcc -nostdlib -no-pie -o adventure adventure.S
./adventure
```

Choose an option by entering its number and pressing Enter. Enter `q` at the
main menu or after an ending to quit.