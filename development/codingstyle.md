---
title: Coding Style
weight: 50
---

# Coding Style
In OPUS4 wird nach dem Coding Style vom Zend Framework 1 entwickelt. Dieser ist auf folgender Homepage zu finden:
https://framework.zend.com/manual/1.12/de/coding-standard.coding-style.html.

Dennoch ein paar Grundlagen:

####Form
Die maximale Zeilenlänge beträgt 120 Zeichen.

Es gilt die grundlegende Idee des OOP. Jede Klasse in eine eigene Datei. Eine Funktion hält, wenn möglich, eine 
Funktionalität. 

Am Ende einer Klasse ist immer eine Leerzeile und am Anfang immer ein Dokumentationsblock.

Jede Einrückung wird mit 4 Leerzeichen getätigt.

Klammern werden nicht in der selben Zeile von Funktions- oder Klassennamen gesetzt.

Der Rückgabewert einer Funktion steht nicht in Klammern.

Deklarationen für Klassenspezifische Variablen finden immer am Anfang einer Klasse statt.
```
01    /**
02    * Dokumentations Block hier
03    */
04    class Foo
05    {
06          Deklaration
07        /**
08         * Dokumentations Block hier
09         */
10        public function bar()
11        {
12            // gesamter Inhalt der Funktion
13            // muss durch view Leerzeichen eingerückt sein
14            return $this->bar;
15        }
16    }
17    
```
####Bennenung
Variablen und Arrays beginnen immer mit einem kleinen Buchstaben. Für jedes neue Wort wird der erste Buchstabe groß geschrieben.
Zum Beispiel `$halloWelt`

Das selbe gilt für Funktionen. In Test-Funktionen ist das erste Wort immer z.B. `testHalloWelt()`.

Klassen beginnen mit einem Großbuchstaben. Außerdem steht vor der Klasse der Pfad der Klasse, der durch
einen Unterstrich getrennt wird. 

    Application_Controller_ActionCRUD   -> library/Application/Controller/ActionCURD (in der Library)
    Admin_Model_EnrichmentKeys  -> modules/admin/models/EnrichmentKeys (in einem Modul)
    
Generell gilt, so prägnant wie möglich. Der Name der Funktion oder Klasse sollte ihre Funktionalität im idealfall 
selbst erklären.

####Arrays
Ein Array kann auf 3 Wegen definiert werden. (Siehe Code-Beispiel)
Nach einem Komma gehört ein Leerzeichen und statt `array()` kann auch `[]` benutzt werden. In assoziativen Arrays
wird für jedes Schlüssel-Wert Paar eine neue Zeile benutzt.
```
    $array = array(1, 2, 3, 'test', 'Flugzeug');
    $array2 = array(
        1, 2, 3, 'test', 'Flugzeug'
        );
    $array3 = array(1, 2, 3,
        'test', 'Flugzeug');      
```

####Kontrollanweisungen
Die Bedingung einer Anweisung wird in Klammern gesetzt und hat vor und nach der Klammer ein Leerzeichen.
Die Anweisung ist in geschweiften Klammern zu setzen und beginnt in der Zeile der Bedingung und endet in einer
leeren Zeile. Bei If-Bedingungen wird das else oder if-else in die Zeile der schließenden Klammer gesetzt. 
Als Beispiel: 
```
if ($a != 2) {
    $a = 2;
} elseif ($a == 3) {
    $a = 4;
} else {
    $a = 7;
}
```
Diese Regeln gelten auch für Schleifen. Ist die Bedingung zu lang, kann vor einem logischen Operator gebrochen 
werden.
####Dokumentation
Jede Funktion und jede Klasse sollte einen Dokumentationsblock haben. Die drei minimalen Bestandteile sind 
die Beschreibung der Funktionalität auch die Argumente und die Rückgabewerte.

```
/**
* Beschreibung
*
* @param
* @return
*/
```
####Kopfzeile
Am Anfang einer jeden Datei ist bei OPUS4 eine Kopfzeile nötig.

Als erstes kommt `<?php` welches dem System vermittelt, dass es sich um eine PHP-Datei handelt.
Es folgt die License von OPUS4. Am Ende werden ein paar Metadaten wie Paket, Kategorie und Autor genannt.
Das folgende ist ein Beispiel dafür. Der Lizenztext ist immer gleich, lediglich die Metadaten werden entsprechend
angepasst.

```
<?php
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
 * @author      Maximilian Salomon (salomom@zib.de)
 * @copyright   Copyright (c) 2017-2018, OPUS 4 development team
 * @license     http://www.gnu.org/licenses/gpl.html General Public License
 */
```
# PHP CodeSniffer
Den Coding-Style kann man mit einem CodeSniffer testen. In OPUS4 lässt sich das mit `ant phpcs` machen.
Das Ergebnis findet sich in der Datei `/build/logs/checkstyle.xml`. 