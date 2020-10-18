V=20200824

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 artix{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/artix{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	git archive --format=tar --prefix=artix-keyring-$(V)/ $(V) | gzip -9 > artix-keyring-$(V).tar.gz
	gpg -u $(KEY) --detach-sign --use-agent artix-keyring-$(V).tar.gz

#.PHONY: install uninstall dist upload
.PHONY: install uninstall dist
