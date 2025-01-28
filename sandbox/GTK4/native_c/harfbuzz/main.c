


// gcc main.c -o main `pkg-config --cflags --libs gtk4 gobject-2.0`

// gcc -o main main.c `pkg-config --cflags --libs harfbuzz freetype2`

#include <stdio.h>
#include <stdlib.h>
#include <hb.h>
#include <hb-ft.h>
#include <freetype/freetype.h>

int main() {
    // Initialisiere FreeType
    FT_Library ft_library;
    if (FT_Init_FreeType(&ft_library)) {
        fprintf(stderr, "Fehler bei der Initialisierung von FreeType\n");
        return 1;
    }

    // Lade eine Schriftart
    FT_Face ft_face;
    if (FT_New_Face(ft_library, "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 0, &ft_face)) {
        fprintf(stderr, "Fehler beim Laden der Schriftart\n");
        return 1;
    }

    // Erstelle einen HarfBuzz Schriftart-Puffer
    hb_font_t *hb_font = hb_ft_font_create(ft_face, NULL);

    // Erstelle einen Puffer und füge Text hinzu
    const char *text = "Hallo, HarfBuzz! äöü";
    hb_buffer_t *buffer = hb_buffer_create();
    hb_buffer_add_utf8(buffer, text, -1, 0, -1);

    // Setze Skript und Sprache
    hb_buffer_set_script(buffer, HB_SCRIPT_LATIN);
    hb_buffer_set_language(buffer, hb_language_from_string("de", -1));

    // Führe Text-Shaping durch
    hb_shape(hb_font, buffer, NULL, 0);

    // Hole die Glyphen-Informationen
    unsigned int glyph_count;
    hb_glyph_info_t *glyph_info = hb_buffer_get_glyph_infos(buffer, &glyph_count);
    hb_glyph_position_t *glyph_pos = hb_buffer_get_glyph_positions(buffer, &glyph_count);

    // Ausgabe der Glyphen-Informationen
    printf("Text: %s\n", text);
    printf("Anzahl der Glyphen: %u\n", glyph_count);
    for (unsigned int i = 0; i < glyph_count; i++) {
        printf("Glyph %u: codepoint=%u, cluster=%u, x_advance=%d, y_advance=%d\n",
               i,
               glyph_info[i].codepoint,
               glyph_info[i].cluster,
               glyph_pos[i].x_advance,
               glyph_pos[i].y_advance);
    }

    // Aufräumen
    hb_buffer_destroy(buffer);
    hb_font_destroy(hb_font);
    FT_Done_Face(ft_face);
    FT_Done_FreeType(ft_library);

    return 0;
}

