---
title: Javascript
weight: 10
---

# Javascript

In Opus4 werden aktuell Javascript Datein benutzt, um spezielle Funktionalitäten nur auf der Client-Seite zur Verfügung 
zu stellen.
Die Javascript Datein werden in `public/layouts/opus4/js` abgelegt.

## Integration

Um eine Funktionalität mithilfe von Javascript zur Verfügung zu stellen, müssen diese nicht nur im enstprechenden Ordner
abgelegt werden, sonder auch in Opus4 integriert werden. <br>
Diese Integration findet über die `common.phtml` statt, welche sich im Pfad `public/layouts/opus4` befindet. Dort finden
sich verschiedene Beispiele zur Integration von Javascript-Funktionaliäten.

## Übersetzungen

Einige Funktionalitäten haben möglicherweise Textausgaben für den Benutzer auf der Oberfläche. Diese müssen übersetzt 
werden. Die Übersetzung in Opus4 findet üblicherweise mithilfe von Zend statt. Da Javascript keinen Zugriff auf dieses
Feature hat, wurde eine eigene Übersetzungsmechanik für Javascript entwickelt, welche die Übersetzungen für Javascript 
über die übliche Mechanik zur Verfügung stellt. <br>
<br>
Die Übersetzungsmechanik läuft über einen View-Helper, der einen script-Block im HTML zur Verfügung stellt, aus dem das
Javascript seine übersetzten Nachrichten beziehen kann. Die Mechanik ist in 
`library/Application/View/Helper/JavascriptMessages.php` zu finden. <br>
<br>
Um die Übersetzungen zu nutzen, gibt es drei Stellen, an denen diese hinzugefügt werden müssen.

1. Die Übersetzung muss in der tmx Datei erscheinen. Nutzen Sie bitte vorzugsweise die entsprechende tmx Datei des
  Modules, in welchem Sie die Funktionalität zur Verfügung stellen wollen. Alternative finden Sie im default-Modul tmx
  Datein, die übergreifend genutzt werden können. Die Datein finden sich immer im entsprechenden Modul im language Ordner.

2. Die Übersetzung muss auch in Ihrer neuen Javascript Datei erscheinen. In dieser muss eine Standardnachricht in 
englischer Sprache zu finden sein. Diese Nachricht **muss** im Array `opus4Messages` untergebracht werden. Zum Beispiel:
 `opus4Messages["uploadedFileHasErrorMessage"] = "The file '%name%' has the following errors:"`. Diese Nachricht kann 
dann an entsprechender Stelle in Ihrer neuen Javascript Datei ausgegeben werden. Die Datein `upload.js` und 
`validation.js` stellen Beispiele dar, an denen Sie sich orientieren können. 
**Achtung:** Der Übersetzungschlüssel, im gezeigten Beispiel `uploadedFileHasErrorMessage`, muss mit dem der tmx Datei 
übereinstimmen.

3. Als letztes muss die Übersetzung der tmx Datei über den ViewHelper auch zur Verfügung gestellt werden. Dies geschieht
über den Controller. Dazu fügen Sie im Controller die Übersetzung mithilfe von `addTranslation` hinzu. Dafür nutzen Sie
bitte den Controller, der für den Bereich verantwortlich ist, in dem Sie die Nachricht ausgeben möchten. 
Im Folgenden finden Sie dazu ein kurzes Code-Beispiel für eine Übersetzung. 

```
$javascriptTranslations = $this->view->getHelper('javascriptMessages');
$javascriptTranslations->addMessage('identifierInvalidFormat');
``` 