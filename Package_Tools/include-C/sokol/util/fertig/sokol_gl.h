typedef struct sgl_logger_t {
    void (*func)(
        const char* tag,                // always "sgl"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SGL_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_gl.h
        const char* filename_or_null,   // source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} sgl_logger_t;

/* sokol_gl pipeline handle (created with sgl_make_pipeline()) */
typedef struct sgl_pipeline { uint32_t id; } sgl_pipeline;

/* a context handle (created with sgl_make_context()) */
typedef struct sgl_context { uint32_t id; } sgl_context;

/*
    sgl_error_t

    Errors are reset each frame after calling sgl_draw(),
    get the last error code with sgl_error()
*/
typedef struct sgl_error_t {
    bool any;
    bool vertices_full;
    bool uniforms_full;
    bool commands_full;
    bool stack_overflow;
    bool stack_underflow;
    bool no_context;
} sgl_error_t;

/*
    sgl_context_desc_t

    Describes the initialization parameters of a rendering context.
    Creating additional contexts is useful if you want to render
    in separate sokol-gfx passes.
*/
typedef struct sgl_context_desc_t {
    int max_vertices;       // default: 64k
    int max_commands;       // default: 16k
    sg_pixel_format color_format;
    sg_pixel_format depth_format;
    int sample_count;
} sgl_context_desc_t;

/*
    sgl_allocator_t

    Used in sgl_desc_t to provide custom memory-alloc and -free functions
    to sokol_gl.h. If memory management should be overridden, both the
    alloc and free function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct sgl_allocator_t {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sgl_allocator_t;

typedef struct sgl_desc_t {
    int max_vertices;               // default: 64k
    int max_commands;               // default: 16k
    int context_pool_size;          // max number of contexts (including default context), default: 4
    int pipeline_pool_size;         // size of internal pipeline pool, default: 64
    sg_pixel_format color_format;
    sg_pixel_format depth_format;
    int sample_count;
    sg_face_winding face_winding;   // default: SG_FACEWINDING_CCW
    sgl_allocator_t allocator;      // optional memory allocation overrides (default: malloc/free)
    sgl_logger_t logger;            // optional log function override (default: NO LOGGING)
} sgl_desc_t;

/* the default context handle */
//xxxxxxxx static const sgl_context SGL_DEFAULT_CONTEXT = { 0x00010001 };

/* setup/shutdown/misc */
extern void sgl_setup(const sgl_desc_t* desc);
extern void sgl_shutdown(void);
extern float sgl_rad(float deg);
extern float sgl_deg(float rad);
extern sgl_error_t sgl_error(void);
extern sgl_error_t sgl_context_error(sgl_context ctx);

/* context functions */
extern sgl_context sgl_make_context(const sgl_context_desc_t* desc);
extern void sgl_destroy_context(sgl_context ctx);
extern void sgl_set_context(sgl_context ctx);
extern sgl_context sgl_get_context(void);
extern sgl_context sgl_default_context(void);

/* get information about recorded vertices and commands in current context */
extern int sgl_num_vertices(void);
extern int sgl_num_commands(void);

/* draw recorded commands (call inside a sokol-gfx render pass) */
extern void sgl_draw(void);
extern void sgl_context_draw(sgl_context ctx);
extern void sgl_draw_layer(int layer_id);
extern void sgl_context_draw_layer(sgl_context ctx, int layer_id);

/* create and destroy pipeline objects */
extern sgl_pipeline sgl_make_pipeline(const sg_pipeline_desc* desc);
extern sgl_pipeline sgl_context_make_pipeline(sgl_context ctx, const sg_pipeline_desc* desc);
extern void sgl_destroy_pipeline(sgl_pipeline pip);

/* render state functions */
extern void sgl_defaults(void);
extern void sgl_viewport(int x, int y, int w, int h, bool origin_top_left);
extern void sgl_viewportf(float x, float y, float w, float h, bool origin_top_left);
extern void sgl_scissor_rect(int x, int y, int w, int h, bool origin_top_left);
extern void sgl_scissor_rectf(float x, float y, float w, float h, bool origin_top_left);
extern void sgl_enable_texture(void);
extern void sgl_disable_texture(void);
extern void sgl_texture(sg_view tex_view, sg_sampler smp);
extern void sgl_layer(int layer_id);

/* pipeline stack functions */
extern void sgl_load_default_pipeline(void);
extern void sgl_load_pipeline(sgl_pipeline pip);
extern void sgl_push_pipeline(void);
extern void sgl_pop_pipeline(void);

/* matrix stack functions */
extern void sgl_matrix_mode_modelview(void);
extern void sgl_matrix_mode_projection(void);
extern void sgl_matrix_mode_texture(void);
extern void sgl_load_identity(void);
extern void sgl_load_matrix(const float m[16]);
extern void sgl_load_transpose_matrix(const float m[16]);
extern void sgl_mult_matrix(const float m[16]);
extern void sgl_mult_transpose_matrix(const float m[16]);
extern void sgl_rotate(float angle_rad, float x, float y, float z);
extern void sgl_scale(float x, float y, float z);
extern void sgl_translate(float x, float y, float z);
extern void sgl_frustum(float l, float r, float b, float t, float n, float f);
extern void sgl_ortho(float l, float r, float b, float t, float n, float f);
extern void sgl_perspective(float fov_y, float aspect, float z_near, float z_far);
extern void sgl_lookat(float eye_x, float eye_y, float eye_z, float center_x, float center_y, float center_z, float up_x, float up_y, float up_z);
extern void sgl_push_matrix(void);
extern void sgl_pop_matrix(void);

/* these functions only set the internal 'current texcoord / color / point size' (valid inside or outside begin/end) */
extern void sgl_t2f(float u, float v);
extern void sgl_c3f(float r, float g, float b);
extern void sgl_c4f(float r, float g, float b, float a);
extern void sgl_c3b(uint8_t r, uint8_t g, uint8_t b);
extern void sgl_c4b(uint8_t r, uint8_t g, uint8_t b, uint8_t a);
extern void sgl_c1i(uint32_t rgba);
extern void sgl_point_size(float s);

/* define primitives, each begin/end is one draw command */
extern void sgl_begin_points(void);
extern void sgl_begin_lines(void);
extern void sgl_begin_line_strip(void);
extern void sgl_begin_triangles(void);
extern void sgl_begin_triangle_strip(void);
extern void sgl_begin_quads(void);
extern void sgl_v2f(float x, float y);
extern void sgl_v3f(float x, float y, float z);
extern void sgl_v2f_t2f(float x, float y, float u, float v);
extern void sgl_v3f_t2f(float x, float y, float z, float u, float v);
extern void sgl_v2f_c3f(float x, float y, float r, float g, float b);
extern void sgl_v2f_c3b(float x, float y, uint8_t r, uint8_t g, uint8_t b);
extern void sgl_v2f_c4f(float x, float y, float r, float g, float b, float a);
extern void sgl_v2f_c4b(float x, float y, uint8_t r, uint8_t g, uint8_t b, uint8_t a);
extern void sgl_v2f_c1i(float x, float y, uint32_t rgba);
extern void sgl_v3f_c3f(float x, float y, float z, float r, float g, float b);
extern void sgl_v3f_c3b(float x, float y, float z, uint8_t r, uint8_t g, uint8_t b);
extern void sgl_v3f_c4f(float x, float y, float z, float r, float g, float b, float a);
extern void sgl_v3f_c4b(float x, float y, float z, uint8_t r, uint8_t g, uint8_t b, uint8_t a);
extern void sgl_v3f_c1i(float x, float y, float z, uint32_t rgba);
extern void sgl_v2f_t2f_c3f(float x, float y, float u, float v, float r, float g, float b);
extern void sgl_v2f_t2f_c3b(float x, float y, float u, float v, uint8_t r, uint8_t g, uint8_t b);
extern void sgl_v2f_t2f_c4f(float x, float y, float u, float v, float r, float g, float b, float a);
extern void sgl_v2f_t2f_c4b(float x, float y, float u, float v, uint8_t r, uint8_t g, uint8_t b, uint8_t a);
extern void sgl_v2f_t2f_c1i(float x, float y, float u, float v, uint32_t rgba);
extern void sgl_v3f_t2f_c3f(float x, float y, float z, float u, float v, float r, float g, float b);
extern void sgl_v3f_t2f_c3b(float x, float y, float z, float u, float v, uint8_t r, uint8_t g, uint8_t b);
extern void sgl_v3f_t2f_c4f(float x, float y, float z, float u, float v, float r, float g, float b, float a);
extern void sgl_v3f_t2f_c4b(float x, float y, float z, float u, float v, uint8_t r, uint8_t g, uint8_t b, uint8_t a);
extern void sgl_v3f_t2f_c1i(float x, float y, float z, float u, float v, uint32_t rgba);
extern void sgl_end(void);


