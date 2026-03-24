
enum xxxx{
    SNK_INVALID_ID = 0,
};

/*
    snk_image_t

    A combined texture-view / sampler pair used to inject custom images and samplers into Nuklear.

    Create with snk_make_image(), and convert to an nk_handle via snk_nkhandle().
*/
typedef struct snk_image_t { uint32_t id; } snk_image_t;

/*
    snk_image_desc_t

    Descriptor struct for snk_make_image(). You must provide
    at least an sg_view handle. Keeping the sg_sampler handle
    zero-initialized will select the builtin default sampler
    which uses linear filtering.
*/
typedef struct snk_image_desc_t {
    sg_view texture_view;
    sg_sampler sampler;
} snk_image_desc_t;

/*
    snk_log_item

    An enum with a unique item for each log message, warning, error
    and validation layer message.
*/
/*
    snk_allocator_t

    Used in snk_desc_t to provide custom memory-alloc and -free functions
    to sokol_nuklear.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct snk_allocator_t {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} snk_allocator_t;

/*
    snk_logger

    Used in snk_desc_t to provide a logging function. Please be aware
    that without logging function, sokol-nuklear will be completely
    silent, e.g. it will not report errors, warnings and
    validation layer messages. For maximum error verbosity,
    compile in debug mode (e.g. NDEBUG *not* defined) and install
    a logger (for instance the standard logging function from sokol_log.h).
*/
typedef struct snk_logger_t {
    void (*func)(
        const char* tag,                // always "snk"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SNK_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_imgui.h
        const char* filename_or_null,   // source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} snk_logger_t;


typedef struct snk_desc_t {
    int max_vertices;                   // default: 65536
    int image_pool_size;                // default: 256
    sg_pixel_format color_format;
    sg_pixel_format depth_format;
    int sample_count;
    float dpi_scale;
    bool no_default_font;
    bool enable_set_mouse_cursor;
    snk_allocator_t allocator;          // optional memory allocation overrides (default: malloc/free)
    snk_logger_t logger;                // optional log function override
} snk_desc_t;

extern void snk_setup(const snk_desc_t* desc);
extern struct nk_context* snk_new_frame(void);
extern void snk_render(int width, int height);
extern snk_image_t snk_make_image(const snk_image_desc_t* desc);
extern void snk_destroy_image(snk_image_t img);
extern snk_image_desc_t snk_query_image_desc(snk_image_t img);
extern nk_handle snk_nkhandle(snk_image_t img);
extern snk_image_t snk_image_from_nkhandle(nk_handle handle);
#if !defined(SOKOL_NUKLEAR_NO_SOKOL_APP)
extern bool snk_handle_event(const sapp_event* ev);
extern nk_flags snk_edit_string(struct nk_context *ctx, nk_flags flags, char *memory, int *len, int max, nk_plugin_filter filter);
#endif
extern void snk_shutdown(void);


