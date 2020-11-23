Repository für Continiuous-Integration (CI) Builds
=================================================

Dieses Repository ermöglicht den wöchentlichen Gluon Build in der Gitlab CI.
Hierzu ist ein Makefile enthalten, dass eine gemeinsame Firmware für alle Hoods baut.

Die CI (.gitlab-ci.yml) kopiert die fertigen binaries dann auf https://files.freifunk-koeln.de.
Für opkg (nicht-https) Zugriffe existiert zudem die URL http://files.freifunk-koeln.de.

Der Build kann auch per Hand gestartert werden

* `make world` erstellt binaries für alle Hoods
* `make deploy` fügt die erstellte Firmware in einer Deploy-Struktur zusammen.

Hinweis:

* Die Knoten erscheinen z.T. nicht auf der Karte map.kbu.freifunk.net. Ein möglicher Hintergrund ist eine Umstellung in respondd (link local multicast -> site local multicast); die Firmware könnte zu neue sein. (Vgl. https://github.com/freifunk-gluon/gluon/issues/984)
* Die Ablage https://kbu.freifunk.net/files/ wird nicht mehr befüllt, da yanosz die Zugriffsrechte dafür entzogen worden sind. Die Dateien dort sind daher veraltet und können weder aktualisiert noch befüllt werden.
