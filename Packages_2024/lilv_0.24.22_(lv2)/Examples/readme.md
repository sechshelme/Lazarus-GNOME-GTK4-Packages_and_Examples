# Einleitung

Von lv2 wurde nur das nötigste übersetzt.


# Standard Plugin

Plugin Examples installieren:
```bash
sudo apt install audacity
```

# Eigene Plugins

## C-Plugin
Folgende Dateien müssen in den Ordner:  `~/.lv2/gain.lv2`
```
gain.so
gain.ttl
manifest.ttl
```

## FPC-Plugin
Folgende Dateien müssen in den Ordner:  `~/.lv2/fpcgain.lv2`
```
libfpcgain.so
fpcgain.ttl
manifest.ttl
```

## Testen der Plugin-Examples
Run-Plugin Demo ausführen.


## Demo Plugin von Ubuntu installieren

```bash
sudo apt install lsp-plugins-lv2
```


