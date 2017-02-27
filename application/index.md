---
title: User Interface
weight: 80
---

# OPUS 4 User Interface

Das User Interface von OPUS 4 ist die "application". Es basiert auf dem 
Zend Framework 1.

## Hinweise

In den Controllern werden manchmal Redirects ausgelöst. Zend bietet 
Funktionen wie **RedirectAndExit** an, die es erlauben die Ausführung
der Requests gleich nach dem Redirekt abzubrechen, egal ob danach noch 
Code im Controller kommt. Werden diese Funktionen verwendet kann das 
Probleme bei den Unit Tests bereiten, da der Testprozess dann einfach
abgebrochen wird. Das Unit Test Framework unterdrückt daher den Exit 
im Redirect Helper. Abhängig vom Code greift das aber unter Umständen 
nicht. Daher sollte sich der OPUS 4 Code nie auf "AndExit" Funktionen
verlassen.







