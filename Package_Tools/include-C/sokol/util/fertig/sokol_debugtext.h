
typedef struct sdtx_logger_t {
    void (*func)(
        const char* tag,                // always "sdtx"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SDTX_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_debugtext.h
        const char* filename_or_null,   // source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} sdtx_logger_t;

/* a rendering context handle */
typedef struct sdtx_context { uint32_t id; } sdtx_context;

/* the default context handle */

//xxxxxxxxxxx  static const sdtx_context SDTX_DEFAULT_CONTEXT = { 0x00010001 };

/*
    sdtx_range is a pointer-size-pair struct used to pass memory
    blobs into sokol-debugtext. When initialized from a value type
    (array or struct), use the SDTX_RANGE() macro to build
    an sdtx_range struct.
*/
typedef struct sdtx_range {
    const void* ptr;
    size_t size;
} sdtx_range;


/*
    sdtx_font_desc_t

    Describes the pixel data of a font. A font consists of up to
    256 8x8 character tiles, where each character tile is described
    by 8 consecutive bytes, each byte describing 8 pixels.

    For instance the character 'A' could look like this (this is also
    how most home computers used to describe their fonts in ROM):

        bits
        7 6 5 4 3 2 1 0
        . . . X X . . .     byte 0: 0x18
        . . X X X X . .     byte 1: 0x3C
        . X X . . X X .     byte 2: 0x66
        . X X . . X X .     byte 3: 0x66
        . X X X X X X .     byte 4: 0x7E
        . X X . . X X .     byte 5: 0x66
        . X X . . X X .     byte 6: 0x66
        . . . . . . . .     byte 7: 0x00
 */
#define SDTX_MAX_FONTS (8)

typedef struct sdtx_font_desc_t {
    sdtx_range data;        // pointer to and size of font pixel data
    uint8_t first_char;     // first character index in font pixel data
    uint8_t last_char;      // last character index in font pixel data, inclusive (default: 255)
} sdtx_font_desc_t;

/*
    sdtx_context_desc_t

    Describes the initialization parameters of a rendering context. Creating
    additional rendering contexts is useful if you want to render in
    different sokol-gfx rendering passes, or when rendering several layers
    of text.
*/
typedef struct sdtx_context_desc_t {
    int max_commands;                       // max number of draw commands, each layer transition counts as a command, default: 4096
    int char_buf_size;                      // max number of characters rendered in one frame, default: 4096
    float canvas_width;                     // the initial virtual canvas width, default: 640
    float canvas_height;                    // the initial virtual canvas height, default: 400
    int tab_width;                          // tab width in number of characters, default: 4
    sg_pixel_format color_format;           // color pixel format of target render pass
    sg_pixel_format depth_format;           // depth pixel format of target render pass
    int sample_count;                       // MSAA sample count of target render pass
} sdtx_context_desc_t;

/*
    sdtx_allocator_t

    Used in sdtx_desc_t to provide custom memory-alloc and -free functions
    to sokol_debugtext.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct sdtx_allocator_t {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sdtx_allocator_t;

/*
    sdtx_desc_t

    Describes the sokol-debugtext API initialization parameters. Passed
    to the sdtx_setup() function.

    NOTE: to populate the fonts item array with builtin fonts, use any
    of the following functions:

        sdtx_font_kc853()
        sdtx_font_kc854()
        sdtx_font_z1013()
        sdtx_font_cpc()
        sdtx_font_c64()
        sdtx_font_oric()
*/
typedef struct sdtx_desc_t {
    int context_pool_size;                  // max number of rendering contexts that can be created, default: 8
    int printf_buf_size;                    // size of internal buffer for snprintf(), default: 4096
    sdtx_font_desc_t fonts[SDTX_MAX_FONTS]; // up to 8 fonts descriptions
    sdtx_context_desc_t context;            // the default context creation parameters
    sdtx_allocator_t allocator;             // optional memory allocation overrides (default: malloc/free)
    sdtx_logger_t logger;                   // optional log override function (default: NO LOGGING)
} sdtx_desc_t;

/* initialization/shutdown */
extern void sdtx_setup(const sdtx_desc_t* desc);
extern void sdtx_shutdown(void);

/* builtin font data (use to populate sdtx_desc.font[]) */
extern sdtx_font_desc_t sdtx_font_kc853(void);
extern sdtx_font_desc_t sdtx_font_kc854(void);
extern sdtx_font_desc_t sdtx_font_z1013(void);
extern sdtx_font_desc_t sdtx_font_cpc(void);
extern sdtx_font_desc_t sdtx_font_c64(void);
extern sdtx_font_desc_t sdtx_font_oric(void);

/* context functions */
extern sdtx_context sdtx_make_context(const sdtx_context_desc_t* desc);
extern void sdtx_destroy_context(sdtx_context ctx);
extern void sdtx_set_context(sdtx_context ctx);
extern sdtx_context sdtx_get_context(void);
extern sdtx_context sdtx_default_context(void);

/* drawing functions (call inside sokol-gfx render pass) */
extern void sdtx_draw(void);
extern void sdtx_context_draw(sdtx_context ctx);
extern void sdtx_draw_layer(int layer_id);
extern void sdtx_context_draw_layer(sdtx_context ctx, int layer_id);

/* switch render layer */
extern void sdtx_layer(int layer_id);

/* switch to a different font */
extern void sdtx_font(int font_index);

/* set a new virtual canvas size in screen pixels */
extern void sdtx_canvas(float w, float h);

/* set a new origin in character grid coordinates */
extern void sdtx_origin(float x, float y);

/* cursor movement functions (relative to origin in character grid coordinates) */
extern void sdtx_home(void);
extern void sdtx_pos(float x, float y);
extern void sdtx_pos_x(float x);
extern void sdtx_pos_y(float y);
extern void sdtx_move(float dx, float dy);
extern void sdtx_move_x(float dx);
extern void sdtx_move_y(float dy);
extern void sdtx_crlf(void);

/* set the current text color */
extern void sdtx_color3b(uint8_t r, uint8_t g, uint8_t b);              // RGB 0..255, A=255
extern void sdtx_color3f(float r, float g, float b);                    // RGB 0.0f..1.0f, A=1.0f
extern void sdtx_color4b(uint8_t r, uint8_t g, uint8_t b, uint8_t a);   // RGBA 0..255
extern void sdtx_color4f(float r, float g, float b, float a);           // RGBA 0.0f..1.0f
extern void sdtx_color1i(uint32_t rgba);                                // ABGR 0xAABBGGRR

/* text rendering */
extern void sdtx_putc(char c);
extern void sdtx_puts(const char* str);             // does NOT append newline!
extern void sdtx_putr(const char* str, int len);    // 'put range', also stops at zero-char
extern int sdtx_printf(const char* fmt, ...) ;
extern int sdtx_vprintf(const char* fmt, va_list args);

/* language bindings helper: get the internal printf format buffer */
extern sdtx_range sdtx_get_cleared_fmt_buffer(void);


