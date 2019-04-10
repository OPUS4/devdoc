---
title: IDEA-Setup
group: navigation
weight: 25
---
# IntelliJ IDEA

IntelliJ IDEA ist eine IDE von JetBrains. Die Einrichtung dieser Software, soll hier kurz beschrieben werden.
Tutorials für die Installation und das Updaten finden sich in der originalen Dokumentation. 

# Setup von IntelliJ IDEA

In File->Settings->Plugin lassen sich Plugins installieren. Dort muss das PHP-Plugin installiert werden.
Diese Möglichkeit besteht nur in der Ultimate-Edition von Intellij.

## Setup für Tests

Wenn man einen Test startet, wird man automatisch aufgefordert eine Konfiguration einzustellen.
Alternativ kann man unter Run->Edit Configurations das entsprechende Fenster öffnen.
Dort fügt man ein PHPUnit-Template hinzu und nimmt folgende Einstellungen vor:

1. Als alternative Konfiguration wird der Pfad zur .../tests/phpunit.xml eingetragen.
2. Das Working-Verzeichnis ist das Vendor-Verzeichnis.
3. In den erweiterten Konfigurationen (Zahnrad) muss ein Composer autoloader eingestellt werden. Das Script dazu findet sich im Vendor-Verzeichnis.