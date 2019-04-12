---
title: Coding Style
weight: 50
---

# Coding Style

OPUS 4 ist zum größten Teil in PHP geschrieben. Der Code folgt den Prinzipien der Objekt-Orientierten 
Programmierung (OOP).  

OPUS 4 richtet sich im Allgemeinen nach dem Coding Style vom Zend Framework 1 und neuer. 

* [Zend Framework 1.12 Coding Style][ZF1CS]
* [Zend Framework 2.4 Coding Standard for PHP][ZF2CS]
{: class="navlist" }

In einigen Punkten weicht der OPUS 4 Source Code von dem auf den Seiten oben beschriebenen Stil ab. Im folgenden
werden die wichtigsten Punkte hervorgehoben. Der Coding Style soll in der Regel durch technische Maßnahmen sicher 
gestellt werden.  

## Allgemeines

* Zeilen sollten nicht länger als **120** Zeichen sein.
* Für Einrückungen verwenden wir 4 Leerzeichen. Es sollten keine Tab-Zeichen verwendet werden.
* Dateien enden immer mit einem Zeilenumbruch, also im Editor mit genau einer leeren Zeile.
* Klammern werden nicht in der selben Zeile von Funktions- oder Klassennamen gesetzt.
* Deklarationen von Variablen finden am Anfang einer Klasse statt.

## Namen von Variablen und Klassen

Variablen und Arrays beginnen immer mit einem kleinen Buchstaben. Für jedes neue Wort wird der erste Buchstabe groß 
geschrieben, zum Beispiel `$halloWelt`. Wir verwenden keinen Präfix '_' für Variablen, die **protected** oder 
**private** sind.

Das selbe gilt für Funktionen. In Test-Funktionen ist das erste Wort immer z.B. `testHalloWelt()`.

Klassen beginnen mit einem Großbuchstaben. Außerdem steht vor der Klasse der Pfad der Klasse, der durch
einen Unterstrich getrennt wird. 

In neueren Paketen wie **opus4-common** verwenden wir bereits Namespaces. Das Framework und die Application 
verwenden noch ein älteres Namenschema wie es in Zend Framework 1 verwendet wird. In der Application sind Klassen
in der Regel entweder Teil eines Modules oder der Library.  

| Klasse | Datei |
| ------ | ----- |
| `Application_Controller_ActionCRUD` | library/Application/Controller/ActionCRUD.php |
| `Admin_Model_EnrichmentKeys` | modules/admin/models/EnrichmentKeys.php |
    
## Arrays

Für Arrays verwenden wir die Kurzschreibweise, also `[]`. Die alte Form, `array()` wird nicht mehr verwendet. Muss
das Array über mehrere Zeilen verteilt werden, steht nach `[` bzw. vor `]` nichts in der jeweiligen Zeile.

{% highlight php %}
$one = [1, 2, 3, 'test', 'Flugzeug'];
$two = [
    1, 2, 3, 'test', 'Flugzeug'
];
{% endhighlight %}


## Dokumentation

In der Dokumentation sollte nicht nur das stehen, was man sowieso schon im Code sieht. Am wichtigsten ist es
die Absichten festzuhalten, so dass später bei Problemen ein Abgleich zwischen dem was ein Stück Code tun soll
und was es wirklich tut vorgenommen werden kann. 

Darüber hinaus ist es wichtig zu dokumentieren, wenn Kompromisse eingegangen werden und warum. Zusammenhänge,
die sich nicht direkt aus dem Code erschließen und wichtig für das Verständnis eines Entwicklers sind sollten
dokumentiert werden. 

Es geht bei der Dokumenation nicht darum, irgendwelche Minimalanforderungen zu erfüllen. Man sollte sich immer
fragen, was der neue Entwickler, der morgen anfangt braucht, um schnell einsteigen zu können. Was braucht ich, 
wenn ich mir den Code in zwei Jahren anschaue?  

Jede Funktion und jede Klasse sollte einen Dokumentationsblock haben. Die drei wichtigsten Bestandteile sind 
die Beschreibung der Funktionalität, die Parameter und der Rückgabewert. Die Beschreibung sollte in einem 
kurzen Satz in einer Zeile erfolgen. Danach können weiter Erläuterungen über mehrere Zeilen hinweg geschrieben 
werden.

{% highlight php %}
/**
 * Kurze Beschreibung der Funktion.
 *
 * Ausführlichere Erläuterungen zur Funktion. 
 *
 * @param  
 * @param 
 * @return 
 */
{% endhighlight %}

### TODO und FIXME Kommentare

Nicht für jede Kleinigkeit lohnt sich ein neues Ticket. Manchmal müssen Kompromisse gemacht werden, bei denen klar
ist, dass später weitere Änderungen sinnvoll werden. Erkenntnisse sollten mit `@TODO` oder `@FIXME` direkt im Code
festgehalten werden, damit diese Informationen nicht verloren gehen und später schnell aufgegriffen werden können. 

## Header

Alle OPUS 4-Dateien bekommen einen Lizenz-Header wie den folgenden. In manchen Dateien müssen weitere Header und
Lizenzen von anderen Projekten berücksichtigt werden. Die Metadaten müssen für jede Datei angepasst werden, 
insbesondere `@category`, `@package`, `@author` und `@copyright`. 

{% highlight php %}
/**
 * This file is part of OPUS. The software OPUS has been originally developed
 * at the University of Stuttgart with funding from the German Research Net,
 * the Federal Department of Higher Education and Research and the Ministry
 * of Science, Research and the Arts of the State of Baden-Wuerttemberg.
 *
 * OPUS 4 is a complete rewrite of the original OPUS software and was developed
 * by the Stuttgart University Library, the Library Service Center
 * Baden-Wuerttemberg, the Cooperative Library Network Berlin-Brandenburg,
 * the Saarland University and State Library, the Saxon State Library -
 * Dresden State and University Library, the Bielefeld University Library and
 * the University Library of Hamburg University of Technology with funding from
 * the German Research Foundation and the European Regional Development Fund.
 *
 * LICENCE
 * OPUS is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the Licence, or any later version.
 * OPUS is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details. You should have received a copy of the GNU General Public License
 * along with OPUS; if not, write to the Free Software Foundation, Inc., 51
 * Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 * @category    Tests
 * @package     Opus_Validate
 * @author      Maximilian Salomon <salomon@zib.de>
 * @copyright   Copyright (c) 2019, OPUS 4 development team
 * @license     http://www.gnu.org/licenses/gpl.html General Public License
 */
{% endhighlight %}

# PHP CodeSniffer

In den `composer.json`-Dateien sind Skripte definiert, um den Coding Style automatisch zu überprüfen. Dabei wird `phpcs`
verwendet, dass in der Datei `phpcs.xml` konfiguriert wird. Mit Composer kann man die Prüfungen wie folgt ausführen. 

    $ composer cs-check
    
Mit folgendem Kommando wird ein Report generiert und in `build/checkstyle.xml` gespeichert.

    $ composer cs-report 

Nicht alle aktuellen Dateien in OPUS 4 entsprechen bereits dem Standard.
   
<p class="note" markdown="1">
Für neuere Pakete, wie [opus4-common][OPUS4COMMON] muss die Prüfung des Coding Styles ohne Meldungen durchlaufen. 
Beim [framework][FRAMEWORK] und der [application][APPLICATION] gibt es noch alten Code, der noch nicht angepasst wurde. 
Dort werden zur Zeit noch viele Verletzungen des Coding Styles gemeldet. 
Hier sollten vorerst nur einzelne Dateien geprüft werden. Neuer oder veränderter Code muss den Vorgaben entsprechen. 
</p>

# Beispiel

{% highlight php %}
/**
 * Dokumentations Block hier
 */
class Foo
{

    const KONSTANTE = 'beispiel';
    
    private $counter = 0;

    /**
     * Returns value of counter.
     *
     * @return integer Current value of counter.
     */
    public function getCounter()
    {
        return $this->counter;
    }
}
{% endhighlight %}    

[ZF1CS]: https://framework.zend.com/manual/1.12/de/coding-standard.coding-style.html
[ZF2CS]: https://framework.zend.com/manual/2.4/en/ref/coding.standard.html
[OPUS4COMMON]: https://github.com/OPUS4/opus4-common
[FRAMEWORK]: https://github.com/OPUS4/framework
[APPLICATION]: https://github.com/OPUS4/application
