---
title: Optionale PHP-Module
---

# Optionale PHP-Module

## PHP-Modul suhosin (Sicherheits-Patches)

Unter Ubuntu/Debian:

    $ sudo apt-get install php5-suhosin

Unter SuSE:

    $ sudo zypper install php5-suhosin

## PHP-Modul xcache (Verbesserung der Performance)

Unter Ubuntu/Debian:

    $ sudo apt-get install php5-xcache

Unter SuSE:

    $ sudo zypper ar -f http://download.opensuse.org/repositories/
    openSUSE:Factory:Contrib/openSUSE_11.3
    openSUSE:Factory:Contrib:openSUSE_11.3
    $ sudo yast2 -i php5-xcache
