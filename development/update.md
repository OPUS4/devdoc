---
title: Updates
---

# Implementation von Updates

Für das Update der OPUS 4 Applikation gibt es ein Shell-Skript

    bin/update.sh
    
Dieses Skript ruft ein PHP-Skript auf
     
    scripts/update/update.php
    
das wiederum die Klasse `Application_Update` verwendet, um die 
für das Update notwendigen Schritte durchzuführen.

Beim Update spielt die Release-Version von OPUS 4 keine Rolle.
Es gibt zwei interne Versionsnummern für die Datenbank und für
die OPUS 4 Applikation. Diese werden in den Tabellen `schema_version`
und `opus_version` gespeichert.

Das Updateskript soll jederzeit ausführbar sein, so dass es auch zwischen
Releases zur Aktualisierung einer Testinstanz verwendet werden kann. Ist
nichts zu tun, hat der Aufruf des Skriptes keine weiteren Auswirkungen.

Ein Downgrade wird generell nicht unterstützt. 

<p class="note">
Das Updateskript funktioniert für Datenbanken, ab OPUS
4.4.5. Um von einer älteren Version umzusteigen sollte zuerst auf 
OPUS 4.4.5 aktualisiert werden, bevor dann der Umstieg auf die Git-basierte
Version erfolgen kann.
</p>

## Datenbank

Für die Updates der Datenbank ist das Framework zuständig. Dafür gibt
es die `update`-Funktion der Klasse `Opus_Database`. Diese wird während
des Updates der Applikation aufgerufen.

Jeder Updateschritt für das Datenbankschema ist als separates SQL-Skript
in `db/schema` des Frameworks abgelegt. Der Name jedes Skripts fängt mit
einer Nummer an. Bei einem Update wird geprüft, ob es Nummern gibt, die 
höher sind als die aktuell in `schema_version` gespeicherte Version. Wenn
ja, werden diese Skripte ausgeführt und die Version in der Datenbank erhöht.

    001-OPUS-4.4.4.sql
    002-OPUS-4.5.sql
    003-Simplify-table-schema-version.sql
    004-Add-table-opus-version.sql

<p class="note">
Es gibt noch keinen Mechanismus, um Datenbankänderungen mit PHP-Skripten zu
verknüpfen, um z.B. komplexere Transformationen von Daten durchzuführen.
</p>

## Applikation

Die Updateschritte für die Application werden nach dem Update der Datenbank 
ausgeführt. Sie sind in Skripten mit Nummern im Verzeichnis `scripts/update`
implementiert.

    001-Add-import-collection.php
    002-Add-CC-4.0-licences.php

Ein Aufgruf bin `bin/update.sh` führt die Skripte aus, deren Versionsnummer
höher ist als die aktuell in der Datenbank gespeicherte Version.

Die Masterdaten setzen die gespeicherte Version, so dass beim Update einer 
neuen Installation z.B. nicht noch einmal Skript "002" ausgeführt wird, um die 
"CC 4.0 Lizenzen" zu ergänzen.

Die Updateskript können auch einzeln gezielt aufgerufen werden. In diesem Fall
wird aber nicht die in der Datenbank gespeichert Version aktualisiert.

Die meisten Updateschritte implementieren das eigentliche Update in einer Klasse
und rufen diese im Skript nur auf. Die Klassen implementieren 
`Application_Update_PluginAbstract` und liegen in `library/Application/Update`. 

    AddImportCollection.php
    ConsoleIni.php
    Database.php
    
Der Updateschritt `ConsoleIni` wird momentan separate gehandhabt, weil er vor dem
Update der Datenbank ausgeführt werden muss, wenn noch keine `console.ini` existiert,
die die Zugriffinformationen für eine Änderung des Datenbankschemas enthält.