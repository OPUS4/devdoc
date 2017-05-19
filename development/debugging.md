---
title: Debugging
weight: 900
---

# Debugging

## Skripte

Die Skripte laufen im Normalfall alle im **production** Environment. Um
zum Beispiel auf **testing** umzuschalten und damit unter anderem den 
Log-Level auf **DEBUG** zu setzen, muss die Environment Variable 
`APPLICATION_ENV` auf **testing** gesetzt werden.

```
export APPLICATION_ENV=testing
```

Weitere mögliche Werte sind: **production**, **staging**, **testing**
und **development** (siehe `config.ini`).

Die Log-Ausgaben der Skripte werden in die Datei `logs/opus-console.log`
geschrieben.