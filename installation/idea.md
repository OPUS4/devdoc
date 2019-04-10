---
title: IDEA-Setup
group: navigation
weight: 25
---
# IntelliJ IDEA

Für die OPUS4-Entwicklung, kann selbstverständlich jede IDE benutzt werden. Ein Vorschlag ist IntelliJ IDEA von JetBrains.
Die Einrichtung dieser Software, soll hier kurz beschrieben werden.

# Setup von IntelliJ IDEA

Als erstes muss in den Settings das PHP-Plugin installiert werden. (File->Settings->Plugin)
Um die Tests in IntelliJ zu starten muss PHP entsprechend eingerichtet werden. Wenn man einen Test startet, wird man
automatisch dazu aufgefordert.

1. Muss in "use alternative configuration file" der Pfad zur .../tests/phpunit.xml eingetragen werden.
2. Das working Verzeichnis ist das .../vendor Verzeichnis.
3. Zusätzlich muss phpunit spezifiziert werden. Dazu auf das Zahnrad neben "use alternative configuration file" klicken.
4. Es muss ein Composer autoloader eingestellt werden. Das Script dazu findet sich im vendor-Verzeichnis


