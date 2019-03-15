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


    $ javascriptTranslations = $this->view->getHelper('javascriptMessages');
    $ javascriptTranslations->addMessage('identifierInvalidFormat');

3. Die Übersetzung muss auch in Ihrer neuen Javascript Datei erscheinen. In dieser muss eine Standardnachricht in 
englischer Sprache zu finden sein. Diese Nachricht **muss** im Array `opus4Messages` untergebracht werden. Zum Beispiel:
 `opus4Messages["uploadedFileHasErrorMessage"] = "The file '%name%' has the following errors:"`. Diese Nachricht kann 
dann an entsprechender Stelle in Ihrer neuen Javascript Datei ausgegeben werden. Die Datein `upload.js` und 
`validation.js` stellen Beispiele dar, an denen Sie sich orientieren können. 
**Achtung:** Der Übersetzungschlüssel, im gezeigten Beispiel `uploadedFileHasErrorMessage`, muss mit dem der tmx Datei 
übereinstimmen.

TODO Beispieldateien, wenn verwendet, verlinken
TODO Erläutern wie, warum man Default-Text definiert (Code-Schnipsel)
TODO Verwendung von Übersetzung (Code-Schnipsel)


