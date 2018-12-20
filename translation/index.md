---
title: Übersetzungen
---

OPUS 4 wird mit Übersetzungsressourcen für Deutsch und Englisch ausgeliefert. Die Texte werden in 
TMX-Dateien gespeichert. Die Defaulttexte liegen im `language`-Verzeichnis eines Modules. Die 
Übersetzungen werden häufig lokal angepasst. Die Anpassungen liegen im `language_custom`-Verzeichnis.

<p class="note" markdown="1">
In einem zukünftigen Release werden die `language_custom`-Verzeichnisse verschwinden, um eine saubere
Trennung zwischen Code und Konfiguration zu erreichen. Vermutlich werden die Anpassungen in die Datenbank 
wandern.
</p>

## Escaping

Bei der Ausgabe von Texten in OPUS 4 sollte immer darauf geachtet werden, ob die Ausgabe evtl. Zeichen
enthält, die Escaped werden müssen. Dafür kann z.B. folgende Funktion verwendet werden.

[htmlspecialchars($output)](http://php.net/manual/de/function.htmlspecialchars.php)

Manche Übersetzungen enthalten allerdings HTML-Code. In diesem Fall kann `htmlspecialchars` nicht 
verwendet werden.

Ausgaben, die von Nutzern eingegeben wurden, z.B. in einem Formular, sollten immer Escaped werden,
damit kein schädlicher HTML-Code in die Ausgabe eingeschleust werden kann.

Zend bietet auch Escape-Funktionalität. 

Im Zweifelsfall sollte immer ein Escaping durchgeführt werden. Bei der Übersetzung von statischen 
Schlüsseln sind Probleme weniger wahrscheinlich. Auch Werte, die aus der Datenbank kommen sollten in 
der Regel escaped werden, da nicht vorhersagbar ist was die Datenbank enthält. Durch einen Bug, könnte 
eine SQL-Injection möglich sein, wodurch schädliches HTML in der Datenbank plaziert werden könnten, z.B.
in Zusammenfassungen oder Notizen zu Dokumenten.