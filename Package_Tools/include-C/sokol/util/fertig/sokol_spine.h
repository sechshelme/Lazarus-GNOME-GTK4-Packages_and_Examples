enum xxxx {
    SSPINE_INVALID_ID = 0,
    SSPINE_MAX_SKINSET_SKINS = 32,
    SSPINE_MAX_STRING_SIZE = 61,    // see sspine_string struct
};

typedef struct sspine_context { uint32_t id; } sspine_context;
typedef struct sspine_atlas { uint32_t id; } sspine_atlas;
typedef struct sspine_skeleton { uint32_t id; } sspine_skeleton;
typedef struct sspine_instance { uint32_t id; } sspine_instance;
typedef struct sspine_skinset { uint32_t id; } sspine_skinset;

typedef struct sspine_image { uint32_t atlas_id; int index; } sspine_image;
typedef struct sspine_atlas_page { uint32_t atlas_id; int index; } sspine_atlas_page;
typedef struct sspine_anim { uint32_t skeleton_id; int index; } sspine_anim;
typedef struct sspine_bone { uint32_t skeleton_id; int index; } sspine_bone;
typedef struct sspine_slot { uint32_t skeleton_id; int index; } sspine_slot;
typedef struct sspine_event { uint32_t skeleton_id; int index; } sspine_event;
typedef struct sspine_iktarget { uint32_t skeleton_id; int index; } sspine_iktarget;
typedef struct sspine_skin { uint32_t skeleton_id; int index; } sspine_skin;

typedef struct sspine_range { const void* ptr; size_t size; } sspine_range;
typedef struct sspine_vec2 { float x, y; } sspine_vec2;
typedef struct sspine_mat4 { float m[16]; } sspine_mat4;
typedef sg_color sspine_color;

typedef struct sspine_string {
    bool valid;
    bool truncated;
    uint8_t len;
    char cstr[SSPINE_MAX_STRING_SIZE];
} sspine_string;

typedef enum sspine_resource_state {
    SSPINE_RESOURCESTATE_INITIAL,
    SSPINE_RESOURCESTATE_ALLOC,
    SSPINE_RESOURCESTATE_VALID,
    SSPINE_RESOURCESTATE_FAILED,
    SSPINE_RESOURCESTATE_INVALID,
    _SSPINE_RESOURCESTATE_FORCE_U32 = 0x7FFFFFFF
} sspine_resource_state;


typedef struct sspine_layer_transform {
    sspine_vec2 size;
    sspine_vec2 origin;
} sspine_layer_transform;

typedef struct sspine_bone_transform {
    sspine_vec2 position;
    float rotation;         // in degrees
    sspine_vec2 scale;
    sspine_vec2 shear;      // in degrees
} sspine_bone_transform;

typedef struct sspine_context_desc {
    int max_vertices;
    int max_commands;
    sg_pixel_format color_format;
    sg_pixel_format depth_format;
    int sample_count;
    sg_color_mask color_write_mask;
} sspine_context_desc;

typedef struct sspine_context_info {
    int num_vertices;   // current number of vertices
    int num_indices;    // current number of indices
    int num_commands;   // current number of commands
} sspine_context_info;

typedef struct sspine_image_info {
    bool valid;
    sg_image sgimage;
    sg_view sgview;
    sg_sampler sgsampler;
    sg_filter min_filter;
    sg_filter mag_filter;
    sg_filter mipmap_filter;
    sg_wrap wrap_u;
    sg_wrap wrap_v;
    int width;
    int height;
    bool premul_alpha;
    sspine_string filename;
} sspine_image_info;

typedef struct sspine_atlas_overrides {
    sg_filter min_filter;
    sg_filter mag_filter;
    sg_filter mipmap_filter;
    sg_wrap wrap_u;
    sg_wrap wrap_v;
    bool premul_alpha_enabled;
    bool premul_alpha_disabled;
} sspine_atlas_overrides;

typedef struct sspine_atlas_desc {
    sspine_range data;
    sspine_atlas_overrides override;
} sspine_atlas_desc;

typedef struct sspine_atlas_page_info {
    bool valid;
    sspine_atlas atlas;
    sspine_image_info image;
    sspine_atlas_overrides overrides;
} sspine_atlas_page_info;

typedef struct sspine_skeleton_desc {
    sspine_atlas atlas;
    float prescale;
    float anim_default_mix;
    const char* json_data;
    sspine_range binary_data;
} sspine_skeleton_desc;

typedef struct sspine_skinset_desc {
    sspine_skeleton skeleton;
    sspine_skin skins[SSPINE_MAX_SKINSET_SKINS];
} sspine_skinset_desc;

typedef struct sspine_anim_info {
    bool valid;
    int index;
    float duration;
    sspine_string name;
} sspine_anim_info;

typedef struct sspine_bone_info {
    bool valid;
    int index;
    sspine_bone parent_bone;
    float length;
    sspine_bone_transform pose;
    sspine_color color;
    sspine_string name;
} sspine_bone_info;

typedef struct sspine_slot_info {
    bool valid;
    int index;
    sspine_bone bone;
    sspine_color color;
    sspine_string attachment_name;
    sspine_string name;
} sspine_slot_info;

typedef struct sspine_iktarget_info {
    bool valid;
    int index;
    sspine_bone target_bone;
    sspine_string name;
} sspine_iktarget_info;

typedef struct sspine_skin_info {
    bool valid;
    int index;
    sspine_string name;
} sspine_skin_info;

typedef struct sspine_event_info {
    bool valid;
    int index;
    int int_value;
    float float_value;
    float volume;
    float balance;
    sspine_string name;
    sspine_string string_value;
    sspine_string audio_path;
} sspine_event_info;

typedef struct sspine_triggered_event_info {
    bool valid;
    sspine_event event;
    float time;
    int int_value;
    float float_value;
    float volume;
    float balance;
    sspine_string string_value;
} sspine_triggered_event_info;

typedef struct sspine_instance_desc {
    sspine_skeleton skeleton;
} sspine_instance_desc;

typedef struct sspine_allocator {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sspine_allocator;

typedef struct sspine_logger {
    void (*func)(
        const char* tag,                // always "sspine"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SSPINE_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_spine.h
        const char* filename_or_null,   // the source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} sspine_logger;

typedef struct sspine_desc {
    int max_vertices;
    int max_commands;
    int context_pool_size;
    int atlas_pool_size;
    int skeleton_pool_size;
    int skinset_pool_size;
    int instance_pool_size;
    sg_pixel_format color_format;
    sg_pixel_format depth_format;
    int sample_count;
    sg_color_mask color_write_mask;
    sspine_allocator allocator;     // optional allocation override functions (default: malloc/free)
    sspine_logger logger;           // optional logging function (default: NO LOGGING!)
} sspine_desc;

// setup/shutdown
extern void sspine_setup(const sspine_desc* desc);
extern void sspine_shutdown(void);

// context functions
extern sspine_context sspine_make_context(const sspine_context_desc* desc);
extern void sspine_destroy_context(sspine_context ctx);
extern void sspine_set_context(sspine_context ctx);
extern sspine_context sspine_get_context(void);
extern sspine_context sspine_default_context(void);
extern sspine_context_info sspine_get_context_info(sspine_context ctx);

// create and destroy spine objects
extern sspine_atlas sspine_make_atlas(const sspine_atlas_desc* desc);
extern sspine_skeleton sspine_make_skeleton(const sspine_skeleton_desc* desc);
extern sspine_skinset sspine_make_skinset(const sspine_skinset_desc* desc);
extern sspine_instance sspine_make_instance(const sspine_instance_desc* desc);
extern void sspine_destroy_atlas(sspine_atlas atlas);
extern void sspine_destroy_skeleton(sspine_skeleton skeleton);
extern void sspine_destroy_skinset(sspine_skinset skinset);
extern void sspine_destroy_instance(sspine_instance instance);

// configure instance appearance via skinsets
extern void sspine_set_skinset(sspine_instance instance, sspine_skinset skinset);

// update instance animations before drawing
extern void sspine_update_instance(sspine_instance instance, float delta_time);

// iterate over triggered events after updating an instance
extern int sspine_num_triggered_events(sspine_instance instance);
extern sspine_triggered_event_info sspine_get_triggered_event_info(sspine_instance instance, int triggered_event_index);

// draw instance into current or explicit context
extern void sspine_draw_instance_in_layer(sspine_instance instance, int layer);
extern void sspine_context_draw_instance_in_layer(sspine_context ctx, sspine_instance instance, int layer);

// helper function to convert sspine_layer_transform into projection matrix
extern sspine_mat4 sspine_layer_transform_to_mat4(const sspine_layer_transform* tform);

// draw a layer in current context or explicit context (call once per context and frame in sokol-gfx pass)
extern void sspine_draw_layer(int layer, const sspine_layer_transform* tform);
extern void sspine_context_draw_layer(sspine_context ctx, int layer, const sspine_layer_transform* tform);

// get current resource state (INITIAL, ALLOC, VALID, FAILED, INVALID)
extern sspine_resource_state sspine_get_context_resource_state(sspine_context context);
extern sspine_resource_state sspine_get_atlas_resource_state(sspine_atlas atlas);
extern sspine_resource_state sspine_get_skeleton_resource_state(sspine_skeleton skeleton);
extern sspine_resource_state sspine_get_skinset_resource_state(sspine_skinset skinset);
extern sspine_resource_state sspine_get_instance_resource_state(sspine_instance instance);

// shortcut for sspine_get_*_state() == SSPINE_RESOURCESTATE_VALID
extern bool sspine_context_valid(sspine_context context);
extern bool sspine_atlas_valid(sspine_atlas atlas);
extern bool sspine_skeleton_valid(sspine_skeleton skeleton);
extern bool sspine_instance_valid(sspine_instance instance);
extern bool sspine_skinset_valid(sspine_skinset skinset);

// get dependency objects
extern sspine_atlas sspine_get_skeleton_atlas(sspine_skeleton skeleton);
extern sspine_skeleton sspine_get_instance_skeleton(sspine_instance instance);

// atlas images
extern int sspine_num_images(sspine_atlas atlas);
extern sspine_image sspine_image_by_index(sspine_atlas atlas, int index);
extern bool sspine_image_valid(sspine_image image);
extern bool sspine_image_equal(sspine_image first, sspine_image second);
extern sspine_image_info sspine_get_image_info(sspine_image image);

// atlas page functions
extern int sspine_num_atlas_pages(sspine_atlas atlas);
extern sspine_atlas_page sspine_atlas_page_by_index(sspine_atlas atlas, int index);
extern bool sspine_atlas_page_valid(sspine_atlas_page page);
extern bool sspine_atlas_page_equal(sspine_atlas_page first, sspine_atlas_page second);
extern sspine_atlas_page_info sspine_get_atlas_page_info(sspine_atlas_page page);

// instance transform functions
extern void sspine_set_position(sspine_instance instance, sspine_vec2 position);
extern void sspine_set_scale(sspine_instance instance, sspine_vec2 scale);
extern void sspine_set_color(sspine_instance instance, sspine_color color);
extern sspine_vec2 sspine_get_position(sspine_instance instance);
extern sspine_vec2 sspine_get_scale(sspine_instance instance);
extern sspine_color sspine_get_color(sspine_instance instance);

// instance animation functions
extern int sspine_num_anims(sspine_skeleton skeleton);
extern sspine_anim sspine_anim_by_name(sspine_skeleton skeleton, const char* name);
extern sspine_anim sspine_anim_by_index(sspine_skeleton skeleton, int index);
extern bool sspine_anim_valid(sspine_anim anim);
extern bool sspine_anim_equal(sspine_anim first, sspine_anim second);
extern sspine_anim_info sspine_get_anim_info(sspine_anim anim);
extern void sspine_clear_animation_tracks(sspine_instance instance);
extern void sspine_clear_animation_track(sspine_instance instance, int track_index);
extern void sspine_set_animation(sspine_instance instance, sspine_anim anim, int track_index, bool loop);
extern void sspine_add_animation(sspine_instance instance, sspine_anim anim, int track_index, bool loop, float delay);
extern void sspine_set_empty_animation(sspine_instance instance, int track_index, float mix_duration);
extern void sspine_add_empty_animation(sspine_instance instance, int track_index, float mix_duration, float delay);

// bone functions
extern int sspine_num_bones(sspine_skeleton skeleton);
extern sspine_bone sspine_bone_by_name(sspine_skeleton skeleton, const char* name);
extern sspine_bone sspine_bone_by_index(sspine_skeleton skeleton, int index);
extern bool sspine_bone_valid(sspine_bone bone);
extern bool sspine_bone_equal(sspine_bone first, sspine_bone second);
extern sspine_bone_info sspine_get_bone_info(sspine_bone bone);
extern void sspine_set_bone_transform(sspine_instance instance, sspine_bone bone, const sspine_bone_transform* transform);
extern void sspine_set_bone_position(sspine_instance instance, sspine_bone bone, sspine_vec2 position);
extern void sspine_set_bone_rotation(sspine_instance instance, sspine_bone bone, float rotation);
extern void sspine_set_bone_scale(sspine_instance instance, sspine_bone bone, sspine_vec2 scale);
extern void sspine_set_bone_shear(sspine_instance instance, sspine_bone bone, sspine_vec2 shear);
extern sspine_bone_transform sspine_get_bone_transform(sspine_instance instance, sspine_bone bone);
extern sspine_vec2 sspine_get_bone_position(sspine_instance instance, sspine_bone bone);
extern float sspine_get_bone_rotation(sspine_instance instance, sspine_bone bone);
extern sspine_vec2 sspine_get_bone_scale(sspine_instance instance, sspine_bone bone);
extern sspine_vec2 sspine_get_bone_shear(sspine_instance instance, sspine_bone bone);
extern sspine_vec2 sspine_get_bone_world_position(sspine_instance instance, sspine_bone bone);
extern sspine_vec2 sspine_bone_local_to_world(sspine_instance instance, sspine_bone bone, sspine_vec2 local_pos);
extern sspine_vec2 sspine_bone_world_to_local(sspine_instance instance, sspine_bone bone, sspine_vec2 world_pos);

// slot functions
extern int sspine_num_slots(sspine_skeleton skeleton);
extern sspine_slot sspine_slot_by_name(sspine_skeleton skeleton, const char* name);
extern sspine_slot sspine_slot_by_index(sspine_skeleton skeleton, int index);
extern bool sspine_slot_valid(sspine_slot slot);
extern bool sspine_slot_equal(sspine_slot first, sspine_slot second);
extern sspine_slot_info sspine_get_slot_info(sspine_slot slot);
extern void sspine_set_slot_color(sspine_instance instance, sspine_slot slot, sspine_color color);
extern sspine_color sspine_get_slot_color(sspine_instance instance, sspine_slot slot);

// event functions
extern int sspine_num_events(sspine_skeleton skeleton);
extern sspine_event sspine_event_by_name(sspine_skeleton skeleton, const char* name);
extern sspine_event sspine_event_by_index(sspine_skeleton skeleton, int index);
extern bool sspine_event_valid(sspine_event event);
extern bool sspine_event_equal(sspine_event first, sspine_event second);
extern sspine_event_info sspine_get_event_info(sspine_event event);

// ik target functions
extern int sspine_num_iktargets(sspine_skeleton skeleton);
extern sspine_iktarget sspine_iktarget_by_name(sspine_skeleton skeleton, const char* name);
extern sspine_iktarget sspine_iktarget_by_index(sspine_skeleton skeleton, int index);
extern bool sspine_iktarget_valid(sspine_iktarget iktarget);
extern bool sspine_iktarget_equal(sspine_iktarget first, sspine_iktarget second);
extern sspine_iktarget_info sspine_get_iktarget_info(sspine_iktarget iktarget);
extern void sspine_set_iktarget_world_pos(sspine_instance instance, sspine_iktarget iktarget, sspine_vec2 world_pos);

// skin functions
extern int sspine_num_skins(sspine_skeleton skeleton);
extern sspine_skin sspine_skin_by_name(sspine_skeleton skeleton, const char* name);
extern sspine_skin sspine_skin_by_index(sspine_skeleton skeleton, int index);
extern bool sspine_skin_valid(sspine_skin skin);
extern bool sspine_skin_equal(sspine_skin first, sspine_skin second);
extern sspine_skin_info sspine_get_skin_info(sspine_skin skin);
extern void sspine_set_skin(sspine_instance instance, sspine_skin skin);


