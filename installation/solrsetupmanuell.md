---
title: Solr manuell einrichten
group: navigation
weight: 100
---

# Apache Solr für OPUS 4 einrichten

Die folgende Anleitung beschreibt, wie Apache Solr manuell für OPUS 4 eingerichtet werden kann. Die Beschreibung bezieht
sich auf Ubuntu 16.04 LTS und Solr 7.7.1. Die Schritte sollten für andere Linux-Distributionen ähnlich sein.

Es wird hier nur auf die grundlegendsten Schritte eingegangen. Mehr Information finden sich in der Dokumentation auf den
Solr-Webseiten.

<http://lucene.apache.org/solr/guide/7_7>
 

## Solr herunterladen

Zuerst muss die Solr-Distribution von der [Solr](http://lucene.apache.org/solr/)-Webseite heruntergeladen werden. Die
heruntergeladene Datei, z.B. `solr-7.7.1.tgz` muss anschließend entpackt werden.

{% highlight bash %}
tar xvfz solr-7.7.1.tgz
{% endhighlight %}

## Solr installieren

Solr kommt mit einem Installationsskript, `bin/install_solr_service.sh`, das genutzt werden kann, um Solr als Service 
auf dem System zu installieren. In der Regel reicht es, das Script nach dem Auspacken des Solr-Downloads mit dem Pfad
zum Download-TAR aufzurufen.

    $ solr-7.7.1/bin/install_solr_service.sh solr-7.7.1.tgz
    
Weitere Informationen finden sich auf den Solr-Webseiten.  

<http://lucene.apache.org/solr/guide/7_7/taking-solr-to-production.html>

Wenn OPUS 4 nur getestet werden soll, kann Solr auch direkt ohne eine Installation als Service gestartet und genutzt 
werden. In jedem Fall müssen aber die Konfigurationsdateien für OPUS 4 hinzugefügt werden, damit die Indizierung und
Suche wie erwartet funktionieren.

## Konfigurationsdateien

Die OPUS 4 Konfigurationsdateien für Solr liegen ab OPUS 4.6.4 im Verzeichnis `vendor/opus4-repo/search/config`.

* solrconfig.xml
* schema.xml

## Verzeichnisse vorbereiten

Nach der Installation von Solr als Service liegen die Daten für Solr normalerweise unter `/var/solr/data`. Dort muss
für OPUS 4 ein Unterverzeichnis angelegt werden.

{% highlight bash %}
$ cd /var/solr/data
$ mkdir opus4
$ cd opus4
$ mkdir conf
$ cd conf
{% endhighlight %}

## Konfigurationsdateien ablegen

Die Konfigurationsdateien von OPUS 4 müssen im `conf`-Verzeichnis liegen. Es bietet sich an, diese zu verlinken, damit
bei einem Update Änderungen an diesen Dateien automatisch übernommen werden. 

{% highlight bash %}
$ cd /var/solr/data/opus4/conf
$ ln -sv /home/opus/opus4/vendor/opus4-repo/search/config/solrconfig.xml solrconfig.xml
$ ln -sv /home/opus/opus4/vendor/opus4-repo/search/config/schema.xml schema.xml
{% endhighlight %}

Der Pfad zu den Dateien muss an die eigene Installation angepasst werden.

Zum Schluss muss Solr neu gestartet werden.

{% highlight bash %}
$ sudo service solr restart 
{% endhighlight %}

Man kann schauen, ob Solr korrekt gestartet wurde, indem man die URL `http://localhost:8983` aufruft. 
