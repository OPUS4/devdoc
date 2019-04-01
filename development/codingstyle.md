---
title: Coding Style
weight: 50
---

# Coding Style

OPUS 4 richtig sich im Allgemeinen nach dem Coding Style vom Zend Framework 1 und neuer. 

* [Zend Framework 1.12 Coding Style][ZF1CS]
* [Zend Framework 2.4 Coding Standard for PHP][ZF2CS]
{: class="navlist" }

In einigen Punkten weicht der OPUS 4 Source Code von dem auf den Seiten oben beschriebenen Stil ab. 

## Allgemeines

Zeilen sollten nicht länger als **120** Zeichen sein.

Für Einrückungen verwenden wir 4 Leerzeichen. Tab-Zeichen werden nicht verwendet.

Dateien enden immer mit einem Zeilenumbruch, also im Editor mit einer leeren Zeile.

Es gilt die grundlegende Idee des OOP. Jede Klasse in eine eigene Datei. Eine Funktion hält, wenn möglich, eine 
Funktionalität. 

Klammern werden nicht in der selben Zeile von Funktions- oder Klassennamen gesetzt.

Der Rückgabewert einer Funktion steht nicht in Klammern.

Deklarationen für Klassenspezifische Variablen finden immer am Anfang einer Klasse statt.

{% highlight php %}
/**
 * Dokumentations Block hier
 */
class Foo
{

    /**
     * Dokumentations Block hier
     */
    public function bar()
    {
        return $this->bar;
    }
}
{% endhighlight %}

## Benennung

Variablen und Arrays beginnen immer mit einem kleinen Buchstaben. Für jedes neue Wort wird der erste Buchstabe groß 
geschrieben. Zum Beispiel `$halloWelt`

Das selbe gilt für Funktionen. In Test-Funktionen ist das erste Wort immer z.B. `testHalloWelt()`.

Klassen beginnen mit einem Großbuchstaben. Außerdem steht vor der Klasse der Pfad der Klasse, der durch
einen Unterstrich getrennt wird. 

    Application_Controller_ActionCRUD   -> library/Application/Controller/ActionCURD (in der Library)
    Admin_Model_EnrichmentKeys  -> modules/admin/models/EnrichmentKeys (in einem Modul)
    
Generell gilt, so prägnant wie möglich. Der Name der Funktion oder Klasse sollte ihre Funktionalität im Idealfall 
selbst erklären.

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

Jede Funktion und jede Klasse sollte einen Dokumentationsblock haben. Die drei minimalen Bestandteile sind 
die Beschreibung der Funktionalität auch die Argumente und die Rückgabewerte.

{% highlight php %}
/**
 * Beschreibung
 *
 * @param
 * @return
 */
{% endhighlight %}

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

[ZF1CS]: https://framework.zend.com/manual/1.12/de/coding-standard.coding-style.html
[ZF2CS]: https://framework.zend.com/manual/2.4/en/ref/coding.standard.html
[OPUS4COMMON]: https://github.com/OPUS4/opus4-common
[FRAMEWORK]: https://github.com/OPUS4/framework
[APPLICATION]: https://github.com/OPUS4/application
