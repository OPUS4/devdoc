---
title: XML Cache
---

# XML Cache

Für viele Operationen wird eine XML Repräsentation der Dokumente 
benötigt. Diese wird aus den Informationen in verschiedenen Objekte, 
wie dem Dokument selbt, den Sammlungen, Lizenzen usw. zusammengeführt.
Das ist eine teure Operation. Um die Anzeige in der Frontdoor und den 
Export über OAI zu beschleunigen wird das XML für Dokumente in einem 
Cache gespeichert und nur bei Bedarf aktualisiert, wenn sich Metadaten 
geändert haben.

Die Klasse `Opus_Model_Plugin_InvalidateDocumentCache` sorgt dafür,
das Cache Einträge für betroffene Dokumente gelöscht werden.