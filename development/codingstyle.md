---
title: Coding Style
weight: 50
---

# Coding Style
In OPUS4 wird nach dem Coding Style vom Zend Framework 1 entwickelt. Dieser ist auf folgender Homepage zu finden:
https://framework.zend.com/manual/1.11/de/coding-standard.coding-style.html.

Dennoch ein paar Grundlagen:

####Bennenung
Variablen und Arrays beginnen immer mit einem kleinen Buchstaben. Für jedes neue Wort wird der erste Buchstabe groß geschrieben.
Zum Beispiel `$halloWelt`

Das selbe gilt für Funktionen. In Test-Funktionen ist das erste Wort immer `test`.

Klassen beginnen auch mit einem Großbuchstaben. Außerdem steht vor der Klasse der Pfad der Klasse, der durch
einen Unterstrich getrennt wird. 

    Application_Controller_ActionCRUD   -> library/Application/Controller/ActionCURD (in der Library)
    Admin_Model_EnrichmentKeys  -> modules/admin/models/EnrichmentKeys (in einem Modul)
    
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
# PHP CodeSniffer
