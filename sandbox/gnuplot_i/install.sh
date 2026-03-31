# https://github.com/longradix/gnuplot_i

# Download
git clone https://github.com/longradix/gnuplot_i.git
cd gnuplot_i

# *.so erstellen
gcc -fPIC -shared -o libgnuplot_i.so gnuplot_i.c

# *.dll erstellen
x86_64-w64-mingw32-gcc -DBUILD_DLL -shared -o gnuplot_i.dll gnuplot_i.c

# Für Linux installieren
sudo cp gnuplot_i.h /usr/local/include/
sudo cp libgnuplot_i.so /usr/local/lib/
sudo ldconfig


