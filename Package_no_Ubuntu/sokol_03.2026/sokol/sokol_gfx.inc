{$IFDEF read_interface}


type
  Tsg_buffer = record
    id: Tuint32_t;
  end;
  Psg_buffer = ^Tsg_buffer;

  Tsg_image = record
    id: Tuint32_t;
  end;
  Psg_image = ^Tsg_image;

  Tsg_sampler = record
    id: Tuint32_t;
  end;
  Psg_sampler = ^Tsg_sampler;

  Tsg_shader = record
    id: Tuint32_t;
  end;
  Psg_shader = ^Tsg_shader;

  Tsg_pipeline = record
    id: Tuint32_t;
  end;
  Psg_pipeline = ^Tsg_pipeline;

  Tsg_view = record
    id: Tuint32_t;
  end;
  Psg_view = ^Tsg_view;

  Tsg_range = record
    ptr: pointer;
    size: Tsize_t;
  end;
  Psg_range = ^Tsg_range;

const
  SG_INVALID_ID = 0;
  SG_NUM_INFLIGHT_FRAMES = 2;
  SG_MAX_COLOR_ATTACHMENTS = 8;
  SG_MAX_UNIFORMBLOCK_MEMBERS = 16;
  SG_MAX_VERTEX_ATTRIBUTES = 16;
  SG_MAX_MIPMAPS = 16;
  SG_MAX_VERTEXBUFFER_BINDSLOTS = 8;
  SG_MAX_UNIFORMBLOCK_BINDSLOTS = 8;
  SG_MAX_VIEW_BINDSLOTS = 32;
  SG_MAX_SAMPLER_BINDSLOTS = 12;
  SG_MAX_TEXTURE_SAMPLER_PAIRS = 32;
  SG_MAX_PORTABLE_COLOR_ATTACHMENTS = 4;
  SG_MAX_PORTABLE_TEXTURE_BINDINGS_PER_STAGE = 16;
  SG_MAX_PORTABLE_STORAGEBUFFER_BINDINGS_PER_STAGE = 8;
  SG_MAX_PORTABLE_STORAGEIMAGE_BINDINGS_PER_STAGE = 4;

type
  Tsg_color = record
    r: single;
    g: single;
    b: single;
    a: single;
  end;
  Psg_color = ^Tsg_color;

type
  Psg_backend = ^Tsg_backend;
  Tsg_backend = longint;

const
  SG_BACKEND_GLCORE = 0;
  SG_BACKEND_GLES3 = 1;
  SG_BACKEND_D3D11 = 2;
  SG_BACKEND_METAL_IOS = 3;
  SG_BACKEND_METAL_MACOS = 4;
  SG_BACKEND_METAL_SIMULATOR = 5;
  SG_BACKEND_WGPU = 6;
  SG_BACKEND_VULKAN = 7;
  SG_BACKEND_DUMMY = 8;

type
  Psg_pixel_format = ^Tsg_pixel_format;
  Tsg_pixel_format = longint;

const
  _SG_PIXELFORMAT_DEFAULT = 0;
  SG_PIXELFORMAT_NONE = 1;
  SG_PIXELFORMAT_R8 = 2;
  SG_PIXELFORMAT_R8SN = 3;
  SG_PIXELFORMAT_R8UI = 4;
  SG_PIXELFORMAT_R8SI = 5;
  SG_PIXELFORMAT_R16 = 6;
  SG_PIXELFORMAT_R16SN = 7;
  SG_PIXELFORMAT_R16UI = 8;
  SG_PIXELFORMAT_R16SI = 9;
  SG_PIXELFORMAT_R16F = 10;
  SG_PIXELFORMAT_RG8 = 11;
  SG_PIXELFORMAT_RG8SN = 12;
  SG_PIXELFORMAT_RG8UI = 13;
  SG_PIXELFORMAT_RG8SI = 14;
  SG_PIXELFORMAT_R32UI = 15;
  SG_PIXELFORMAT_R32SI = 16;
  SG_PIXELFORMAT_R32F = 17;
  SG_PIXELFORMAT_RG16 = 18;
  SG_PIXELFORMAT_RG16SN = 19;
  SG_PIXELFORMAT_RG16UI = 20;
  SG_PIXELFORMAT_RG16SI = 21;
  SG_PIXELFORMAT_RG16F = 22;
  SG_PIXELFORMAT_RGBA8 = 23;
  SG_PIXELFORMAT_SRGB8A8 = 24;
  SG_PIXELFORMAT_RGBA8SN = 25;
  SG_PIXELFORMAT_RGBA8UI = 26;
  SG_PIXELFORMAT_RGBA8SI = 27;
  SG_PIXELFORMAT_BGRA8 = 28;
  SG_PIXELFORMAT_RGB10A2 = 29;
  SG_PIXELFORMAT_RG11B10F = 30;
  SG_PIXELFORMAT_RGB9E5 = 31;
  SG_PIXELFORMAT_RG32UI = 32;
  SG_PIXELFORMAT_RG32SI = 33;
  SG_PIXELFORMAT_RG32F = 34;
  SG_PIXELFORMAT_RGBA16 = 35;
  SG_PIXELFORMAT_RGBA16SN = 36;
  SG_PIXELFORMAT_RGBA16UI = 37;
  SG_PIXELFORMAT_RGBA16SI = 38;
  SG_PIXELFORMAT_RGBA16F = 39;
  SG_PIXELFORMAT_RGBA32UI = 40;
  SG_PIXELFORMAT_RGBA32SI = 41;
  SG_PIXELFORMAT_RGBA32F = 42;
  SG_PIXELFORMAT_DEPTH = 43;
  SG_PIXELFORMAT_DEPTH_STENCIL = 44;
  SG_PIXELFORMAT_BC1_RGBA = 45;
  SG_PIXELFORMAT_BC2_RGBA = 46;
  SG_PIXELFORMAT_BC3_RGBA = 47;
  SG_PIXELFORMAT_BC3_SRGBA = 48;
  SG_PIXELFORMAT_BC4_R = 49;
  SG_PIXELFORMAT_BC4_RSN = 50;
  SG_PIXELFORMAT_BC5_RG = 51;
  SG_PIXELFORMAT_BC5_RGSN = 52;
  SG_PIXELFORMAT_BC6H_RGBF = 53;
  SG_PIXELFORMAT_BC6H_RGBUF = 54;
  SG_PIXELFORMAT_BC7_RGBA = 55;
  SG_PIXELFORMAT_BC7_SRGBA = 56;
  SG_PIXELFORMAT_ETC2_RGB8 = 57;
  SG_PIXELFORMAT_ETC2_SRGB8 = 58;
  SG_PIXELFORMAT_ETC2_RGB8A1 = 59;
  SG_PIXELFORMAT_ETC2_RGBA8 = 60;
  SG_PIXELFORMAT_ETC2_SRGB8A8 = 61;
  SG_PIXELFORMAT_EAC_R11 = 62;
  SG_PIXELFORMAT_EAC_R11SN = 63;
  SG_PIXELFORMAT_EAC_RG11 = 64;
  SG_PIXELFORMAT_EAC_RG11SN = 65;
  SG_PIXELFORMAT_ASTC_4x4_RGBA = 66;
  SG_PIXELFORMAT_ASTC_4x4_SRGBA = 67;
  _SG_PIXELFORMAT_NUM = 68;
  _SG_PIXELFORMAT_FORCE_U32 = $7FFFFFFF;

type
  Tsg_pixelformat_info = record
    sample: boolean;
    filter: boolean;
    render: boolean;
    blend: boolean;
    msaa: boolean;
    depth: boolean;
    compressed: boolean;
    read: boolean;
    write: boolean;
    bytes_per_pixel: longint;
  end;
  Psg_pixelformat_info = ^Tsg_pixelformat_info;

  Tsg_features = record
    origin_top_left: boolean;
    image_clamp_to_border: boolean;
    mrt_independent_blend_state: boolean;
    mrt_independent_write_mask: boolean;
    compute: boolean;
    msaa_texture_bindings: boolean;
    separate_buffer_types: boolean;
    draw_base_vertex: boolean;
    draw_base_instance: boolean;
    dual_source_blending: boolean;
    gl_texture_views: boolean;
  end;
  Psg_features = ^Tsg_features;

  Tsg_limits = record
    max_image_size_2d: longint;
    max_image_size_cube: longint;
    max_image_size_3d: longint;
    max_image_size_array: longint;
    max_image_array_layers: longint;
    max_vertex_attrs: longint;
    max_color_attachments: longint;
    max_texture_bindings_per_stage: longint;
    max_storage_buffer_bindings_per_stage: longint;
    max_storage_image_bindings_per_stage: longint;
    gl_max_vertex_uniform_components: longint;
    gl_max_combined_texture_image_units: longint;
    d3d11_max_unordered_access_views: longint;
    vk_min_uniform_buffer_offset_alignment: longint;
  end;
  Psg_limits = ^Tsg_limits;

type
  Psg_resource_state = ^Tsg_resource_state;
  Tsg_resource_state = longint;

const
  SG_RESOURCESTATE_INITIAL = 0;
  SG_RESOURCESTATE_ALLOC = 1;
  SG_RESOURCESTATE_VALID = 2;
  SG_RESOURCESTATE_FAILED = 3;
  SG_RESOURCESTATE_INVALID = 4;
  _SG_RESOURCESTATE_FORCE_U32 = $7FFFFFFF;

type
  Psg_index_type = ^Tsg_index_type;
  Tsg_index_type = longint;

const
  _SG_INDEXTYPE_DEFAULT = 0;
  SG_INDEXTYPE_NONE = 1;
  SG_INDEXTYPE_UINT16 = 2;
  SG_INDEXTYPE_UINT32 = 3;
  _SG_INDEXTYPE_NUM = 4;
  _SG_INDEXTYPE_FORCE_U32 = $7FFFFFFF;

type
  Psg_image_type = ^Tsg_image_type;
  Tsg_image_type = longint;

const
  _SG_IMAGETYPE_DEFAULT = 0;
  SG_IMAGETYPE_2D = 1;
  SG_IMAGETYPE_CUBE = 2;
  SG_IMAGETYPE_3D = 3;
  SG_IMAGETYPE_ARRAY = 4;
  _SG_IMAGETYPE_NUM = 5;
  _SG_IMAGETYPE_FORCE_U32 = $7FFFFFFF;

type
  Psg_image_sample_type = ^Tsg_image_sample_type;
  Tsg_image_sample_type = longint;

const
  _SG_IMAGESAMPLETYPE_DEFAULT = 0;
  SG_IMAGESAMPLETYPE_FLOAT = 1;
  SG_IMAGESAMPLETYPE_DEPTH = 2;
  SG_IMAGESAMPLETYPE_SINT = 3;
  SG_IMAGESAMPLETYPE_UINT = 4;
  SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT = 5;
  _SG_IMAGESAMPLETYPE_NUM = 6;
  _SG_IMAGESAMPLETYPE_FORCE_U32 = $7FFFFFFF;

type
  Psg_sampler_type = ^Tsg_sampler_type;
  Tsg_sampler_type = longint;

const
  _SG_SAMPLERTYPE_DEFAULT = 0;
  SG_SAMPLERTYPE_FILTERING = 1;
  SG_SAMPLERTYPE_NONFILTERING = 2;
  SG_SAMPLERTYPE_COMPARISON = 3;
  _SG_SAMPLERTYPE_NUM = 4;
  _SG_SAMPLERTYPE_FORCE_U32 = 5;

type
  Psg_primitive_type = ^Tsg_primitive_type;
  Tsg_primitive_type = longint;

const
  _SG_PRIMITIVETYPE_DEFAULT = 0;
  SG_PRIMITIVETYPE_POINTS = 1;
  SG_PRIMITIVETYPE_LINES = 2;
  SG_PRIMITIVETYPE_LINE_STRIP = 3;
  SG_PRIMITIVETYPE_TRIANGLES = 4;
  SG_PRIMITIVETYPE_TRIANGLE_STRIP = 5;
  _SG_PRIMITIVETYPE_NUM = 6;
  _SG_PRIMITIVETYPE_FORCE_U32 = $7FFFFFFF;

type
  Psg_filter = ^Tsg_filter;
  Tsg_filter = longint;

const
  _SG_FILTER_DEFAULT = 0;
  SG_FILTER_NEAREST = 1;
  SG_FILTER_LINEAR = 2;
  _SG_FILTER_NUM = 3;
  _SG_FILTER_FORCE_U32 = $7FFFFFFF;

type
  Psg_wrap = ^Tsg_wrap;
  Tsg_wrap = longint;

const
  _SG_WRAP_DEFAULT = 0;
  SG_WRAP_REPEAT = 1;
  SG_WRAP_CLAMP_TO_EDGE = 2;
  SG_WRAP_CLAMP_TO_BORDER = 3;
  SG_WRAP_MIRRORED_REPEAT = 4;
  _SG_WRAP_NUM = 5;
  _SG_WRAP_FORCE_U32 = $7FFFFFFF;

type
  Psg_border_color = ^Tsg_border_color;
  Tsg_border_color = longint;

const
  _SG_BORDERCOLOR_DEFAULT = 0;
  SG_BORDERCOLOR_TRANSPARENT_BLACK = 1;
  SG_BORDERCOLOR_OPAQUE_BLACK = 2;
  SG_BORDERCOLOR_OPAQUE_WHITE = 3;
  _SG_BORDERCOLOR_NUM = 4;
  _SG_BORDERCOLOR_FORCE_U32 = $7FFFFFFF;

type
  Psg_vertex_format = ^Tsg_vertex_format;
  Tsg_vertex_format = longint;

const
  SG_VERTEXFORMAT_INVALID = 0;
  SG_VERTEXFORMAT_FLOAT = 1;
  SG_VERTEXFORMAT_FLOAT2 = 2;
  SG_VERTEXFORMAT_FLOAT3 = 3;
  SG_VERTEXFORMAT_FLOAT4 = 4;
  SG_VERTEXFORMAT_INT = 5;
  SG_VERTEXFORMAT_INT2 = 6;
  SG_VERTEXFORMAT_INT3 = 7;
  SG_VERTEXFORMAT_INT4 = 8;
  SG_VERTEXFORMAT_UINT = 9;
  SG_VERTEXFORMAT_UINT2 = 10;
  SG_VERTEXFORMAT_UINT3 = 11;
  SG_VERTEXFORMAT_UINT4 = 12;
  SG_VERTEXFORMAT_BYTE4 = 13;
  SG_VERTEXFORMAT_BYTE4N = 14;
  SG_VERTEXFORMAT_UBYTE4 = 15;
  SG_VERTEXFORMAT_UBYTE4N = 16;
  SG_VERTEXFORMAT_SHORT2 = 17;
  SG_VERTEXFORMAT_SHORT2N = 18;
  SG_VERTEXFORMAT_USHORT2 = 19;
  SG_VERTEXFORMAT_USHORT2N = 20;
  SG_VERTEXFORMAT_SHORT4 = 21;
  SG_VERTEXFORMAT_SHORT4N = 22;
  SG_VERTEXFORMAT_USHORT4 = 23;
  SG_VERTEXFORMAT_USHORT4N = 24;
  SG_VERTEXFORMAT_UINT10_N2 = 25;
  SG_VERTEXFORMAT_HALF2 = 26;
  SG_VERTEXFORMAT_HALF4 = 27;
  _SG_VERTEXFORMAT_NUM = 28;
  _SG_VERTEXFORMAT_FORCE_U32 = $7FFFFFFF;

type
  Psg_vertex_step = ^Tsg_vertex_step;
  Tsg_vertex_step = longint;

const
  _SG_VERTEXSTEP_DEFAULT = 0;
  SG_VERTEXSTEP_PER_VERTEX = 1;
  SG_VERTEXSTEP_PER_INSTANCE = 2;
  _SG_VERTEXSTEP_NUM = 3;
  _SG_VERTEXSTEP_FORCE_U32 = $7FFFFFFF;

type
  Psg_uniform_type = ^Tsg_uniform_type;
  Tsg_uniform_type = longint;

const
  SG_UNIFORMTYPE_INVALID = 0;
  SG_UNIFORMTYPE_FLOAT = 1;
  SG_UNIFORMTYPE_FLOAT2 = 2;
  SG_UNIFORMTYPE_FLOAT3 = 3;
  SG_UNIFORMTYPE_FLOAT4 = 4;
  SG_UNIFORMTYPE_INT = 5;
  SG_UNIFORMTYPE_INT2 = 6;
  SG_UNIFORMTYPE_INT3 = 7;
  SG_UNIFORMTYPE_INT4 = 8;
  SG_UNIFORMTYPE_MAT4 = 9;
  _SG_UNIFORMTYPE_NUM = 10;
  _SG_UNIFORMTYPE_FORCE_U32 = $7FFFFFFF;

type
  Psg_uniform_layout = ^Tsg_uniform_layout;
  Tsg_uniform_layout = longint;

const
  _SG_UNIFORMLAYOUT_DEFAULT = 0;
  SG_UNIFORMLAYOUT_NATIVE = 1;
  SG_UNIFORMLAYOUT_STD140 = 2;
  _SG_UNIFORMLAYOUT_NUM = 3;
  _SG_UNIFORMLAYOUT_FORCE_U32 = $7FFFFFFF;

type
  Psg_cull_mode = ^Tsg_cull_mode;
  Tsg_cull_mode = longint;

const
  _SG_CULLMODE_DEFAULT = 0;
  SG_CULLMODE_NONE = 1;
  SG_CULLMODE_FRONT = 2;
  SG_CULLMODE_BACK = 3;
  _SG_CULLMODE_NUM = 4;
  _SG_CULLMODE_FORCE_U32 = $7FFFFFFF;

type
  Psg_face_winding = ^Tsg_face_winding;
  Tsg_face_winding = longint;

const
  _SG_FACEWINDING_DEFAULT = 0;
  SG_FACEWINDING_CCW = 1;
  SG_FACEWINDING_CW = 2;
  _SG_FACEWINDING_NUM = 3;
  _SG_FACEWINDING_FORCE_U32 = $7FFFFFFF;

type
  Psg_compare_func = ^Tsg_compare_func;
  Tsg_compare_func = longint;

const
  _SG_COMPAREFUNC_DEFAULT = 0;
  SG_COMPAREFUNC_NEVER = 1;
  SG_COMPAREFUNC_LESS = 2;
  SG_COMPAREFUNC_EQUAL = 3;
  SG_COMPAREFUNC_LESS_EQUAL = 4;
  SG_COMPAREFUNC_GREATER = 5;
  SG_COMPAREFUNC_NOT_EQUAL = 6;
  SG_COMPAREFUNC_GREATER_EQUAL = 7;
  SG_COMPAREFUNC_ALWAYS = 8;
  _SG_COMPAREFUNC_NUM = 9;
  _SG_COMPAREFUNC_FORCE_U32 = $7FFFFFFF;

type
  Psg_stencil_op = ^Tsg_stencil_op;
  Tsg_stencil_op = longint;

const
  _SG_STENCILOP_DEFAULT = 0;
  SG_STENCILOP_KEEP = 1;
  SG_STENCILOP_ZERO = 2;
  SG_STENCILOP_REPLACE = 3;
  SG_STENCILOP_INCR_CLAMP = 4;
  SG_STENCILOP_DECR_CLAMP = 5;
  SG_STENCILOP_INVERT = 6;
  SG_STENCILOP_INCR_WRAP = 7;
  SG_STENCILOP_DECR_WRAP = 8;
  _SG_STENCILOP_NUM = 9;
  _SG_STENCILOP_FORCE_U32 = $7FFFFFFF;

type
  Psg_blend_factor = ^Tsg_blend_factor;
  Tsg_blend_factor = longint;

const
  _SG_BLENDFACTOR_DEFAULT = 0;
  SG_BLENDFACTOR_ZERO = 1;
  SG_BLENDFACTOR_ONE = 2;
  SG_BLENDFACTOR_SRC_COLOR = 3;
  SG_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 4;
  SG_BLENDFACTOR_SRC_ALPHA = 5;
  SG_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 6;
  SG_BLENDFACTOR_DST_COLOR = 7;
  SG_BLENDFACTOR_ONE_MINUS_DST_COLOR = 8;
  SG_BLENDFACTOR_DST_ALPHA = 9;
  SG_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 10;
  SG_BLENDFACTOR_SRC_ALPHA_SATURATED = 11;
  SG_BLENDFACTOR_BLEND_COLOR = 12;
  SG_BLENDFACTOR_ONE_MINUS_BLEND_COLOR = 13;
  SG_BLENDFACTOR_BLEND_ALPHA = 14;
  SG_BLENDFACTOR_ONE_MINUS_BLEND_ALPHA = 15;
  SG_BLENDFACTOR_SRC1_COLOR = 16;
  SG_BLENDFACTOR_ONE_MINUS_SRC1_COLOR = 17;
  SG_BLENDFACTOR_SRC1_ALPHA = 18;
  SG_BLENDFACTOR_ONE_MINUS_SRC1_ALPHA = 19;
  _SG_BLENDFACTOR_NUM = 20;
  _SG_BLENDFACTOR_FORCE_U32 = $7FFFFFFF;

type
  Psg_blend_op = ^Tsg_blend_op;
  Tsg_blend_op = longint;

const
  _SG_BLENDOP_DEFAULT = 0;
  SG_BLENDOP_ADD = 1;
  SG_BLENDOP_SUBTRACT = 2;
  SG_BLENDOP_REVERSE_SUBTRACT = 3;
  SG_BLENDOP_MIN = 4;
  SG_BLENDOP_MAX = 5;
  _SG_BLENDOP_NUM = 6;
  _SG_BLENDOP_FORCE_U32 = $7FFFFFFF;

type
  Psg_color_mask = ^Tsg_color_mask;
  Tsg_color_mask = longint;

const
  _SG_COLORMASK_DEFAULT = 0;
  SG_COLORMASK_NONE = $10;
  SG_COLORMASK_R = $1;
  SG_COLORMASK_G = $2;
  SG_COLORMASK_RG = $3;
  SG_COLORMASK_B = $4;
  SG_COLORMASK_RB = $5;
  SG_COLORMASK_GB = $6;
  SG_COLORMASK_RGB = $7;
  SG_COLORMASK_A = $8;
  SG_COLORMASK_RA = $9;
  SG_COLORMASK_GA = $A;
  SG_COLORMASK_RGA = $B;
  SG_COLORMASK_BA = $C;
  SG_COLORMASK_RBA = $D;
  SG_COLORMASK_GBA = $E;
  SG_COLORMASK_RGBA = $F;
  _SG_COLORMASK_FORCE_U32 = $7FFFFFFF;

type
  Psg_load_action = ^Tsg_load_action;
  Tsg_load_action = longint;

const
  _SG_LOADACTION_DEFAULT = 0;
  SG_LOADACTION_CLEAR = 1;
  SG_LOADACTION_LOAD = 2;
  SG_LOADACTION_DONTCARE = 3;
  _SG_LOADACTION_FORCE_U32 = $7FFFFFFF;

type
  Psg_store_action = ^Tsg_store_action;
  Tsg_store_action = longint;

const
  _SG_STOREACTION_DEFAULT = 0;
  SG_STOREACTION_STORE = 1;
  SG_STOREACTION_DONTCARE = 2;
  _SG_STOREACTION_FORCE_U32 = $7FFFFFFF;

type
  Tsg_color_attachment_action = record
    load_action: Tsg_load_action;
    store_action: Tsg_store_action;
    clear_value: Tsg_color;
  end;
  Psg_color_attachment_action = ^Tsg_color_attachment_action;

  Tsg_depth_attachment_action = record
    load_action: Tsg_load_action;
    store_action: Tsg_store_action;
    clear_value: single;
  end;
  Psg_depth_attachment_action = ^Tsg_depth_attachment_action;

  Tsg_stencil_attachment_action = record
    load_action: Tsg_load_action;
    store_action: Tsg_store_action;
    clear_value: Tuint8_t;
  end;
  Psg_stencil_attachment_action = ^Tsg_stencil_attachment_action;

  Tsg_pass_action = record
    colors: array[0..(SG_MAX_COLOR_ATTACHMENTS) - 1] of Tsg_color_attachment_action;
    depth: Tsg_depth_attachment_action;
    stencil: Tsg_stencil_attachment_action;
  end;
  Psg_pass_action = ^Tsg_pass_action;

  Tsg_metal_swapchain = record
    current_drawable: pointer;
    depth_stencil_texture: pointer;
    msaa_color_texture: pointer;
  end;
  Psg_metal_swapchain = ^Tsg_metal_swapchain;

  Tsg_d3d11_swapchain = record
    render_view: pointer;
    resolve_view: pointer;
    depth_stencil_view: pointer;
  end;
  Psg_d3d11_swapchain = ^Tsg_d3d11_swapchain;

  Tsg_wgpu_swapchain = record
    render_view: pointer;
    resolve_view: pointer;
    depth_stencil_view: pointer;
  end;
  Psg_wgpu_swapchain = ^Tsg_wgpu_swapchain;

  Tsg_vulkan_swapchain = record
    render_image: pointer;
    render_view: pointer;
    resolve_image: pointer;
    resolve_view: pointer;
    depth_stencil_image: pointer;
    depth_stencil_view: pointer;
    render_finished_semaphore: pointer;
    present_complete_semaphore: pointer;
  end;
  Psg_vulkan_swapchain = ^Tsg_vulkan_swapchain;

  Tsg_gl_swapchain = record
    framebuffer: Tuint32_t;
  end;
  Psg_gl_swapchain = ^Tsg_gl_swapchain;

  Tsg_swapchain = record
    width: longint;
    height: longint;
    sample_count: longint;
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    metal: Tsg_metal_swapchain;
    d3d11: Tsg_d3d11_swapchain;
    wgpu: Tsg_wgpu_swapchain;
    vulkan: Tsg_vulkan_swapchain;
    gl: Tsg_gl_swapchain;
  end;
  Psg_swapchain = ^Tsg_swapchain;

  Tsg_attachments = record
    colors: array[0..(SG_MAX_COLOR_ATTACHMENTS) - 1] of Tsg_view;
    resolves: array[0..(SG_MAX_COLOR_ATTACHMENTS) - 1] of Tsg_view;
    depth_stencil: Tsg_view;
  end;
  Psg_attachments = ^Tsg_attachments;

  Tsg_pass = record
    _start_canary: Tuint32_t;
    compute: boolean;
    action: Tsg_pass_action;
    attachments: Tsg_attachments;
    swapchain: Tsg_swapchain;
    _label: pchar;
    _end_canary: Tuint32_t;
  end;
  Psg_pass = ^Tsg_pass;

  Tsg_bindings = record
    _start_canary: Tuint32_t;
    vertex_buffers: array[0..(SG_MAX_VERTEXBUFFER_BINDSLOTS) - 1] of Tsg_buffer;
    vertex_buffer_offsets: array[0..(SG_MAX_VERTEXBUFFER_BINDSLOTS) - 1] of longint;
    index_buffer: Tsg_buffer;
    index_buffer_offset: longint;
    views: array[0..(SG_MAX_VIEW_BINDSLOTS) - 1] of Tsg_view;
    samplers: array[0..(SG_MAX_SAMPLER_BINDSLOTS) - 1] of Tsg_sampler;
    _end_canary: Tuint32_t;
  end;
  Psg_bindings = ^Tsg_bindings;

  Tsg_buffer_usage = record
    vertex_buffer: boolean;
    index_buffer: boolean;
    storage_buffer: boolean;
    immutable: boolean;
    dynamic_update: boolean;
    stream_update: boolean;
  end;
  Psg_buffer_usage = ^Tsg_buffer_usage;

  Tsg_buffer_desc = record
    _start_canary: Tuint32_t;
    size: Tsize_t;
    usage: Tsg_buffer_usage;
    data: Tsg_range;
    _label: pchar;
    gl_buffers: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of Tuint32_t;
    mtl_buffers: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of pointer;
    d3d11_buffer: pointer;
    wgpu_buffer: pointer;
    _end_canary: Tuint32_t;
  end;
  Psg_buffer_desc = ^Tsg_buffer_desc;

  Tsg_image_usage = record
    storage_image: boolean;
    color_attachment: boolean;
    resolve_attachment: boolean;
    depth_stencil_attachment: boolean;
    immutable: boolean;
    dynamic_update: boolean;
    stream_update: boolean;
  end;
  Psg_image_usage = ^Tsg_image_usage;

type
  Psg_view_type = ^Tsg_view_type;
  Tsg_view_type = longint;

const
  SG_VIEWTYPE_INVALID = 0;
  SG_VIEWTYPE_STORAGEBUFFER = 1;
  SG_VIEWTYPE_STORAGEIMAGE = 2;
  SG_VIEWTYPE_TEXTURE = 3;
  SG_VIEWTYPE_COLORATTACHMENT = 4;
  SG_VIEWTYPE_RESOLVEATTACHMENT = 5;
  SG_VIEWTYPE_DEPTHSTENCILATTACHMENT = 6;
  _SG_VIEWTYPE_FORCE_U32 = $7FFFFFFF;

type
  Tsg_image_data = record
    mip_levels: array[0..(SG_MAX_MIPMAPS) - 1] of Tsg_range;
  end;
  Psg_image_data = ^Tsg_image_data;

  Tsg_image_desc = record
    _start_canary: Tuint32_t;
    _type: Tsg_image_type;
    usage: Tsg_image_usage;
    width: longint;
    height: longint;
    num_slices: longint;
    num_mipmaps: longint;
    pixel_format: Tsg_pixel_format;
    sample_count: longint;
    data: Tsg_image_data;
    _label: pchar;
    gl_textures: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of Tuint32_t;
    gl_texture_target: Tuint32_t;
    mtl_textures: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of pointer;
    d3d11_texture: pointer;
    wgpu_texture: pointer;
    _end_canary: Tuint32_t;
  end;
  Psg_image_desc = ^Tsg_image_desc;

  Tsg_sampler_desc = record
    _start_canary: Tuint32_t;
    min_filter: Tsg_filter;
    mag_filter: Tsg_filter;
    mipmap_filter: Tsg_filter;
    wrap_u: Tsg_wrap;
    wrap_v: Tsg_wrap;
    wrap_w: Tsg_wrap;
    min_lod: single;
    max_lod: single;
    border_color: Tsg_border_color;
    compare: Tsg_compare_func;
    max_anisotropy: Tuint32_t;
    _label: pchar;
    gl_sampler: Tuint32_t;
    mtl_sampler: pointer;
    d3d11_sampler: pointer;
    wgpu_sampler: pointer;
    _end_canary: Tuint32_t;
  end;
  Psg_sampler_desc = ^Tsg_sampler_desc;

type
  Psg_shader_stage = ^Tsg_shader_stage;
  Tsg_shader_stage = longint;

const
  SG_SHADERSTAGE_NONE = 0;
  SG_SHADERSTAGE_VERTEX = 1;
  SG_SHADERSTAGE_FRAGMENT = 2;
  SG_SHADERSTAGE_COMPUTE = 3;
  _SG_SHADERSTAGE_FORCE_U32 = $7FFFFFFF;

type
  Tsg_shader_function = record
    source: pchar;
    bytecode: Tsg_range;
    entry: pchar;
    d3d11_target: pchar;
    d3d11_filepath: pchar;
  end;
  Psg_shader_function = ^Tsg_shader_function;

type
  Psg_shader_attr_base_type = ^Tsg_shader_attr_base_type;
  Tsg_shader_attr_base_type = longint;

const
  SG_SHADERATTRBASETYPE_UNDEFINED = 0;
  SG_SHADERATTRBASETYPE_FLOAT = 1;
  SG_SHADERATTRBASETYPE_SINT = 2;
  SG_SHADERATTRBASETYPE_UINT = 3;
  _SG_SHADERATTRBASETYPE_FORCE_U32 = $7FFFFFFF;

type
  Tsg_shader_vertex_attr = record
    base_type: Tsg_shader_attr_base_type;
    glsl_name: pchar;
    hlsl_sem_name: pchar;
    hlsl_sem_index: Tuint8_t;
  end;
  Psg_shader_vertex_attr = ^Tsg_shader_vertex_attr;

  Tsg_glsl_shader_uniform = record
    _type: Tsg_uniform_type;
    array_count: Tuint16_t;
    glsl_name: pchar;
  end;
  Psg_glsl_shader_uniform = ^Tsg_glsl_shader_uniform;

  Tsg_shader_uniform_block = record
    stage: Tsg_shader_stage;
    size: Tuint32_t;
    hlsl_register_b_n: Tuint8_t;
    msl_buffer_n: Tuint8_t;
    wgsl_group0_binding_n: Tuint8_t;
    spirv_set0_binding_n: Tuint8_t;
    layout: Tsg_uniform_layout;
    glsl_uniforms: array[0..(SG_MAX_UNIFORMBLOCK_MEMBERS) - 1] of Tsg_glsl_shader_uniform;
  end;
  Psg_shader_uniform_block = ^Tsg_shader_uniform_block;

  Tsg_shader_texture_view = record
    stage: Tsg_shader_stage;
    image_type: Tsg_image_type;
    sample_type: Tsg_image_sample_type;
    multisampled: boolean;
    hlsl_register_t_n: Tuint8_t;
    msl_texture_n: Tuint8_t;
    wgsl_group1_binding_n: Tuint8_t;
    spirv_set1_binding_n: Tuint8_t;
  end;
  Psg_shader_texture_view = ^Tsg_shader_texture_view;

  Tsg_shader_storage_buffer_view = record
    stage: Tsg_shader_stage;
    readonly: boolean;
    hlsl_register_t_n: Tuint8_t;
    hlsl_register_u_n: Tuint8_t;
    msl_buffer_n: Tuint8_t;
    wgsl_group1_binding_n: Tuint8_t;
    spirv_set1_binding_n: Tuint8_t;
    glsl_binding_n: Tuint8_t;
  end;
  Psg_shader_storage_buffer_view = ^Tsg_shader_storage_buffer_view;

  Tsg_shader_storage_image_view = record
    stage: Tsg_shader_stage;
    image_type: Tsg_image_type;
    access_format: Tsg_pixel_format;
    writeonly: boolean;
    hlsl_register_u_n: Tuint8_t;
    msl_texture_n: Tuint8_t;
    wgsl_group1_binding_n: Tuint8_t;
    spirv_set1_binding_n: Tuint8_t;
    glsl_binding_n: Tuint8_t;
  end;
  Psg_shader_storage_image_view = ^Tsg_shader_storage_image_view;

  Tsg_shader_view = record
    texture: Tsg_shader_texture_view;
    storage_buffer: Tsg_shader_storage_buffer_view;
    storage_image: Tsg_shader_storage_image_view;
  end;
  Psg_shader_view = ^Tsg_shader_view;

  Tsg_shader_sampler = record
    stage: Tsg_shader_stage;
    sampler_type: Tsg_sampler_type;
    hlsl_register_s_n: Tuint8_t;
    msl_sampler_n: Tuint8_t;
    wgsl_group1_binding_n: Tuint8_t;
    spirv_set1_binding_n: Tuint8_t;
  end;
  Psg_shader_sampler = ^Tsg_shader_sampler;

  Tsg_shader_texture_sampler_pair = record
    stage: Tsg_shader_stage;
    view_slot: Tuint8_t;
    sampler_slot: Tuint8_t;
    glsl_name: pchar;
  end;
  Psg_shader_texture_sampler_pair = ^Tsg_shader_texture_sampler_pair;

  Tsg_mtl_shader_threads_per_threadgroup = record
    x: longint;
    y: longint;
    z: longint;
  end;
  Psg_mtl_shader_threads_per_threadgroup = ^Tsg_mtl_shader_threads_per_threadgroup;

  Tsg_shader_desc = record
    _start_canary: Tuint32_t;
    vertex_func: Tsg_shader_function;
    fragment_func: Tsg_shader_function;
    compute_func: Tsg_shader_function;
    attrs: array[0..(SG_MAX_VERTEX_ATTRIBUTES) - 1] of Tsg_shader_vertex_attr;
    uniform_blocks: array[0..(SG_MAX_UNIFORMBLOCK_BINDSLOTS) - 1] of Tsg_shader_uniform_block;
    views: array[0..(SG_MAX_VIEW_BINDSLOTS) - 1] of Tsg_shader_view;
    samplers: array[0..(SG_MAX_SAMPLER_BINDSLOTS) - 1] of Tsg_shader_sampler;
    texture_sampler_pairs: array[0..(SG_MAX_TEXTURE_SAMPLER_PAIRS) - 1] of Tsg_shader_texture_sampler_pair;
    mtl_threads_per_threadgroup: Tsg_mtl_shader_threads_per_threadgroup;
    _label: pchar;
    _end_canary: Tuint32_t;
  end;
  Psg_shader_desc = ^Tsg_shader_desc;

  Tsg_vertex_buffer_layout_state = record
    stride: longint;
    step_func: Tsg_vertex_step;
    step_rate: longint;
  end;
  Psg_vertex_buffer_layout_state = ^Tsg_vertex_buffer_layout_state;

  Tsg_vertex_attr_state = record
    buffer_index: longint;
    offset: longint;
    format: Tsg_vertex_format;
  end;
  Psg_vertex_attr_state = ^Tsg_vertex_attr_state;

  Tsg_vertex_layout_state = record
    buffers: array[0..(SG_MAX_VERTEXBUFFER_BINDSLOTS) - 1] of Tsg_vertex_buffer_layout_state;
    attrs: array[0..(SG_MAX_VERTEX_ATTRIBUTES) - 1] of Tsg_vertex_attr_state;
  end;
  Psg_vertex_layout_state = ^Tsg_vertex_layout_state;

  Tsg_stencil_face_state = record
    compare: Tsg_compare_func;
    fail_op: Tsg_stencil_op;
    depth_fail_op: Tsg_stencil_op;
    pass_op: Tsg_stencil_op;
  end;
  Psg_stencil_face_state = ^Tsg_stencil_face_state;

  Tsg_stencil_state = record
    enabled: boolean;
    front: Tsg_stencil_face_state;
    back: Tsg_stencil_face_state;
    read_mask: Tuint8_t;
    write_mask: Tuint8_t;
    ref: Tuint8_t;
  end;
  Psg_stencil_state = ^Tsg_stencil_state;

  Tsg_depth_state = record
    pixel_format: Tsg_pixel_format;
    compare: Tsg_compare_func;
    write_enabled: boolean;
    bias: single;
    bias_slope_scale: single;
    bias_clamp: single;
  end;
  Psg_depth_state = ^Tsg_depth_state;

  Tsg_blend_state = record
    enabled: boolean;
    src_factor_rgb: Tsg_blend_factor;
    dst_factor_rgb: Tsg_blend_factor;
    op_rgb: Tsg_blend_op;
    src_factor_alpha: Tsg_blend_factor;
    dst_factor_alpha: Tsg_blend_factor;
    op_alpha: Tsg_blend_op;
  end;
  Psg_blend_state = ^Tsg_blend_state;

  Tsg_color_target_state = record
    pixel_format: Tsg_pixel_format;
    write_mask: Tsg_color_mask;
    blend: Tsg_blend_state;
  end;
  Psg_color_target_state = ^Tsg_color_target_state;

  Tsg_pipeline_desc = record
    _start_canary: Tuint32_t;
    compute: boolean;
    shader: Tsg_shader;
    layout: Tsg_vertex_layout_state;
    depth: Tsg_depth_state;
    stencil: Tsg_stencil_state;
    color_count: longint;
    colors: array[0..(SG_MAX_COLOR_ATTACHMENTS) - 1] of Tsg_color_target_state;
    primitive_type: Tsg_primitive_type;
    index_type: Tsg_index_type;
    cull_mode: Tsg_cull_mode;
    face_winding: Tsg_face_winding;
    sample_count: longint;
    blend_color: Tsg_color;
    alpha_to_coverage_enabled: boolean;
    _label: pchar;
    _end_canary: Tuint32_t;
  end;
  Psg_pipeline_desc = ^Tsg_pipeline_desc;

  Tsg_buffer_view_desc = record
    buffer: Tsg_buffer;
    offset: longint;
  end;
  Psg_buffer_view_desc = ^Tsg_buffer_view_desc;

  Tsg_image_view_desc = record
    image: Tsg_image;
    mip_level: longint;
    slice: longint;
  end;
  Psg_image_view_desc = ^Tsg_image_view_desc;

  Tsg_texture_view_range = record
    base: longint;
    count: longint;
  end;
  Psg_texture_view_range = ^Tsg_texture_view_range;

  Tsg_texture_view_desc = record
    image: Tsg_image;
    mip_levels: Tsg_texture_view_range;
    slices: Tsg_texture_view_range;
  end;
  Psg_texture_view_desc = ^Tsg_texture_view_desc;

  Tsg_view_desc = record
    _start_canary: Tuint32_t;
    texture: Tsg_texture_view_desc;
    storage_buffer: Tsg_buffer_view_desc;
    storage_image: Tsg_image_view_desc;
    color_attachment: Tsg_image_view_desc;
    resolve_attachment: Tsg_image_view_desc;
    depth_stencil_attachment: Tsg_image_view_desc;
    _label: pchar;
    _end_canary: Tuint32_t;
  end;
  Psg_view_desc = ^Tsg_view_desc;

  Tsg_trace_hooks = record
    user_data: pointer;
    reset_state_cache: procedure(user_data: pointer); cdecl;
    make_buffer: procedure(desc: Psg_buffer_desc; result: Tsg_buffer; user_data: pointer); cdecl;
    make_image: procedure(desc: Psg_image_desc; result: Tsg_image; user_data: pointer); cdecl;
    make_sampler: procedure(desc: Psg_sampler_desc; result: Tsg_sampler; user_data: pointer); cdecl;
    make_shader: procedure(desc: Psg_shader_desc; result: Tsg_shader; user_data: pointer); cdecl;
    make_pipeline: procedure(desc: Psg_pipeline_desc; result: Tsg_pipeline; user_data: pointer); cdecl;
    make_view: procedure(desc: Psg_view_desc; result: Tsg_view; user_data: pointer); cdecl;
    destroy_buffer: procedure(buf: Tsg_buffer; user_data: pointer); cdecl;
    destroy_image: procedure(img: Tsg_image; user_data: pointer); cdecl;
    destroy_sampler: procedure(smp: Tsg_sampler; user_data: pointer); cdecl;
    destroy_shader: procedure(shd: Tsg_shader; user_data: pointer); cdecl;
    destroy_pipeline: procedure(pip: Tsg_pipeline; user_data: pointer); cdecl;
    destroy_view: procedure(view: Tsg_view; user_data: pointer); cdecl;
    update_buffer: procedure(buf: Tsg_buffer; data: Psg_range; user_data: pointer); cdecl;
    update_image: procedure(img: Tsg_image; data: Psg_image_data; user_data: pointer); cdecl;
    append_buffer: procedure(buf: Tsg_buffer; data: Psg_range; result: longint; user_data: pointer); cdecl;
    begin_pass: procedure(pass: Psg_pass; user_data: pointer); cdecl;
    apply_viewport: procedure(x: longint; y: longint; width: longint; height: longint; origin_top_left: boolean;
      user_data: pointer); cdecl;
    apply_scissor_rect: procedure(x: longint; y: longint; width: longint; height: longint; origin_top_left: boolean;
      user_data: pointer); cdecl;
    apply_pipeline: procedure(pip: Tsg_pipeline; user_data: pointer); cdecl;
    apply_bindings: procedure(bindings: Psg_bindings; user_data: pointer); cdecl;
    apply_uniforms: procedure(ub_index: longint; data: Psg_range; user_data: pointer); cdecl;
    draw: procedure(base_element: longint; num_elements: longint; num_instances: longint; user_data: pointer); cdecl;
    draw_ex: procedure(base_element: longint; num_elements: longint; num_instances: longint; base_vertex: longint; base_instance: longint;
      user_data: pointer); cdecl;
    dispatch: procedure(num_groups_x: longint; num_groups_y: longint; num_groups_z: longint; user_data: pointer); cdecl;
    end_pass: procedure(user_data: pointer); cdecl;
    commit: procedure(user_data: pointer); cdecl;
    alloc_buffer: procedure(result: Tsg_buffer; user_data: pointer); cdecl;
    alloc_image: procedure(result: Tsg_image; user_data: pointer); cdecl;
    alloc_sampler: procedure(result: Tsg_sampler; user_data: pointer); cdecl;
    alloc_shader: procedure(result: Tsg_shader; user_data: pointer); cdecl;
    alloc_pipeline: procedure(result: Tsg_pipeline; user_data: pointer); cdecl;
    alloc_view: procedure(result: Tsg_view; user_data: pointer); cdecl;
    dealloc_buffer: procedure(buf_id: Tsg_buffer; user_data: pointer); cdecl;
    dealloc_image: procedure(img_id: Tsg_image; user_data: pointer); cdecl;
    dealloc_sampler: procedure(smp_id: Tsg_sampler; user_data: pointer); cdecl;
    dealloc_shader: procedure(shd_id: Tsg_shader; user_data: pointer); cdecl;
    dealloc_pipeline: procedure(pip_id: Tsg_pipeline; user_data: pointer); cdecl;
    dealloc_view: procedure(view_id: Tsg_view; user_data: pointer); cdecl;
    init_buffer: procedure(buf_id: Tsg_buffer; desc: Psg_buffer_desc; user_data: pointer); cdecl;
    init_image: procedure(img_id: Tsg_image; desc: Psg_image_desc; user_data: pointer); cdecl;
    init_sampler: procedure(smp_id: Tsg_sampler; desc: Psg_sampler_desc; user_data: pointer); cdecl;
    init_shader: procedure(shd_id: Tsg_shader; desc: Psg_shader_desc; user_data: pointer); cdecl;
    init_pipeline: procedure(pip_id: Tsg_pipeline; desc: Psg_pipeline_desc; user_data: pointer); cdecl;
    init_view: procedure(view_id: Tsg_view; desc: Psg_view_desc; user_data: pointer); cdecl;
    uninit_buffer: procedure(buf_id: Tsg_buffer; user_data: pointer); cdecl;
    uninit_image: procedure(img_id: Tsg_image; user_data: pointer); cdecl;
    uninit_sampler: procedure(smp_id: Tsg_sampler; user_data: pointer); cdecl;
    uninit_shader: procedure(shd_id: Tsg_shader; user_data: pointer); cdecl;
    uninit_pipeline: procedure(pip_id: Tsg_pipeline; user_data: pointer); cdecl;
    uninit_view: procedure(view_id: Tsg_view; user_data: pointer); cdecl;
    fail_buffer: procedure(buf_id: Tsg_buffer; user_data: pointer); cdecl;
    fail_image: procedure(img_id: Tsg_image; user_data: pointer); cdecl;
    fail_sampler: procedure(smp_id: Tsg_sampler; user_data: pointer); cdecl;
    fail_shader: procedure(shd_id: Tsg_shader; user_data: pointer); cdecl;
    fail_pipeline: procedure(pip_id: Tsg_pipeline; user_data: pointer); cdecl;
    fail_view: procedure(view_id: Tsg_view; user_data: pointer); cdecl;
    push_debug_group: procedure(name: pchar; user_data: pointer); cdecl;
    pop_debug_group: procedure(user_data: pointer); cdecl;
  end;
  Psg_trace_hooks = ^Tsg_trace_hooks;

  Tsg_slot_info = record
    state: Tsg_resource_state;
    res_id: Tuint32_t;
    uninit_count: Tuint32_t;
  end;
  Psg_slot_info = ^Tsg_slot_info;

  Tsg_buffer_info = record
    slot: Tsg_slot_info;
    update_frame_index: Tuint32_t;
    append_frame_index: Tuint32_t;
    append_pos: longint;
    append_overflow: boolean;
    num_slots: longint;
    active_slot: longint;
  end;
  Psg_buffer_info = ^Tsg_buffer_info;

  Tsg_image_info = record
    slot: Tsg_slot_info;
    upd_frame_index: Tuint32_t;
    num_slots: longint;
    active_slot: longint;
  end;
  Psg_image_info = ^Tsg_image_info;

  Tsg_sampler_info = record
    slot: Tsg_slot_info;
  end;
  Psg_sampler_info = ^Tsg_sampler_info;

  Tsg_shader_info = record
    slot: Tsg_slot_info;
  end;
  Psg_shader_info = ^Tsg_shader_info;

  Tsg_pipeline_info = record
    slot: Tsg_slot_info;
  end;
  Psg_pipeline_info = ^Tsg_pipeline_info;

  Tsg_view_info = record
    slot: Tsg_slot_info;
  end;
  Psg_view_info = ^Tsg_view_info;

  Tsg_frame_stats_gl = record
    num_bind_buffer: Tuint32_t;
    num_active_texture: Tuint32_t;
    num_bind_texture: Tuint32_t;
    num_bind_sampler: Tuint32_t;
    num_bind_image_texture: Tuint32_t;
    num_use_program: Tuint32_t;
    num_render_state: Tuint32_t;
    num_vertex_attrib_pointer: Tuint32_t;
    num_vertex_attrib_divisor: Tuint32_t;
    num_enable_vertex_attrib_array: Tuint32_t;
    num_disable_vertex_attrib_array: Tuint32_t;
    num_uniform: Tuint32_t;
    num_memory_barriers: Tuint32_t;
  end;
  Psg_frame_stats_gl = ^Tsg_frame_stats_gl;

  Tsg_frame_stats_d3d11_pass = record
    num_om_set_render_targets: Tuint32_t;
    num_clear_render_target_view: Tuint32_t;
    num_clear_depth_stencil_view: Tuint32_t;
    num_resolve_subresource: Tuint32_t;
  end;
  Psg_frame_stats_d3d11_pass = ^Tsg_frame_stats_d3d11_pass;

  Tsg_frame_stats_d3d11_pipeline = record
    num_rs_set_state: Tuint32_t;
    num_om_set_depth_stencil_state: Tuint32_t;
    num_om_set_blend_state: Tuint32_t;
    num_ia_set_primitive_topology: Tuint32_t;
    num_ia_set_input_layout: Tuint32_t;
    num_vs_set_shader: Tuint32_t;
    num_vs_set_constant_buffers: Tuint32_t;
    num_ps_set_shader: Tuint32_t;
    num_ps_set_constant_buffers: Tuint32_t;
    num_cs_set_shader: Tuint32_t;
    num_cs_set_constant_buffers: Tuint32_t;
  end;
  Psg_frame_stats_d3d11_pipeline = ^Tsg_frame_stats_d3d11_pipeline;

  Tsg_frame_stats_d3d11_bindings = record
    num_ia_set_vertex_buffers: Tuint32_t;
    num_ia_set_index_buffer: Tuint32_t;
    num_vs_set_shader_resources: Tuint32_t;
    num_vs_set_samplers: Tuint32_t;
    num_ps_set_shader_resources: Tuint32_t;
    num_ps_set_samplers: Tuint32_t;
    num_cs_set_shader_resources: Tuint32_t;
    num_cs_set_samplers: Tuint32_t;
    num_cs_set_unordered_access_views: Tuint32_t;
  end;
  Psg_frame_stats_d3d11_bindings = ^Tsg_frame_stats_d3d11_bindings;

  Tsg_frame_stats_d3d11_uniforms = record
    num_update_subresource: Tuint32_t;
  end;
  Psg_frame_stats_d3d11_uniforms = ^Tsg_frame_stats_d3d11_uniforms;

  Tsg_frame_stats_d3d11_draw = record
    num_draw_indexed_instanced: Tuint32_t;
    num_draw_indexed: Tuint32_t;
    num_draw_instanced: Tuint32_t;
    num_draw: Tuint32_t;
  end;
  Psg_frame_stats_d3d11_draw = ^Tsg_frame_stats_d3d11_draw;

  Tsg_frame_stats_d3d11 = record
    pass: Tsg_frame_stats_d3d11_pass;
    pipeline: Tsg_frame_stats_d3d11_pipeline;
    bindings: Tsg_frame_stats_d3d11_bindings;
    uniforms: Tsg_frame_stats_d3d11_uniforms;
    draw: Tsg_frame_stats_d3d11_draw;
    num_map: Tuint32_t;
    num_unmap: Tuint32_t;
  end;
  Psg_frame_stats_d3d11 = ^Tsg_frame_stats_d3d11;

  Tsg_frame_stats_metal_idpool = record
    num_added: Tuint32_t;
    num_released: Tuint32_t;
    num_garbage_collected: Tuint32_t;
  end;
  Psg_frame_stats_metal_idpool = ^Tsg_frame_stats_metal_idpool;

  Tsg_frame_stats_metal_pipeline = record
    num_set_blend_color: Tuint32_t;
    num_set_cull_mode: Tuint32_t;
    num_set_front_facing_winding: Tuint32_t;
    num_set_stencil_reference_value: Tuint32_t;
    num_set_depth_bias: Tuint32_t;
    num_set_render_pipeline_state: Tuint32_t;
    num_set_depth_stencil_state: Tuint32_t;
  end;
  Psg_frame_stats_metal_pipeline = ^Tsg_frame_stats_metal_pipeline;

  Tsg_frame_stats_metal_bindings = record
    num_set_vertex_buffer: Tuint32_t;
    num_set_vertex_buffer_offset: Tuint32_t;
    num_skip_redundant_vertex_buffer: Tuint32_t;
    num_set_vertex_texture: Tuint32_t;
    num_skip_redundant_vertex_texture: Tuint32_t;
    num_set_vertex_sampler_state: Tuint32_t;
    num_skip_redundant_vertex_sampler_state: Tuint32_t;
    num_set_fragment_buffer: Tuint32_t;
    num_set_fragment_buffer_offset: Tuint32_t;
    num_skip_redundant_fragment_buffer: Tuint32_t;
    num_set_fragment_texture: Tuint32_t;
    num_skip_redundant_fragment_texture: Tuint32_t;
    num_set_fragment_sampler_state: Tuint32_t;
    num_skip_redundant_fragment_sampler_state: Tuint32_t;
    num_set_compute_buffer: Tuint32_t;
    num_set_compute_buffer_offset: Tuint32_t;
    num_skip_redundant_compute_buffer: Tuint32_t;
    num_set_compute_texture: Tuint32_t;
    num_skip_redundant_compute_texture: Tuint32_t;
    num_set_compute_sampler_state: Tuint32_t;
    num_skip_redundant_compute_sampler_state: Tuint32_t;
  end;
  Psg_frame_stats_metal_bindings = ^Tsg_frame_stats_metal_bindings;

  Tsg_frame_stats_metal_uniforms = record
    num_set_vertex_buffer_offset: Tuint32_t;
    num_set_fragment_buffer_offset: Tuint32_t;
    num_set_compute_buffer_offset: Tuint32_t;
  end;
  Psg_frame_stats_metal_uniforms = ^Tsg_frame_stats_metal_uniforms;

  Tsg_frame_stats_metal = record
    idpool: Tsg_frame_stats_metal_idpool;
    pipeline: Tsg_frame_stats_metal_pipeline;
    bindings: Tsg_frame_stats_metal_bindings;
    uniforms: Tsg_frame_stats_metal_uniforms;
  end;
  Psg_frame_stats_metal = ^Tsg_frame_stats_metal;

  Tsg_frame_stats_wgpu_uniforms = record
    num_set_bindgroup: Tuint32_t;
    size_write_buffer: Tuint32_t;
  end;
  Psg_frame_stats_wgpu_uniforms = ^Tsg_frame_stats_wgpu_uniforms;

  Tsg_frame_stats_wgpu_bindings = record
    num_set_vertex_buffer: Tuint32_t;
    num_skip_redundant_vertex_buffer: Tuint32_t;
    num_set_index_buffer: Tuint32_t;
    num_skip_redundant_index_buffer: Tuint32_t;
    num_create_bindgroup: Tuint32_t;
    num_discard_bindgroup: Tuint32_t;
    num_set_bindgroup: Tuint32_t;
    num_skip_redundant_bindgroup: Tuint32_t;
    num_bindgroup_cache_hits: Tuint32_t;
    num_bindgroup_cache_misses: Tuint32_t;
    num_bindgroup_cache_collisions: Tuint32_t;
    num_bindgroup_cache_invalidates: Tuint32_t;
    num_bindgroup_cache_hash_vs_key_mismatch: Tuint32_t;
  end;
  Psg_frame_stats_wgpu_bindings = ^Tsg_frame_stats_wgpu_bindings;

  Tsg_frame_stats_wgpu = record
    uniforms: Tsg_frame_stats_wgpu_uniforms;
    bindings: Tsg_frame_stats_wgpu_bindings;
  end;
  Psg_frame_stats_wgpu = ^Tsg_frame_stats_wgpu;

  Tsg_frame_stats_vk = record
    num_cmd_pipeline_barrier: Tuint32_t;
    num_allocate_memory: Tuint32_t;
    num_free_memory: Tuint32_t;
    size_allocate_memory: Tuint32_t;
    num_delete_queue_added: Tuint32_t;
    num_delete_queue_collected: Tuint32_t;
    num_cmd_copy_buffer: Tuint32_t;
    num_cmd_copy_buffer_to_image: Tuint32_t;
    num_cmd_set_descriptor_buffer_offsets: Tuint32_t;
    size_descriptor_buffer_writes: Tuint32_t;
  end;
  Psg_frame_stats_vk = ^Tsg_frame_stats_vk;

  Tsg_frame_resource_stats = record
    allocated: Tuint32_t;
    deallocated: Tuint32_t;
    inited: Tuint32_t;
    uninited: Tuint32_t;
  end;
  Psg_frame_resource_stats = ^Tsg_frame_resource_stats;

  Tsg_total_resource_stats = record
    alive: Tuint32_t;
    free: Tuint32_t;
    allocated: Tuint32_t;
    deallocated: Tuint32_t;
    inited: Tuint32_t;
    uninited: Tuint32_t;
  end;
  Psg_total_resource_stats = ^Tsg_total_resource_stats;

  Tsg_total_stats = record
    buffers: Tsg_total_resource_stats;
    images: Tsg_total_resource_stats;
    samplers: Tsg_total_resource_stats;
    views: Tsg_total_resource_stats;
    shaders: Tsg_total_resource_stats;
    pipelines: Tsg_total_resource_stats;
  end;
  Psg_total_stats = ^Tsg_total_stats;

  Tsg_frame_stats = record
    frame_index: Tuint32_t;
    num_passes: Tuint32_t;
    num_apply_viewport: Tuint32_t;
    num_apply_scissor_rect: Tuint32_t;
    num_apply_pipeline: Tuint32_t;
    num_apply_bindings: Tuint32_t;
    num_apply_uniforms: Tuint32_t;
    num_draw: Tuint32_t;
    num_draw_ex: Tuint32_t;
    num_dispatch: Tuint32_t;
    num_update_buffer: Tuint32_t;
    num_append_buffer: Tuint32_t;
    num_update_image: Tuint32_t;
    size_apply_uniforms: Tuint32_t;
    size_update_buffer: Tuint32_t;
    size_append_buffer: Tuint32_t;
    size_update_image: Tuint32_t;
    buffers: Tsg_frame_resource_stats;
    images: Tsg_frame_resource_stats;
    samplers: Tsg_frame_resource_stats;
    views: Tsg_frame_resource_stats;
    shaders: Tsg_frame_resource_stats;
    pipelines: Tsg_frame_resource_stats;
    gl: Tsg_frame_stats_gl;
    d3d11: Tsg_frame_stats_d3d11;
    metal: Tsg_frame_stats_metal;
    wgpu: Tsg_frame_stats_wgpu;
    vk: Tsg_frame_stats_vk;
  end;
  Psg_frame_stats = ^Tsg_frame_stats;

  Tsg_stats = record
    prev_frame: Tsg_frame_stats;
    cur_frame: Tsg_frame_stats;
    total: Tsg_total_stats;
  end;
  Psg_stats = ^Tsg_stats;

  Tsg_environment_defaults = record
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    sample_count: longint;
  end;
  Psg_environment_defaults = ^Tsg_environment_defaults;

  Tsg_metal_environment = record
    device: pointer;
  end;
  Psg_metal_environment = ^Tsg_metal_environment;

  Tsg_d3d11_environment = record
    device: pointer;
    device_context: pointer;
  end;
  Psg_d3d11_environment = ^Tsg_d3d11_environment;

  Tsg_wgpu_environment = record
    device: pointer;
  end;
  Psg_wgpu_environment = ^Tsg_wgpu_environment;

  Tsg_vulkan_environment = record
    instance: pointer;
    physical_device: pointer;
    device: pointer;
    queue: pointer;
    queue_family_index: Tuint32_t;
  end;
  Psg_vulkan_environment = ^Tsg_vulkan_environment;

  Tsg_environment = record
    defaults: Tsg_environment_defaults;
    metal: Tsg_metal_environment;
    d3d11: Tsg_d3d11_environment;
    wgpu: Tsg_wgpu_environment;
    vulkan: Tsg_vulkan_environment;
  end;
  Psg_environment = ^Tsg_environment;

  Tsg_commit_listener = record
    func: procedure(user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psg_commit_listener = ^Tsg_commit_listener;

  Tsg_allocator = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psg_allocator = ^Tsg_allocator;

  Tsg_logger = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psg_logger = ^Tsg_logger;

  Tsg_d3d11_desc = record
    shader_debugging: boolean;
  end;
  Psg_d3d11_desc = ^Tsg_d3d11_desc;

  Tsg_metal_desc = record
    force_managed_storage_mode: boolean;
    use_command_buffer_with_retained_references: boolean;
  end;
  Psg_metal_desc = ^Tsg_metal_desc;

  Tsg_wgpu_desc = record
    disable_bindgroups_cache: boolean;
    bindgroups_cache_size: longint;
  end;
  Psg_wgpu_desc = ^Tsg_wgpu_desc;

  Tsg_vulkan_desc = record
    copy_staging_buffer_size: longint;
    stream_staging_buffer_size: longint;
    descriptor_buffer_size: longint;
  end;
  Psg_vulkan_desc = ^Tsg_vulkan_desc;

  Tsg_desc = record
    _start_canary: Tuint32_t;
    buffer_pool_size: longint;
    image_pool_size: longint;
    sampler_pool_size: longint;
    shader_pool_size: longint;
    pipeline_pool_size: longint;
    view_pool_size: longint;
    uniform_buffer_size: longint;
    max_commit_listeners: longint;
    disable_validation: boolean;
    enforce_portable_limits: boolean;
    d3d11: Tsg_d3d11_desc;
    metal: Tsg_metal_desc;
    wgpu: Tsg_wgpu_desc;
    vulkan: Tsg_vulkan_desc;
    allocator: Tsg_allocator;
    logger: Tsg_logger;
    environment: Tsg_environment;
    _end_canary: Tuint32_t;
  end;
  Psg_desc = ^Tsg_desc;

procedure sg_setup(desc: Psg_desc); cdecl; external libsokol;
procedure sg_shutdown; cdecl; external libsokol;
function sg_isvalid: boolean; cdecl; external libsokol;
procedure sg_reset_state_cache; cdecl; external libsokol;
function sg_install_trace_hooks(trace_hooks: Psg_trace_hooks): Tsg_trace_hooks; cdecl; external libsokol;
procedure sg_push_debug_group(name: pchar); cdecl; external libsokol;
procedure sg_pop_debug_group; cdecl; external libsokol;
function sg_add_commit_listener(listener: Tsg_commit_listener): boolean; cdecl; external libsokol;
function sg_remove_commit_listener(listener: Tsg_commit_listener): boolean; cdecl; external libsokol;

function sg_make_buffer(desc: Psg_buffer_desc): Tsg_buffer; cdecl; external libsokol;
function sg_make_image(desc: Psg_image_desc): Tsg_image; cdecl; external libsokol;
function sg_make_sampler(desc: Psg_sampler_desc): Tsg_sampler; cdecl; external libsokol;
function sg_make_shader(desc: Psg_shader_desc): Tsg_shader; cdecl; external libsokol;
function sg_make_pipeline(desc: Psg_pipeline_desc): Tsg_pipeline; cdecl; external libsokol;
function sg_make_view(desc: Psg_view_desc): Tsg_view; cdecl; external libsokol;
procedure sg_destroy_buffer(buf: Tsg_buffer); cdecl; external libsokol;
procedure sg_destroy_image(img: Tsg_image); cdecl; external libsokol;
procedure sg_destroy_sampler(smp: Tsg_sampler); cdecl; external libsokol;
procedure sg_destroy_shader(shd: Tsg_shader); cdecl; external libsokol;
procedure sg_destroy_pipeline(pip: Tsg_pipeline); cdecl; external libsokol;
procedure sg_destroy_view(view: Tsg_view); cdecl; external libsokol;
procedure sg_update_buffer(buf: Tsg_buffer; data: Psg_range); cdecl; external libsokol;
procedure sg_update_image(img: Tsg_image; data: Psg_image_data); cdecl; external libsokol;
function sg_append_buffer(buf: Tsg_buffer; data: Psg_range): longint; cdecl; external libsokol;
function sg_query_buffer_overflow(buf: Tsg_buffer): boolean; cdecl; external libsokol;
function sg_query_buffer_will_overflow(buf: Tsg_buffer; size: Tsize_t): boolean; cdecl; external libsokol;

procedure sg_begin_pass(pass: Psg_pass); cdecl; external libsokol;
procedure sg_apply_viewport(x: longint; y: longint; width: longint; height: longint; origin_top_left: boolean); cdecl; external libsokol;
procedure sg_apply_viewportf(x: single; y: single; width: single; height: single; origin_top_left: boolean); cdecl; external libsokol;
procedure sg_apply_scissor_rect(x: longint; y: longint; width: longint; height: longint; origin_top_left: boolean); cdecl; external libsokol;
procedure sg_apply_scissor_rectf(x: single; y: single; width: single; height: single; origin_top_left: boolean); cdecl; external libsokol;
procedure sg_apply_pipeline(pip: Tsg_pipeline); cdecl; external libsokol;
procedure sg_apply_bindings(bindings: Psg_bindings); cdecl; external libsokol;
procedure sg_apply_uniforms(ub_slot: longint; data: Psg_range); cdecl; external libsokol;
procedure sg_draw(base_element: longint; num_elements: longint; num_instances: longint); cdecl; external libsokol;
procedure sg_draw_ex(base_element: longint; num_elements: longint; num_instances: longint; base_vertex: longint; base_instance: longint); cdecl; external libsokol;
procedure sg_dispatch(num_groups_x: longint; num_groups_y: longint; num_groups_z: longint); cdecl; external libsokol;
procedure sg_end_pass; cdecl; external libsokol;
procedure sg_commit; cdecl; external libsokol;

function sg_query_desc: Tsg_desc; cdecl; external libsokol;
function sg_query_backend: Tsg_backend; cdecl; external libsokol;
function sg_query_features: Tsg_features; cdecl; external libsokol;
function sg_query_limits: Tsg_limits; cdecl; external libsokol;
function sg_query_pixelformat(fmt: Tsg_pixel_format): Tsg_pixelformat_info; cdecl; external libsokol;
function sg_query_row_pitch(fmt: Tsg_pixel_format; width: longint; row_align_bytes: longint): longint; cdecl; external libsokol;
function sg_query_surface_pitch(fmt: Tsg_pixel_format; width: longint; height: longint; row_align_bytes: longint): longint; cdecl; external libsokol;

function sg_query_buffer_state(buf: Tsg_buffer): Tsg_resource_state; cdecl; external libsokol;
function sg_query_image_state(img: Tsg_image): Tsg_resource_state; cdecl; external libsokol;
function sg_query_sampler_state(smp: Tsg_sampler): Tsg_resource_state; cdecl; external libsokol;
function sg_query_shader_state(shd: Tsg_shader): Tsg_resource_state; cdecl; external libsokol;
function sg_query_pipeline_state(pip: Tsg_pipeline): Tsg_resource_state; cdecl; external libsokol;
function sg_query_view_state(view: Tsg_view): Tsg_resource_state; cdecl; external libsokol;

function sg_query_buffer_info(buf: Tsg_buffer): Tsg_buffer_info; cdecl; external libsokol;
function sg_query_image_info(img: Tsg_image): Tsg_image_info; cdecl; external libsokol;
function sg_query_sampler_info(smp: Tsg_sampler): Tsg_sampler_info; cdecl; external libsokol;
function sg_query_shader_info(shd: Tsg_shader): Tsg_shader_info; cdecl; external libsokol;
function sg_query_pipeline_info(pip: Tsg_pipeline): Tsg_pipeline_info; cdecl; external libsokol;
function sg_query_view_info(view: Tsg_view): Tsg_view_info; cdecl; external libsokol;

function sg_query_buffer_desc(buf: Tsg_buffer): Tsg_buffer_desc; cdecl; external libsokol;
function sg_query_image_desc(img: Tsg_image): Tsg_image_desc; cdecl; external libsokol;
function sg_query_sampler_desc(smp: Tsg_sampler): Tsg_sampler_desc; cdecl; external libsokol;
function sg_query_shader_desc(shd: Tsg_shader): Tsg_shader_desc; cdecl; external libsokol;
function sg_query_pipeline_desc(pip: Tsg_pipeline): Tsg_pipeline_desc; cdecl; external libsokol;
function sg_query_view_desc(view: Tsg_view): Tsg_view_desc; cdecl; external libsokol;

function sg_query_buffer_defaults(desc: Psg_buffer_desc): Tsg_buffer_desc; cdecl; external libsokol;
function sg_query_image_defaults(desc: Psg_image_desc): Tsg_image_desc; cdecl; external libsokol;
function sg_query_sampler_defaults(desc: Psg_sampler_desc): Tsg_sampler_desc; cdecl; external libsokol;
function sg_query_shader_defaults(desc: Psg_shader_desc): Tsg_shader_desc; cdecl; external libsokol;
function sg_query_pipeline_defaults(desc: Psg_pipeline_desc): Tsg_pipeline_desc; cdecl; external libsokol;
function sg_query_view_defaults(desc: Psg_view_desc): Tsg_view_desc; cdecl; external libsokol;

function sg_query_buffer_size(buf: Tsg_buffer): Tsize_t; cdecl; external libsokol;
function sg_query_buffer_usage(buf: Tsg_buffer): Tsg_buffer_usage; cdecl; external libsokol;
function sg_query_image_type(img: Tsg_image): Tsg_image_type; cdecl; external libsokol;
function sg_query_image_width(img: Tsg_image): longint; cdecl; external libsokol;
function sg_query_image_height(img: Tsg_image): longint; cdecl; external libsokol;
function sg_query_image_num_slices(img: Tsg_image): longint; cdecl; external libsokol;
function sg_query_image_num_mipmaps(img: Tsg_image): longint; cdecl; external libsokol;
function sg_query_image_pixelformat(img: Tsg_image): Tsg_pixel_format; cdecl; external libsokol;
function sg_query_image_usage(img: Tsg_image): Tsg_image_usage; cdecl; external libsokol;
function sg_query_image_sample_count(img: Tsg_image): longint; cdecl; external libsokol;
function sg_query_view_type(view: Tsg_view): Tsg_view_type; cdecl; external libsokol;
function sg_query_view_image(view: Tsg_view): Tsg_image; cdecl; external libsokol;
function sg_query_view_buffer(view: Tsg_view): Tsg_buffer; cdecl; external libsokol;

function sg_alloc_buffer: Tsg_buffer; cdecl; external libsokol;
function sg_alloc_image: Tsg_image; cdecl; external libsokol;
function sg_alloc_sampler: Tsg_sampler; cdecl; external libsokol;
function sg_alloc_shader: Tsg_shader; cdecl; external libsokol;
function sg_alloc_pipeline: Tsg_pipeline; cdecl; external libsokol;
function sg_alloc_view: Tsg_view; cdecl; external libsokol;
procedure sg_dealloc_buffer(buf: Tsg_buffer); cdecl; external libsokol;
procedure sg_dealloc_image(img: Tsg_image); cdecl; external libsokol;
procedure sg_dealloc_sampler(smp: Tsg_sampler); cdecl; external libsokol;
procedure sg_dealloc_shader(shd: Tsg_shader); cdecl; external libsokol;
procedure sg_dealloc_pipeline(pip: Tsg_pipeline); cdecl; external libsokol;
procedure sg_dealloc_view(view: Tsg_view); cdecl; external libsokol;
procedure sg_init_buffer(buf: Tsg_buffer; desc: Psg_buffer_desc); cdecl; external libsokol;
procedure sg_init_image(img: Tsg_image; desc: Psg_image_desc); cdecl; external libsokol;
procedure sg_init_sampler(smg: Tsg_sampler; desc: Psg_sampler_desc); cdecl; external libsokol;
procedure sg_init_shader(shd: Tsg_shader; desc: Psg_shader_desc); cdecl; external libsokol;
procedure sg_init_pipeline(pip: Tsg_pipeline; desc: Psg_pipeline_desc); cdecl; external libsokol;
procedure sg_init_view(view: Tsg_view; desc: Psg_view_desc); cdecl; external libsokol;
procedure sg_uninit_buffer(buf: Tsg_buffer); cdecl; external libsokol;
procedure sg_uninit_image(img: Tsg_image); cdecl; external libsokol;
procedure sg_uninit_sampler(smp: Tsg_sampler); cdecl; external libsokol;
procedure sg_uninit_shader(shd: Tsg_shader); cdecl; external libsokol;
procedure sg_uninit_pipeline(pip: Tsg_pipeline); cdecl; external libsokol;
procedure sg_uninit_view(view: Tsg_view); cdecl; external libsokol;
procedure sg_fail_buffer(buf: Tsg_buffer); cdecl; external libsokol;
procedure sg_fail_image(img: Tsg_image); cdecl; external libsokol;
procedure sg_fail_sampler(smp: Tsg_sampler); cdecl; external libsokol;
procedure sg_fail_shader(shd: Tsg_shader); cdecl; external libsokol;
procedure sg_fail_pipeline(pip: Tsg_pipeline); cdecl; external libsokol;
procedure sg_fail_view(view: Tsg_view); cdecl; external libsokol;

procedure sg_enable_stats; cdecl; external libsokol;
procedure sg_disable_stats; cdecl; external libsokol;
function sg_stats_enabled: boolean; cdecl; external libsokol;
function sg_query_stats: Tsg_stats; cdecl; external libsokol;

type
  Tsg_d3d11_buffer_info = record
    buf: pointer;
  end;
  Psg_d3d11_buffer_info = ^Tsg_d3d11_buffer_info;

  Tsg_d3d11_image_info = record
    tex2d: pointer;
    tex3d: pointer;
    res: pointer;
  end;
  Psg_d3d11_image_info = ^Tsg_d3d11_image_info;

  Tsg_d3d11_sampler_info = record
    smp: pointer;
  end;
  Psg_d3d11_sampler_info = ^Tsg_d3d11_sampler_info;

  Tsg_d3d11_shader_info = record
    cbufs: array[0..(SG_MAX_UNIFORMBLOCK_BINDSLOTS) - 1] of pointer;
    vs: pointer;
    fs: pointer;
  end;
  Psg_d3d11_shader_info = ^Tsg_d3d11_shader_info;

  Tsg_d3d11_pipeline_info = record
    il: pointer;
    rs: pointer;
    dss: pointer;
    bs: pointer;
  end;
  Psg_d3d11_pipeline_info = ^Tsg_d3d11_pipeline_info;

  Tsg_d3d11_view_info = record
    srv: pointer;
    uav: pointer;
    rtv: pointer;
    dsv: pointer;
  end;
  Psg_d3d11_view_info = ^Tsg_d3d11_view_info;

  Tsg_mtl_buffer_info = record
    buf: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of pointer;
    active_slot: longint;
  end;
  Psg_mtl_buffer_info = ^Tsg_mtl_buffer_info;

  Tsg_mtl_image_info = record
    tex: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of pointer;
    active_slot: longint;
  end;
  Psg_mtl_image_info = ^Tsg_mtl_image_info;

  Tsg_mtl_sampler_info = record
    smp: pointer;
  end;
  Psg_mtl_sampler_info = ^Tsg_mtl_sampler_info;

  Tsg_mtl_shader_info = record
    vertex_lib: pointer;
    fragment_lib: pointer;
    vertex_func: pointer;
    fragment_func: pointer;
  end;
  Psg_mtl_shader_info = ^Tsg_mtl_shader_info;

  Tsg_mtl_pipeline_info = record
    rps: pointer;
    dss: pointer;
  end;
  Psg_mtl_pipeline_info = ^Tsg_mtl_pipeline_info;

  Tsg_wgpu_buffer_info = record
    buf: pointer;
  end;
  Psg_wgpu_buffer_info = ^Tsg_wgpu_buffer_info;

  Tsg_wgpu_image_info = record
    tex: pointer;
  end;
  Psg_wgpu_image_info = ^Tsg_wgpu_image_info;

  Tsg_wgpu_sampler_info = record
    smp: pointer;
  end;
  Psg_wgpu_sampler_info = ^Tsg_wgpu_sampler_info;

  Tsg_wgpu_shader_info = record
    vs_mod: pointer;
    fs_mod: pointer;
    bgl: pointer;
  end;
  Psg_wgpu_shader_info = ^Tsg_wgpu_shader_info;

  Tsg_wgpu_pipeline_info = record
    render_pipeline: pointer;
    compute_pipeline: pointer;
  end;
  Psg_wgpu_pipeline_info = ^Tsg_wgpu_pipeline_info;

  Tsg_wgpu_view_info = record
    view: pointer;
  end;
  Psg_wgpu_view_info = ^Tsg_wgpu_view_info;

  Tsg_gl_buffer_info = record
    buf: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of Tuint32_t;
    active_slot: longint;
  end;
  Psg_gl_buffer_info = ^Tsg_gl_buffer_info;

  Tsg_gl_image_info = record
    tex: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of Tuint32_t;
    tex_target: Tuint32_t;
    active_slot: longint;
  end;
  Psg_gl_image_info = ^Tsg_gl_image_info;

  Tsg_gl_sampler_info = record
    smp: Tuint32_t;
  end;
  Psg_gl_sampler_info = ^Tsg_gl_sampler_info;

  Tsg_gl_shader_info = record
    prog: Tuint32_t;
  end;
  Psg_gl_shader_info = ^Tsg_gl_shader_info;

  Tsg_gl_view_info = record
    tex_view: array[0..(SG_NUM_INFLIGHT_FRAMES) - 1] of Tuint32_t;
    msaa_render_buffer: Tuint32_t;
    msaa_resolve_frame_buffer: Tuint32_t;
  end;
  Psg_gl_view_info = ^Tsg_gl_view_info;

function sg_d3d11_device: pointer; cdecl; external libsokol;
function sg_d3d11_device_context: pointer; cdecl; external libsokol;
function sg_d3d11_query_buffer_info(buf: Tsg_buffer): Tsg_d3d11_buffer_info; cdecl; external libsokol;
function sg_d3d11_query_image_info(img: Tsg_image): Tsg_d3d11_image_info; cdecl; external libsokol;
function sg_d3d11_query_sampler_info(smp: Tsg_sampler): Tsg_d3d11_sampler_info; cdecl; external libsokol;
function sg_d3d11_query_shader_info(shd: Tsg_shader): Tsg_d3d11_shader_info; cdecl; external libsokol;
function sg_d3d11_query_pipeline_info(pip: Tsg_pipeline): Tsg_d3d11_pipeline_info; cdecl; external libsokol;
function sg_d3d11_query_view_info(view: Tsg_view): Tsg_d3d11_view_info; cdecl; external libsokol;
function sg_mtl_device: pointer; cdecl; external libsokol;
function sg_mtl_render_command_encoder: pointer; cdecl; external libsokol;
function sg_mtl_compute_command_encoder: pointer; cdecl; external libsokol;
function sg_mtl_command_queue: pointer; cdecl; external libsokol;
function sg_mtl_query_buffer_info(buf: Tsg_buffer): Tsg_mtl_buffer_info; cdecl; external libsokol;
function sg_mtl_query_image_info(img: Tsg_image): Tsg_mtl_image_info; cdecl; external libsokol;
function sg_mtl_query_sampler_info(smp: Tsg_sampler): Tsg_mtl_sampler_info; cdecl; external libsokol;
function sg_mtl_query_shader_info(shd: Tsg_shader): Tsg_mtl_shader_info; cdecl; external libsokol;
function sg_mtl_query_pipeline_info(pip: Tsg_pipeline): Tsg_mtl_pipeline_info; cdecl; external libsokol;
function sg_wgpu_device: pointer; cdecl; external libsokol;
function sg_wgpu_queue: pointer; cdecl; external libsokol;
function sg_wgpu_command_encoder: pointer; cdecl; external libsokol;
function sg_wgpu_render_pass_encoder: pointer; cdecl; external libsokol;
function sg_wgpu_compute_pass_encoder: pointer; cdecl; external libsokol;
function sg_wgpu_query_buffer_info(buf: Tsg_buffer): Tsg_wgpu_buffer_info; cdecl; external libsokol;
function sg_wgpu_query_image_info(img: Tsg_image): Tsg_wgpu_image_info; cdecl; external libsokol;
function sg_wgpu_query_sampler_info(smp: Tsg_sampler): Tsg_wgpu_sampler_info; cdecl; external libsokol;
function sg_wgpu_query_shader_info(shd: Tsg_shader): Tsg_wgpu_shader_info; cdecl; external libsokol;
function sg_wgpu_query_pipeline_info(pip: Tsg_pipeline): Tsg_wgpu_pipeline_info; cdecl; external libsokol;
function sg_wgpu_query_view_info(view: Tsg_view): Tsg_wgpu_view_info; cdecl; external libsokol;
function sg_gl_query_buffer_info(buf: Tsg_buffer): Tsg_gl_buffer_info; cdecl; external libsokol;
function sg_gl_query_image_info(img: Tsg_image): Tsg_gl_image_info; cdecl; external libsokol;
function sg_gl_query_sampler_info(smp: Tsg_sampler): Tsg_gl_sampler_info; cdecl; external libsokol;
function sg_gl_query_shader_info(shd: Tsg_shader): Tsg_gl_shader_info; cdecl; external libsokol;
function sg_gl_query_view_info(view: Tsg_view): Tsg_gl_view_info; cdecl; external libsokol;

// === Konventiert am: 22-3-26 16:22:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
