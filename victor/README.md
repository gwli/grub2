## How debug

* qemu-system-x86_64 -cdrom bootcd.iso -s -S
* in another shell prompt change current directory to the gru2 build directory, then change to grub-core directory, and start GDB as below:

```
grub-core]$ gdb -x gdb_grub
GNU gdb (GDB) Fedora (7.4.50.20120120-42.fc17)
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-redhat-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
0x0000fff0 in mem_regions ()
Breakpoint 1 at 0xb569: file kern/dl.c, line 56.
(gdb) b grub_cmd_ls
Function "grub_cmd_ls" not defined.
(gdb) b grub_main
Breakpoint 2 at 0xcb08: file kern/main.c, line 209.
(gdb) c

```
