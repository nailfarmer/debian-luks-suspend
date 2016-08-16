debian-luks-suspend
==================

A script for [Debian][] to lock the encrypted root volume on suspend.

Modified from the original [arch-luks-suspend][] for [Arch Linux][].

When using debian's default full-disk encryption using LUKS, the encryption 
key is kept in memory when suspending the system. This drawback defeats the 
purpose of encryption if you carry around your suspended laptop a lot. One 
can use the `cryptsetup luksSuspend` command to freeze all I/O and flush the 
key from memory, but special care must be taken when applying it to the root 
device.

The `debian-linux-suspend` script replaces the default suspend mechanism of
systemd. It changes root to the initramfs in order to perform the 
`luksSuspend`, actual suspend, and `luksResume` operations.

When successfully completed, it uses loginctl to unlock the user session to
reduce password fatigue.

This script assumes you're using systemd, and is untested in all but the most 
generic of lvm setups.  It currently breaks under grsecurity, and probably
won't work if you're using lvm+raid. It makes no security guarantees 
whatsoever.  You have been warned.

[Debian]: https://www.debian.org/
[arch-luks-suspend]: https://github.com/vianney/arch-luks-suspend/
[Arch Linux]: https://www.archlinux.org/

Installation
-------------

To install, run 'make install' as root and reboot.

Authors and license
-------------------
Copyright 2016 Jen Bowen <debianfangirl@gmail.com>

Based on [work][] by
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
