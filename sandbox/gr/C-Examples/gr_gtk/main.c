
// cmake ../gr/ -DCMAKE_INSTALL_PREFIX=/usr/local 

// gcc main.c -o main `pkg-config --cflags --libs cairo gtk4` -lGR -lm


#include <gtk/gtk.h>
#include <math.h>
#include <gr.h>

#define GRID_SIZE 500      // Auflösung der Grafik (Pixel-Gitter)
#define N_POINTS  100      // Anzahl der Zufalls-Messpunkte (Qualität der Daten)
#define N_LEVELS  20       // Anzahl der Kontur-Ringe (Optik)

typedef struct {
    double xd[N_POINTS], yd[N_POINTS], zd[N_POINTS];
    double x[GRID_SIZE], y[GRID_SIZE], z[GRID_SIZE * GRID_SIZE];
    double h[N_LEVELS];
} PlotData;

static void draw_func(GtkDrawingArea *drawing_area, cairo_t *cr, 
                      int width, int height, gpointer user_data) {
    PlotData *pd = (PlotData *)user_data;

    // 1. Zwischen-Buffer im RAM erstellen (vermeidet (nil) Pointer)
    cairo_surface_t *mem_surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, width, height);
    cairo_t *mem_cr = cairo_create(mem_surface);

    // Hintergrund weiss füllen
    cairo_set_source_rgb(mem_cr, 1, 1, 1);
    cairo_paint(mem_cr);
    cairo_destroy(mem_cr);

    unsigned char *pixels = cairo_image_surface_get_data(mem_surface);
    
    // 2. GR Target-String bauen
    char target[128];
    sprintf(target, "!%dx%d@%p.mem", width, height, (void*)pixels);
    
    // 3. GR Rendering
    gr_beginprint(target);
    
    gr_setviewport(0.1, 0.9, 0.1, 0.9);
    gr_setwindow(-2, 2, -2, 2);

//    gr_setspace(-0.5, 0.5, 0, 90);
 gr_setspace(-0.5, 0.5, 30, 40);

    gr_setmarkersize(1.0);
    gr_setmarkertype(1);
    gr_setcharheight(0.024);

    // Zeichne die vorbereitete Oberfläche
//    gr_surface(GRID_SIZE, GRID_SIZE, pd->x, pd->y, pd->z, 5);
    gr_surface(GRID_SIZE, GRID_SIZE, pd->x, pd->y, pd->z, 4);

    gr_contour(GRID_SIZE, GRID_SIZE, N_LEVELS, pd->x, pd->y, pd->h, pd->z, 0);
    gr_polymarker(N_POINTS, pd->xd, pd->yd);
    gr_axes(0.25, 0.25, -2, -2, 2, 2, 0.01);
    
    gr_endprint();

    // 4. Den fertigen Plot auf das GTK-Fenster übertragen
    cairo_set_source_surface(cr, mem_surface, 0, 0);
    cairo_paint(cr);

    // Aufräumen
    cairo_surface_destroy(mem_surface);
}

static void activate(GtkApplication *app, gpointer user_data) {
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "GR 3D Surface in GTK4");
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    GtkWidget *drawing_area = gtk_drawing_area_new();
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), draw_func, user_data, NULL);
    
    gtk_window_set_child(GTK_WINDOW(window), drawing_area);
    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv) {
    PlotData pd;
    int i;

    // Daten einmalig vorbereiten
    srand(0);
    for (i = 0; i < N_POINTS; i++) {
        pd.xd[i] = -2 + 4.0 * rand() / RAND_MAX;
        pd.yd[i] = -2 + 4.0 * rand() / RAND_MAX;
        pd.zd[i] = pd.xd[i] * exp(-pd.xd[i] * pd.xd[i] - pd.yd[i] * pd.yd[i]);
//pd.zd[i] = sin(pd.xd[i] * pd.xd[i] + pd.yd[i] * pd.yd[i]);

    }
    // Gitter-Berechnung (Gridit) vorab durchführen
    gr_gridit(N_POINTS, pd.xd, pd.yd, pd.zd, GRID_SIZE, GRID_SIZE, pd.x, pd.y, pd.z);
    for (i = 0; i < N_LEVELS; i++) pd.h[i] = -0.5 + i / (double)(N_LEVELS - 1);

    GtkApplication *app = gtk_application_new("org.gr.gtk4.surface", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), &pd);
    
    int status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}

