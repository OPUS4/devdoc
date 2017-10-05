---
title: Unit-Tests
---

# Unit-Tests

Die Unit Tests befinden sich im Verzeichnis `tests`. Um sie auszuführen kann man z.B. 
folgende Kommandos verwenden.

    $ cd tests
    $ ../vendor/bin/phpunit . | tee testresult.txt
    
Mit "`../vendor/bin/phpunit .`" wird die durch Composer installierte Version von PHPUnit
verwendet und sämtliche Tests ausgeführt. Durch "`| tee testresult.txt`" werden die Ausgaben während des Tests zusätzlich in die
Datei `testresult.txt` geschrieben.

Folgende Zeile würde nur die Tests für `Opus_Document` ausführen. 

    $ ../vendor/bin/phpunit Opus/DocumentTest    
    
Am Ende des Testdurchlaufs werden die Tests mit Fehlern aufgelistet. Mit der Option `--debug` 
werden bereits während der Ausführung die Namen der Tests aufgelistet.

    $ ../vendor/bin/phpunit --debug .     

Die Unit-Tests lassen sich auch mit `ant` ausführen. Im Root-Verzeichnis von OPUS 4 liegt
die Datei `build.xml`, die verschiedene Targets für die Ausführung definiert. Mit folgendem
Kommando lassen sich alle Tests ausführen. 

    $ ant phpunit-fast     
    
Dabei werden die Zwischenergebnisse immer erst am Ende einer Zeile ausgegeben. Ant wird auch
vom CI-System für die Ausführung der Tests verwendet.

# Testdaten

Die Tests der OPUS 4 Application setzen Testdaten voraus. Nach einem Durchlauf der Tests sind
diese Daten unter Umständen nicht mehr in ihrem ursprünglichen Zustand. Für einen sauberen
Test müssen daher die Testdaten vorher zurückgesetzt werden. Aufgrund des Zeitaufwands passiert
dies nicht automatisch vor jedem Test.

Mit folgendem Kommando werden die Datenbank und die Volltextdateien zurückgesetzt und eine
neue Indizierung durchgeführt. 

    $ ant reset-testdata
    
Um die ausführlichen Information zum Kopieren der Testdateien zu sehen, kann `-Dverbose=1`
verwendet werden.

    $ ant reset-testdata -Dverbose=1    

# XHTML/XML-Schema-Dateien lokal cachen

Während der Tests werden die Ausgaben von OPUS 4 unter anderem auf korrektes XHTML geprüft.
Für das XHTML-Schema wird normalerweise auf Ressourcen auf den Servern von 
[www.w3.org](www.w3.org) 
zugegriffen. Der Zugriff auf diese Server ist gedrosselt, so dass Anfragen manchmal sehr
lange dauern. Manche Unit-Tests benötigen dadurch Minuten anstelle von Sekunden. Um die 
Tests zu beschleunigen kann die Verwendung lokaler Kopien der Schema-Dateien konfiguriert
werden.

Die notwendigen XML-Schema-Dateien befinden sich in folgendem Verzeichnis:

    tests/resources
    
und sind in eine XML-Katalog-Datei aufgelistet:

    tests/resources/opus4-catalog.xml
    
Damit der XML-Katalog verwendet wird muss die Environmentvariable `XML_CATALOG_FILES`
gesetzt werden, z.B. in der `.bashrc` Datei. 

    export XML_CATALOG_FILES=~/projects/opus4/tests/resources/opus4-catalog.xml
    
Sollen die Unit-Tests in einer IDE ausgeführt werden, sollte die Variable auch dort für 
die Ausführung von PHPUnit konfiguriert werden. Wie das genau passiert ist für jede IDE
etwas anders.

In IntelliJ IDEA kann die Konfiguration der Variable unter `Run->Edit Configurations...` 
für die PHPUnit-Default-Einstellungen erfolgen.

* [Weitere Informationen zu XML-Catalogs](http://xmlsoft.org/catalog.html)
{: class="navlist" }