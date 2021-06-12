Repository für Continiuous-Integration (CI) Builds
=================================================

Dieses Repository ermöglicht den wöchentlichen Gluon Build in der Gitlab CI.
Hierzu ist ein Makefile enthalten, dass eine gemeinsame Firmware für alle Hoods baut.

Die CI (.gitlab-ci.yml) kopiert die fertigen binaries dann auf https://files.freifunk-koeln.de.
Für opkg (nicht-https) Zugriffe existiert zudem die URL http://files.freifunk-koeln.de.

Der Build kann auch per Hand gestartert werden

* `make world` erstellt binaries für alle Hoods

## Branches:

* Der Branch `master` baut zur Zeit Gluon v2021.1.x, weekly (bei Updates und wöchtenlich)
* Der Branch `2020.2` ist aktuell noch für weeklies eingetaktet.
* Die Branches `release-2019.1-ibss` und `release-2019.1-11s` bauen Gluon v2019.1.x, d.h. die letzte Version, die prinzipiell noch mit ibss arbeiten kann.

## Hinweise:

* Die Knoten erscheinen z.T. nicht auf der Karte map.kbu.freifunk.net. Ein möglicher Hintergrund ist eine Umstellung in respondd (link local multicast -> site local multicast); die Firmware ist zu neu (vgl. https://github.com/freifunk-gluon/gluon/issues/984).
* Die Ablage https://kbu.freifunk.net/files/ wird nicht mehr befüllt, da yanosz die Zugriffsrechte dafür entzogen worden sind. Die Dateien dort sind daher veraltet und können weder aktualisiert noch gelöscht werden.

## Gitlab-Pipeline Builds

Für einen gitlab-Build müssen zwei Umgebungsvariablen angegeben werden - zum Beispiel:

* `GLUON_RELEASE: "v2021.1.x-ci-auto"`: Versionsnummer des Builds. Ablageort auf dem Fileserver
* `GLUON_BRANCH: "v2021.1.x"`: Git-Branch im gluon-Repository (github)
