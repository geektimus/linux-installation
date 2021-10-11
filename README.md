# Linux Installation Scripts

In this repository you will find scripts for the base install of base linux systems with XMonad, BSPWM or I3

Modify the packages to your liking, make the script executable with 

```
chmod +x scriptname
```

and then run with `./scriptname.`

Remember that the first part of the base system installation is manual, that is you will have to partition, format and mount the disk yourself. Install the base packages and make sure to include git so that you can clone the repository in chroot.

A small summary:

1. If needed, load your keymap
2. Refresh the servers with pacman -Syy
3. Partition the disk
4. Format the partitions
5. Mount the partitions
6. Install the base packages
7. Download the git repository with git clone https://github.com/geektimus/linux-installation
8. Run the scripts needed

## Notes 

It's worth to mention that most of the scripts included here are tailored to my Arch systems, I will add other WM and distros later when I get to play with those.