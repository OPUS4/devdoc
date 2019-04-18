---
title: Composer
---

# Composer

[Composer Dokumentation](https://getcomposer.org/doc/)

## Einbinden von lokalen Paketen während der Entwicklung

Während der Entwicklung, z.B. am Framework, ist es manchmal notwendig Tests in der Applikation 
durchzuführen. Dafür muss die lokale Entwicklungsversion in die Applikation eingebunden werden.

Dafür kann man in `composer.json` folgenden Einträge vornehmen.

{% highlight json %}
"repositories": [
  {
    "type": "path",
    "url": "../framework",
    "options": {
      "symlink": true
    }
  }
]
{% endhighlight %}

{% highlight json %}
"require": {
  "opus4-repo/framework": "@dev"
}
{% endhighlight %}

Mit folgendem Kommando kann das Paket, dann lokal durch einen symbolischen Link installiert werden.

```
$ composer update opus4-repo/framework --prefer-source
```

Änderungen im Source Code des Paketes wirken sich so sofort aus und können getestet werden.

<p class="note" markdown="1">
Wenn das Paket bereits installiert ist wird es unter Umständen nicht durch den symbolischen Link ersetzt. 
In diesem Fall das Paket einfach aus dem `vendor`-Verzeichnis entfernen.
</p>