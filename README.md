debian-luks-suspend
==================

A script for [Debian][] to lock the encrypted root volume on suspend.

Modified from the original [arch-luks-suspend][] for [Arch Linux][].

Further modified to work on Buster.

Now with optional gui support through Plymouth bootsplash!

When using debian's default full-disk encryption using LUKS, the encryption 
key is kept in memory when suspending the system. This drawback defeats the 
purpose of encryption if you carry around your suspended laptop a lot. One 
can use the `cryptsetup luksSuspend` command to freeze all I/O and flush the 
key from memory, but special care must be taken when applying it to the root 
device.

The `debian-luks-suspend` script replaces the default suspend mechanism of
systemd. It changes root to the initramfs in order to perform the 
`luksSuspend`, actual suspend, and `luksResume` operations.

When successfully completed, it uses loginctl to unlock the user session to
reduce password fatigue.

With kernels prior to 5.6, to avoid hangs when suspending, you will need a
kernel compiled with CONFIG_SUSPEND_SKIP_SYNC=y. The default debian kernels
do not have this option enabled. See [the kernel team documentation][] for
instructions on how to compile a custom kernel for debian.

Please report any breakage to the [issue tracker][].

The scripts assume you're using systemd, and are untested in all but the most
generic of lvm setups.  It currently breaks under grsecurity, and probably
won't work if you're using lvm+raid. It makes no security guarantees 
whatsoever.  You have been warned.

[Debian]: https://www.debian.org/
[arch-luks-suspend]: https://github.com/vianney/arch-luks-suspend/
[Arch Linux]: https://www.archlinux.org/
[issue tracker]: https://github.com/nailfarmer/debian-luks-suspend/issues
[the kernel team documentation]: https://kernel-team.pages.debian.net/kernel-handbook/ch-common-tasks.html#s-common-official

Installation
-------------
To install, run 'make install' as root and reboot. For plymouth splash support,
run 'make plymouth', 'make install', and reboot.  To remove plymouth
splash support, run 'make noplymouth', 'make install', and reboot.

Authors and license
-------------------
Copyright 2019 Jen Bowen <debianfangirl@gmail.com>

Based very heavily on [work][] by
 Vianney le Clément de Saint-Marcq <vleclement@gmail.com>

[work]: [https://github.com/vianney/arch-luks-suspend/] 

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with This program.  If not, see <http://www.gnu.org/licenses/>.
