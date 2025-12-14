

// gcc -o harfbuzz_demo main.c `pkg-config --cflags --libs gtk4 harfbuzz cairo freetype2`

#include <gtk/gtk.h>
#include <cairo.h>
#include <hb.h>
#include <hb-ft.h>
#include FT_FREETYPE_H

static FT_Library ft_library;
static FT_Face ft_face;
static hb_font_t *hb_font;

static void init_harfbuzz() {
    FT_Init_FreeType(&ft_library);
    FT_New_Face(ft_library, "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 0, &ft_face);
    hb_font = hb_ft_font_create(ft_face, NULL);
    hb_font_set_scale(hb_font, 36*64, 36*64);
}

static void draw_function(GtkDrawingArea *area, cairo_t *cr, int width, int height, gpointer user_data) {
    cairo_set_source_rgb(cr, 0.0, 1.0, 1.0);  // Cyan BG
    cairo_paint(cr);
    
    if (!hb_font) return;
    
    const char *text = "Hello, HarfBuzz! ÄÖÜöäüÿŸlllwww";
    hb_buffer_t *buf = hb_buffer_create();
    hb_buffer_add_utf8(buf, text, -1, 0, -1);
    hb_buffer_guess_segment_properties(buf);
    
    hb_shape(hb_font, buf, NULL, 0);
    
    unsigned int glyph_count;
    hb_glyph_info_t *glyph_info = hb_buffer_get_glyph_infos(buf, &glyph_count);
    hb_glyph_position_t *glyph_pos = hb_buffer_get_glyph_positions(buf, &glyph_count);
    
    // **NORMALES CAIRO** - HarfBuzz NUR für Positionen!
    cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, 36);
    
    double x = 20, y = height / 2 + 15;
    char ch[5];
    
    for (unsigned int i = 0; i < glyph_count; i++) {
        gunichar unichar = g_utf8_get_char(text + glyph_info[i].cluster);
        int len = g_unichar_to_utf8(unichar, ch);
        ch[len] = 0;
        
        cairo_move_to(cr, x + glyph_pos[i].x_offset / 64.0, 
                         y + glyph_pos[i].y_offset / 64.0);
        cairo_show_text(cr, ch);
        
        x += glyph_pos[i].x_advance / 64.0;
        y += glyph_pos[i].y_advance / 64.0;
    }
    
    hb_buffer_destroy(buf);
}

static void activate(GtkApplication *app, gpointer user_data) {
    init_harfbuzz();
    
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "HarfBuzz GTK4");
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 200);
    
    GtkWidget *drawing_area = gtk_drawing_area_new();
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), draw_function, NULL, NULL);
    gtk_widget_set_hexpand(drawing_area, TRUE);
    gtk_widget_set_vexpand(drawing_area, TRUE);
    gtk_window_set_child(GTK_WINDOW(window), drawing_area);
    
    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv) {
    GtkApplication *app = gtk_application_new("org.gtk.harfbuzz", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    int status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
    
    hb_font_destroy(hb_font);
    FT_Done_Face(ft_face);
    FT_Done_FreeType(ft_library);
    return status;
}

