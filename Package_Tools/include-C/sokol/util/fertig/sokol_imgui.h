/*
    simgui_allocator_t

    Used in simgui_desc_t to provide custom memory-alloc and -free functions
    to sokol_imgui.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct simgui_allocator_t {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} simgui_allocator_t;

/*
    simgui_logger

    Used in simgui_desc_t to provide a logging function. Please be aware
    that without logging function, sokol-imgui will be completely
    silent, e.g. it will not report errors, warnings and
    validation layer messages. For maximum error verbosity,
    compile in debug mode (e.g. NDEBUG *not* defined) and install
    a logger (for instance the standard logging function from sokol_log.h).
*/
typedef struct simgui_logger_t {
    void (*func)(
        const char* tag,                // always "simgui"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SIMGUI_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_imgui.h
        const char* filename_or_null,   // source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} simgui_logger_t;

typedef struct simgui_desc_t {
    int max_vertices;               // default: 65536
    sg_pixel_format color_format;
    sg_pixel_format depth_format;
    int sample_count;
    const char* ini_filename;
    bool no_default_font;
    bool disable_paste_override;    // if true, don't send Ctrl-V on EVENTTYPE_CLIPBOARD_PASTED
    bool disable_set_mouse_cursor;  // if true, don't control the mouse cursor type via sapp_set_mouse_cursor()
    bool disable_windows_resize_from_edges; // if true, only resize edges from the bottom right corner
    bool write_alpha_channel;       // if true, alpha values get written into the framebuffer
    simgui_allocator_t allocator;   // optional memory allocation overrides (default: malloc/free)
    simgui_logger_t logger;         // optional log function override
} simgui_desc_t;

typedef struct simgui_frame_desc_t {
    int width;
    int height;
    double delta_time;
    float dpi_scale;
} simgui_frame_desc_t;

typedef struct simgui_font_tex_desc_t {
    sg_filter min_filter;
    sg_filter mag_filter;
} simgui_font_tex_desc_t;

extern void simgui_setup(const simgui_desc_t* desc);
extern void simgui_new_frame(const simgui_frame_desc_t* desc);
extern void simgui_render(void);

extern uint64_t simgui_imtextureid(sg_view tex_view);
extern uint64_t simgui_imtextureid_with_sampler(sg_view tex_view, sg_sampler smp);
extern sg_view simgui_texture_view_from_imtextureid(uint64_t imtex_id);
extern sg_sampler simgui_sampler_from_imtextureid(uint64_t imtex_id);

extern void simgui_add_focus_event(bool focus);
extern void simgui_add_mouse_pos_event(float x, float y);
extern void simgui_add_touch_pos_event(float x, float y);
extern void simgui_add_mouse_button_event(int mouse_button, bool down);
extern void simgui_add_mouse_wheel_event(float wheel_x, float wheel_y);
extern void simgui_add_key_event(int imgui_key, bool down);
extern void simgui_add_input_character(uint32_t c);
extern void simgui_add_input_characters_utf8(const char* c);
extern void simgui_add_touch_button_event(int mouse_button, bool down);

#if !defined(SOKOL_IMGUI_NO_SOKOL_APP)
extern bool simgui_handle_event(const sapp_event* ev);
extern int simgui_map_keycode(sapp_keycode keycode);  // returns ImGuiKey_*
#endif
extern void simgui_shutdown(void);


