


// gcc main.c -o main `pkg-config --cflags --libs gtk4 gobject-2.0`

// gcc -o main main.c `pkg-config --cflags --libs harfbuzz freetype2`
// gcc -o main main.c `pkg-config --cflags --libs harfbuzz`

// gcc -o main main.c `pkg-config --cflags --libs gtk4 harfbuzz`
// gcc -o main main.c `pkg-config --cflags --libs gtk4 harfbuzz freetype2 cairo`

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-welches-pIzb0Z04T0qvCzE115caJg

#include <gtk/gtk.h>
#include <cairo.h>
#include <hb.h>

static cairo_surface_t *surface = NULL;
static cairo_t *cr = NULL;

static void draw_function(GtkDrawingArea *area, cairo_t *cr, int width, int height, gpointer user_data) {
    cairo_set_source_surface(cr, surface, 0, 0);
    cairo_paint(cr);
}

static void activate(GtkApplication *app, gpointer user_data) {
    GtkWidget *window;
    GtkWidget *drawing_area;

    window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "HarfBuzz und Cairo Beispiel");
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 100);

    drawing_area = gtk_drawing_area_new();
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), draw_function, NULL, NULL);
    gtk_window_set_child(GTK_WINDOW(window), drawing_area);

    surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 400, 100);
    cr = cairo_create(surface);

    // Hintergrund
    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);

    // Text vorbereiten
    const char *text = "Hello, HarfBuzz! ÄÖÜöäüÿŸlllwww";
    hb_buffer_t *buf = hb_buffer_create();
    hb_buffer_add_utf8(buf, text, -1, 0, -1);
    hb_buffer_guess_segment_properties(buf);

    // HarfBuzz Font erstellen (ohne echte Schriftart)
    hb_font_t *hb_font = hb_font_create(hb_face_get_empty());
    hb_font_set_scale(hb_font, 18 * 64, 18 * 64);

    // Shaping durchführen
    hb_shape(hb_font, buf, NULL, 0);

    unsigned int glyph_count;
    hb_glyph_info_t *glyph_info = hb_buffer_get_glyph_infos(buf, &glyph_count);
    hb_glyph_position_t *glyph_pos = hb_buffer_get_glyph_positions(buf, &glyph_count);

    // Text zeichnen
    cairo_set_source_rgb(cr, 0, 0, 0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 18);

// ... (vorheriger Code bleibt unverändert)

double x = 10, y = 50;
for (unsigned int i = 0; i < glyph_count; i++) {
    cairo_text_extents_t extents;
    char glyph_char[5] = {0};
    int len = g_unichar_to_utf8(g_utf8_get_char(text + glyph_info[i].cluster), glyph_char);
    
    cairo_text_extents(cr, glyph_char, &extents);
    
    cairo_move_to(cr, x + glyph_pos[i].x_offset / 64.0 - extents.x_bearing, 
                     y - glyph_pos[i].y_offset / 64.0);
    cairo_show_text(cr, glyph_char);
    
    // Berechne den Abstand basierend auf der Zeichenbreite
    double char_width = extents.x_advance;
    double spacing = char_width * 1.2; // 20% der Zeichenbreite als Abstand

    x += glyph_pos[i].x_advance / 64.0 + spacing;
    y -= glyph_pos[i].y_advance / 64.0;
}

// ... (restlicher Code bleibt unverändert)

    // Aufräumen
    hb_buffer_destroy(buf);
    hb_font_destroy(hb_font);

    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv) {
    GtkApplication *app;
    int status;

    app = gtk_application_new("org.example.HarfbuzzCairo", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    if (cr) cairo_destroy(cr);
    if (surface) cairo_surface_destroy(surface);

    return status;
}

