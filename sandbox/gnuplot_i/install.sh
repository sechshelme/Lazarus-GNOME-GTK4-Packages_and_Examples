# https://github.com/longradix/gnuplot_i

git clone https://github.com/longradix/gnuplot_i.git

cd gnuplot_i

gcc -fPIC -c gnuplot_i.c -o gnuplot_i.o
gcc -shared -o libgnuplot_i.so gnuplot_i.o

x86_64-w64-mingw32-gcc -DBUILD_DLL -c gnuplot_i.c -o gnuplot_i.o
x86_64-w64-mingw32-gcc -shared -o gnuplot_i.dll gnuplot_i.o

sudo cp gnuplot_i.h /usr/local/include/
sudo cp libgnuplot_i.so /usr/local/lib/
sudo ldconfig


