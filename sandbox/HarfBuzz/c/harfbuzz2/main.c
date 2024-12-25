


// gcc main.c -o main `pkg-config --cflags --libs gtk4 gobject-2.0`

// gcc -o main main.c `pkg-config --cflags --libs harfbuzz freetype2`
// gcc -o main main.c `pkg-config --cflags --libs harfbuzz freetype2 libpng`

// https://www.perplexity.ai/search/gib-mir-ein-c-beipiel-mit-hard-FmMTrhO4S4e0M0oBSWyuUA

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <hb.h>
#include <hb-ft.h>
#include <ft2build.h>
#include FT_FREETYPE_H
#include <png.h>

#define ATLAS_WIDTH 512
#define ATLAS_HEIGHT 512

typedef struct {
    int x;
    int y;
    int width;
    int height;
} GlyphInfo;

void write_png(const char* filename, unsigned char* data, int width, int height) {
    FILE *fp = fopen(filename, "wb");
    if (!fp) return;

    png_structp png = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    if (!png) return;

    png_infop info = png_create_info_struct(png);
    if (!info) return;

    if (setjmp(png_jmpbuf(png))) return;

    png_init_io(png, fp);

    png_set_IHDR(
        png,
        info,
        width, height,
        8,
        PNG_COLOR_TYPE_GRAY,
        PNG_INTERLACE_NONE,
        PNG_COMPRESSION_TYPE_DEFAULT,
        PNG_FILTER_TYPE_DEFAULT
    );
    png_write_info(png, info);

    png_bytep row_pointers[height];
    for (int y = 0; y < height; y++) {
        row_pointers[y] = &data[y * width];
    }

    png_write_image(png, row_pointers);
    png_write_end(png, NULL);

    fclose(fp);
    png_destroy_write_struct(&png, &info);
}

int main() {
    FT_Library ft_library;
    FT_Face ft_face;
    hb_font_t *hb_font;
    hb_buffer_t *buffer;
    unsigned char *atlas_bitmap;
    GlyphInfo *glyph_infos;
    int atlas_x = 0, atlas_y = 0, max_height = 0;

    // Initialize FreeType
    if (FT_Init_FreeType(&ft_library)) {
        fprintf(stderr, "Error initializing FreeType\n");
        return 1;
    }

    // Load font
    if (FT_New_Face(ft_library, "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 0, &ft_face)) {
        fprintf(stderr, "Error loading font\n");
        return 1;
    }

    // Set font size to 32 pixels
    FT_Set_Pixel_Sizes(ft_face, 0, 32);

    // Create HarfBuzz font
    hb_font = hb_ft_font_create(ft_face, NULL);

    // Create HarfBuzz buffer and add text
    const char *text = "Hello, HarfBuzz! öäü Ÿÿ";
    buffer = hb_buffer_create();
    hb_buffer_add_utf8(buffer, text, -1, 0, -1);
    hb_buffer_set_direction(buffer, HB_DIRECTION_LTR);
    hb_buffer_set_script(buffer, HB_SCRIPT_LATIN);
    hb_buffer_set_language(buffer, hb_language_from_string("en", -1));

    // Shape the text
    hb_shape(hb_font, buffer, NULL, 0);

    // Get glyph information
    unsigned int glyph_count;
    hb_glyph_info_t *glyph_info = hb_buffer_get_glyph_infos(buffer, &glyph_count);

    // Create atlas bitmap
    atlas_bitmap = (unsigned char*)calloc(ATLAS_WIDTH * ATLAS_HEIGHT, sizeof(unsigned char));
    glyph_infos = (GlyphInfo*)malloc(glyph_count * sizeof(GlyphInfo));

    // Render glyphs to atlas
// ... (vorheriger Code bleibt unverändert)
// ... (vorheriger Code bleibt unverändert)

int row_baseline = 0;

// Render glyphs to atlas
for (unsigned int i = 0; i < glyph_count; i++) {
    FT_Load_Glyph(ft_face, glyph_info[i].codepoint, FT_LOAD_RENDER);
    FT_GlyphSlot slot = ft_face->glyph;

    // Get glyph dimensions, even for space
    int glyph_width = slot->metrics.horiAdvance >> 6;  // Convert from 26.6 fixed-point format
    int glyph_height = slot->metrics.height >> 6;

    // Check if we need to move to the next row
    if (atlas_x + glyph_width >= ATLAS_WIDTH) {
        atlas_x = 0;
        atlas_y += max_height + 1;  // Add 1 pixel padding between rows
        max_height = 0;
        row_baseline = 0;
    }

    // Update row_baseline if necessary
    if (slot->bitmap_top > row_baseline) {
        row_baseline = slot->bitmap_top;
    }

    // Calculate vertical position considering the baseline
    int y_offset = row_baseline - slot->bitmap_top;

    // Copy glyph bitmap to atlas (skip for space)
    if (glyph_info[i].codepoint != ' ') {
        for (unsigned int y = 0; y < slot->bitmap.rows; y++) {
            for (unsigned int x = 0; x < slot->bitmap.width; x++) {
                int atlas_pos_y = atlas_y + y_offset + y;
                if (atlas_pos_y >= 0 && atlas_pos_y < ATLAS_HEIGHT) {
                    atlas_bitmap[atlas_pos_y * ATLAS_WIDTH + (atlas_x + x)] = 
                        slot->bitmap.buffer[y * slot->bitmap.width + x];
                }
            }
        }
    }

    // Store glyph info
    glyph_infos[i].x = atlas_x;
    glyph_infos[i].y = atlas_y + y_offset;
    glyph_infos[i].width = glyph_width;
    glyph_infos[i].height = glyph_height;

    // Update atlas position
    atlas_x += glyph_width + 1;  // Add 1 pixel padding
    if (glyph_height + y_offset > max_height) {
        max_height = glyph_height + y_offset;
    }
}

// ... (restlicher Code bleibt unverändert)


// ... (restlicher Code bleibt unverändert)

    // Save atlas as PNG
    write_png("glyph_atlas.png", atlas_bitmap, ATLAS_WIDTH, ATLAS_HEIGHT);

    // Print glyph information
    printf("Glyph Information:\n");
    for (unsigned int i = 0; i < glyph_count; i++) {
        printf("Glyph %u: x=%d, y=%d, width=%d, height=%d\n",
               i, glyph_infos[i].x, glyph_infos[i].y, glyph_infos[i].width, glyph_infos[i].height);
    }

    // Clean up
    free(atlas_bitmap);
    free(glyph_infos);
    hb_buffer_destroy(buffer);
    hb_font_destroy(hb_font);
    FT_Done_Face(ft_face);
    FT_Done_FreeType(ft_library);

    return 0;
}

