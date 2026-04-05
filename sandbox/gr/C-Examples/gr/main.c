
// cmake ../gr/ -DCMAKE_INSTALL_PREFIX=/usr/local 

// gcc main.c -o main `pkg-config --cflags --libs cairo` -lGR -lm


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <cairo.h>
#include <gr.h>

int main(void)
{
    int width = 800, height = 600;
    double xd[100], yd[100], zd[100];
    double x[200], y[200], z[200 * 200];
    double h[20];
    int i;

    // 1. Cairo-Surface vorbereiten (ARGB32 Format passt zu GR)
    cairo_surface_t *surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, width, height);
    unsigned char *pixels = cairo_image_surface_get_data(surface);

    // 2. Daten wie im ersten Beispiel generieren
    srand(0);
    for (i = 0; i < 100; i++) {
        xd[i] = -2 + 4.0 * rand() / RAND_MAX;
        yd[i] = -2 + 4.0 * rand() / RAND_MAX;
        zd[i] = xd[i] * exp(-xd[i] * xd[i] - yd[i] * yd[i]);
    }

    // 3. GR anweisen, in den Cairo-Buffer zu rendern
    char gr_target[128];
    sprintf(gr_target, "!%dx%d@%p.mem", width, height, (void*)pixels);
    printf("target String: %s\n", gr_target);
    gr_beginprint(gr_target);

    // --- Originale GR-Zeichenbefehle ---
    gr_setviewport(0.1, 0.95, 0.1, 0.95);
    gr_setwindow(-2, 2, -2, 2);
    gr_setspace(-0.5, 0.5, 0, 90);
    gr_setmarkersize(1);
    gr_setmarkertype(1); // GKS_K_MARKERTYPE_SOLID_CIRCLE
    gr_setcharheight(0.024);

    gr_gridit(100, xd, yd, zd, 200, 200, x, y, z);
    for (i = 0; i < 20; i++) h[i] = -0.5 + i / 19.0;
    
    gr_surface(200, 200, x, y, z, 5);
    gr_contour(200, 200, 20, x, y, h, z, 0);
    gr_polymarker(100, xd, yd);
    gr_axes(0.25, 0.25, -2, -2, 2, 2, 0.01);
    // -----------------------------------

    gr_endprint(); // Schliesst den GR-Render-Vorgang ab

    // 4. Cairo informieren und als PNG speichern
    cairo_surface_mark_dirty(surface);
    cairo_surface_write_to_png(surface, "gr_cairo_output.png");

    // Cleanup
    cairo_surface_destroy(surface);
    printf("Grafik wurde in 'gr_cairo_output.png' gespeichert.\n");

    return 0;
}

