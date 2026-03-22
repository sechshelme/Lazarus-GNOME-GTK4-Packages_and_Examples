#ifdef __cplusplus
extern "C" {
#endif

/*
    Resource id typedefs:

    sg_buffer:      vertex- and index-buffers
    sg_image:       images used as textures and render-pass attachments
    sg_sampler      sampler objects describing how a texture is sampled in a shader
    sg_shader:      vertex- and fragment-shaders and shader interface information
    sg_pipeline:    associated shader and vertex-layouts, and render states
    sg_view:        a resource view object used for bindings and render-pass attachments

    Instead of pointers, resource creation functions return a 32-bit
    handle which uniquely identifies the resource object.

    The 32-bit resource id is split into a 16-bit pool index in the lower bits,
    and a 16-bit 'generation counter' in the upper bits. The index allows fast
    pool lookups, and combined with the generation-counter it allows to detect
    'dangling accesses' (trying to use an object which no longer exists, and
    its pool slot has been reused for a new object)

    The resource ids are wrapped into a strongly-typed struct so that
    trying to pass an incompatible resource id is a compile error.
*/
typedef struct sg_buffer        { uint32_t id; } sg_buffer;
typedef struct sg_image         { uint32_t id; } sg_image;
typedef struct sg_sampler       { uint32_t id; } sg_sampler;
typedef struct sg_shader        { uint32_t id; } sg_shader;
typedef struct sg_pipeline      { uint32_t id; } sg_pipeline;
typedef struct sg_view          { uint32_t id; } sg_view;

/*
    sg_range is a pointer-size-pair struct used to pass memory blobs into
    sokol-gfx. When initialized from a value type (array or struct), you can
    use the SG_RANGE() macro to build an sg_range struct. For functions which
    take either a sg_range pointer, or a (C++) sg_range reference, use the
    SG_RANGE_REF macro as a solution which compiles both in C and C++.
*/
typedef struct sg_range {
    const void* ptr;
    size_t size;
} sg_range;


// various compile-time constants in the public API
enum xxx{
    SG_INVALID_ID = 0,
    SG_NUM_INFLIGHT_FRAMES = 2,
    SG_MAX_COLOR_ATTACHMENTS = 8,
    SG_MAX_UNIFORMBLOCK_MEMBERS = 16,
    SG_MAX_VERTEX_ATTRIBUTES = 16,
    SG_MAX_MIPMAPS = 16,
    SG_MAX_VERTEXBUFFER_BINDSLOTS = 8,
    SG_MAX_UNIFORMBLOCK_BINDSLOTS = 8,
    SG_MAX_VIEW_BINDSLOTS = 32,
    SG_MAX_SAMPLER_BINDSLOTS = 12,
    SG_MAX_TEXTURE_SAMPLER_PAIRS = 32,  // same as SG_MAX_VIEW_BINDSLOTS
    SG_MAX_PORTABLE_COLOR_ATTACHMENTS = 4,
    SG_MAX_PORTABLE_TEXTURE_BINDINGS_PER_STAGE = 16,
    SG_MAX_PORTABLE_STORAGEBUFFER_BINDINGS_PER_STAGE = 8,   // assuming sg_features.compute = true
    SG_MAX_PORTABLE_STORAGEIMAGE_BINDINGS_PER_STAGE = 4,    // assuming sg_features.compute = true
};

/*
    sg_color

    An RGBA color value.
*/
typedef struct sg_color { float r, g, b, a; } sg_color;

/*
    sg_backend

    The active 3D-API backend, use the function sg_query_backend()
    to get the currently active backend.
*/
typedef enum sg_backend {
    SG_BACKEND_GLCORE,
    SG_BACKEND_GLES3,
    SG_BACKEND_D3D11,
    SG_BACKEND_METAL_IOS,
    SG_BACKEND_METAL_MACOS,
    SG_BACKEND_METAL_SIMULATOR,
    SG_BACKEND_WGPU,
    SG_BACKEND_VULKAN,
    SG_BACKEND_DUMMY,
} sg_backend;

typedef enum sg_pixel_format {
    _SG_PIXELFORMAT_DEFAULT,    // value 0 reserved for default-init
    SG_PIXELFORMAT_NONE,

    SG_PIXELFORMAT_R8,
    SG_PIXELFORMAT_R8SN,
    SG_PIXELFORMAT_R8UI,
    SG_PIXELFORMAT_R8SI,

    SG_PIXELFORMAT_R16,
    SG_PIXELFORMAT_R16SN,
    SG_PIXELFORMAT_R16UI,
    SG_PIXELFORMAT_R16SI,
    SG_PIXELFORMAT_R16F,
    SG_PIXELFORMAT_RG8,
    SG_PIXELFORMAT_RG8SN,
    SG_PIXELFORMAT_RG8UI,
    SG_PIXELFORMAT_RG8SI,

    SG_PIXELFORMAT_R32UI,
    SG_PIXELFORMAT_R32SI,
    SG_PIXELFORMAT_R32F,
    SG_PIXELFORMAT_RG16,
    SG_PIXELFORMAT_RG16SN,
    SG_PIXELFORMAT_RG16UI,
    SG_PIXELFORMAT_RG16SI,
    SG_PIXELFORMAT_RG16F,
    SG_PIXELFORMAT_RGBA8,
    SG_PIXELFORMAT_SRGB8A8,
    SG_PIXELFORMAT_RGBA8SN,
    SG_PIXELFORMAT_RGBA8UI,
    SG_PIXELFORMAT_RGBA8SI,
    SG_PIXELFORMAT_BGRA8,
    SG_PIXELFORMAT_RGB10A2,
    SG_PIXELFORMAT_RG11B10F,
    SG_PIXELFORMAT_RGB9E5,

    SG_PIXELFORMAT_RG32UI,
    SG_PIXELFORMAT_RG32SI,
    SG_PIXELFORMAT_RG32F,
    SG_PIXELFORMAT_RGBA16,
    SG_PIXELFORMAT_RGBA16SN,
    SG_PIXELFORMAT_RGBA16UI,
    SG_PIXELFORMAT_RGBA16SI,
    SG_PIXELFORMAT_RGBA16F,

    SG_PIXELFORMAT_RGBA32UI,
    SG_PIXELFORMAT_RGBA32SI,
    SG_PIXELFORMAT_RGBA32F,

    SG_PIXELFORMAT_DEPTH,
    SG_PIXELFORMAT_DEPTH_STENCIL,

    // NOTE: don't put any new compressed format in front of here
    SG_PIXELFORMAT_BC1_RGBA,
    SG_PIXELFORMAT_BC2_RGBA,
    SG_PIXELFORMAT_BC3_RGBA,
    SG_PIXELFORMAT_BC3_SRGBA,
    SG_PIXELFORMAT_BC4_R,
    SG_PIXELFORMAT_BC4_RSN,
    SG_PIXELFORMAT_BC5_RG,
    SG_PIXELFORMAT_BC5_RGSN,
    SG_PIXELFORMAT_BC6H_RGBF,
    SG_PIXELFORMAT_BC6H_RGBUF,
    SG_PIXELFORMAT_BC7_RGBA,
    SG_PIXELFORMAT_BC7_SRGBA,
    SG_PIXELFORMAT_ETC2_RGB8,
    SG_PIXELFORMAT_ETC2_SRGB8,
    SG_PIXELFORMAT_ETC2_RGB8A1,
    SG_PIXELFORMAT_ETC2_RGBA8,
    SG_PIXELFORMAT_ETC2_SRGB8A8,
    SG_PIXELFORMAT_EAC_R11,
    SG_PIXELFORMAT_EAC_R11SN,
    SG_PIXELFORMAT_EAC_RG11,
    SG_PIXELFORMAT_EAC_RG11SN,

    SG_PIXELFORMAT_ASTC_4x4_RGBA,
    SG_PIXELFORMAT_ASTC_4x4_SRGBA,

    _SG_PIXELFORMAT_NUM,
    _SG_PIXELFORMAT_FORCE_U32 = 0x7FFFFFFF
} sg_pixel_format;

/*
    Runtime information about a pixel format, returned by sg_query_pixelformat().
*/
typedef struct sg_pixelformat_info {
    bool sample;            // pixel format can be sampled in shaders at least with nearest filtering
    bool filter;            // pixel format can be sampled with linear filtering
    bool render;            // pixel format can be used as render-pass attachment
    bool blend;             // pixel format supports alpha-blending when used as render-pass attachment
    bool msaa;              // pixel format supports MSAA when used as render-pass attachment
    bool depth;             // pixel format is a depth format
    bool compressed;        // true if this is a hardware-compressed format
    bool read;              // true if format supports compute shader read access
    bool write;             // true if format supports compute shader write access
    int bytes_per_pixel;    // NOTE: this is 0 for compressed formats, use sg_query_row_pitch() / sg_query_surface_pitch() as alternative
} sg_pixelformat_info;

/*
    Runtime information about available optional features, returned by sg_query_features()
*/
typedef struct sg_features {
    bool origin_top_left;               // framebuffer- and texture-origin is in top left corner
    bool image_clamp_to_border;         // border color and clamp-to-border uv-wrap mode is supported
    bool mrt_independent_blend_state;   // multiple-render-target rendering can use per-render-target blend state
    bool mrt_independent_write_mask;    // multiple-render-target rendering can use per-render-target color write masks
    bool compute;                       // storage buffers and compute shaders are supported
    bool msaa_texture_bindings;         // if true, multisampled images can be bound as textures
    bool separate_buffer_types;         // cannot use the same buffer for vertex and indices (only WebGL2)
    bool draw_base_vertex;              // draw with (base vertex > 0) && (base_instance == 0) supported
    bool draw_base_instance;            // draw with (base instance > 0) supported
    bool dual_source_blending;          // dual-source-blending supported
    bool gl_texture_views;              // supports 'proper' texture views (GL 4.3+)
} sg_features;

/*
    Runtime information about resource limits, returned by sg_query_limit()
*/
typedef struct sg_limits {
    int max_image_size_2d;          // max width/height of SG_IMAGETYPE_2D images
    int max_image_size_cube;        // max width/height of SG_IMAGETYPE_CUBE images
    int max_image_size_3d;          // max width/height/depth of SG_IMAGETYPE_3D images
    int max_image_size_array;       // max width/height of SG_IMAGETYPE_ARRAY images
    int max_image_array_layers;     // max number of layers in SG_IMAGETYPE_ARRAY images
    int max_vertex_attrs;           // max number of vertex attributes, clamped to SG_MAX_VERTEX_ATTRIBUTES
    int max_color_attachments;      // max number of render pass color attachments, clamped to SG_MAX_COLOR_ATTACHMENTS
    int max_texture_bindings_per_stage; // max number of texture bindings per shader stage, clamped to SG_MAX_VIEW_BINDSLOTS
    int max_storage_buffer_bindings_per_stage;  // max number of storage buffer bindings per shader stage, clamped to SG_MAX_VIEW_BINDSLOTS
    int max_storage_image_bindings_per_stage;   // max number of storage image bindings per shader stage, clamped to SG_MAX_VIEW_BINDSLOTS
    int gl_max_vertex_uniform_components;       // GL_MAX_VERTEX_UNIFORM_COMPONENTS (only on GL backends)
    int gl_max_combined_texture_image_units;    // GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS (only on GL backends)
    int d3d11_max_unordered_access_views;       // 8 on feature level 11.0, otherwise 32 (clamped to SG_MAX_VIEW_BINDSLOTS)
    int vk_min_uniform_buffer_offset_alignment;
} sg_limits;

/*
    sg_resource_state

    The current state of a resource in its resource pool.
    Resources start in the INITIAL state, which means the
    pool slot is unoccupied and can be allocated. When a resource is
    created, first an id is allocated, and the resource pool slot
    is set to state ALLOC. After allocation, the resource is
    initialized, which may result in the VALID or FAILED state. The
    reason why allocation and initialization are separate is because
    some resource types (e.g. buffers and images) might be asynchronously
    initialized by the user application. If a resource which is not
    in the VALID state is attempted to be used for rendering, rendering
    operations will silently be dropped.

    The special INVALID state is returned in sg_query_xxx_state() if no
    resource object exists for the provided resource id.
*/
typedef enum sg_resource_state {
    SG_RESOURCESTATE_INITIAL,
    SG_RESOURCESTATE_ALLOC,
    SG_RESOURCESTATE_VALID,
    SG_RESOURCESTATE_FAILED,
    SG_RESOURCESTATE_INVALID,
    _SG_RESOURCESTATE_FORCE_U32 = 0x7FFFFFFF
} sg_resource_state;

/*
    sg_index_type

    Indicates whether indexed rendering (fetching vertex-indices from an
    index buffer) is used, and if yes, the index data type (16- or 32-bits).

    This is used in the sg_pipeline_desc.index_type member when creating a
    pipeline object.

    The default index type is SG_INDEXTYPE_NONE.
*/
typedef enum sg_index_type {
    _SG_INDEXTYPE_DEFAULT,   // value 0 reserved for default-init
    SG_INDEXTYPE_NONE,
    SG_INDEXTYPE_UINT16,
    SG_INDEXTYPE_UINT32,
    _SG_INDEXTYPE_NUM,
    _SG_INDEXTYPE_FORCE_U32 = 0x7FFFFFFF
} sg_index_type;

/*
    sg_image_type

    Indicates the basic type of an image object (2D-texture, cubemap,
    3D-texture or 2D-array-texture). Used in the sg_image_desc.type member when
    creating an image, and in sg_shader_image_desc to describe a sampled texture
    in the shader (both must match and will be checked in the validation layer
    when calling sg_apply_bindings).

    The default image type when creating an image is SG_IMAGETYPE_2D.
*/
typedef enum sg_image_type {
    _SG_IMAGETYPE_DEFAULT,  // value 0 reserved for default-init
    SG_IMAGETYPE_2D,
    SG_IMAGETYPE_CUBE,
    SG_IMAGETYPE_3D,
    SG_IMAGETYPE_ARRAY,
    _SG_IMAGETYPE_NUM,
    _SG_IMAGETYPE_FORCE_U32 = 0x7FFFFFFF
} sg_image_type;

/*
    sg_image_sample_type

    The basic data type of a texture sample as expected by a shader.
    Must be provided in sg_shader_image and used by the validation
    layer in sg_apply_bindings() to check if the provided image object
    is compatible with what the shader expects. Apart from the sokol-gfx
    validation layer, WebGPU is the only backend API which actually requires
    matching texture and sampler type to be provided upfront for validation
    (other 3D APIs treat texture/sampler type mismatches as undefined behaviour).

    NOTE that the following texture pixel formats require the use
    of SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT, combined with a sampler
    of type SG_SAMPLERTYPE_NONFILTERING:

    - SG_PIXELFORMAT_R32F
    - SG_PIXELFORMAT_RG32F
    - SG_PIXELFORMAT_RGBA32F

    (when using sokol-shdc, also check out the meta tags `@image_sample_type`
    and `@sampler_type`)
*/
typedef enum sg_image_sample_type {
    _SG_IMAGESAMPLETYPE_DEFAULT,  // value 0 reserved for default-init
    SG_IMAGESAMPLETYPE_FLOAT,
    SG_IMAGESAMPLETYPE_DEPTH,
    SG_IMAGESAMPLETYPE_SINT,
    SG_IMAGESAMPLETYPE_UINT,
    SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT,
    _SG_IMAGESAMPLETYPE_NUM,
    _SG_IMAGESAMPLETYPE_FORCE_U32 = 0x7FFFFFFF
} sg_image_sample_type;

/*
    sg_sampler_type

    The basic type of a texture sampler (sampling vs comparison) as
    defined in a shader. Must be provided in sg_shader_sampler_desc.

    sg_image_sample_type and sg_sampler_type for a texture/sampler
    pair must be compatible with each other, specifically only
    the following pairs are allowed:

    - SG_IMAGESAMPLETYPE_FLOAT => (SG_SAMPLERTYPE_FILTERING or SG_SAMPLERTYPE_NONFILTERING)
    - SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT => SG_SAMPLERTYPE_NONFILTERING
    - SG_IMAGESAMPLETYPE_SINT => SG_SAMPLERTYPE_NONFILTERING
    - SG_IMAGESAMPLETYPE_UINT => SG_SAMPLERTYPE_NONFILTERING
    - SG_IMAGESAMPLETYPE_DEPTH => SG_SAMPLERTYPE_COMPARISON
*/
typedef enum sg_sampler_type {
    _SG_SAMPLERTYPE_DEFAULT,
    SG_SAMPLERTYPE_FILTERING,
    SG_SAMPLERTYPE_NONFILTERING,
    SG_SAMPLERTYPE_COMPARISON,
    _SG_SAMPLERTYPE_NUM,
    _SG_SAMPLERTYPE_FORCE_U32,
} sg_sampler_type;

/*
    sg_primitive_type

    This is the common subset of 3D primitive types supported across all 3D
    APIs. This is used in the sg_pipeline_desc.primitive_type member when
    creating a pipeline object.

    The default primitive type is SG_PRIMITIVETYPE_TRIANGLES.
*/
typedef enum sg_primitive_type {
    _SG_PRIMITIVETYPE_DEFAULT,  // value 0 reserved for default-init
    SG_PRIMITIVETYPE_POINTS,
    SG_PRIMITIVETYPE_LINES,
    SG_PRIMITIVETYPE_LINE_STRIP,
    SG_PRIMITIVETYPE_TRIANGLES,
    SG_PRIMITIVETYPE_TRIANGLE_STRIP,
    _SG_PRIMITIVETYPE_NUM,
    _SG_PRIMITIVETYPE_FORCE_U32 = 0x7FFFFFFF
} sg_primitive_type;

/*
    sg_filter

    The filtering mode when sampling a texture image. This is
    used in the sg_sampler_desc.min_filter, sg_sampler_desc.mag_filter
    and sg_sampler_desc.mipmap_filter members when creating a sampler object.

    For the default is SG_FILTER_NEAREST.
*/
typedef enum sg_filter {
    _SG_FILTER_DEFAULT, // value 0 reserved for default-init
    SG_FILTER_NEAREST,
    SG_FILTER_LINEAR,
    _SG_FILTER_NUM,
    _SG_FILTER_FORCE_U32 = 0x7FFFFFFF
} sg_filter;

/*
    sg_wrap

    The texture coordinates wrapping mode when sampling a texture
    image. This is used in the sg_image_desc.wrap_u, .wrap_v
    and .wrap_w members when creating an image.

    The default wrap mode is SG_WRAP_REPEAT.

    NOTE: SG_WRAP_CLAMP_TO_BORDER is not supported on all backends
    and platforms. To check for support, call sg_query_features()
    and check the "clamp_to_border" boolean in the returned
    sg_features struct.

    Platforms which don't support SG_WRAP_CLAMP_TO_BORDER will silently fall back
    to SG_WRAP_CLAMP_TO_EDGE without a validation error.
*/
typedef enum sg_wrap {
    _SG_WRAP_DEFAULT,   // value 0 reserved for default-init
    SG_WRAP_REPEAT,
    SG_WRAP_CLAMP_TO_EDGE,
    SG_WRAP_CLAMP_TO_BORDER,
    SG_WRAP_MIRRORED_REPEAT,
    _SG_WRAP_NUM,
    _SG_WRAP_FORCE_U32 = 0x7FFFFFFF
} sg_wrap;

/*
    sg_border_color

    The border color to use when sampling a texture, and the UV wrap
    mode is SG_WRAP_CLAMP_TO_BORDER.

    The default border color is SG_BORDERCOLOR_OPAQUE_BLACK
*/
typedef enum sg_border_color {
    _SG_BORDERCOLOR_DEFAULT,    // value 0 reserved for default-init
    SG_BORDERCOLOR_TRANSPARENT_BLACK,
    SG_BORDERCOLOR_OPAQUE_BLACK,
    SG_BORDERCOLOR_OPAQUE_WHITE,
    _SG_BORDERCOLOR_NUM,
    _SG_BORDERCOLOR_FORCE_U32 = 0x7FFFFFFF
} sg_border_color;

/*
    sg_vertex_format

    The data type of a vertex component. This is used to describe
    the layout of input vertex data when creating a pipeline object.

    NOTE that specific mapping rules exist from the CPU-side vertex
    formats to the vertex attribute base type in the vertex shader code
    (see doc header section 'ON VERTEX FORMATS').
*/
typedef enum sg_vertex_format {
    SG_VERTEXFORMAT_INVALID,
    SG_VERTEXFORMAT_FLOAT,
    SG_VERTEXFORMAT_FLOAT2,
    SG_VERTEXFORMAT_FLOAT3,
    SG_VERTEXFORMAT_FLOAT4,
    SG_VERTEXFORMAT_INT,
    SG_VERTEXFORMAT_INT2,
    SG_VERTEXFORMAT_INT3,
    SG_VERTEXFORMAT_INT4,
    SG_VERTEXFORMAT_UINT,
    SG_VERTEXFORMAT_UINT2,
    SG_VERTEXFORMAT_UINT3,
    SG_VERTEXFORMAT_UINT4,
    SG_VERTEXFORMAT_BYTE4,
    SG_VERTEXFORMAT_BYTE4N,
    SG_VERTEXFORMAT_UBYTE4,
    SG_VERTEXFORMAT_UBYTE4N,
    SG_VERTEXFORMAT_SHORT2,
    SG_VERTEXFORMAT_SHORT2N,
    SG_VERTEXFORMAT_USHORT2,
    SG_VERTEXFORMAT_USHORT2N,
    SG_VERTEXFORMAT_SHORT4,
    SG_VERTEXFORMAT_SHORT4N,
    SG_VERTEXFORMAT_USHORT4,
    SG_VERTEXFORMAT_USHORT4N,
    SG_VERTEXFORMAT_UINT10_N2,
    SG_VERTEXFORMAT_HALF2,
    SG_VERTEXFORMAT_HALF4,
    _SG_VERTEXFORMAT_NUM,
    _SG_VERTEXFORMAT_FORCE_U32 = 0x7FFFFFFF
} sg_vertex_format;

/*
    sg_vertex_step

    Defines whether the input pointer of a vertex input stream is advanced
    'per vertex' or 'per instance'. The default step-func is
    SG_VERTEXSTEP_PER_VERTEX. SG_VERTEXSTEP_PER_INSTANCE is used with
    instanced-rendering.

    The vertex-step is part of the vertex-layout definition
    when creating pipeline objects.
*/
typedef enum sg_vertex_step {
    _SG_VERTEXSTEP_DEFAULT,     // value 0 reserved for default-init
    SG_VERTEXSTEP_PER_VERTEX,
    SG_VERTEXSTEP_PER_INSTANCE,
    _SG_VERTEXSTEP_NUM,
    _SG_VERTEXSTEP_FORCE_U32 = 0x7FFFFFFF
} sg_vertex_step;

/*
    sg_uniform_type

    The data type of a uniform block member. This is used to
    describe the internal layout of uniform blocks when creating
    a shader object. This is only required for the GL backend, all
    other backends will ignore the interior layout of uniform blocks.
*/
typedef enum sg_uniform_type {
    SG_UNIFORMTYPE_INVALID,
    SG_UNIFORMTYPE_FLOAT,
    SG_UNIFORMTYPE_FLOAT2,
    SG_UNIFORMTYPE_FLOAT3,
    SG_UNIFORMTYPE_FLOAT4,
    SG_UNIFORMTYPE_INT,
    SG_UNIFORMTYPE_INT2,
    SG_UNIFORMTYPE_INT3,
    SG_UNIFORMTYPE_INT4,
    SG_UNIFORMTYPE_MAT4,
    _SG_UNIFORMTYPE_NUM,
    _SG_UNIFORMTYPE_FORCE_U32 = 0x7FFFFFFF
} sg_uniform_type;

/*
    sg_uniform_layout

    A hint for the interior memory layout of uniform blocks. This is
    only relevant for the GL backend where the internal layout
    of uniform blocks must be known to sokol-gfx. For all other backends the
    internal memory layout of uniform blocks doesn't matter, sokol-gfx
    will just pass uniform data as an opaque memory blob to the
    3D backend.

    SG_UNIFORMLAYOUT_NATIVE (default)
        Native layout means that a 'backend-native' memory layout
        is used. For the GL backend this means that uniforms
        are packed tightly in memory (e.g. there are no padding
        bytes).

    SG_UNIFORMLAYOUT_STD140
        The memory layout is a subset of std140. Arrays are only
        allowed for the FLOAT4, INT4 and MAT4. Alignment is as
        is as follows:

            FLOAT, INT:         4 byte alignment
            FLOAT2, INT2:       8 byte alignment
            FLOAT3, INT3:       16 byte alignment(!)
            FLOAT4, INT4:       16 byte alignment
            MAT4:               16 byte alignment
            FLOAT4[], INT4[]:   16 byte alignment

        The overall size of the uniform block must be a multiple
        of 16.

    For more information search for 'UNIFORM DATA LAYOUT' in the documentation block
    at the start of the header.
*/
typedef enum sg_uniform_layout {
    _SG_UNIFORMLAYOUT_DEFAULT,     // value 0 reserved for default-init
    SG_UNIFORMLAYOUT_NATIVE,       // default: layout depends on currently active backend
    SG_UNIFORMLAYOUT_STD140,       // std140: memory layout according to std140
    _SG_UNIFORMLAYOUT_NUM,
    _SG_UNIFORMLAYOUT_FORCE_U32 = 0x7FFFFFFF
} sg_uniform_layout;

/*
    sg_cull_mode

    The face-culling mode, this is used in the
    sg_pipeline_desc.cull_mode member when creating a
    pipeline object.

    The default cull mode is SG_CULLMODE_NONE
*/
typedef enum sg_cull_mode {
    _SG_CULLMODE_DEFAULT,   // value 0 reserved for default-init
    SG_CULLMODE_NONE,
    SG_CULLMODE_FRONT,
    SG_CULLMODE_BACK,
    _SG_CULLMODE_NUM,
    _SG_CULLMODE_FORCE_U32 = 0x7FFFFFFF
} sg_cull_mode;

/*
    sg_face_winding

    The vertex-winding rule that determines a front-facing primitive. This
    is used in the member sg_pipeline_desc.face_winding
    when creating a pipeline object.

    The default winding is SG_FACEWINDING_CW (clockwise)
*/
typedef enum sg_face_winding {
    _SG_FACEWINDING_DEFAULT,    // value 0 reserved for default-init
    SG_FACEWINDING_CCW,
    SG_FACEWINDING_CW,
    _SG_FACEWINDING_NUM,
    _SG_FACEWINDING_FORCE_U32 = 0x7FFFFFFF
} sg_face_winding;

/*
    sg_compare_func

    The compare-function for configuring depth- and stencil-ref tests
    in pipeline objects, and for texture samplers which perform a comparison
    instead of regular sampling operation.

    Used in the following structs:

    sg_pipeline_desc
        .depth
            .compare
        .stencil
            .front.compare
            .back.compare

    sg_sampler_desc
        .compare

    The default compare func for depth- and stencil-tests is
    SG_COMPAREFUNC_ALWAYS.

    The default compare func for samplers is SG_COMPAREFUNC_NEVER.
*/
typedef enum sg_compare_func {
    _SG_COMPAREFUNC_DEFAULT,    // value 0 reserved for default-init
    SG_COMPAREFUNC_NEVER,
    SG_COMPAREFUNC_LESS,
    SG_COMPAREFUNC_EQUAL,
    SG_COMPAREFUNC_LESS_EQUAL,
    SG_COMPAREFUNC_GREATER,
    SG_COMPAREFUNC_NOT_EQUAL,
    SG_COMPAREFUNC_GREATER_EQUAL,
    SG_COMPAREFUNC_ALWAYS,
    _SG_COMPAREFUNC_NUM,
    _SG_COMPAREFUNC_FORCE_U32 = 0x7FFFFFFF
} sg_compare_func;

/*
    sg_stencil_op

    The operation performed on a currently stored stencil-value when a
    comparison test passes or fails. This is used when creating a pipeline
    object in the following sg_pipeline_desc struct items:

    sg_pipeline_desc
        .stencil
            .front
                .fail_op
                .depth_fail_op
                .pass_op
            .back
                .fail_op
                .depth_fail_op
                .pass_op

    The default value is SG_STENCILOP_KEEP.
*/
typedef enum sg_stencil_op {
    _SG_STENCILOP_DEFAULT,      // value 0 reserved for default-init
    SG_STENCILOP_KEEP,
    SG_STENCILOP_ZERO,
    SG_STENCILOP_REPLACE,
    SG_STENCILOP_INCR_CLAMP,
    SG_STENCILOP_DECR_CLAMP,
    SG_STENCILOP_INVERT,
    SG_STENCILOP_INCR_WRAP,
    SG_STENCILOP_DECR_WRAP,
    _SG_STENCILOP_NUM,
    _SG_STENCILOP_FORCE_U32 = 0x7FFFFFFF
} sg_stencil_op;

/*
    sg_blend_factor

    The source and destination factors in blending operations.
    This is used in the following members when creating a pipeline object:

    sg_pipeline_desc
        .colors[i]
            .blend
                .src_factor_rgb
                .dst_factor_rgb
                .src_factor_alpha
                .dst_factor_alpha

    The default value is SG_BLENDFACTOR_ONE for source
    factors, and for the destination SG_BLENDFACTOR_ZERO if the associated
    blend-op is ADD, SUBTRACT or REVERSE_SUBTRACT or SG_BLENDFACTOR_ONE
    if the associated blend-op is MIN or MAX.
*/
typedef enum sg_blend_factor {
    _SG_BLENDFACTOR_DEFAULT,    // value 0 reserved for default-init
    SG_BLENDFACTOR_ZERO,
    SG_BLENDFACTOR_ONE,
    SG_BLENDFACTOR_SRC_COLOR,
    SG_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
    SG_BLENDFACTOR_SRC_ALPHA,
    SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
    SG_BLENDFACTOR_DST_COLOR,
    SG_BLENDFACTOR_ONE_MINUS_DST_COLOR,
    SG_BLENDFACTOR_DST_ALPHA,
    SG_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
    SG_BLENDFACTOR_SRC_ALPHA_SATURATED,
    SG_BLENDFACTOR_BLEND_COLOR,
    SG_BLENDFACTOR_ONE_MINUS_BLEND_COLOR,
    SG_BLENDFACTOR_BLEND_ALPHA,
    SG_BLENDFACTOR_ONE_MINUS_BLEND_ALPHA,
    SG_BLENDFACTOR_SRC1_COLOR,
    SG_BLENDFACTOR_ONE_MINUS_SRC1_COLOR,
    SG_BLENDFACTOR_SRC1_ALPHA,
    SG_BLENDFACTOR_ONE_MINUS_SRC1_ALPHA,
    _SG_BLENDFACTOR_NUM,
    _SG_BLENDFACTOR_FORCE_U32 = 0x7FFFFFFF
} sg_blend_factor;

/*
    sg_blend_op

    Describes how the source and destination values are combined in the
    fragment blending operation. It is used in the following struct items
    when creating a pipeline object:

    sg_pipeline_desc
        .colors[i]
            .blend
                .op_rgb
                .op_alpha

    The default value is SG_BLENDOP_ADD.
*/
typedef enum sg_blend_op {
    _SG_BLENDOP_DEFAULT,    // value 0 reserved for default-init
    SG_BLENDOP_ADD,
    SG_BLENDOP_SUBTRACT,
    SG_BLENDOP_REVERSE_SUBTRACT,
    SG_BLENDOP_MIN,
    SG_BLENDOP_MAX,
    _SG_BLENDOP_NUM,
    _SG_BLENDOP_FORCE_U32 = 0x7FFFFFFF
} sg_blend_op;

/*
    sg_color_mask

    Selects the active color channels when writing a fragment color to the
    framebuffer. This is used in the members
    sg_pipeline_desc.colors[i].write_mask when creating a pipeline object.

    The default colormask is SG_COLORMASK_RGBA (write all colors channels)

    NOTE: since the color mask value 0 is reserved for the default value
    (SG_COLORMASK_RGBA), use SG_COLORMASK_NONE if all color channels
    should be disabled.
*/
typedef enum sg_color_mask {
    _SG_COLORMASK_DEFAULT = 0,    // value 0 reserved for default-init
    SG_COLORMASK_NONE   = 0x10,   // special value for 'all channels disabled
    SG_COLORMASK_R      = 0x1,
    SG_COLORMASK_G      = 0x2,
    SG_COLORMASK_RG     = 0x3,
    SG_COLORMASK_B      = 0x4,
    SG_COLORMASK_RB     = 0x5,
    SG_COLORMASK_GB     = 0x6,
    SG_COLORMASK_RGB    = 0x7,
    SG_COLORMASK_A      = 0x8,
    SG_COLORMASK_RA     = 0x9,
    SG_COLORMASK_GA     = 0xA,
    SG_COLORMASK_RGA    = 0xB,
    SG_COLORMASK_BA     = 0xC,
    SG_COLORMASK_RBA    = 0xD,
    SG_COLORMASK_GBA    = 0xE,
    SG_COLORMASK_RGBA   = 0xF,
    _SG_COLORMASK_FORCE_U32 = 0x7FFFFFFF
} sg_color_mask;

/*
    sg_load_action

    Defines the load action that should be performed at the start of a render pass:

    SG_LOADACTION_CLEAR:        clear the render target
    SG_LOADACTION_LOAD:         load the previous content of the render target
    SG_LOADACTION_DONTCARE:     leave the render target in an undefined state

    This is used in the sg_pass_action structure.

    The default load action for all pass attachments is SG_LOADACTION_CLEAR,
    with the values rgba = { 0.5f, 0.5f, 0.5f, 1.0f }, depth=1.0f and stencil=0.

    If you want to override the default behaviour, it is important to not
    only set the clear color, but the 'action' field as well (as long as this
    is _SG_LOADACTION_DEFAULT, the value fields will be ignored).
*/
typedef enum sg_load_action {
    _SG_LOADACTION_DEFAULT,
    SG_LOADACTION_CLEAR,
    SG_LOADACTION_LOAD,
    SG_LOADACTION_DONTCARE,
    _SG_LOADACTION_FORCE_U32 = 0x7FFFFFFF
} sg_load_action;

/*
    sg_store_action

    Defines the store action that should be performed at the end of a render pass:

    SG_STOREACTION_STORE:       store the rendered content to the color attachment image
    SG_STOREACTION_DONTCARE:    allows the GPU to discard the rendered content
*/
typedef enum sg_store_action {
    _SG_STOREACTION_DEFAULT,
    SG_STOREACTION_STORE,
    SG_STOREACTION_DONTCARE,
    _SG_STOREACTION_FORCE_U32 = 0x7FFFFFFF
} sg_store_action;


/*
    sg_pass_action

    The sg_pass_action struct defines the actions to be performed
    at the start and end of a render pass.

    - at the start of the pass: whether the render attachments should be cleared,
      loaded with their previous content, or start in an undefined state
    - for clear operations: the clear value (color, depth, or stencil values)
    - at the end of the pass: whether the rendering result should be
      stored back into the render attachment or discarded
*/
typedef struct sg_color_attachment_action {
    sg_load_action load_action;         // default: SG_LOADACTION_CLEAR
    sg_store_action store_action;       // default: SG_STOREACTION_STORE
    sg_color clear_value;               // default: { 0.5f, 0.5f, 0.5f, 1.0f }
} sg_color_attachment_action;

typedef struct sg_depth_attachment_action {
    sg_load_action load_action;         // default: SG_LOADACTION_CLEAR
    sg_store_action store_action;       // default: SG_STOREACTION_DONTCARE
    float clear_value;                  // default: 1.0
} sg_depth_attachment_action;

typedef struct sg_stencil_attachment_action {
    sg_load_action load_action;         // default: SG_LOADACTION_CLEAR
    sg_store_action store_action;       // default: SG_STOREACTION_DONTCARE
    uint8_t clear_value;                // default: 0
} sg_stencil_attachment_action;

typedef struct sg_pass_action {
    sg_color_attachment_action colors[SG_MAX_COLOR_ATTACHMENTS];
    sg_depth_attachment_action depth;
    sg_stencil_attachment_action stencil;
} sg_pass_action;

/*
    sg_swapchain

    Used in sg_begin_pass() to provide details about an external swapchain
    (pixel formats, sample count and backend-API specific render surface objects).

    The following information must be provided:

    - the width and height of the swapchain surfaces in number of pixels,
    - the pixel format of the render- and optional msaa-resolve-surface
    - the pixel format of the optional depth- or depth-stencil-surface
    - the MSAA sample count for the render and depth-stencil surface

    If the pixel formats and MSAA sample counts are left zero-initialized,
    their defaults are taken from the sg_environment struct provided in the
    sg_setup() call.

    The width and height *must* be > 0.

    Additionally the following backend API specific objects must be passed in
    as 'type erased' void pointers:

    GL:
        - on all GL backends, a GL framebuffer object must be provided. This
          can be zero for the default framebuffer.

    D3D11:
        - an ID3D11RenderTargetView for the rendering surface, without
          MSAA rendering this surface will also be displayed
        - an optional ID3D11DepthStencilView for the depth- or depth/stencil
          buffer surface
        - when MSAA rendering is used, another ID3D11RenderTargetView
          which serves as MSAA resolve target and will be displayed

    WebGPU (same as D3D11, except different types)
        - a WGPUTextureView for the rendering surface, without
          MSAA rendering this surface will also be displayed
        - an optional WGPUTextureView for the depth- or depth/stencil
          buffer surface
        - when MSAA rendering is used, another WGPUTextureView
          which serves as MSAA resolve target and will be displayed

    Metal (NOTE that the roles of provided surfaces is slightly different
    than on D3D11 or WebGPU in case of MSAA vs non-MSAA rendering):

        - A current CAMetalDrawable (NOT an MTLDrawable!) which will be presented.
          This will either be rendered to directly (if no MSAA is used), or serve
          as MSAA-resolve target.
        - an optional MTLTexture for the depth- or depth-stencil buffer
        - an optional multisampled MTLTexture which serves as intermediate
          rendering surface which will then be resolved into the
          CAMetalDrawable.

    NOTE that for Metal you must use an ObjC __bridge cast to
    properly tunnel the ObjC object id through a C void*, e.g.:

        swapchain.metal.current_drawable = (__bridge const void*) [mtkView currentDrawable];

    On all other backends you shouldn't need to mess with the reference count.

    It's a good practice to write a helper function which returns an initialized
    sg_swapchain struct, which can then be plugged directly into
    sg_pass.swapchain. Look at the function sglue_swapchain() in the sokol_glue.h
    as an example.
*/
typedef struct sg_metal_swapchain {
    const void* current_drawable;       // CAMetalDrawable (NOT MTLDrawable!!!)
    const void* depth_stencil_texture;  // MTLTexture
    const void* msaa_color_texture;     // MTLTexture
} sg_metal_swapchain;

typedef struct sg_d3d11_swapchain {
    const void* render_view;            // ID3D11RenderTargetView
    const void* resolve_view;           // ID3D11RenderTargetView
    const void* depth_stencil_view;     // ID3D11DepthStencilView
} sg_d3d11_swapchain;

typedef struct sg_wgpu_swapchain {
    const void* render_view;            // WGPUTextureView
    const void* resolve_view;           // WGPUTextureView
    const void* depth_stencil_view;     // WGPUTextureView
} sg_wgpu_swapchain;

typedef struct sg_vulkan_swapchain {
    const void* render_image;           // vkImage
    const void* render_view;            // vkImageView
    const void* resolve_image;          // vkImage
    const void* resolve_view;           // vkImageView
    const void* depth_stencil_image;    // vkImage
    const void* depth_stencil_view;     // vkImageView
    const void* render_finished_semaphore;  // vkSemaphore
    const void* present_complete_semaphore; // vkSemaphore
} sg_vulkan_swapchain;

typedef struct sg_gl_swapchain {
    uint32_t framebuffer;               // GL framebuffer object
} sg_gl_swapchain;

typedef struct sg_swapchain {
    int width;
    int height;
    int sample_count;
    sg_pixel_format color_format;
    sg_pixel_format depth_format;
    sg_metal_swapchain metal;
    sg_d3d11_swapchain d3d11;
    sg_wgpu_swapchain wgpu;
    sg_vulkan_swapchain vulkan;
    sg_gl_swapchain gl;
} sg_swapchain;

/*
    sg_attachments

    Used in sg_pass to provide render pass attachment views. Each
    type of pass attachment has it corresponding view type:

    sg_attachments.colors[]:
        populate with color-attachment views, e.g.:

        sg_make_view(&(sg_view_desc){
            .color_attachment = { ... },
        });

    sg_attachments.resolves[]:
        populate with resolve-attachment views, e.g.:

        sg_make_view(&(sg_view_desc){
            .resolve_attachment = { ... },
        });

    sg_attachments.depth_stencil:
        populate with depth-stencil-attachment views, e.g.:

        sg_make_view(&(sg_view_desc){
            .depth_stencil_attachment = { ... },
        });
*/
typedef struct sg_attachments {
    sg_view colors[SG_MAX_COLOR_ATTACHMENTS];
    sg_view resolves[SG_MAX_COLOR_ATTACHMENTS];
    sg_view depth_stencil;
} sg_attachments;

/*
    sg_pass

    The sg_pass structure is passed as argument into the sg_begin_pass()
    function.

    For a swapchain render pass, provide an sg_pass_action and sg_swapchain
    struct (for instance via the sglue_swapchain() helper function from
    sokol_glue.h):

        sg_begin_pass(&(sg_pass){
            .action = { ... },
            .swapchain = sglue_swapchain(),
        });

    For an offscreen render pass, provide an sg_pass_action struct with
    attachment view objects:

        sg_begin_pass(&(sg_pass){
            .action = { ... },
            .attachments = {
                .colors = { ... },
                .resolves = { ... },
                .depth_stencil = ...,
            },
        });

    You can also omit the .action object to get default pass action behaviour
    (clear to color=grey, depth=1 and stencil=0).

    For a compute pass, just set the sg_pass.compute boolean to true:

        sg_begin_pass(&(sg_pass){ .compute = true });
*/
typedef struct sg_pass {
    uint32_t _start_canary;
    bool compute;
    sg_pass_action action;
    sg_attachments attachments;
    sg_swapchain swapchain;
    const char* label;
    uint32_t _end_canary;
} sg_pass;

typedef struct sg_bindings {
    uint32_t _start_canary;
    sg_buffer vertex_buffers[SG_MAX_VERTEXBUFFER_BINDSLOTS];
    int vertex_buffer_offsets[SG_MAX_VERTEXBUFFER_BINDSLOTS];
    sg_buffer index_buffer;
    int index_buffer_offset;
    sg_view views[SG_MAX_VIEW_BINDSLOTS];
    sg_sampler samplers[SG_MAX_SAMPLER_BINDSLOTS];
    uint32_t _end_canary;
} sg_bindings;

/*
    sg_buffer_usage

    Describes how a buffer object is going to be used:

    .vertex_buffer (default: true)
        the buffer will be bound as vertex buffer via sg_bindings.vertex_buffers[]
    .index_buffer (default: false)
        the buffer will be bound as index buffer via sg_bindings.index_buffer
    .storage_buffer (default: false)
        the buffer will be bound as storage buffer via storage-buffer-view
        in sg_bindings.views[]
    .immutable (default: true)
        the buffer content will never be updated from the CPU side (but
        may be written to by a compute shader)
    .dynamic_update (default: false)
        the buffer content will be infrequently updated from the CPU side
    .stream_upate (default: false)
        the buffer content will be updated each frame from the CPU side
*/
typedef struct sg_buffer_usage {
    bool vertex_buffer;
    bool index_buffer;
    bool storage_buffer;
    bool immutable;
    bool dynamic_update;
    bool stream_update;
} sg_buffer_usage;

/*
    sg_buffer_desc

    Creation parameters for sg_buffer objects, used in the sg_make_buffer() call.

    The default configuration is:

    .size:      0       (*must* be >0 for buffers without data)
    .usage      { .vertex_buffer = true, .immutable = true }
    .data.ptr   0       (*must* be valid for immutable buffers without storage buffer usage)
    .data.size  0       (*must* be > 0 for immutable buffers without storage buffer usage)
    .label      0       (optional string label)

    For immutable buffers which are initialized with initial data,
    keep the .size item zero-initialized, and set the size together with the
    pointer to the initial data in the .data item.

    For immutable or mutable buffers without initial data, keep the .data item
    zero-initialized, and set the buffer size in the .size item instead.

    You can also set both size values, but currently both size values must
    be identical (this may change in the future when the dynamic resource
    management may become more flexible).

    NOTE: Immutable buffers without storage-buffer-usage *must* be created
    with initial content, this restriction doesn't apply to storage buffer usage,
    because storage buffers may also get their initial content by running
    a compute shader on them.

    NOTE: Buffers without initial data will have undefined content, e.g.
    do *not* expect the buffer to be zero-initialized!

    ADVANCED TOPIC: Injecting native 3D-API buffers:

    The following struct members allow to inject your own GL, Metal
    or D3D11 buffers into sokol_gfx:

    .gl_buffers[SG_NUM_INFLIGHT_FRAMES]
    .mtl_buffers[SG_NUM_INFLIGHT_FRAMES]
    .d3d11_buffer

    You must still provide all other struct items except the .data item, and
    these must match the creation parameters of the native buffers you provide.
    For sg_buffer_desc.usage.immutable buffers, only provide a single native
    3D-API buffer, otherwise you need to provide SG_NUM_INFLIGHT_FRAMES buffers
    (only for GL and Metal, not D3D11). Providing multiple buffers for GL and
    Metal is necessary because sokol_gfx will rotate through them when calling
    sg_update_buffer() to prevent lock-stalls.

    Note that it is expected that immutable injected buffer have already been
    initialized with content, and the .content member must be 0!

    Also you need to call sg_reset_state_cache() after calling native 3D-API
    functions, and before calling any sokol_gfx function.
*/
typedef struct sg_buffer_desc {
    uint32_t _start_canary;
    size_t size;
    sg_buffer_usage usage;
    sg_range data;
    const char* label;
    // optionally inject backend-specific resources
    uint32_t gl_buffers[SG_NUM_INFLIGHT_FRAMES];
    const void* mtl_buffers[SG_NUM_INFLIGHT_FRAMES];
    const void* d3d11_buffer;
    const void* wgpu_buffer;
    uint32_t _end_canary;
} sg_buffer_desc;

/*
    sg_image_usage

    Describes the intended usage of an image object:

    .storage_image (default: false)
        the image can be used as parent resource of a storage-image-view,
        which allows compute shaders to write to the image in a compute
        pass (for read-only access in compute shaders bind the image
        via a texture view instead
    .color_attachment (default: false)
        the image can be used as parent resource of a color-attachment-view,
        which is then passed into sg_begin_pass via sg_pass.attachments.colors[]
        so that fragment shaders can render into the image
    .resolve_attachment (default: false)
        the image can be used as parent resource of a resolve-attachment-view,
        which is then passed into sg_begin_pass via sg_pass.attachments.resolves[]
        as target for an MSAA-resolve operation in sg_end_pass()
    .depth_stencil_attachment (default: false)
        the image can be used as parent resource of a depth-stencil-attachmnet-view
        which is then passes into sg_begin_pass via sg_pass.attachments.depth_stencil
        as depth-stencil-buffer
    .immutable (default: true)
        the image content cannot be updated from the CPU side
        (but may be updated by the GPU in a render- or compute-pass)
    .dynamic_update (default: false)
        the image content is updated infrequently by the CPU
    .stream_update (default: false)
        the image content is updated each frame by the CPU via

    Note that creating a texture view from the image to be used for
    texture-sampling in vertex-, fragment- or compute-shaders
    is always implicitly allowed.
*/
typedef struct sg_image_usage {
    bool storage_image;
    bool color_attachment;
    bool resolve_attachment;
    bool depth_stencil_attachment;
    bool immutable;
    bool dynamic_update;
    bool stream_update;
} sg_image_usage;

/*
    sg_view_type

    Allows to query the type of a view object via the function sg_query_view_type()
*/
typedef enum sg_view_type {
    SG_VIEWTYPE_INVALID,
    SG_VIEWTYPE_STORAGEBUFFER,
    SG_VIEWTYPE_STORAGEIMAGE,
    SG_VIEWTYPE_TEXTURE,
    SG_VIEWTYPE_COLORATTACHMENT,
    SG_VIEWTYPE_RESOLVEATTACHMENT,
    SG_VIEWTYPE_DEPTHSTENCILATTACHMENT,
    _SG_VIEWTYPE_FORCE_U32 = 0x7FFFFFFF
} sg_view_type;

/*
    sg_image_data

    Defines the content of an image through an array of sg_range structs, each
    range pointing to the pixel data for one mip-level. For array-, cubemap- and
    3D-images each mip-level contains all slice-surfaces for that mip-level in a
    single tightly packed memory block.

    The size of a single surface in a mip-level for a regular 2D texture
    can be computed via:

        sg_query_surface_pitch(pixel_format, mip_width, mip_height, 1);

    For array- and 3d-images the size of a single miplevel is:

        num_slices * sg_query_surface_pitch(pixel_format, mip_width, mip_height, 1);

    For cubemap-images the size of a single mip-level is:

        6 * sg_query_surface_pitch(pixel_format, mip_width, mip_height, 1);

    The order of cubemap-faces is in a mip-level data chunk is:

        [0] => +X
        [1] => -X
        [2] => +Y
        [3] => -Y
        [4] => +Z
        [5] => -Z
*/
typedef struct sg_image_data {
    sg_range mip_levels[SG_MAX_MIPMAPS];
} sg_image_data;

/*
    sg_image_desc

    Creation parameters for sg_image objects, used in the sg_make_image() call.

    The default configuration is:

    .type               SG_IMAGETYPE_2D
    .usage              .immutable = true
    .width              0 (must be set to >0)
    .height             0 (must be set to >0)
    .num_slices         1 (3D textures: depth; array textures: number of layers)
    .num_mipmaps        1
    .pixel_format       SG_PIXELFORMAT_RGBA8 for textures, or sg_desc.environment.defaults.color_format for render targets
    .sample_count       1 for textures, or sg_desc.environment.defaults.sample_count for render targets
    .data               an sg_image_data struct to define the initial content
    .label              0 (optional string label for trace hooks)

    Q: Why is the default sample_count for render targets identical with the
    "default sample count" from sg_desc.environment.defaults.sample_count?

    A: So that it matches the default sample count in pipeline objects. Even
    though it is a bit strange/confusing that offscreen render targets by default
    get the same sample count as 'default swapchains', but it's better that
    an offscreen render target created with default parameters matches
    a pipeline object created with default parameters.

    NOTE:

    Regular images used as texture binding with usage.immutable must be fully
    initialized by providing a valid .data member which points to initialization
    data.

    Images with usage.*_attachment or usage.storage_image must
    *not* be created with initial content. Be aware that the initial
    content of pass attachment and storage images is undefined
    (not guaranteed to be zeroed).

    ADVANCED TOPIC: Injecting native 3D-API textures:

    The following struct members allow to inject your own GL, Metal or D3D11
    textures into sokol_gfx:

    .gl_textures[SG_NUM_INFLIGHT_FRAMES]
    .mtl_textures[SG_NUM_INFLIGHT_FRAMES]
    .d3d11_texture
    .wgpu_texture

    For GL, you can also specify the texture target or leave it empty to use
    the default texture target for the image type (GL_TEXTURE_2D for
    SG_IMAGETYPE_2D etc)

    The same rules apply as for injecting native buffers (see sg_buffer_desc
    documentation for more details).
*/
typedef struct sg_image_desc {
    uint32_t _start_canary;
    sg_image_type type;
    sg_image_usage usage;
    int width;
    int height;
    int num_slices;
    int num_mipmaps;
    sg_pixel_format pixel_format;
    int sample_count;
    sg_image_data data;
    const char* label;
    // optionally inject backend-specific resources
    uint32_t gl_textures[SG_NUM_INFLIGHT_FRAMES];
    uint32_t gl_texture_target;
    const void* mtl_textures[SG_NUM_INFLIGHT_FRAMES];
    const void* d3d11_texture;
    const void* wgpu_texture;
    uint32_t _end_canary;
} sg_image_desc;

/*
    sg_sampler_desc

    Creation parameters for sg_sampler objects, used in the sg_make_sampler() call

    .min_filter:        SG_FILTER_NEAREST
    .mag_filter:        SG_FILTER_NEAREST
    .mipmap_filter      SG_FILTER_NEAREST
    .wrap_u:            SG_WRAP_REPEAT
    .wrap_v:            SG_WRAP_REPEAT
    .wrap_w:            SG_WRAP_REPEAT (only SG_IMAGETYPE_3D)
    .min_lod            0.0f
    .max_lod            FLT_MAX
    .border_color       SG_BORDERCOLOR_OPAQUE_BLACK
    .compare            SG_COMPAREFUNC_NEVER
    .max_anisotropy     1 (must be 1..16)
*/
typedef struct sg_sampler_desc {
    uint32_t _start_canary;
    sg_filter min_filter;
    sg_filter mag_filter;
    sg_filter mipmap_filter;
    sg_wrap wrap_u;
    sg_wrap wrap_v;
    sg_wrap wrap_w;
    float min_lod;
    float max_lod;
    sg_border_color border_color;
    sg_compare_func compare;
    uint32_t max_anisotropy;
    const char* label;
    // optionally inject backend-specific resources
    uint32_t gl_sampler;
    const void* mtl_sampler;
    const void* d3d11_sampler;
    const void* wgpu_sampler;
    uint32_t _end_canary;
} sg_sampler_desc;

/*
    sg_shader_desc

    Used as parameter of sg_make_shader() to create a shader object which
    communicates shader source or bytecode and shader interface
    reflection information to sokol-gfx.

    If you use sokol-shdc you can ignore the following information since
    the sg_shader_desc struct will be code-generated.

    Otherwise you need to provide the following information to the
    sg_make_shader() call:

    - a vertex- and fragment-shader function:
        - the shader source or bytecode
        - an optional entry point name
        - for D3D11: an optional compile target when source code is provided
          (the defaults are "vs_4_0" and "ps_4_0")

    - ...or alternatively, a compute function:
        - the shader source or bytecode
        - an optional entry point name
        - for D3D11: an optional compile target when source code is provided
          (the default is "cs_5_0")

    - vertex attributes required by some backends (not for compute shaders):
        - the vertex attribute base type (undefined, float, signed int, unsigned int),
          this information is only used in the validation layer to check that the
          pipeline object vertex formats are compatible with the input vertex attribute
          type used in the vertex shader. NOTE that the default base type
          'undefined' skips the validation layer check.
        - for the GL backend: optional vertex attribute names used for name lookup
        - for the D3D11 backend: semantic names and indices

    - only for compute shaders on the Metal backend:
        - the workgroup size aka 'threads per thread-group'

          In other 3D APIs this is declared in the shader code:
            - GLSL: `layout(local_size_x=x, local_size_y=y, local_size_y=z) in;`
            - HLSL: `[numthreads(x, y, z)]`
            - WGSL: `@workgroup_size(x, y, z)`
          ...but in Metal the workgroup size is declared on the CPU side

    - reflection information for each uniform block binding used by the shader:
        - the shader stage the uniform block appears in (SG_SHADERSTAGE_*)
        - the size in bytes of the uniform block
        - backend-specific bindslots:
            - HLSL: the constant buffer register `register(b0..7)`
            - MSL: the buffer attribute `[[buffer(0..7)]]`
            - WGSL: the binding in `@group(0) @binding(0..15)`
        - GLSL only: a description of the uniform block interior
            - the memory layout standard (SG_UNIFORMLAYOUT_*)
            - for each member in the uniform block:
                - the member type (SG_UNIFORM_*)
                - if the member is an array, the array count
                - the member name

    - reflection information for each texture-, storage-buffer and
      storage-image bindings by the shader, each with an associated
      view type:
        - texture bindings => texture views
        - storage-buffer bindings => storage-buffer views
        - storage-image bindings => storage-image views

    - texture bindings must provide the following information:
        - the shader stage the texture binding appears in (SG_SHADERSTAGE_*)
        - the image type (SG_IMAGETYPE_*)
        - the image-sample type (SG_IMAGESAMPLETYPE_*)
        - whether the texture is multisampled
        - backend specific bindslots:
            - HLSL: the texture register `register(t0..31)`
            - MSL: the texture attribute `[[texture(0..31)]]`
            - WGSL: the binding in `@group(1) @binding(0..127)`

    - storage-buffer bindings must provide the following information:
        - the shader stage the storage buffer appears in (SG_SHADERSTAGE_*)
        - whether the storage buffer is readonly
        - backend specific bindslots:
            - HLSL:
                - for storage buffer bindings: `register(t0..31)`
                - for read/write storage buffer bindings: `register(u0..31)`
            - MSL: the buffer attribute `[[buffer(8..23)]]`
            - WGSL: the binding in `@group(1) @binding(0..127)`
            - GL: the binding in `layout(binding=0..sg_limits.max_storage_buffer_bindings_per_stage)`

    - storage-image bindings must provide the following information:
        - the shader stage (*must* be SG_SHADERSTAGE_COMPUTE)
        - whether the storage image is writeonly or readwrite (for readonly
          access use a regular texture binding instead)
        - the image type expected by the shader (SG_IMAGETYPE_*)
        - the access pixel format expected by the shader (SG_PIXELFORMAT_*),
          note that only a subset of pixel formats is allowed for storage image
          bindings
        - backend specific bindslots:
            - HLSL: the UAV register `register(u0..31)`
            - MSL: the texture attribute `[[texture(0..31)]]`
            - WGSL: the binding in `@group(1) @binding(0..127)`
            - GLSL: the binding in `layout(binding=0..sg_imits.max_storage_buffer_bindings_per_stage, [access_format])`

    - reflection information for each sampler used by the shader:
        - the shader stage the sampler appears in (SG_SHADERSTAGE_*)
        - the sampler type (SG_SAMPLERTYPE_*)
        - backend specific bindslots:
            - HLSL: the sampler register `register(s0..11)`
            - MSL: the sampler attribute `[[sampler(0..11)]]`
            - WGSL: the binding in `@group(0) @binding(0..127)`

    - reflection information for each texture-sampler pair used by
      the shader:
        - the shader stage (SG_SHADERSTAGE_*)
        - the texture's array index in the sg_shader_desc.views[] array
        - the sampler's array index in the sg_shader_desc.samplers[] array
        - GLSL only: the name of the combined image-sampler object

    The number and order of items in the sg_shader_desc.attrs[]
    array corresponds to the items in sg_pipeline_desc.layout.attrs.

        - sg_shader_desc.attrs[N] => sg_pipeline_desc.layout.attrs[N]

    NOTE that vertex attribute indices currently cannot have gaps.

    The items index in the sg_shader_desc.uniform_blocks[] array corresponds
    to the ub_slot arg in sg_apply_uniforms():

        - sg_shader_desc.uniform_blocks[N] => sg_apply_uniforms(N, ...)

    The items in the sg_shader_desc.views[] array directly map to
    the views in the sg_bindings.views[] array!

    For all GL backends, shader source-code must be provided. For D3D11 and Metal,
    either shader source-code or byte-code can be provided.

    NOTE that the uniform-block, view and sampler arrays may have gaps. This
    allows to use the same sg_bindings struct for different but related
    shader variations.

    For D3D11, if source code is provided, the d3dcompiler_47.dll will be loaded
    on demand. If this fails, shader creation will fail. When compiling HLSL
    source code, you can provide an optional target string via
    sg_shader_stage_desc.d3d11_target, the default target is "vs_4_0" for the
    vertex shader stage and "ps_4_0" for the pixel shader stage.
    You may optionally provide the file path to enable the default #include handler
    behavior when compiling source code.
*/
typedef enum sg_shader_stage {
    SG_SHADERSTAGE_NONE,
    SG_SHADERSTAGE_VERTEX,
    SG_SHADERSTAGE_FRAGMENT,
    SG_SHADERSTAGE_COMPUTE,
    _SG_SHADERSTAGE_FORCE_U32 = 0x7FFFFFFF,
} sg_shader_stage;

typedef struct sg_shader_function {
    const char* source;
    sg_range bytecode;
    const char* entry;
    const char* d3d11_target;   // default: "vs_4_0" or "ps_4_0"
    const char* d3d11_filepath;
} sg_shader_function;

typedef enum sg_shader_attr_base_type {
    SG_SHADERATTRBASETYPE_UNDEFINED,
    SG_SHADERATTRBASETYPE_FLOAT,
    SG_SHADERATTRBASETYPE_SINT,
    SG_SHADERATTRBASETYPE_UINT,
    _SG_SHADERATTRBASETYPE_FORCE_U32 = 0x7FFFFFFF,
} sg_shader_attr_base_type;

typedef struct sg_shader_vertex_attr {
    sg_shader_attr_base_type base_type;  // default: UNDEFINED (disables validation)
    const char* glsl_name;      // [optional] GLSL attribute name
    const char* hlsl_sem_name;  // HLSL semantic name
    uint8_t hlsl_sem_index;     // HLSL semantic index
} sg_shader_vertex_attr;

typedef struct sg_glsl_shader_uniform {
    sg_uniform_type type;
    uint16_t array_count;       // 0 or 1 for scalars, >1 for arrays
    const char* glsl_name;      // glsl name binding is required on GL 4.1 and WebGL2
} sg_glsl_shader_uniform;

typedef struct sg_shader_uniform_block {
    sg_shader_stage stage;
    uint32_t size;
    uint8_t hlsl_register_b_n;  // HLSL register(bn)
    uint8_t msl_buffer_n;       // MSL [[buffer(n)]]
    uint8_t wgsl_group0_binding_n;  // WGSL @group(0) @binding(n)
    uint8_t spirv_set0_binding_n;   // Vulkan GLSL layout(set=0, binding=n)
    sg_uniform_layout layout;
    sg_glsl_shader_uniform glsl_uniforms[SG_MAX_UNIFORMBLOCK_MEMBERS];
} sg_shader_uniform_block;

typedef struct sg_shader_texture_view {
    sg_shader_stage stage;
    sg_image_type image_type;
    sg_image_sample_type sample_type;
    bool multisampled;
    uint8_t hlsl_register_t_n;      // HLSL register(tn) bind slot
    uint8_t msl_texture_n;          // MSL [[texture(n)]] bind slot
    uint8_t wgsl_group1_binding_n;  // WGSL @group(1) @binding(n) bind slot
    uint8_t spirv_set1_binding_n;   // Vulkan GLSL layout(set=1, binding=0)
} sg_shader_texture_view;

typedef struct sg_shader_storage_buffer_view {
    sg_shader_stage stage;
    bool readonly;
    uint8_t hlsl_register_t_n;      // HLSL register(tn) bind slot (for readonly access)
    uint8_t hlsl_register_u_n;      // HLSL register(un) bind slot (for read/write access)
    uint8_t msl_buffer_n;           // MSL [[buffer(n)]] bind slot
    uint8_t wgsl_group1_binding_n;  // WGSL @group(1) @binding(n) bind slot
    uint8_t spirv_set1_binding_n;   // Vulkan GLSL layout(set=1, binding=0)
    uint8_t glsl_binding_n;         // GLSL layout(binding=n)
} sg_shader_storage_buffer_view;

typedef struct sg_shader_storage_image_view {
    sg_shader_stage stage;
    sg_image_type image_type;
    sg_pixel_format access_format;  // shader-access pixel format
    bool writeonly;                 // false means read/write access
    uint8_t hlsl_register_u_n;      // HLSL register(un) bind slot
    uint8_t msl_texture_n;          // MSL [[texture(n)]] bind slot
    uint8_t wgsl_group1_binding_n;  // WGSL @group(2) @binding(n) bind slot
    uint8_t spirv_set1_binding_n;   // Vulkan GLSL layout(set=1, binding=0)
    uint8_t glsl_binding_n;         // GLSL layout(binding=n)
} sg_shader_storage_image_view;

typedef struct sg_shader_view {
    sg_shader_texture_view texture;
    sg_shader_storage_buffer_view storage_buffer;
    sg_shader_storage_image_view storage_image;
} sg_shader_view;

typedef struct sg_shader_sampler {
    sg_shader_stage stage;
    sg_sampler_type sampler_type;
    uint8_t hlsl_register_s_n;      // HLSL register(sn) bind slot
    uint8_t msl_sampler_n;          // MSL [[sampler(n)]] bind slot
    uint8_t wgsl_group1_binding_n;  // WGSL @group(1) @binding(n) bind slot
    uint8_t spirv_set1_binding_n;   // Vulkan GLSL layout(set=1, binding=0)
} sg_shader_sampler;

typedef struct sg_shader_texture_sampler_pair {
    sg_shader_stage stage;
    uint8_t view_slot;              // must be SG_VIEWTYPE_TEXTURE
    uint8_t sampler_slot;
    const char* glsl_name;          // glsl name binding required because of GL 4.1 and WebGL2
} sg_shader_texture_sampler_pair;

typedef struct sg_mtl_shader_threads_per_threadgroup {
    int x, y, z;
} sg_mtl_shader_threads_per_threadgroup;

typedef struct sg_shader_desc {
    uint32_t _start_canary;
    sg_shader_function vertex_func;
    sg_shader_function fragment_func;
    sg_shader_function compute_func;
    sg_shader_vertex_attr attrs[SG_MAX_VERTEX_ATTRIBUTES];
    sg_shader_uniform_block uniform_blocks[SG_MAX_UNIFORMBLOCK_BINDSLOTS];
    sg_shader_view views[SG_MAX_VIEW_BINDSLOTS];
    sg_shader_sampler samplers[SG_MAX_SAMPLER_BINDSLOTS];
    sg_shader_texture_sampler_pair texture_sampler_pairs[SG_MAX_TEXTURE_SAMPLER_PAIRS];
    sg_mtl_shader_threads_per_threadgroup mtl_threads_per_threadgroup;
    const char* label;
    uint32_t _end_canary;
} sg_shader_desc;

/*
    sg_pipeline_desc

    The sg_pipeline_desc struct defines all creation parameters for an
    sg_pipeline object, used as argument to the sg_make_pipeline() function:

    Pipeline objects come in two flavours:

    - render pipelines for use in render passes
    - compute pipelines for use in compute passes

    A compute pipeline only requires a compute shader object but no
    'render state', while a render pipeline requires a vertex/fragment shader
    object and additional render state declarations:

    - the vertex layout for all input vertex buffers
    - a shader object
    - the 3D primitive type (points, lines, triangles, ...)
    - the index type (none, 16- or 32-bit)
    - all the fixed-function-pipeline state (depth-, stencil-, blend-state, etc...)

    If the vertex data has no gaps between vertex components, you can omit
    the .layout.buffers[].stride and layout.attrs[].offset items (leave them
    default-initialized to 0), sokol-gfx will then compute the offsets and
    strides from the vertex component formats (.layout.attrs[].format).
    Please note that ALL vertex attribute offsets must be 0 in order for the
    automatic offset computation to kick in.

    Note that if you use vertex-pulling from storage buffers instead of
    fixed-function vertex input you can simply omit the entire nested .layout
    struct.

    The default configuration is as follows:

    .compute:               false (must be set to true for a compute pipeline)
    .shader:                0 (must be initialized with a valid sg_shader id!)
    .layout:
        .buffers[]:         vertex buffer layouts
            .stride:        0 (if no stride is given it will be computed)
            .step_func      SG_VERTEXSTEP_PER_VERTEX
            .step_rate      1
        .attrs[]:           vertex attribute declarations
            .buffer_index   0 the vertex buffer bind slot
            .offset         0 (offsets can be omitted if the vertex layout has no gaps)
            .format         SG_VERTEXFORMAT_INVALID (must be initialized!)
    .depth:
        .pixel_format:      sg_desc.context.depth_format
        .compare:           SG_COMPAREFUNC_ALWAYS
        .write_enabled:     false
        .bias:              0.0f
        .bias_slope_scale:  0.0f
        .bias_clamp:        0.0f
    .stencil:
        .enabled:           false
        .front/back:
            .compare:       SG_COMPAREFUNC_ALWAYS
            .fail_op:       SG_STENCILOP_KEEP
            .depth_fail_op: SG_STENCILOP_KEEP
            .pass_op:       SG_STENCILOP_KEEP
        .read_mask:         0
        .write_mask:        0
        .ref:               0
    .color_count            1
    .colors[0..color_count]
        .pixel_format       sg_desc.context.color_format
        .write_mask:        SG_COLORMASK_RGBA
        .blend:
            .enabled:           false
            .src_factor_rgb:    SG_BLENDFACTOR_ONE
            .dst_factor_rgb:    SG_BLENDFACTOR_ZERO
            .op_rgb:            SG_BLENDOP_ADD
            .src_factor_alpha:  SG_BLENDFACTOR_ONE
            .dst_factor_alpha:  SG_BLENDFACTOR_ZERO
            .op_alpha:          SG_BLENDOP_ADD
    .primitive_type:            SG_PRIMITIVETYPE_TRIANGLES
    .index_type:                SG_INDEXTYPE_NONE
    .cull_mode:                 SG_CULLMODE_NONE
    .face_winding:              SG_FACEWINDING_CW
    .sample_count:              sg_desc.context.sample_count
    .blend_color:               (sg_color) { 0.0f, 0.0f, 0.0f, 0.0f }
    .alpha_to_coverage_enabled: false
    .label  0       (optional string label for trace hooks)
*/
typedef struct sg_vertex_buffer_layout_state {
    int stride;
    sg_vertex_step step_func;
    int step_rate;
} sg_vertex_buffer_layout_state;

typedef struct sg_vertex_attr_state {
    int buffer_index;
    int offset;
    sg_vertex_format format;
} sg_vertex_attr_state;

typedef struct sg_vertex_layout_state {
    sg_vertex_buffer_layout_state buffers[SG_MAX_VERTEXBUFFER_BINDSLOTS];
    sg_vertex_attr_state attrs[SG_MAX_VERTEX_ATTRIBUTES];
} sg_vertex_layout_state;

typedef struct sg_stencil_face_state {
    sg_compare_func compare;
    sg_stencil_op fail_op;
    sg_stencil_op depth_fail_op;
    sg_stencil_op pass_op;
} sg_stencil_face_state;

typedef struct sg_stencil_state {
    bool enabled;
    sg_stencil_face_state front;
    sg_stencil_face_state back;
    uint8_t read_mask;
    uint8_t write_mask;
    uint8_t ref;
} sg_stencil_state;

typedef struct sg_depth_state {
    sg_pixel_format pixel_format;
    sg_compare_func compare;
    bool write_enabled;
    float bias;
    float bias_slope_scale;
    float bias_clamp;
} sg_depth_state;

typedef struct sg_blend_state {
    bool enabled;
    sg_blend_factor src_factor_rgb;
    sg_blend_factor dst_factor_rgb;
    sg_blend_op op_rgb;
    sg_blend_factor src_factor_alpha;
    sg_blend_factor dst_factor_alpha;
    sg_blend_op op_alpha;
} sg_blend_state;

typedef struct sg_color_target_state {
    sg_pixel_format pixel_format;
    sg_color_mask write_mask;
    sg_blend_state blend;
} sg_color_target_state;

typedef struct sg_pipeline_desc {
    uint32_t _start_canary;
    bool compute;
    sg_shader shader;
    sg_vertex_layout_state layout;
    sg_depth_state depth;
    sg_stencil_state stencil;
    int color_count;
    sg_color_target_state colors[SG_MAX_COLOR_ATTACHMENTS];
    sg_primitive_type primitive_type;
    sg_index_type index_type;
    sg_cull_mode cull_mode;
    sg_face_winding face_winding;
    int sample_count;
    sg_color blend_color;
    bool alpha_to_coverage_enabled;
    const char* label;
    uint32_t _end_canary;
} sg_pipeline_desc;

/*
    sg_view_desc

    Creation params for sg_view objects, passed into sg_make_view() calls.

    View objects are passed into sg_apply_bindings() (for texture-, storage-buffer-
    and storage-image views), and sg_begin_pass() (for color-, resolve-
    and depth-stencil-attachment views).

    The view type is determined by initializing one of the sub-structs of
    sg_view_desc:

    .texture            a texture-view object will be created
        .image          the sg_image parent resource
        .mip_levels     optional mip-level range, keep zero-initialized for the
                        entire mipmap chain
            .base       the first mip level
            .count      number of mip levels, keeping this zero-initialized means
                        'all remaining mip levels'
        .slices         optional slice range, keep zero-initialized to include
                        all slices
            .base       the first slice
            .count      number of slices, keeping this zero-initializied means 'all remaining slices'

    .storage_buffer     a storage-buffer-view object will be created
        .buffer         the sg_buffer parent resource, must have been created
                        with `sg_buffer_desc.usage.storage_buffer = true`
        .offset         optional 256-byte aligned byte-offset into the buffer

    .storage_image      a storage-image-view object will be created
        .image          the sg_image parent resource, must have been created
                        with `sg_image_desc.usage.storage_image = true`
        .mip_level      selects the mip-level for the compute shader to write
        .slice          selects the slice for the compute shader to write

    .color_attachment   a color-attachment-view object will be created
        .image          the sg_image parent resource, must have been created
                        with `sg_image_desc.usage.color_attachment = true`
        .mip_level      selects the mip-level to render into
        .slice          selects the slice to render into

    .resolve_attachment a resolve-attachment-view object will be created
        .image          the sg_image parent resource, must have been created
                        with `sg_image_desc.usage.resolve_attachment = true`
        .mip_level      selects the mip-level to msaa-resolve into
        .slice          selects the slice to msaa-resolve into

    .depth_stencil_attachment   a depth-stencil-attachment-view object will be created
        .image          the sg_image parent resource, must have been created
                        with `sg_image_desc.usage.depth_stencil_attachment = true`
        .mip_level      selects the mip-level to render into
        .slice          selects the slice to render into
*/
typedef struct sg_buffer_view_desc {
    sg_buffer buffer;
    int offset;
} sg_buffer_view_desc;

typedef struct sg_image_view_desc {
    sg_image image;
    int mip_level;
    int slice;      // cube texture: face; array texture: layer; 3D texture: depth-slice
} sg_image_view_desc;

typedef struct sg_texture_view_range {
    int base;
    int count;
} sg_texture_view_range;

typedef struct sg_texture_view_desc {
    sg_image image;
    sg_texture_view_range mip_levels;
    sg_texture_view_range slices;   // cube texture: face; array texture: layer; 3D texture: depth-slice
} sg_texture_view_desc;

typedef struct sg_view_desc {
    uint32_t _start_canary;
    sg_texture_view_desc texture;
    sg_buffer_view_desc storage_buffer;
    sg_image_view_desc storage_image;
    sg_image_view_desc color_attachment;
    sg_image_view_desc resolve_attachment;
    sg_image_view_desc depth_stencil_attachment;
    const char* label;
    uint32_t _end_canary;
} sg_view_desc;

/*
    sg_trace_hooks

    Installable callback functions to keep track of the sokol-gfx calls,
    this is useful for debugging, or keeping track of resource creation
    and destruction.

    Trace hooks are installed with sg_install_trace_hooks(), this returns
    another sg_trace_hooks struct with the previous set of
    trace hook function pointers. These should be invoked by the
    new trace hooks to form a proper call chain.
*/
typedef struct sg_trace_hooks {
    void* user_data;
    void (*reset_state_cache)(void* user_data);
    void (*make_buffer)(const sg_buffer_desc* desc, sg_buffer result, void* user_data);
    void (*make_image)(const sg_image_desc* desc, sg_image result, void* user_data);
    void (*make_sampler)(const sg_sampler_desc* desc, sg_sampler result, void* user_data);
    void (*make_shader)(const sg_shader_desc* desc, sg_shader result, void* user_data);
    void (*make_pipeline)(const sg_pipeline_desc* desc, sg_pipeline result, void* user_data);
    void (*make_view)(const sg_view_desc* desc, sg_view result, void* user_data);
    void (*destroy_buffer)(sg_buffer buf, void* user_data);
    void (*destroy_image)(sg_image img, void* user_data);
    void (*destroy_sampler)(sg_sampler smp, void* user_data);
    void (*destroy_shader)(sg_shader shd, void* user_data);
    void (*destroy_pipeline)(sg_pipeline pip, void* user_data);
    void (*destroy_view)(sg_view view, void* user_data);
    void (*update_buffer)(sg_buffer buf, const sg_range* data, void* user_data);
    void (*update_image)(sg_image img, const sg_image_data* data, void* user_data);
    void (*append_buffer)(sg_buffer buf, const sg_range* data, int result, void* user_data);
    void (*begin_pass)(const sg_pass* pass, void* user_data);
    void (*apply_viewport)(int x, int y, int width, int height, bool origin_top_left, void* user_data);
    void (*apply_scissor_rect)(int x, int y, int width, int height, bool origin_top_left, void* user_data);
    void (*apply_pipeline)(sg_pipeline pip, void* user_data);
    void (*apply_bindings)(const sg_bindings* bindings, void* user_data);
    void (*apply_uniforms)(int ub_index, const sg_range* data, void* user_data);
    void (*draw)(int base_element, int num_elements, int num_instances, void* user_data);
    void (*draw_ex)(int base_element, int num_elements, int num_instances, int base_vertex, int base_instance, void* user_data);
    void (*dispatch)(int num_groups_x, int num_groups_y, int num_groups_z, void* user_data);
    void (*end_pass)(void* user_data);
    void (*commit)(void* user_data);
    void (*alloc_buffer)(sg_buffer result, void* user_data);
    void (*alloc_image)(sg_image result, void* user_data);
    void (*alloc_sampler)(sg_sampler result, void* user_data);
    void (*alloc_shader)(sg_shader result, void* user_data);
    void (*alloc_pipeline)(sg_pipeline result, void* user_data);
    void (*alloc_view)(sg_view result, void* user_data);
    void (*dealloc_buffer)(sg_buffer buf_id, void* user_data);
    void (*dealloc_image)(sg_image img_id, void* user_data);
    void (*dealloc_sampler)(sg_sampler smp_id, void* user_data);
    void (*dealloc_shader)(sg_shader shd_id, void* user_data);
    void (*dealloc_pipeline)(sg_pipeline pip_id, void* user_data);
    void (*dealloc_view)(sg_view view_id, void* user_data);
    void (*init_buffer)(sg_buffer buf_id, const sg_buffer_desc* desc, void* user_data);
    void (*init_image)(sg_image img_id, const sg_image_desc* desc, void* user_data);
    void (*init_sampler)(sg_sampler smp_id, const sg_sampler_desc* desc, void* user_data);
    void (*init_shader)(sg_shader shd_id, const sg_shader_desc* desc, void* user_data);
    void (*init_pipeline)(sg_pipeline pip_id, const sg_pipeline_desc* desc, void* user_data);
    void (*init_view)(sg_view view_id, const sg_view_desc* desc, void* user_data);
    void (*uninit_buffer)(sg_buffer buf_id, void* user_data);
    void (*uninit_image)(sg_image img_id, void* user_data);
    void (*uninit_sampler)(sg_sampler smp_id, void* user_data);
    void (*uninit_shader)(sg_shader shd_id, void* user_data);
    void (*uninit_pipeline)(sg_pipeline pip_id, void* user_data);
    void (*uninit_view)(sg_view view_id, void* user_data);
    void (*fail_buffer)(sg_buffer buf_id, void* user_data);
    void (*fail_image)(sg_image img_id, void* user_data);
    void (*fail_sampler)(sg_sampler smp_id, void* user_data);
    void (*fail_shader)(sg_shader shd_id, void* user_data);
    void (*fail_pipeline)(sg_pipeline pip_id, void* user_data);
    void (*fail_view)(sg_view view_id, void* user_data);
    void (*push_debug_group)(const char* name, void* user_data);
    void (*pop_debug_group)(void* user_data);
} sg_trace_hooks;

/*
    sg_buffer_info
    sg_image_info
    sg_sampler_info
    sg_shader_info
    sg_pipeline_info
    sg_view_info

    These structs contain various internal resource attributes which
    might be useful for debug-inspection. Please don't rely on the
    actual content of those structs too much, as they are quite closely
    tied to sokol_gfx.h internals and may change more frequently than
    the other public API elements.

    The *_info structs are used as the return values of the following functions:

    sg_query_buffer_info()
    sg_query_image_info()
    sg_query_sampler_info()
    sg_query_shader_info()
    sg_query_pipeline_info()
    sg_query_view_info()
*/
typedef struct sg_slot_info {
    sg_resource_state state;    // the current state of this resource slot
    uint32_t res_id;            // type-neutral resource if (e.g. sg_buffer.id)
    uint32_t uninit_count;
} sg_slot_info;

typedef struct sg_buffer_info {
    sg_slot_info slot;              // resource pool slot info
    uint32_t update_frame_index;    // frame index of last sg_update_buffer()
    uint32_t append_frame_index;    // frame index of last sg_append_buffer()
    int append_pos;                 // current position in buffer for sg_append_buffer()
    bool append_overflow;           // is buffer in overflow state (due to sg_append_buffer)
    int num_slots;                  // number of renaming-slots for dynamically updated buffers
    int active_slot;                // currently active write-slot for dynamically updated buffers
} sg_buffer_info;

typedef struct sg_image_info {
    sg_slot_info slot;              // resource pool slot info
    uint32_t upd_frame_index;       // frame index of last sg_update_image()
    int num_slots;                  // number of renaming-slots for dynamically updated images
    int active_slot;                // currently active write-slot for dynamically updated images
} sg_image_info;

typedef struct sg_sampler_info {
    sg_slot_info slot;              // resource pool slot info
} sg_sampler_info;

typedef struct sg_shader_info {
    sg_slot_info slot;              // resource pool slot info
} sg_shader_info;

typedef struct sg_pipeline_info {
    sg_slot_info slot;              // resource pool slot info
} sg_pipeline_info;

typedef struct sg_view_info {
    sg_slot_info slot;              // resource pool slot info
} sg_view_info;

/*
    sg_stats

    Allows to track generic and backend-specific rendering stats,
    obtained via sg_query_stats().
*/
typedef struct sg_frame_stats_gl {
    uint32_t num_bind_buffer;
    uint32_t num_active_texture;
    uint32_t num_bind_texture;
    uint32_t num_bind_sampler;
    uint32_t num_bind_image_texture;
    uint32_t num_use_program;
    uint32_t num_render_state;
    uint32_t num_vertex_attrib_pointer;
    uint32_t num_vertex_attrib_divisor;
    uint32_t num_enable_vertex_attrib_array;
    uint32_t num_disable_vertex_attrib_array;
    uint32_t num_uniform;
    uint32_t num_memory_barriers;
} sg_frame_stats_gl;

typedef struct sg_frame_stats_d3d11_pass {
    uint32_t num_om_set_render_targets;
    uint32_t num_clear_render_target_view;
    uint32_t num_clear_depth_stencil_view;
    uint32_t num_resolve_subresource;
} sg_frame_stats_d3d11_pass;

typedef struct sg_frame_stats_d3d11_pipeline {
    uint32_t num_rs_set_state;
    uint32_t num_om_set_depth_stencil_state;
    uint32_t num_om_set_blend_state;
    uint32_t num_ia_set_primitive_topology;
    uint32_t num_ia_set_input_layout;
    uint32_t num_vs_set_shader;
    uint32_t num_vs_set_constant_buffers;
    uint32_t num_ps_set_shader;
    uint32_t num_ps_set_constant_buffers;
    uint32_t num_cs_set_shader;
    uint32_t num_cs_set_constant_buffers;
} sg_frame_stats_d3d11_pipeline;

typedef struct sg_frame_stats_d3d11_bindings {
    uint32_t num_ia_set_vertex_buffers;
    uint32_t num_ia_set_index_buffer;
    uint32_t num_vs_set_shader_resources;
    uint32_t num_vs_set_samplers;
    uint32_t num_ps_set_shader_resources;
    uint32_t num_ps_set_samplers;
    uint32_t num_cs_set_shader_resources;
    uint32_t num_cs_set_samplers;
    uint32_t num_cs_set_unordered_access_views;
} sg_frame_stats_d3d11_bindings;

typedef struct sg_frame_stats_d3d11_uniforms {
    uint32_t num_update_subresource;
} sg_frame_stats_d3d11_uniforms;

typedef struct sg_frame_stats_d3d11_draw {
    uint32_t num_draw_indexed_instanced;
    uint32_t num_draw_indexed;
    uint32_t num_draw_instanced;
    uint32_t num_draw;
} sg_frame_stats_d3d11_draw;

typedef struct sg_frame_stats_d3d11 {
    sg_frame_stats_d3d11_pass pass;
    sg_frame_stats_d3d11_pipeline pipeline;
    sg_frame_stats_d3d11_bindings bindings;
    sg_frame_stats_d3d11_uniforms uniforms;
    sg_frame_stats_d3d11_draw draw;
    uint32_t num_map;
    uint32_t num_unmap;
} sg_frame_stats_d3d11;

typedef struct sg_frame_stats_metal_idpool {
    uint32_t num_added;
    uint32_t num_released;
    uint32_t num_garbage_collected;
} sg_frame_stats_metal_idpool;

typedef struct sg_frame_stats_metal_pipeline {
    uint32_t num_set_blend_color;
    uint32_t num_set_cull_mode;
    uint32_t num_set_front_facing_winding;
    uint32_t num_set_stencil_reference_value;
    uint32_t num_set_depth_bias;
    uint32_t num_set_render_pipeline_state;
    uint32_t num_set_depth_stencil_state;
} sg_frame_stats_metal_pipeline;

typedef struct sg_frame_stats_metal_bindings {
    uint32_t num_set_vertex_buffer;
    uint32_t num_set_vertex_buffer_offset;
    uint32_t num_skip_redundant_vertex_buffer;
    uint32_t num_set_vertex_texture;
    uint32_t num_skip_redundant_vertex_texture;
    uint32_t num_set_vertex_sampler_state;
    uint32_t num_skip_redundant_vertex_sampler_state;
    uint32_t num_set_fragment_buffer;
    uint32_t num_set_fragment_buffer_offset;
    uint32_t num_skip_redundant_fragment_buffer;
    uint32_t num_set_fragment_texture;
    uint32_t num_skip_redundant_fragment_texture;
    uint32_t num_set_fragment_sampler_state;
    uint32_t num_skip_redundant_fragment_sampler_state;
    uint32_t num_set_compute_buffer;
    uint32_t num_set_compute_buffer_offset;
    uint32_t num_skip_redundant_compute_buffer;
    uint32_t num_set_compute_texture;
    uint32_t num_skip_redundant_compute_texture;
    uint32_t num_set_compute_sampler_state;
    uint32_t num_skip_redundant_compute_sampler_state;
} sg_frame_stats_metal_bindings;

typedef struct sg_frame_stats_metal_uniforms {
    uint32_t num_set_vertex_buffer_offset;
    uint32_t num_set_fragment_buffer_offset;
    uint32_t num_set_compute_buffer_offset;
} sg_frame_stats_metal_uniforms;

typedef struct sg_frame_stats_metal {
    sg_frame_stats_metal_idpool idpool;
    sg_frame_stats_metal_pipeline pipeline;
    sg_frame_stats_metal_bindings bindings;
    sg_frame_stats_metal_uniforms uniforms;
} sg_frame_stats_metal;

typedef struct sg_frame_stats_wgpu_uniforms {
    uint32_t num_set_bindgroup;
    uint32_t size_write_buffer;
} sg_frame_stats_wgpu_uniforms;

typedef struct sg_frame_stats_wgpu_bindings {
    uint32_t num_set_vertex_buffer;
    uint32_t num_skip_redundant_vertex_buffer;
    uint32_t num_set_index_buffer;
    uint32_t num_skip_redundant_index_buffer;
    uint32_t num_create_bindgroup;
    uint32_t num_discard_bindgroup;
    uint32_t num_set_bindgroup;
    uint32_t num_skip_redundant_bindgroup;
    uint32_t num_bindgroup_cache_hits;
    uint32_t num_bindgroup_cache_misses;
    uint32_t num_bindgroup_cache_collisions;
    uint32_t num_bindgroup_cache_invalidates;
    uint32_t num_bindgroup_cache_hash_vs_key_mismatch;
} sg_frame_stats_wgpu_bindings;

typedef struct sg_frame_stats_wgpu {
    sg_frame_stats_wgpu_uniforms uniforms;
    sg_frame_stats_wgpu_bindings bindings;
} sg_frame_stats_wgpu;

typedef struct sg_frame_stats_vk {
    uint32_t num_cmd_pipeline_barrier;
    uint32_t num_allocate_memory;
    uint32_t num_free_memory;
    uint32_t size_allocate_memory;
    uint32_t num_delete_queue_added;
    uint32_t num_delete_queue_collected;
    uint32_t num_cmd_copy_buffer;
    uint32_t num_cmd_copy_buffer_to_image;
    uint32_t num_cmd_set_descriptor_buffer_offsets;
    uint32_t size_descriptor_buffer_writes;
} sg_frame_stats_vk;

typedef struct sg_frame_resource_stats {
    uint32_t allocated;     // number of allocated objects in current frame
    uint32_t deallocated;   // number of deallocated object in current frame
    uint32_t inited;        // number of initialized objects in current frame
    uint32_t uninited;      // number of deinitialized objects in current frame
} sg_frame_resource_stats;

typedef struct sg_total_resource_stats {
    uint32_t alive;     // number of live objects in pool
    uint32_t free;      // number of free objects in pool
    uint32_t allocated;     // total number of object allocations
    uint32_t deallocated;   // total number of object deallocations
    uint32_t inited;        // total number of object initializations
    uint32_t uninited;      // total number of object deinitializations
} sg_total_resource_stats;

typedef struct sg_total_stats {
    sg_total_resource_stats buffers;
    sg_total_resource_stats images;
    sg_total_resource_stats samplers;
    sg_total_resource_stats views;
    sg_total_resource_stats shaders;
    sg_total_resource_stats pipelines;
} sg_total_stats;

typedef struct sg_frame_stats {
    uint32_t frame_index;   // current frame counter, starts at 0

    uint32_t num_passes;
    uint32_t num_apply_viewport;
    uint32_t num_apply_scissor_rect;
    uint32_t num_apply_pipeline;
    uint32_t num_apply_bindings;
    uint32_t num_apply_uniforms;
    uint32_t num_draw;
    uint32_t num_draw_ex;
    uint32_t num_dispatch;
    uint32_t num_update_buffer;
    uint32_t num_append_buffer;
    uint32_t num_update_image;

    uint32_t size_apply_uniforms;
    uint32_t size_update_buffer;
    uint32_t size_append_buffer;
    uint32_t size_update_image;

    sg_frame_resource_stats buffers;
    sg_frame_resource_stats images;
    sg_frame_resource_stats samplers;
    sg_frame_resource_stats views;
    sg_frame_resource_stats shaders;
    sg_frame_resource_stats pipelines;

    sg_frame_stats_gl gl;
    sg_frame_stats_d3d11 d3d11;
    sg_frame_stats_metal metal;
    sg_frame_stats_wgpu wgpu;
    sg_frame_stats_vk vk;
} sg_frame_stats;

typedef struct sg_stats {
    sg_frame_stats prev_frame;
    sg_frame_stats cur_frame;
    sg_total_stats total;
} sg_stats;

/*
    sg_log_item

    An enum with a unique item for each log message, warning, error
    and validation layer message. Note that these messages are only
    visible when a logger function is installed in the sg_setup() call.
*/
typedef struct sg_environment_defaults {
    sg_pixel_format color_format;
    sg_pixel_format depth_format;
    int sample_count;
} sg_environment_defaults;

typedef struct sg_metal_environment {
    const void* device;
} sg_metal_environment;

typedef struct sg_d3d11_environment {
    const void* device;
    const void* device_context;
} sg_d3d11_environment;

typedef struct sg_wgpu_environment {
    const void* device;
} sg_wgpu_environment;

typedef struct sg_vulkan_environment {
    const void* instance;
    const void* physical_device;
    const void* device;
    const void* queue;
    uint32_t queue_family_index;
} sg_vulkan_environment;

typedef struct sg_environment {
    sg_environment_defaults defaults;
    sg_metal_environment metal;
    sg_d3d11_environment d3d11;
    sg_wgpu_environment wgpu;
    sg_vulkan_environment vulkan;
} sg_environment;

/*
    sg_commit_listener

    Used with function sg_add_commit_listener() to add a callback
    which will be called in sg_commit(). This is useful for libraries
    building on top of sokol-gfx to be notified about when a frame
    ends (instead of having to guess, or add a manual 'new-frame'
    function.
*/
typedef struct sg_commit_listener {
    void (*func)(void* user_data);
    void* user_data;
} sg_commit_listener;

/*
    sg_allocator

    Used in sg_desc to provide custom memory-alloc and -free functions
    to sokol_gfx.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct sg_allocator {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sg_allocator;

/*
    sg_logger

    Used in sg_desc to provide a logging function. Please be aware
    that without logging function, sokol-gfx will be completely
    silent, e.g. it will not report errors, warnings and
    validation layer messages. For maximum error verbosity,
    compile in debug mode (e.g. NDEBUG *not* defined) and provide a
    compatible logger function in the sg_setup() call
    (for instance the standard logging function from sokol_log.h).
*/
typedef struct sg_logger {
    void (*func)(
        const char* tag,                // always "sg"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SG_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_gfx.h
        const char* filename_or_null,   // source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} sg_logger;

typedef struct sg_d3d11_desc {
    bool shader_debugging;  // if true, HLSL shaders are compiled with D3DCOMPILE_DEBUG | D3DCOMPILE_SKIP_OPTIMIZATION
} sg_d3d11_desc;

typedef struct sg_metal_desc {
    bool force_managed_storage_mode; // for debugging: use Metal managed storage mode for resources even with UMA
    bool use_command_buffer_with_retained_references;    // Metal: use a managed MTLCommandBuffer which ref-counts used resources
} sg_metal_desc;

typedef struct sg_wgpu_desc {
    bool disable_bindgroups_cache; // set to true to disable the WebGPU backend BindGroup cache
    int bindgroups_cache_size;     // number of slots in the WebGPU bindgroup cache (must be 2^N)
} sg_wgpu_desc;

typedef struct sg_vulkan_desc {
    int copy_staging_buffer_size;    // size of staging buffer for immutable and dynamic resources (default: 4 MB)
    int stream_staging_buffer_size;  // size of per-frame staging buffer for updating streaming resources (default: 16 MB)
    int descriptor_buffer_size;      // size of per-frame descriptor buffer for updating resource bindings (default: 16 MB)
} sg_vulkan_desc;

typedef struct sg_desc {
    uint32_t _start_canary;
    int buffer_pool_size;
    int image_pool_size;
    int sampler_pool_size;
    int shader_pool_size;
    int pipeline_pool_size;
    int view_pool_size;
    int uniform_buffer_size;        // max size of all sg_apply_uniform() calls per frame, with worst-case 256 byte alignment
    int max_commit_listeners;       // max number of commit listener hook functions
    bool disable_validation;        // disable validation layer even in debug mode, useful for tests
    bool enforce_portable_limits;   // if true, enforce portable resource binding limits (SG_MAX_PORTABLE_*)
    sg_d3d11_desc d3d11;            // d3d11-specific setup parameters
    sg_metal_desc metal;            // metal-specific setup parameters
    sg_wgpu_desc wgpu;              // webgpu-specific setup parameters
    sg_vulkan_desc vulkan;          // vulkan-specific setup parameters
    sg_allocator allocator;         // optional memory allocation hooks
    sg_logger logger;               // optional log function override
    sg_environment environment;     // required externally provided runtime objects and defaults
    uint32_t _end_canary;
} sg_desc;

// setup and misc functions
extern void sg_setup(const sg_desc* desc);
extern void sg_shutdown(void);
extern bool sg_isvalid(void);
extern void sg_reset_state_cache(void);
extern sg_trace_hooks sg_install_trace_hooks(const sg_trace_hooks* trace_hooks);
extern void sg_push_debug_group(const char* name);
extern void sg_pop_debug_group(void);
extern bool sg_add_commit_listener(sg_commit_listener listener);
extern bool sg_remove_commit_listener(sg_commit_listener listener);

// resource creation, destruction and updating
extern sg_buffer sg_make_buffer(const sg_buffer_desc* desc);
extern sg_image sg_make_image(const sg_image_desc* desc);
extern sg_sampler sg_make_sampler(const sg_sampler_desc* desc);
extern sg_shader sg_make_shader(const sg_shader_desc* desc);
extern sg_pipeline sg_make_pipeline(const sg_pipeline_desc* desc);
extern sg_view sg_make_view(const sg_view_desc* desc);
extern void sg_destroy_buffer(sg_buffer buf);
extern void sg_destroy_image(sg_image img);
extern void sg_destroy_sampler(sg_sampler smp);
extern void sg_destroy_shader(sg_shader shd);
extern void sg_destroy_pipeline(sg_pipeline pip);
extern void sg_destroy_view(sg_view view);
extern void sg_update_buffer(sg_buffer buf, const sg_range* data);
extern void sg_update_image(sg_image img, const sg_image_data* data);
extern int sg_append_buffer(sg_buffer buf, const sg_range* data);
extern bool sg_query_buffer_overflow(sg_buffer buf);
extern bool sg_query_buffer_will_overflow(sg_buffer buf, size_t size);

// render and compute functions
extern void sg_begin_pass(const sg_pass* pass);
extern void sg_apply_viewport(int x, int y, int width, int height, bool origin_top_left);
extern void sg_apply_viewportf(float x, float y, float width, float height, bool origin_top_left);
extern void sg_apply_scissor_rect(int x, int y, int width, int height, bool origin_top_left);
extern void sg_apply_scissor_rectf(float x, float y, float width, float height, bool origin_top_left);
extern void sg_apply_pipeline(sg_pipeline pip);
extern void sg_apply_bindings(const sg_bindings* bindings);
extern void sg_apply_uniforms(int ub_slot, const sg_range* data);
extern void sg_draw(int base_element, int num_elements, int num_instances);
extern void sg_draw_ex(int base_element, int num_elements, int num_instances, int base_vertex, int base_instance);
extern void sg_dispatch(int num_groups_x, int num_groups_y, int num_groups_z);
extern void sg_end_pass(void);
extern void sg_commit(void);

// getting information
extern sg_desc sg_query_desc(void);
extern sg_backend sg_query_backend(void);
extern sg_features sg_query_features(void);
extern sg_limits sg_query_limits(void);
extern sg_pixelformat_info sg_query_pixelformat(sg_pixel_format fmt);
extern int sg_query_row_pitch(sg_pixel_format fmt, int width, int row_align_bytes);
extern int sg_query_surface_pitch(sg_pixel_format fmt, int width, int height, int row_align_bytes);
// get current state of a resource (INITIAL, ALLOC, VALID, FAILED, INVALID)
extern sg_resource_state sg_query_buffer_state(sg_buffer buf);
extern sg_resource_state sg_query_image_state(sg_image img);
extern sg_resource_state sg_query_sampler_state(sg_sampler smp);
extern sg_resource_state sg_query_shader_state(sg_shader shd);
extern sg_resource_state sg_query_pipeline_state(sg_pipeline pip);
extern sg_resource_state sg_query_view_state(sg_view view);
// get runtime information about a resource
extern sg_buffer_info sg_query_buffer_info(sg_buffer buf);
extern sg_image_info sg_query_image_info(sg_image img);
extern sg_sampler_info sg_query_sampler_info(sg_sampler smp);
extern sg_shader_info sg_query_shader_info(sg_shader shd);
extern sg_pipeline_info sg_query_pipeline_info(sg_pipeline pip);
extern sg_view_info sg_query_view_info(sg_view view);
// get desc structs matching a specific resource (NOTE that not all creation attributes may be provided)
extern sg_buffer_desc sg_query_buffer_desc(sg_buffer buf);
extern sg_image_desc sg_query_image_desc(sg_image img);
extern sg_sampler_desc sg_query_sampler_desc(sg_sampler smp);
extern sg_shader_desc sg_query_shader_desc(sg_shader shd);
extern sg_pipeline_desc sg_query_pipeline_desc(sg_pipeline pip);
extern sg_view_desc sg_query_view_desc(sg_view view);
// get resource creation desc struct with their default values replaced
extern sg_buffer_desc sg_query_buffer_defaults(const sg_buffer_desc* desc);
extern sg_image_desc sg_query_image_defaults(const sg_image_desc* desc);
extern sg_sampler_desc sg_query_sampler_defaults(const sg_sampler_desc* desc);
extern sg_shader_desc sg_query_shader_defaults(const sg_shader_desc* desc);
extern sg_pipeline_desc sg_query_pipeline_defaults(const sg_pipeline_desc* desc);
extern sg_view_desc sg_query_view_defaults(const sg_view_desc* desc);
// assorted query functions
extern size_t sg_query_buffer_size(sg_buffer buf);
extern sg_buffer_usage sg_query_buffer_usage(sg_buffer buf);
extern sg_image_type sg_query_image_type(sg_image img);
extern int sg_query_image_width(sg_image img);
extern int sg_query_image_height(sg_image img);
extern int sg_query_image_num_slices(sg_image img);
extern int sg_query_image_num_mipmaps(sg_image img);
extern sg_pixel_format sg_query_image_pixelformat(sg_image img);
extern sg_image_usage sg_query_image_usage(sg_image img);
extern int sg_query_image_sample_count(sg_image img);
extern sg_view_type sg_query_view_type(sg_view view);
extern sg_image sg_query_view_image(sg_view view);
extern sg_buffer sg_query_view_buffer(sg_view view);

// separate resource allocation and initialization (for async setup)
extern sg_buffer sg_alloc_buffer(void);
extern sg_image sg_alloc_image(void);
extern sg_sampler sg_alloc_sampler(void);
extern sg_shader sg_alloc_shader(void);
extern sg_pipeline sg_alloc_pipeline(void);
extern sg_view sg_alloc_view(void);
extern void sg_dealloc_buffer(sg_buffer buf);
extern void sg_dealloc_image(sg_image img);
extern void sg_dealloc_sampler(sg_sampler smp);
extern void sg_dealloc_shader(sg_shader shd);
extern void sg_dealloc_pipeline(sg_pipeline pip);
extern void sg_dealloc_view(sg_view view);
extern void sg_init_buffer(sg_buffer buf, const sg_buffer_desc* desc);
extern void sg_init_image(sg_image img, const sg_image_desc* desc);
extern void sg_init_sampler(sg_sampler smg, const sg_sampler_desc* desc);
extern void sg_init_shader(sg_shader shd, const sg_shader_desc* desc);
extern void sg_init_pipeline(sg_pipeline pip, const sg_pipeline_desc* desc);
extern void sg_init_view(sg_view view, const sg_view_desc* desc);
extern void sg_uninit_buffer(sg_buffer buf);
extern void sg_uninit_image(sg_image img);
extern void sg_uninit_sampler(sg_sampler smp);
extern void sg_uninit_shader(sg_shader shd);
extern void sg_uninit_pipeline(sg_pipeline pip);
extern void sg_uninit_view(sg_view view);
extern void sg_fail_buffer(sg_buffer buf);
extern void sg_fail_image(sg_image img);
extern void sg_fail_sampler(sg_sampler smp);
extern void sg_fail_shader(sg_shader shd);
extern void sg_fail_pipeline(sg_pipeline pip);
extern void sg_fail_view(sg_view view);

// frame and total stats
extern void sg_enable_stats(void);
extern void sg_disable_stats(void);
extern bool sg_stats_enabled(void);
extern sg_stats sg_query_stats(void);

/* Backend-specific structs and functions, these may come in handy for mixing
   sokol-gfx rendering with 'native backend' rendering functions.

   This group of functions will be expanded as needed.
*/

typedef struct sg_d3d11_buffer_info {
    const void* buf;      // ID3D11Buffer*
} sg_d3d11_buffer_info;

typedef struct sg_d3d11_image_info {
    const void* tex2d;    // ID3D11Texture2D*
    const void* tex3d;    // ID3D11Texture3D*
    const void* res;      // ID3D11Resource* (either tex2d or tex3d)
} sg_d3d11_image_info;

typedef struct sg_d3d11_sampler_info {
    const void* smp;      // ID3D11SamplerState*
} sg_d3d11_sampler_info;

typedef struct sg_d3d11_shader_info {
    const void* cbufs[SG_MAX_UNIFORMBLOCK_BINDSLOTS]; // ID3D11Buffer* (constant buffers by bind slot)
    const void* vs;   // ID3D11VertexShader*
    const void* fs;   // ID3D11PixelShader*
} sg_d3d11_shader_info;

typedef struct sg_d3d11_pipeline_info {
    const void* il;   // ID3D11InputLayout*
    const void* rs;   // ID3D11RasterizerState*
    const void* dss;  // ID3D11DepthStencilState*
    const void* bs;   // ID3D11BlendState*
} sg_d3d11_pipeline_info;

typedef struct sg_d3d11_view_info {
    const void* srv;    // ID3D11ShaderResourceView
    const void* uav;    // ID3D11UnorderedAccessView
    const void* rtv;    // ID3D11RenderTargetView
    const void* dsv;    // ID3D11DepthStencilView
} sg_d3d11_view_info;

typedef struct sg_mtl_buffer_info {
    const void* buf[SG_NUM_INFLIGHT_FRAMES];  // id<MTLBuffer>
    int active_slot;
} sg_mtl_buffer_info;

typedef struct sg_mtl_image_info {
    const void* tex[SG_NUM_INFLIGHT_FRAMES]; // id<MTLTexture>
    int active_slot;
} sg_mtl_image_info;

typedef struct sg_mtl_sampler_info {
    const void* smp;  // id<MTLSamplerState>
} sg_mtl_sampler_info;

typedef struct sg_mtl_shader_info {
    const void* vertex_lib;     // id<MTLLibrary>
    const void* fragment_lib;   // id<MTLLibrary>
    const void* vertex_func;    // id<MTLFunction>
    const void* fragment_func;  // id<MTLFunction>
} sg_mtl_shader_info;

typedef struct sg_mtl_pipeline_info {
    const void* rps;      // id<MTLRenderPipelineState>
    const void* dss;      // id<MTLDepthStencilState>
} sg_mtl_pipeline_info;

typedef struct sg_wgpu_buffer_info {
    const void* buf;  // WGPUBuffer
} sg_wgpu_buffer_info;

typedef struct sg_wgpu_image_info {
    const void* tex;  // WGPUTexture
} sg_wgpu_image_info;

typedef struct sg_wgpu_sampler_info {
    const void* smp;  // WGPUSampler
} sg_wgpu_sampler_info;

typedef struct sg_wgpu_shader_info {
    const void* vs_mod;   // WGPUShaderModule
    const void* fs_mod;   // WGPUShaderModule
    const void* bgl;      // WGPUBindGroupLayout;
} sg_wgpu_shader_info;

typedef struct sg_wgpu_pipeline_info {
    const void* render_pipeline;   // WGPURenderPipeline
    const void* compute_pipeline;  // WGPUComputePipeline
} sg_wgpu_pipeline_info;

typedef struct sg_wgpu_view_info {
    const void* view; // WGPUTextureView
} sg_wgpu_view_info;

typedef struct sg_gl_buffer_info {
    uint32_t buf[SG_NUM_INFLIGHT_FRAMES];
    int active_slot;
} sg_gl_buffer_info;

typedef struct sg_gl_image_info {
    uint32_t tex[SG_NUM_INFLIGHT_FRAMES];
    uint32_t tex_target;
    int active_slot;
} sg_gl_image_info;

typedef struct sg_gl_sampler_info {
    uint32_t smp;
} sg_gl_sampler_info;

typedef struct sg_gl_shader_info {
    uint32_t prog;
} sg_gl_shader_info;

typedef struct sg_gl_view_info {
    uint32_t tex_view[SG_NUM_INFLIGHT_FRAMES];
    uint32_t msaa_render_buffer;
    uint32_t msaa_resolve_frame_buffer;
} sg_gl_view_info;

// D3D11: return ID3D11Device
extern const void* sg_d3d11_device(void);
// D3D11: return ID3D11DeviceContext
extern const void* sg_d3d11_device_context(void);
// D3D11: get internal buffer resource objects
extern sg_d3d11_buffer_info sg_d3d11_query_buffer_info(sg_buffer buf);
// D3D11: get internal image resource objects
extern sg_d3d11_image_info sg_d3d11_query_image_info(sg_image img);
// D3D11: get internal sampler resource objects
extern sg_d3d11_sampler_info sg_d3d11_query_sampler_info(sg_sampler smp);
// D3D11: get internal shader resource objects
extern sg_d3d11_shader_info sg_d3d11_query_shader_info(sg_shader shd);
// D3D11: get internal pipeline resource objects
extern sg_d3d11_pipeline_info sg_d3d11_query_pipeline_info(sg_pipeline pip);
// D3D11: get internal view resource objects
extern sg_d3d11_view_info sg_d3d11_query_view_info(sg_view view);

// Metal: return __bridge-casted MTLDevice
extern const void* sg_mtl_device(void);
// Metal: return __bridge-casted MTLRenderCommandEncoder when inside render pass (otherwise zero)
extern const void* sg_mtl_render_command_encoder(void);
// Metal: return __bridge-casted MTLComputeCommandEncoder when inside compute pass (otherwise zero)
extern const void* sg_mtl_compute_command_encoder(void);
// Metal: return __bridge-casted MTLCommandQueue
extern const void* sg_mtl_command_queue(void);
// Metal: get internal __bridge-casted buffer resource objects
extern sg_mtl_buffer_info sg_mtl_query_buffer_info(sg_buffer buf);
// Metal: get internal __bridge-casted image resource objects
extern sg_mtl_image_info sg_mtl_query_image_info(sg_image img);
// Metal: get internal __bridge-casted sampler resource objects
extern sg_mtl_sampler_info sg_mtl_query_sampler_info(sg_sampler smp);
// Metal: get internal __bridge-casted shader resource objects
extern sg_mtl_shader_info sg_mtl_query_shader_info(sg_shader shd);
// Metal: get internal __bridge-casted pipeline resource objects
extern sg_mtl_pipeline_info sg_mtl_query_pipeline_info(sg_pipeline pip);

// WebGPU: return WGPUDevice object
extern const void* sg_wgpu_device(void);
// WebGPU: return WGPUQueue object
extern const void* sg_wgpu_queue(void);
// WebGPU: return this frame's WGPUCommandEncoder
extern const void* sg_wgpu_command_encoder(void);
// WebGPU: return WGPURenderPassEncoder of current pass (returns 0 when outside pass or in a compute pass)
extern const void* sg_wgpu_render_pass_encoder(void);
// WebGPU: return WGPUComputePassEncoder of current pass (returns 0 when outside pass or in a render pass)
extern const void* sg_wgpu_compute_pass_encoder(void);
// WebGPU: get internal buffer resource objects
extern sg_wgpu_buffer_info sg_wgpu_query_buffer_info(sg_buffer buf);
// WebGPU: get internal image resource objects
extern sg_wgpu_image_info sg_wgpu_query_image_info(sg_image img);
// WebGPU: get internal sampler resource objects
extern sg_wgpu_sampler_info sg_wgpu_query_sampler_info(sg_sampler smp);
// WebGPU: get internal shader resource objects
extern sg_wgpu_shader_info sg_wgpu_query_shader_info(sg_shader shd);
// WebGPU: get internal pipeline resource objects
extern sg_wgpu_pipeline_info sg_wgpu_query_pipeline_info(sg_pipeline pip);
// WebGPU: get internal view resource objects
extern sg_wgpu_view_info sg_wgpu_query_view_info(sg_view view);

// GL: get internal buffer resource objects
extern sg_gl_buffer_info sg_gl_query_buffer_info(sg_buffer buf);
// GL: get internal image resource objects
extern sg_gl_image_info sg_gl_query_image_info(sg_image img);
// GL: get internal sampler resource objects
extern sg_gl_sampler_info sg_gl_query_sampler_info(sg_sampler smp);
// GL: get internal shader resource objects
extern sg_gl_shader_info sg_gl_query_shader_info(sg_shader shd);
// GL: get internal view resource objects
extern sg_gl_view_info sg_gl_query_view_info(sg_view view);

#ifdef __cplusplus
} // extern "C"

// reference-based equivalents for c++
inline void sg_setup(const sg_desc& desc) { return sg_setup(&desc); }

inline sg_buffer sg_make_buffer(const sg_buffer_desc& desc) { return sg_make_buffer(&desc); }
inline sg_image sg_make_image(const sg_image_desc& desc) { return sg_make_image(&desc); }
inline sg_sampler sg_make_sampler(const sg_sampler_desc& desc) { return sg_make_sampler(&desc); }
inline sg_shader sg_make_shader(const sg_shader_desc& desc) { return sg_make_shader(&desc); }
inline sg_pipeline sg_make_pipeline(const sg_pipeline_desc& desc) { return sg_make_pipeline(&desc); }
inline sg_view sg_make_view(const sg_view_desc& desc) { return sg_make_view(&desc); }
inline void sg_update_image(sg_image img, const sg_image_data& data) { return sg_update_image(img, &data); }

inline void sg_begin_pass(const sg_pass& pass) { return sg_begin_pass(&pass); }
inline void sg_apply_bindings(const sg_bindings& bindings) { return sg_apply_bindings(&bindings); }
inline void sg_apply_uniforms(int ub_slot, const sg_range& data) { return sg_apply_uniforms(ub_slot, &data); }

inline sg_buffer_desc sg_query_buffer_defaults(const sg_buffer_desc& desc) { return sg_query_buffer_defaults(&desc); }
inline sg_image_desc sg_query_image_defaults(const sg_image_desc& desc) { return sg_query_image_defaults(&desc); }
inline sg_sampler_desc sg_query_sampler_defaults(const sg_sampler_desc& desc) { return sg_query_sampler_defaults(&desc); }
inline sg_shader_desc sg_query_shader_defaults(const sg_shader_desc& desc) { return sg_query_shader_defaults(&desc); }
inline sg_pipeline_desc sg_query_pipeline_defaults(const sg_pipeline_desc& desc) { return sg_query_pipeline_defaults(&desc); }
inline sg_view_desc sg_query_view_defaults(const sg_view_desc& desc) { return sg_query_view_defaults(&desc); }

inline void sg_init_buffer(sg_buffer buf, const sg_buffer_desc& desc) { return sg_init_buffer(buf, &desc); }
inline void sg_init_image(sg_image img, const sg_image_desc& desc) { return sg_init_image(img, &desc); }
inline void sg_init_sampler(sg_sampler smp, const sg_sampler_desc& desc) { return sg_init_sampler(smp, &desc); }
inline void sg_init_shader(sg_shader shd, const sg_shader_desc& desc) { return sg_init_shader(shd, &desc); }
inline void sg_init_pipeline(sg_pipeline pip, const sg_pipeline_desc& desc) { return sg_init_pipeline(pip, &desc); }
inline void sg_init_view(sg_view view, const sg_view_desc& desc) { return sg_init_view(view, &desc); }

inline void sg_update_buffer(sg_buffer buf_id, const sg_range& data) { return sg_update_buffer(buf_id, &data); }
inline int sg_append_buffer(sg_buffer buf_id, const sg_range& data) { return sg_append_buffer(buf_id, &data); }

