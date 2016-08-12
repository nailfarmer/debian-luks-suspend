.PHONY: all install

INSTALL_DIR := /usr/lib/debian-luks-suspend
INITRAMFS_TOOLS := /etc/initramfs-tools/hooks/

all:

install:
	install -Dm755 debian-luks-suspend "$(DESTDIR)$(INSTALL_DIR)/debian-luks-suspend"
	install -Dm755 initramfs-encrypt-suspend "$(DESTDIR)$(INSTALL_DIR)/initramfs-encrypt-suspend"
	install -Dm755 initramfs-tools-hook "$(DESTDIR)$(INITRAMFS_TOOLS)/initramfs-tools-hook"
	install -Dm644 systemd-suspend.service "$(DESTDIR)/etc/systemd/system/systemd-suspend.service"

# vim:set sw=4 ts=4 noet:
