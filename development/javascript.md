---
title: Javascript
weight: 10
---

# Javascript

In OPUS 4 werden aktuell Javascript-Dateien benutzt, um spezielle Funktionen direkt im Browser auf der Client-Seite zur 
Verfügung zu stellen. Die Javascript-Dateien werden in `public/layouts/opus4/js` abgelegt.

## Integration

Um eine Funktionalität mit Hilfe von Javascript zur Verfügung zu stellen, müssen diese nicht nur im enstprechenden 
Ordner abgelegt werden, sonder auch in Opus4 integriert werden.

Diese Integration findet in der Datei `common.phtml` statt, welche sich im Pfad `public/layouts/opus4` befindet. Dort 
finden sich verschiedene Beispiele zur Integration von Javascript-Funktionalitäten.

## Übersetzungen

Um Textausgaben für den Benutzer in Javascript an die gewählte Sprache anpassen zu können, wurde eine eigene 
Übersetzungsmechanik entwickelt. Auf der Server-Seite werden die Übersetzungen durch das Zend-Framework gehandhabt.  

Um Übersetzungen in Javascript verfügbar zu machen gibt es einen View-Helper 
(`Application_View_Helper_JavascriptMessages`), der einen HTML `script`-Block generiert, aus dem Javascript seine 
übersetzten Nachrichten beziehen kann. 

Um die Übersetzungen zu nutzen, gibt es drei Stellen, an denen diese hinzugefügt werden müssen.

1. Die Übersetzung müssen zu einer TMX-Datei hinzugefügt werden, normalerweise im `language`-Verzeichnis des 
   entsprechenden Modules. Allgemein genutzt Übersetzungen sollten zum Default-Modul hinzugefügt werden.

2. Als nächstes müssen die benötigten Übersetzungen im View-Helper registriert werden, da nicht automatisch alle
   Übersetzungen auf der Client-Seite verfügbar gemacht werden können. Im Controller können mit `addMessage`
   Übersetzungsschlüssel übergeben werden.
    ```
    $ javascriptTranslations = $this->view->getHelper('javascriptMessages');
    $ javascriptTranslations->addMessage('identifierInvalidFormat');
    ```
3. Die Übersetzung muss auch in Ihrer neuen Javascript Datei erscheinen. In dieser muss eine Standardnachricht in 
englischer Sprache zu finden sein. Diese Nachricht **muss** im Array `opus4Messages` untergebracht werden. Zum Beispiel:
 `opus4Messages["uploadedFileHasErrorMessage"] = "The file '%name%' has the following errors:"`. Diese Nachricht kann 
dann an entsprechender Stelle in Ihrer neuen Javascript Datei ausgegeben werden. Die Datein `upload.js` und 
`validation.js` stellen Beispiele dar, an denen Sie sich orientieren können. 
**Achtung:** Der Übersetzungschlüssel, im gezeigten Beispiel `uploadedFileHasErrorMessage`, muss mit dem der tmx Datei 
übereinstimmen.

4. Es ist sinnvoll für Funktionen, welche Übersetzungen benutzen, einen Default-Text zur Verfügung zur stellen.
Damit kann immer eine Nachricht ausgegeben werden ohne zwingend Übersetzungen in der tmx-Datei zu haben.
Dafür muss in dem Array `opus4Messages` ein Key definiert werden. Der dazugehörige Value ist die Default-Nachricht.
Es bietet sich an, diese Nachricht in Englisch zu definieren.
    ```
    opus4Messages["identifierInvalidCheckdigit"] = "The check digit of \'%value%\' is not valid";
    opus4Messages["identifierInvalidFormat"] = "\'%value%\' is malformed";
    ```
### Beispiel

Um die Entwicklung zu erleichtern, folgt ein kurzes Beispiel am Code. (`validation.js`)

Als erstes setzen wir in der Javascript-Datei das `opus4Messages`-Array und definieren die Default-Texte

    var opus4Messages = [];
    opus4Messages["identifierInvalidCheckdigit"] = "The check digit of \'%value%\' is not valid";
    opus4Messages["identifierInvalidFormat"] = "\'%value%\' is malformed";
   
Im Code können wir die Übersetzung mithilfe von `getMessage` nutzen. Value definiert eine bestimmten Wert.
Hier zum Beispiel eine ISBN.
    
    return this.getMessage("identifierInvalidFormat", value);
    
In der Javascirpt-Datei sind wir damit fertig. Nun sollten wir auch eine Übersetzung für unseren Text hinzufügen.
Dies können wir im Controller machen. Dafür definieren wir eine Übersetzung und fügen ihr translation-keys zu.
Hier ein Beispiel aus dem `DocumentController` des `admin`-Moduls.

    $javascriptTranslations = $this->view->getHelper('javascriptMessages');
    $javascriptTranslations->addMessage('identifierInvalidFormat');
    $javascriptTranslations->addMessage('identifierInvalidCheckdigit');

In einer tmx-Datei werden dann diese Schlüssel mit Übersetzungen definiert. Wir müssen hier beachten,
dass die keys überall übereinstimmen. Sonst werden die Default-Texte nicht ordentlich überschrieben.
Hier aus der `error.tmx` des `default`-Moduls. Die tmx-Dateien findet man im `language`-Ordner.
    
    <tu tuid="identifierInvalidCheckdigit">
        <tuv xml:lang="en">
    ...

Das wars. Nun haben wir eine Übersetzung hinzugefügt. Dieses Schema können Sie auch in Ihren eigenen Javascript-Datein
anwenden.