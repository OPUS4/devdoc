---
title: Unit-Tests
---

# Unit-Tests

Die Unit Tests befinden sich im Verzeichnis `tests`. Um sie auszuführen kann man z.B.
folgende Kommandos verwenden.

    $ cd tests
    $ ../vendor/bin/phpunit . | tee testresult.txt

Mit "`../vendor/bin/phpunit .`" wird die durch Composer installierte Version von PHPUnit
verwendet und sämtliche Tests ausgeführt. Durch "`| tee testresult.txt`" werden die Ausgaben während des Tests
zusätzlich in die Datei `testresult.txt` geschrieben.

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

# Manipulation der `Zend_Config` innerhalb von Tests

Bei der Manipulation oder dem Hinzufügen von Werten in der `Zend_Config` sollte
darauf geachtet werden, dass beim Setzen von Booleschen Werten ausschließlich
die Konstanten `CONFIG_VALUE_TRUE` bzw. `CONFIG_VALUE_FALSE` aus der Klasse
`ControllerTestCase` verwendet werden. Die Konstanten repräsentieren die Werte,
die Zend beim Auslesen von booleschen Werten aus `ini`-Dateien setzt. In ZF1
ist das `'1'` für `true` und `''` (Leerstring) für `false`.

Ein Zurücksetzen von Änderungen in `Zend_Config` am Ende eines Tests ist **nicht**
erforderlich. Die `Zend_Config` wird bei jedem Test neu geladen, so dass zuvor
geänderte oder neu hinzugefügte Werte nicht mehr vorhanden sind.

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

``` bash
export XML_CATALOG_FILES=~/projects/opus4/tests/resources/opus4-catalog.xml
```

Sollen die Unit-Tests in einer IDE ausgeführt werden, sollte die Variable auch dort für
die Ausführung von PHPUnit konfiguriert werden. Wie das genau passiert ist für jede IDE
etwas anders.

In IntelliJ IDEA kann die Konfiguration der Variable unter `Run->Edit Configurations...`
für die PHPUnit-Default-Einstellungen erfolgen.

* [Weitere Informationen zu XML-Catalogs](http://xmlsoft.org/catalog.html)
{: class="navlist" }

# Code-Coverage

Die Code-Coverage gibt an wieviel vom Code durch die Tests abgedeckt wird. Insbesondere
die Controller-Tests sind aber keine Unit Tests, sondern Integrationstest. Mindestens für
die Tests sollte die Coverage eingeschränkt werden. Dafür kann `@covers` verwendet werden.

``` php
/**
 * IndexControllerTest class for testing IndexController.
 *
 *
 * @covers IndexController
 */
```

Dadurch wird nur die Tests erzeugte Coverage für den IndexController berücksichtigt und
nicht für die Klassen, die bei der Ausführung evtl. auch noch berührt werden. Es gibt
noch weitere Wege, um die Coverage einzuschränken und ein ehrlicheres Bild der Abdeckung
zu bekommen. Für genauere Information bitte die PHPUnit Dokumentation hinzuziehen.     

# Performanz

Die Geschwindigkeit der Tests wird unter anderem durch den Speicherverbrauch beeinflusst.
Leider ist es schwierig nach jedem Tests den Speicher wieder komplett aufzuräumen. Dadurch
steigt der Speicherverbrauch mit jedem Test etwas an. Bei 3500+ Tests für die Application
kommt dabei einiges zusammen und die Laufzeit verlängert sich beträchtlich. Um diesen Effekt
abzumildern wurden einige Massnahmen getroffen.

## Tests in Blöcken

Die Tests sind für Travis in Blöcke eingeteilt, die nach einander ausgeführt werden. Dadurch
reduziert sich der maximale Speicherverbrauch und Tests laufen schneller durch. Die Blöcke
sind als Testsuites in `tests/phpunit.xml` definiert.

* library
* modules (ohne Admin-Modul)
* admin (nur Admin-Modul)
* security
* scripts

## Selektives Laden der Ressourcen

Jede Testklasse sollte nur die Ressourcen laden die notwendig sind. Folgendes Beispiel
sorgt dafür, dass die Datenbank und die Übersetzungen verfügbar sind. Insbesondere die
Übersetzungen beeinflussen die Laufzeit von Tests beträchtlich.  

``` php
protected $additionalResources = ['database', 'translation'];
```

Die verfügbaren Ressourcen entsprechen, den `_initXXX`-Funktionen im Bootstrap von OPUS, also
in `Application_Bootstrap` und `Opus_Bootstrap_Base`. Die folgenden Ressourcen werden
automatisch geladen.

* configuration
* logging

Gibt man für `$additionalResources` den Wert `all` an wird der gesamte Bootstrap ausgeführt.

Mit folgender Option kann man dafür sorgen, dass die Konfiguration in einem Test manipulierbar
ist.

``` php
protected $configModifiable = true;
```

## Memory-Leak reduzieren

Bei den Tests wird das Übersetzungsobjekt, `Application_Translate`, wiederverwendet.
Dadurch sinkt der Speicherverbrauch beträchtlich. Für den produktiven Betrieb hat das keine
Auswirkungen, da dort nach jedem Request, der Speicher wieder freigegeben wird.

Es gibt noch weitere Objekte durch die mit jedem Test der Speicherverbrauch steigt, unter
anderem vermutlich `Zend_Acl`. Momentan haben wir den Verbrauch aber auf etwa 300 MB gesenkt
und die Laufzeit mit Travis beträgt etwa 27 Minuten. Das ist für den Augenblick gut genug.
