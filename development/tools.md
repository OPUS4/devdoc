---
title: Tools
---

# Tools für die OPUS 4 Entwicklung

Für die Entwicklung von OPUS 4 sollte eine IDE eingesetzt werden, die PHP unterstützt.

## IntelliJ IDEA
 
[IntelliJ IDEA](https://www.jetbrains.com/idea/) ist eine IDE von JetBrains und wird 
beim KOBV eingesetzt. Die freie Community Edition unterstützt leider nicht die PHP 
Entwicklung. 

Für die Installation der IDE und die grundlegende Konfiguration sollte die offizielle 
Dokumentation herangezogen werden.

Für die Arbeit an OPUS 4 muss das PHP-Plugin hinzugefügt werden. Das ist möglich unter
`File->Settings->Plugins`. In der Regel schlägt IntelliJ IDEA passende Plugins vor, 
wenn es z.B. Dateien in bestimmten Formaten, wie `.ini` findet.

Nach dem Clonen des OPUS 4 Codes von GitHub direkt in der IDE (unter 
`VCS->Checkout from Version Control->Git`) oder im Terminal, muss in IntelliJ IDEA ein 
"Project from Existing Source..." angelegt werden. Dabei ist eigentlich nicht weiter 
zu beachten und man kann den angezeigten Schritten folgen. 

### Tests

Die Unit Tests von OPUS 4 können direkt in der IDE ausgeführt werden. Die Tests nutzen
PHPUnit. Beim ersten Versuch eine Testdatei laufen ("Run") zu lassen muss die 
Konfiguration angepasst werden.  

* Für die **PHPUnit Library** sollte "*Use Composer Autoloader*" und die Datei 
  `.../vendor/autoloader.php` ausgewählt werden.
* Für den **Test Runner** sollte als "*Default Configuration File*" die Datei 
  `.../tests/phpunit.xml` verwendet werden.  

## Netbeans

[Netbeans](https://netbeans.org/) ist eine weitere IDE mit PHP Support.