


// gcc main.c -o main `pkg-config --cflags --libs gtk4 gobject-2.0`

// gcc -o main main.c `pkg-config --cflags --libs harfbuzz freetype2`

// gcc -o main main.c `pkg-config --cflags --libs gtk4` -lm

// https://www.perplexity.ai/search/ich-will-mit-gtk4-2-unterschie-ysrmyTvPTpWC8ykTlLg7og


#include <gtk/gtk.h>

static void draw_function(GtkDrawingArea *area, cairo_t *cr, int width, int height, gpointer user_data) {
    double x1 = 250, y1 = 120, r1 = 70;  // Großer Kreis
    double x2 = 100, y2 = 50, r2 = 15;   // Kleiner Kreis
    double dx = x2 - x1, dy = y2 - y1;
    double dist = sqrt(dx*dx + dy*dy);
    double angle = atan2(dy, dx);
    double alpha = acos((r1 - r2) / dist);

    // Kreise zeichnen
    cairo_set_source_rgb(cr, 0.7, 0.7, 0.7);
    cairo_arc(cr, x1, y1, r1, 0, 2 * M_PI);
    cairo_fill(cr);
    cairo_arc(cr, x2, y2, r2, 0, 2 * M_PI);
    cairo_fill(cr);

    // Teilkreise des Riemens zeichnen
    cairo_set_source_rgb(cr, 0.2, 0.2, 0.2);
    cairo_set_line_width(cr, 5);
    cairo_arc(cr, x1, y1, r1, angle + alpha, angle - alpha);
    cairo_stroke(cr);
    cairo_arc(cr, x2, y2, r2, angle - alpha, angle + alpha);  // Korrigiert
    cairo_stroke(cr);

    // Tangenten zeichnen
    cairo_set_source_rgb(cr, 0.2, 0.2, 0.2);
    cairo_set_line_width(cr, 5);

    // Obere Tangente
    cairo_move_to(cr, x1 + r1 * cos(angle + alpha), y1 + r1 * sin(angle + alpha));
    cairo_line_to(cr, x2 + r2 * cos(angle + alpha), y2 + r2 * sin(angle + alpha));
    cairo_stroke(cr);

    // Untere Tangente
    cairo_move_to(cr, x1 + r1 * cos(angle - alpha), y1 + r1 * sin(angle - alpha));
    cairo_line_to(cr, x2 + r2 * cos(angle - alpha), y2 + r2 * sin(angle - alpha));
    cairo_stroke(cr);
}

static void activate(GtkApplication *app, gpointer user_data) {
    GtkWidget *window;
    GtkWidget *drawing_area;

    window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Zwei Kreise");
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    drawing_area = gtk_drawing_area_new();
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), draw_function, NULL, NULL);

    gtk_window_set_child(GTK_WINDOW(window), drawing_area);

    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv) {
    GtkApplication *app;
    int status;

    app = gtk_application_new("com.example.GtkApplication", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}

