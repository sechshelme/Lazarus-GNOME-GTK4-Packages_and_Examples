# altes tcl8.0 bauen

Download: https://www.tcl-lang.org/software/tcltk/8.0.html

entpacken: `gunzip -c tcl8.0.5.tar.gz | tar xf -`

In Ordner `unix` wechseln und `bash ./configure --enable-shared --prefix=/usr/local` ausführen. 

Bauen: `make -j`
Installieren: `sudo make install`







