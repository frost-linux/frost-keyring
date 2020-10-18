V=20200824

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 frost{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/frost{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	git archive --format=tar --prefix=frost-keyring-$(V)/ $(V) | gzip -9 > frost-keyring-$(V).tar.gz
	gpg -u $(KEY) --detach-sign --use-agent frost-keyring-$(V).tar.gz

#.PHONY: install uninstall dist upload
.PHONY: install uninstall dist
