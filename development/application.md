---
title: Applikation
weight: 60
---

# Zugriff auf Boolesche Konfigurationsparameter

Der Zugriff auf Boolesche Konfigurationsparameter (über `Zend_Config`) sollte
folgendermaßen umgesetzt werden (hier am Beispiel des Konfigurationsparameters
`foo.bar`):

```php
$config = Zend_Registry::get('Zend_Config');
$boolVal = isset($config->foo->bar) && filter_var($config->foo->bar, FILTER_VALIDATE_BOOLEAN);
```

Diese Art des Auslesen garantiert, dass in `$boolVal` tatsächlich ein boolescher
Wert (`TRUE` oder `FALSE`) steht. Ist der Parameter `foo.bar` in der Konfiguration
gar nicht vorhanden, so liefert `$boolVal` ebenfalls `FALSE`.

Innerhalb von Konfigurationsdateien (`ini`-Dateien) werden die folgenden Werte
auf den Wahrheitswert `TRUE` abgebildet:

```
1
true
'1'
'true'
'on'
'yes'
```

Alle anderen Werte werden auf `FALSE` abgebildet.


# Unit Tests

## Setup

### Mailserver

Der Mailserver läuft auf Port 25000.

{% highlight bash %}
$ php $BASEDIR/scripts/opus-smtp-dumpserver.php 2>&1 >>$BASEDIR/tests/workspace/logs/opus-smtp-dumpserver.log &
{% endhighlight %}
