
/*
    sgimgui_allocator_t

    Used in sgimgui_desc_t to provide custom memory-alloc and -free functions
    to sokol_gfx_imgui.h. If memory management should be overridden, both the
    alloc and free function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct sgimgui_allocator_t {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sgimgui_allocator_t;

/*
    sgimgui_desc_t

    Initialization options for sgimgui_init().
*/
typedef struct sgimgui_desc_t {
    sgimgui_allocator_t allocator; // optional memory allocation overrides (default: malloc/free)
} sgimgui_desc_t;

extern void sgimgui_setup(const sgimgui_desc_t* desc);
extern void sgimgui_shutdown(void);
extern void sgimgui_draw(void);
extern void sgimgui_draw_menu(const char* title);

extern void sgimgui_draw_buffer_window_content(void);
extern void sgimgui_draw_image_window_content(void);
extern void sgimgui_draw_sampler_window_content(void);
extern void sgimgui_draw_shader_window_content(void);
extern void sgimgui_draw_pipeline_window_content(void);
extern void sgimgui_draw_view_window_content(void);
extern void sgimgui_draw_capture_window_content(void);
extern void sgimgui_draw_capabilities_window_content(void);
extern void sgimgui_draw_frame_stats_window_content(void);

extern void sgimgui_draw_buffer_window(const char* title);
extern void sgimgui_draw_image_window(const char* title);
extern void sgimgui_draw_sampler_window(const char* title);
extern void sgimgui_draw_shader_window(const char* title);
extern void sgimgui_draw_pipeline_window(const char* title);
extern void sgimgui_draw_view_window(const char* title);
extern void sgimgui_draw_capture_window(const char* title);
extern void sgimgui_draw_capabilities_window(const char* title);
extern void sgimgui_draw_frame_stats_window(const char* title);

extern void sgimgui_draw_buffer_menu_item(const char* label);
extern void sgimgui_draw_image_menu_item(const char* label);
extern void sgimgui_draw_sampler_menu_item(const char* label);
extern void sgimgui_draw_shader_menu_item(const char* label);
extern void sgimgui_draw_pipeline_menu_item(const char* label);
extern void sgimgui_draw_view_menu_item(const char* label);
extern void sgimgui_draw_capture_menu_item(const char* label);
extern void sgimgui_draw_capabilities_menu_item(const char* label);
extern void sgimgui_draw_frame_stats_menu_item(const char* label);


