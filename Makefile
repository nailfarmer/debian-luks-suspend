.PHONY: all install

INSTALL_DIR := /usr/lib/debian-luks-suspend
INITRAMFS_TOOLS := /etc/initramfs-tools/hooks/

all:

install:
	install -Dm755 debian-luks-suspend "$(DESTDIR)$(INSTALL_DIR)/debian-luks-suspend"
	install -Dm755 encrypt-on-suspend "$(DESTDIR)$(INSTALL_DIR)/encrypt-on-suspend"
	install -Dm755 initramfs-tools-hook "$(DESTDIR)$(INITRAMFS_TOOLS)/initramfs-tools-hook"
	install -Dm644 systemd-suspend.service "$(DESTDIR)/etc/systemd/system/systemd-suspend.service"
	update-initramfs -u -k all
	systemctl daemon-reload

uninstall:
	rm -f "$(DESTDIR)$(INSTALL_DIR)/debian-luks-suspend"
	rm -f "$(DESTDIR)$(INSTALL_DIR)/encrypt-on-suspend"
	rm -f "$(DESTDIR)$(INITRAMFS_TOOLS)/initramfs-tools-hook"
	rm -f "$(DESTDIR)/etc/systemd/system/systemd-suspend.service"
	update-initramfs -u -k all
	systemctl daemon-reload



# vim:set sw=4 ts=4 noet:
