# Fedora Distrobox: GTK4 für Windows (32/64 Bit) bauen und testen

Mit dieser Anleitung kannst du in einer Fedora-Distrobox-Umgebung GTK4 für Windows (32 und 64 Bit) bauen und die DLLs mit Wine auf deinem Linux-Host testen.

---

## Voraussetzungen

- Ubuntu oder ein anderes Debian-basiertes System
- Terminalzugang mit sudo-Rechten

---

## 1. Installation der benötigten Tools

sudo apt update
sudo apt install podman
sudo apt install distrobox

---

## 2. Fedora-Container mit Distrobox erstellen und starten

distrobox create --name fedora42 --image fedora:42
distrobox enter fedora42

---

## 3. MinGW GTK4 für Windows im Container installieren

sudo dnf install mingw32-gtk4 mingw64-gtk4

---

## 4. GTK4 DLLs exportieren

### 64-Bit Windows

cd /usr/x86_64-w64-mingw32/sys-root/mingw/bin/
cp . /home/tux/win64_dll/ -r

### 32-Bit Windows

cd /usr/i686-w64-mingw32/sys-root/mingw/bin/
cp . /home/tux/win32_dll/ -r

---

## 5. GTK4-Demo unter Wine auf dem Host starten (64 Bit)

cd /home/tux/win64_dll
wine gtk4-demo

---

**Hinweis:**  
Passe ggf. die Pfade und den Benutzernamen (`tux`) an dein System an.

---

Viel Erfolg beim Bauen und Testen!
