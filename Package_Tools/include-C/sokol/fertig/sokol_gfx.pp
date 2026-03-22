
unit sokol_gfx;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_gfx.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_gfx.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Psg_allocator  = ^sg_allocator;
Psg_attachments  = ^sg_attachments;
Psg_backend  = ^sg_backend;
Psg_bindings  = ^sg_bindings;
Psg_blend_factor  = ^sg_blend_factor;
Psg_blend_op  = ^sg_blend_op;
Psg_blend_state  = ^sg_blend_state;
Psg_border_color  = ^sg_border_color;
Psg_buffer  = ^sg_buffer;
Psg_buffer_desc  = ^sg_buffer_desc;
Psg_buffer_info  = ^sg_buffer_info;
Psg_buffer_usage  = ^sg_buffer_usage;
Psg_buffer_view_desc  = ^sg_buffer_view_desc;
Psg_color  = ^sg_color;
Psg_color_attachment_action  = ^sg_color_attachment_action;
Psg_color_mask  = ^sg_color_mask;
Psg_color_target_state  = ^sg_color_target_state;
Psg_commit_listener  = ^sg_commit_listener;
Psg_compare_func  = ^sg_compare_func;
Psg_cull_mode  = ^sg_cull_mode;
Psg_d3d11_buffer_info  = ^sg_d3d11_buffer_info;
Psg_d3d11_desc  = ^sg_d3d11_desc;
Psg_d3d11_environment  = ^sg_d3d11_environment;
Psg_d3d11_image_info  = ^sg_d3d11_image_info;
Psg_d3d11_pipeline_info  = ^sg_d3d11_pipeline_info;
Psg_d3d11_sampler_info  = ^sg_d3d11_sampler_info;
Psg_d3d11_shader_info  = ^sg_d3d11_shader_info;
Psg_d3d11_swapchain  = ^sg_d3d11_swapchain;
Psg_d3d11_view_info  = ^sg_d3d11_view_info;
Psg_depth_attachment_action  = ^sg_depth_attachment_action;
Psg_depth_state  = ^sg_depth_state;
Psg_desc  = ^sg_desc;
Psg_environment  = ^sg_environment;
Psg_environment_defaults  = ^sg_environment_defaults;
Psg_face_winding  = ^sg_face_winding;
Psg_features  = ^sg_features;
Psg_filter  = ^sg_filter;
Psg_frame_resource_stats  = ^sg_frame_resource_stats;
Psg_frame_stats  = ^sg_frame_stats;
Psg_frame_stats_d3d11  = ^sg_frame_stats_d3d11;
Psg_frame_stats_d3d11_bindings  = ^sg_frame_stats_d3d11_bindings;
Psg_frame_stats_d3d11_draw  = ^sg_frame_stats_d3d11_draw;
Psg_frame_stats_d3d11_pass  = ^sg_frame_stats_d3d11_pass;
Psg_frame_stats_d3d11_pipeline  = ^sg_frame_stats_d3d11_pipeline;
Psg_frame_stats_d3d11_uniforms  = ^sg_frame_stats_d3d11_uniforms;
Psg_frame_stats_gl  = ^sg_frame_stats_gl;
Psg_frame_stats_metal  = ^sg_frame_stats_metal;
Psg_frame_stats_metal_bindings  = ^sg_frame_stats_metal_bindings;
Psg_frame_stats_metal_idpool  = ^sg_frame_stats_metal_idpool;
Psg_frame_stats_metal_pipeline  = ^sg_frame_stats_metal_pipeline;
Psg_frame_stats_metal_uniforms  = ^sg_frame_stats_metal_uniforms;
Psg_frame_stats_vk  = ^sg_frame_stats_vk;
Psg_frame_stats_wgpu  = ^sg_frame_stats_wgpu;
Psg_frame_stats_wgpu_bindings  = ^sg_frame_stats_wgpu_bindings;
Psg_frame_stats_wgpu_uniforms  = ^sg_frame_stats_wgpu_uniforms;
Psg_gl_buffer_info  = ^sg_gl_buffer_info;
Psg_gl_image_info  = ^sg_gl_image_info;
Psg_gl_sampler_info  = ^sg_gl_sampler_info;
Psg_gl_shader_info  = ^sg_gl_shader_info;
Psg_gl_swapchain  = ^sg_gl_swapchain;
Psg_gl_view_info  = ^sg_gl_view_info;
Psg_glsl_shader_uniform  = ^sg_glsl_shader_uniform;
Psg_image  = ^sg_image;
Psg_image_data  = ^sg_image_data;
Psg_image_desc  = ^sg_image_desc;
Psg_image_info  = ^sg_image_info;
Psg_image_sample_type  = ^sg_image_sample_type;
Psg_image_type  = ^sg_image_type;
Psg_image_usage  = ^sg_image_usage;
Psg_image_view_desc  = ^sg_image_view_desc;
Psg_index_type  = ^sg_index_type;
Psg_limits  = ^sg_limits;
Psg_load_action  = ^sg_load_action;
Psg_logger  = ^sg_logger;
Psg_metal_desc  = ^sg_metal_desc;
Psg_metal_environment  = ^sg_metal_environment;
Psg_metal_swapchain  = ^sg_metal_swapchain;
Psg_mtl_buffer_info  = ^sg_mtl_buffer_info;
Psg_mtl_image_info  = ^sg_mtl_image_info;
Psg_mtl_pipeline_info  = ^sg_mtl_pipeline_info;
Psg_mtl_sampler_info  = ^sg_mtl_sampler_info;
Psg_mtl_shader_info  = ^sg_mtl_shader_info;
Psg_mtl_shader_threads_per_threadgroup  = ^sg_mtl_shader_threads_per_threadgroup;
Psg_pass  = ^sg_pass;
Psg_pass_action  = ^sg_pass_action;
Psg_pipeline  = ^sg_pipeline;
Psg_pipeline_desc  = ^sg_pipeline_desc;
Psg_pipeline_info  = ^sg_pipeline_info;
Psg_pixel_format  = ^sg_pixel_format;
Psg_pixelformat_info  = ^sg_pixelformat_info;
Psg_primitive_type  = ^sg_primitive_type;
Psg_range  = ^sg_range;
Psg_resource_state  = ^sg_resource_state;
Psg_sampler  = ^sg_sampler;
Psg_sampler_desc  = ^sg_sampler_desc;
Psg_sampler_info  = ^sg_sampler_info;
Psg_sampler_type  = ^sg_sampler_type;
Psg_shader  = ^sg_shader;
Psg_shader_attr_base_type  = ^sg_shader_attr_base_type;
Psg_shader_desc  = ^sg_shader_desc;
Psg_shader_function  = ^sg_shader_function;
Psg_shader_info  = ^sg_shader_info;
Psg_shader_sampler  = ^sg_shader_sampler;
Psg_shader_stage  = ^sg_shader_stage;
Psg_shader_storage_buffer_view  = ^sg_shader_storage_buffer_view;
Psg_shader_storage_image_view  = ^sg_shader_storage_image_view;
Psg_shader_texture_sampler_pair  = ^sg_shader_texture_sampler_pair;
Psg_shader_texture_view  = ^sg_shader_texture_view;
Psg_shader_uniform_block  = ^sg_shader_uniform_block;
Psg_shader_vertex_attr  = ^sg_shader_vertex_attr;
Psg_shader_view  = ^sg_shader_view;
Psg_slot_info  = ^sg_slot_info;
Psg_stats  = ^sg_stats;
Psg_stencil_attachment_action  = ^sg_stencil_attachment_action;
Psg_stencil_face_state  = ^sg_stencil_face_state;
Psg_stencil_op  = ^sg_stencil_op;
Psg_stencil_state  = ^sg_stencil_state;
Psg_store_action  = ^sg_store_action;
Psg_swapchain  = ^sg_swapchain;
Psg_texture_view_desc  = ^sg_texture_view_desc;
Psg_texture_view_range  = ^sg_texture_view_range;
Psg_total_resource_stats  = ^sg_total_resource_stats;
Psg_total_stats  = ^sg_total_stats;
Psg_trace_hooks  = ^sg_trace_hooks;
Psg_uniform_layout  = ^sg_uniform_layout;
Psg_uniform_type  = ^sg_uniform_type;
Psg_vertex_attr_state  = ^sg_vertex_attr_state;
Psg_vertex_buffer_layout_state  = ^sg_vertex_buffer_layout_state;
Psg_vertex_format  = ^sg_vertex_format;
Psg_vertex_layout_state  = ^sg_vertex_layout_state;
Psg_vertex_step  = ^sg_vertex_step;
Psg_view  = ^sg_view;
Psg_view_desc  = ^sg_view_desc;
Psg_view_info  = ^sg_view_info;
Psg_view_type  = ^sg_view_type;
Psg_vulkan_desc  = ^sg_vulkan_desc;
Psg_vulkan_environment  = ^sg_vulkan_environment;
Psg_vulkan_swapchain  = ^sg_vulkan_swapchain;
Psg_wgpu_buffer_info  = ^sg_wgpu_buffer_info;
Psg_wgpu_desc  = ^sg_wgpu_desc;
Psg_wgpu_environment  = ^sg_wgpu_environment;
Psg_wgpu_image_info  = ^sg_wgpu_image_info;
Psg_wgpu_pipeline_info  = ^sg_wgpu_pipeline_info;
Psg_wgpu_sampler_info  = ^sg_wgpu_sampler_info;
Psg_wgpu_shader_info  = ^sg_wgpu_shader_info;
Psg_wgpu_swapchain  = ^sg_wgpu_swapchain;
Psg_wgpu_view_info  = ^sg_wgpu_view_info;
Psg_wrap  = ^sg_wrap;
Pxxx  = ^xxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ C++ extern C conditionnal removed }
{
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
 }
type
  Psg_buffer = ^Tsg_buffer;
  Tsg_buffer = record
      id : Tuint32_t;
    end;

  Psg_image = ^Tsg_image;
  Tsg_image = record
      id : Tuint32_t;
    end;

  Psg_sampler = ^Tsg_sampler;
  Tsg_sampler = record
      id : Tuint32_t;
    end;

  Psg_shader = ^Tsg_shader;
  Tsg_shader = record
      id : Tuint32_t;
    end;

  Psg_pipeline = ^Tsg_pipeline;
  Tsg_pipeline = record
      id : Tuint32_t;
    end;

  Psg_view = ^Tsg_view;
  Tsg_view = record
      id : Tuint32_t;
    end;
{
    sg_range is a pointer-size-pair struct used to pass memory blobs into
    sokol-gfx. When initialized from a value type (array or struct), you can
    use the SG_RANGE() macro to build an sg_range struct. For functions which
    take either a sg_range pointer, or a (C++) sg_range reference, use the
    SG_RANGE_REF macro as a solution which compiles both in C and C++.
 }
(* Const before type ignored *)

  Psg_range = ^Tsg_range;
  Tsg_range = record
      ptr : pointer;
      size : Tsize_t;
    end;
{ various compile-time constants in the public API }
{ same as SG_MAX_VIEW_BINDSLOTS }
{ assuming sg_features.compute = true }
{ assuming sg_features.compute = true }
  Txxx =  Longint;
  Const
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

{
    sg_color

    An RGBA color value.
 }
type
  Psg_color = ^Tsg_color;
  Tsg_color = record
      r : single;
      g : single;
      b : single;
      a : single;
    end;
{
    sg_backend

    The active 3D-API backend, use the function sg_query_backend()
    to get the currently active backend.
 }

  Psg_backend = ^Tsg_backend;
  Tsg_backend =  Longint;
  Const
    SG_BACKEND_GLCORE = 0;
    SG_BACKEND_GLES3 = 1;
    SG_BACKEND_D3D11 = 2;
    SG_BACKEND_METAL_IOS = 3;
    SG_BACKEND_METAL_MACOS = 4;
    SG_BACKEND_METAL_SIMULATOR = 5;
    SG_BACKEND_WGPU = 6;
    SG_BACKEND_VULKAN = 7;
    SG_BACKEND_DUMMY = 8;
;
{ value 0 reserved for default-init }
{ NOTE: don't put any new compressed format in front of here }
type
  Psg_pixel_format = ^Tsg_pixel_format;
  Tsg_pixel_format =  Longint;
  Const
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
;
{
    Runtime information about a pixel format, returned by sg_query_pixelformat().
 }
{ pixel format can be sampled in shaders at least with nearest filtering }
{ pixel format can be sampled with linear filtering }
{ pixel format can be used as render-pass attachment }
{ pixel format supports alpha-blending when used as render-pass attachment }
{ pixel format supports MSAA when used as render-pass attachment }
{ pixel format is a depth format }
{ true if this is a hardware-compressed format }
{ true if format supports compute shader read access }
{ true if format supports compute shader write access }
{ NOTE: this is 0 for compressed formats, use sg_query_row_pitch() / sg_query_surface_pitch() as alternative }
type
  Psg_pixelformat_info = ^Tsg_pixelformat_info;
  Tsg_pixelformat_info = record
      sample : Tbool;
      filter : Tbool;
      render : Tbool;
      blend : Tbool;
      msaa : Tbool;
      depth : Tbool;
      compressed : Tbool;
      read : Tbool;
      write : Tbool;
      bytes_per_pixel : longint;
    end;
{
    Runtime information about available optional features, returned by sg_query_features()
 }
{ framebuffer- and texture-origin is in top left corner }
{ border color and clamp-to-border uv-wrap mode is supported }
{ multiple-render-target rendering can use per-render-target blend state }
{ multiple-render-target rendering can use per-render-target color write masks }
{ storage buffers and compute shaders are supported }
{ if true, multisampled images can be bound as textures }
{ cannot use the same buffer for vertex and indices (only WebGL2) }
{ draw with (base vertex > 0) && (base_instance == 0) supported }
{ draw with (base instance > 0) supported }
{ dual-source-blending supported }
{ supports 'proper' texture views (GL 4.3+) }

  Psg_features = ^Tsg_features;
  Tsg_features = record
      origin_top_left : Tbool;
      image_clamp_to_border : Tbool;
      mrt_independent_blend_state : Tbool;
      mrt_independent_write_mask : Tbool;
      compute : Tbool;
      msaa_texture_bindings : Tbool;
      separate_buffer_types : Tbool;
      draw_base_vertex : Tbool;
      draw_base_instance : Tbool;
      dual_source_blending : Tbool;
      gl_texture_views : Tbool;
    end;
{
    Runtime information about resource limits, returned by sg_query_limit()
 }
{ max width/height of SG_IMAGETYPE_2D images }
{ max width/height of SG_IMAGETYPE_CUBE images }
{ max width/height/depth of SG_IMAGETYPE_3D images }
{ max width/height of SG_IMAGETYPE_ARRAY images }
{ max number of layers in SG_IMAGETYPE_ARRAY images }
{ max number of vertex attributes, clamped to SG_MAX_VERTEX_ATTRIBUTES }
{ max number of render pass color attachments, clamped to SG_MAX_COLOR_ATTACHMENTS }
{ max number of texture bindings per shader stage, clamped to SG_MAX_VIEW_BINDSLOTS }
{ max number of storage buffer bindings per shader stage, clamped to SG_MAX_VIEW_BINDSLOTS }
{ max number of storage image bindings per shader stage, clamped to SG_MAX_VIEW_BINDSLOTS }
{ GL_MAX_VERTEX_UNIFORM_COMPONENTS (only on GL backends) }
{ GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS (only on GL backends) }
{ 8 on feature level 11.0, otherwise 32 (clamped to SG_MAX_VIEW_BINDSLOTS) }

  Psg_limits = ^Tsg_limits;
  Tsg_limits = record
      max_image_size_2d : longint;
      max_image_size_cube : longint;
      max_image_size_3d : longint;
      max_image_size_array : longint;
      max_image_array_layers : longint;
      max_vertex_attrs : longint;
      max_color_attachments : longint;
      max_texture_bindings_per_stage : longint;
      max_storage_buffer_bindings_per_stage : longint;
      max_storage_image_bindings_per_stage : longint;
      gl_max_vertex_uniform_components : longint;
      gl_max_combined_texture_image_units : longint;
      d3d11_max_unordered_access_views : longint;
      vk_min_uniform_buffer_offset_alignment : longint;
    end;
{
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
 }

  Psg_resource_state = ^Tsg_resource_state;
  Tsg_resource_state =  Longint;
  Const
    SG_RESOURCESTATE_INITIAL = 0;
    SG_RESOURCESTATE_ALLOC = 1;
    SG_RESOURCESTATE_VALID = 2;
    SG_RESOURCESTATE_FAILED = 3;
    SG_RESOURCESTATE_INVALID = 4;
    _SG_RESOURCESTATE_FORCE_U32 = $7FFFFFFF;
;
{
    sg_index_type

    Indicates whether indexed rendering (fetching vertex-indices from an
    index buffer) is used, and if yes, the index data type (16- or 32-bits).

    This is used in the sg_pipeline_desc.index_type member when creating a
    pipeline object.

    The default index type is SG_INDEXTYPE_NONE.
 }
{ value 0 reserved for default-init }
type
  Psg_index_type = ^Tsg_index_type;
  Tsg_index_type =  Longint;
  Const
    _SG_INDEXTYPE_DEFAULT = 0;
    SG_INDEXTYPE_NONE = 1;
    SG_INDEXTYPE_UINT16 = 2;
    SG_INDEXTYPE_UINT32 = 3;
    _SG_INDEXTYPE_NUM = 4;
    _SG_INDEXTYPE_FORCE_U32 = $7FFFFFFF;
;
{
    sg_image_type

    Indicates the basic type of an image object (2D-texture, cubemap,
    3D-texture or 2D-array-texture). Used in the sg_image_desc.type member when
    creating an image, and in sg_shader_image_desc to describe a sampled texture
    in the shader (both must match and will be checked in the validation layer
    when calling sg_apply_bindings).

    The default image type when creating an image is SG_IMAGETYPE_2D.
 }
{ value 0 reserved for default-init }
type
  Psg_image_type = ^Tsg_image_type;
  Tsg_image_type =  Longint;
  Const
    _SG_IMAGETYPE_DEFAULT = 0;
    SG_IMAGETYPE_2D = 1;
    SG_IMAGETYPE_CUBE = 2;
    SG_IMAGETYPE_3D = 3;
    SG_IMAGETYPE_ARRAY = 4;
    _SG_IMAGETYPE_NUM = 5;
    _SG_IMAGETYPE_FORCE_U32 = $7FFFFFFF;
;
{
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
 }
{ value 0 reserved for default-init }
type
  Psg_image_sample_type = ^Tsg_image_sample_type;
  Tsg_image_sample_type =  Longint;
  Const
    _SG_IMAGESAMPLETYPE_DEFAULT = 0;
    SG_IMAGESAMPLETYPE_FLOAT = 1;
    SG_IMAGESAMPLETYPE_DEPTH = 2;
    SG_IMAGESAMPLETYPE_SINT = 3;
    SG_IMAGESAMPLETYPE_UINT = 4;
    SG_IMAGESAMPLETYPE_UNFILTERABLE_FLOAT = 5;
    _SG_IMAGESAMPLETYPE_NUM = 6;
    _SG_IMAGESAMPLETYPE_FORCE_U32 = $7FFFFFFF;
;
{
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
 }
type
  Psg_sampler_type = ^Tsg_sampler_type;
  Tsg_sampler_type =  Longint;
  Const
    _SG_SAMPLERTYPE_DEFAULT = 0;
    SG_SAMPLERTYPE_FILTERING = 1;
    SG_SAMPLERTYPE_NONFILTERING = 2;
    SG_SAMPLERTYPE_COMPARISON = 3;
    _SG_SAMPLERTYPE_NUM = 4;
    _SG_SAMPLERTYPE_FORCE_U32 = 5;
;
{
    sg_primitive_type

    This is the common subset of 3D primitive types supported across all 3D
    APIs. This is used in the sg_pipeline_desc.primitive_type member when
    creating a pipeline object.

    The default primitive type is SG_PRIMITIVETYPE_TRIANGLES.
 }
{ value 0 reserved for default-init }
type
  Psg_primitive_type = ^Tsg_primitive_type;
  Tsg_primitive_type =  Longint;
  Const
    _SG_PRIMITIVETYPE_DEFAULT = 0;
    SG_PRIMITIVETYPE_POINTS = 1;
    SG_PRIMITIVETYPE_LINES = 2;
    SG_PRIMITIVETYPE_LINE_STRIP = 3;
    SG_PRIMITIVETYPE_TRIANGLES = 4;
    SG_PRIMITIVETYPE_TRIANGLE_STRIP = 5;
    _SG_PRIMITIVETYPE_NUM = 6;
    _SG_PRIMITIVETYPE_FORCE_U32 = $7FFFFFFF;
;
{
    sg_filter

    The filtering mode when sampling a texture image. This is
    used in the sg_sampler_desc.min_filter, sg_sampler_desc.mag_filter
    and sg_sampler_desc.mipmap_filter members when creating a sampler object.

    For the default is SG_FILTER_NEAREST.
 }
{ value 0 reserved for default-init }
type
  Psg_filter = ^Tsg_filter;
  Tsg_filter =  Longint;
  Const
    _SG_FILTER_DEFAULT = 0;
    SG_FILTER_NEAREST = 1;
    SG_FILTER_LINEAR = 2;
    _SG_FILTER_NUM = 3;
    _SG_FILTER_FORCE_U32 = $7FFFFFFF;
;
{
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
 }
{ value 0 reserved for default-init }
type
  Psg_wrap = ^Tsg_wrap;
  Tsg_wrap =  Longint;
  Const
    _SG_WRAP_DEFAULT = 0;
    SG_WRAP_REPEAT = 1;
    SG_WRAP_CLAMP_TO_EDGE = 2;
    SG_WRAP_CLAMP_TO_BORDER = 3;
    SG_WRAP_MIRRORED_REPEAT = 4;
    _SG_WRAP_NUM = 5;
    _SG_WRAP_FORCE_U32 = $7FFFFFFF;
;
{
    sg_border_color

    The border color to use when sampling a texture, and the UV wrap
    mode is SG_WRAP_CLAMP_TO_BORDER.

    The default border color is SG_BORDERCOLOR_OPAQUE_BLACK
 }
{ value 0 reserved for default-init }
type
  Psg_border_color = ^Tsg_border_color;
  Tsg_border_color =  Longint;
  Const
    _SG_BORDERCOLOR_DEFAULT = 0;
    SG_BORDERCOLOR_TRANSPARENT_BLACK = 1;
    SG_BORDERCOLOR_OPAQUE_BLACK = 2;
    SG_BORDERCOLOR_OPAQUE_WHITE = 3;
    _SG_BORDERCOLOR_NUM = 4;
    _SG_BORDERCOLOR_FORCE_U32 = $7FFFFFFF;
;
{
    sg_vertex_format

    The data type of a vertex component. This is used to describe
    the layout of input vertex data when creating a pipeline object.

    NOTE that specific mapping rules exist from the CPU-side vertex
    formats to the vertex attribute base type in the vertex shader code
    (see doc header section 'ON VERTEX FORMATS').
 }
type
  Psg_vertex_format = ^Tsg_vertex_format;
  Tsg_vertex_format =  Longint;
  Const
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
;
{
    sg_vertex_step

    Defines whether the input pointer of a vertex input stream is advanced
    'per vertex' or 'per instance'. The default step-func is
    SG_VERTEXSTEP_PER_VERTEX. SG_VERTEXSTEP_PER_INSTANCE is used with
    instanced-rendering.

    The vertex-step is part of the vertex-layout definition
    when creating pipeline objects.
 }
{ value 0 reserved for default-init }
type
  Psg_vertex_step = ^Tsg_vertex_step;
  Tsg_vertex_step =  Longint;
  Const
    _SG_VERTEXSTEP_DEFAULT = 0;
    SG_VERTEXSTEP_PER_VERTEX = 1;
    SG_VERTEXSTEP_PER_INSTANCE = 2;
    _SG_VERTEXSTEP_NUM = 3;
    _SG_VERTEXSTEP_FORCE_U32 = $7FFFFFFF;
;
{
    sg_uniform_type

    The data type of a uniform block member. This is used to
    describe the internal layout of uniform blocks when creating
    a shader object. This is only required for the GL backend, all
    other backends will ignore the interior layout of uniform blocks.
 }
type
  Psg_uniform_type = ^Tsg_uniform_type;
  Tsg_uniform_type =  Longint;
  Const
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
;
{
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
 }
{ value 0 reserved for default-init }
{ default: layout depends on currently active backend }
{ std140: memory layout according to std140 }
type
  Psg_uniform_layout = ^Tsg_uniform_layout;
  Tsg_uniform_layout =  Longint;
  Const
    _SG_UNIFORMLAYOUT_DEFAULT = 0;
    SG_UNIFORMLAYOUT_NATIVE = 1;
    SG_UNIFORMLAYOUT_STD140 = 2;
    _SG_UNIFORMLAYOUT_NUM = 3;
    _SG_UNIFORMLAYOUT_FORCE_U32 = $7FFFFFFF;
;
{
    sg_cull_mode

    The face-culling mode, this is used in the
    sg_pipeline_desc.cull_mode member when creating a
    pipeline object.

    The default cull mode is SG_CULLMODE_NONE
 }
{ value 0 reserved for default-init }
type
  Psg_cull_mode = ^Tsg_cull_mode;
  Tsg_cull_mode =  Longint;
  Const
    _SG_CULLMODE_DEFAULT = 0;
    SG_CULLMODE_NONE = 1;
    SG_CULLMODE_FRONT = 2;
    SG_CULLMODE_BACK = 3;
    _SG_CULLMODE_NUM = 4;
    _SG_CULLMODE_FORCE_U32 = $7FFFFFFF;
;
{
    sg_face_winding

    The vertex-winding rule that determines a front-facing primitive. This
    is used in the member sg_pipeline_desc.face_winding
    when creating a pipeline object.

    The default winding is SG_FACEWINDING_CW (clockwise)
 }
{ value 0 reserved for default-init }
type
  Psg_face_winding = ^Tsg_face_winding;
  Tsg_face_winding =  Longint;
  Const
    _SG_FACEWINDING_DEFAULT = 0;
    SG_FACEWINDING_CCW = 1;
    SG_FACEWINDING_CW = 2;
    _SG_FACEWINDING_NUM = 3;
    _SG_FACEWINDING_FORCE_U32 = $7FFFFFFF;
;
{
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
 }
{ value 0 reserved for default-init }
type
  Psg_compare_func = ^Tsg_compare_func;
  Tsg_compare_func =  Longint;
  Const
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
;
{
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
 }
{ value 0 reserved for default-init }
type
  Psg_stencil_op = ^Tsg_stencil_op;
  Tsg_stencil_op =  Longint;
  Const
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
;
{
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
 }
{ value 0 reserved for default-init }
type
  Psg_blend_factor = ^Tsg_blend_factor;
  Tsg_blend_factor =  Longint;
  Const
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
;
{
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
 }
{ value 0 reserved for default-init }
type
  Psg_blend_op = ^Tsg_blend_op;
  Tsg_blend_op =  Longint;
  Const
    _SG_BLENDOP_DEFAULT = 0;
    SG_BLENDOP_ADD = 1;
    SG_BLENDOP_SUBTRACT = 2;
    SG_BLENDOP_REVERSE_SUBTRACT = 3;
    SG_BLENDOP_MIN = 4;
    SG_BLENDOP_MAX = 5;
    _SG_BLENDOP_NUM = 6;
    _SG_BLENDOP_FORCE_U32 = $7FFFFFFF;
;
{
    sg_color_mask

    Selects the active color channels when writing a fragment color to the
    framebuffer. This is used in the members
    sg_pipeline_desc.colors[i].write_mask when creating a pipeline object.

    The default colormask is SG_COLORMASK_RGBA (write all colors channels)

    NOTE: since the color mask value 0 is reserved for the default value
    (SG_COLORMASK_RGBA), use SG_COLORMASK_NONE if all color channels
    should be disabled.
 }
{ value 0 reserved for default-init }
{ special value for 'all channels disabled }
type
  Psg_color_mask = ^Tsg_color_mask;
  Tsg_color_mask =  Longint;
  Const
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
;
{
    sg_load_action

    Defines the load action that should be performed at the start of a render pass:

    SG_LOADACTION_CLEAR:        clear the render target
    SG_LOADACTION_LOAD:         load the previous content of the render target
    SG_LOADACTION_DONTCARE:     leave the render target in an undefined state

    This is used in the sg_pass_action structure.

    The default load action for all pass attachments is SG_LOADACTION_CLEAR,
    with the values rgba =  0.5f, 0.5f, 0.5f, 1.0f , depth=1.0f and stencil=0.

    If you want to override the default behaviour, it is important to not
    only set the clear color, but the 'action' field as well (as long as this
    is _SG_LOADACTION_DEFAULT, the value fields will be ignored).
 }
type
  Psg_load_action = ^Tsg_load_action;
  Tsg_load_action =  Longint;
  Const
    _SG_LOADACTION_DEFAULT = 0;
    SG_LOADACTION_CLEAR = 1;
    SG_LOADACTION_LOAD = 2;
    SG_LOADACTION_DONTCARE = 3;
    _SG_LOADACTION_FORCE_U32 = $7FFFFFFF;
;
{
    sg_store_action

    Defines the store action that should be performed at the end of a render pass:

    SG_STOREACTION_STORE:       store the rendered content to the color attachment image
    SG_STOREACTION_DONTCARE:    allows the GPU to discard the rendered content
 }
type
  Psg_store_action = ^Tsg_store_action;
  Tsg_store_action =  Longint;
  Const
    _SG_STOREACTION_DEFAULT = 0;
    SG_STOREACTION_STORE = 1;
    SG_STOREACTION_DONTCARE = 2;
    _SG_STOREACTION_FORCE_U32 = $7FFFFFFF;
;
{
    sg_pass_action

    The sg_pass_action struct defines the actions to be performed
    at the start and end of a render pass.

    - at the start of the pass: whether the render attachments should be cleared,
      loaded with their previous content, or start in an undefined state
    - for clear operations: the clear value (color, depth, or stencil values)
    - at the end of the pass: whether the rendering result should be
      stored back into the render attachment or discarded
 }
{ default: SG_LOADACTION_CLEAR }
{ default: SG_STOREACTION_STORE }
{ default:  0.5f, 0.5f, 0.5f, 1.0f  }
type
  Psg_color_attachment_action = ^Tsg_color_attachment_action;
  Tsg_color_attachment_action = record
      load_action : Tsg_load_action;
      store_action : Tsg_store_action;
      clear_value : Tsg_color;
    end;
{ default: SG_LOADACTION_CLEAR }
{ default: SG_STOREACTION_DONTCARE }
{ default: 1.0 }

  Psg_depth_attachment_action = ^Tsg_depth_attachment_action;
  Tsg_depth_attachment_action = record
      load_action : Tsg_load_action;
      store_action : Tsg_store_action;
      clear_value : single;
    end;
{ default: SG_LOADACTION_CLEAR }
{ default: SG_STOREACTION_DONTCARE }
{ default: 0 }

  Psg_stencil_attachment_action = ^Tsg_stencil_attachment_action;
  Tsg_stencil_attachment_action = record
      load_action : Tsg_load_action;
      store_action : Tsg_store_action;
      clear_value : Tuint8_t;
    end;

  Psg_pass_action = ^Tsg_pass_action;
  Tsg_pass_action = record
      colors : array[0..(SG_MAX_COLOR_ATTACHMENTS)-1] of Tsg_color_attachment_action;
      depth : Tsg_depth_attachment_action;
      stencil : Tsg_stencil_attachment_action;
    end;
{
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
 }
(* Const before type ignored *)
{ CAMetalDrawable (NOT MTLDrawable!!!) }
(* Const before type ignored *)
{ MTLTexture }
(* Const before type ignored *)
{ MTLTexture }

  Psg_metal_swapchain = ^Tsg_metal_swapchain;
  Tsg_metal_swapchain = record
      current_drawable : pointer;
      depth_stencil_texture : pointer;
      msaa_color_texture : pointer;
    end;
(* Const before type ignored *)
{ ID3D11RenderTargetView }
(* Const before type ignored *)
{ ID3D11RenderTargetView }
(* Const before type ignored *)
{ ID3D11DepthStencilView }

  Psg_d3d11_swapchain = ^Tsg_d3d11_swapchain;
  Tsg_d3d11_swapchain = record
      render_view : pointer;
      resolve_view : pointer;
      depth_stencil_view : pointer;
    end;
(* Const before type ignored *)
{ WGPUTextureView }
(* Const before type ignored *)
{ WGPUTextureView }
(* Const before type ignored *)
{ WGPUTextureView }

  Psg_wgpu_swapchain = ^Tsg_wgpu_swapchain;
  Tsg_wgpu_swapchain = record
      render_view : pointer;
      resolve_view : pointer;
      depth_stencil_view : pointer;
    end;
(* Const before type ignored *)
{ vkImage }
(* Const before type ignored *)
{ vkImageView }
(* Const before type ignored *)
{ vkImage }
(* Const before type ignored *)
{ vkImageView }
(* Const before type ignored *)
{ vkImage }
(* Const before type ignored *)
{ vkImageView }
(* Const before type ignored *)
{ vkSemaphore }
(* Const before type ignored *)
{ vkSemaphore }

  Psg_vulkan_swapchain = ^Tsg_vulkan_swapchain;
  Tsg_vulkan_swapchain = record
      render_image : pointer;
      render_view : pointer;
      resolve_image : pointer;
      resolve_view : pointer;
      depth_stencil_image : pointer;
      depth_stencil_view : pointer;
      render_finished_semaphore : pointer;
      present_complete_semaphore : pointer;
    end;
{ GL framebuffer object }

  Psg_gl_swapchain = ^Tsg_gl_swapchain;
  Tsg_gl_swapchain = record
      framebuffer : Tuint32_t;
    end;

  Psg_swapchain = ^Tsg_swapchain;
  Tsg_swapchain = record
      width : longint;
      height : longint;
      sample_count : longint;
      color_format : Tsg_pixel_format;
      depth_format : Tsg_pixel_format;
      metal : Tsg_metal_swapchain;
      d3d11 : Tsg_d3d11_swapchain;
      wgpu : Tsg_wgpu_swapchain;
      vulkan : Tsg_vulkan_swapchain;
      gl : Tsg_gl_swapchain;
    end;
{
    sg_attachments

    Used in sg_pass to provide render pass attachment views. Each
    type of pass attachment has it corresponding view type:

    sg_attachments.colors[]:
        populate with color-attachment views, e.g.:

        sg_make_view(&(sg_view_desc)
            .color_attachment =  ... ,
        );

    sg_attachments.resolves[]:
        populate with resolve-attachment views, e.g.:

        sg_make_view(&(sg_view_desc)
            .resolve_attachment =  ... ,
        );

    sg_attachments.depth_stencil:
        populate with depth-stencil-attachment views, e.g.:

        sg_make_view(&(sg_view_desc)
            .depth_stencil_attachment =  ... ,
        );
 }

  Psg_attachments = ^Tsg_attachments;
  Tsg_attachments = record
      colors : array[0..(SG_MAX_COLOR_ATTACHMENTS)-1] of Tsg_view;
      resolves : array[0..(SG_MAX_COLOR_ATTACHMENTS)-1] of Tsg_view;
      depth_stencil : Tsg_view;
    end;
{
    sg_pass

    The sg_pass structure is passed as argument into the sg_begin_pass()
    function.

    For a swapchain render pass, provide an sg_pass_action and sg_swapchain
    struct (for instance via the sglue_swapchain() helper function from
    sokol_glue.h):

        sg_begin_pass(&(sg_pass)
            .action =  ... ,
            .swapchain = sglue_swapchain(),
        );

    For an offscreen render pass, provide an sg_pass_action struct with
    attachment view objects:

        sg_begin_pass(&(sg_pass)
            .action =  ... ,
            .attachments = 
                .colors =  ... ,
                .resolves =  ... ,
                .depth_stencil = ...,
            ,
        );

    You can also omit the .action object to get default pass action behaviour
    (clear to color=grey, depth=1 and stencil=0).

    For a compute pass, just set the sg_pass.compute boolean to true:

        sg_begin_pass(&(sg_pass) .compute = true );
 }
(* Const before type ignored *)

  Psg_pass = ^Tsg_pass;
  Tsg_pass = record
      _start_canary : Tuint32_t;
      compute : Tbool;
      action : Tsg_pass_action;
      attachments : Tsg_attachments;
      swapchain : Tsg_swapchain;
      _label : Pchar;
      _end_canary : Tuint32_t;
    end;

  Psg_bindings = ^Tsg_bindings;
  Tsg_bindings = record
      _start_canary : Tuint32_t;
      vertex_buffers : array[0..(SG_MAX_VERTEXBUFFER_BINDSLOTS)-1] of Tsg_buffer;
      vertex_buffer_offsets : array[0..(SG_MAX_VERTEXBUFFER_BINDSLOTS)-1] of longint;
      index_buffer : Tsg_buffer;
      index_buffer_offset : longint;
      views : array[0..(SG_MAX_VIEW_BINDSLOTS)-1] of Tsg_view;
      samplers : array[0..(SG_MAX_SAMPLER_BINDSLOTS)-1] of Tsg_sampler;
      _end_canary : Tuint32_t;
    end;
{
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
 }

  Psg_buffer_usage = ^Tsg_buffer_usage;
  Tsg_buffer_usage = record
      vertex_buffer : Tbool;
      index_buffer : Tbool;
      storage_buffer : Tbool;
      immutable : Tbool;
      dynamic_update : Tbool;
      stream_update : Tbool;
    end;
{
    sg_buffer_desc

    Creation parameters for sg_buffer objects, used in the sg_make_buffer() call.

    The default configuration is:

    .size:      0       (*must* be >0 for buffers without data)
    .usage       .vertex_buffer = true, .immutable = true 
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
 }
(* Const before type ignored *)
{ optionally inject backend-specific resources }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Psg_buffer_desc = ^Tsg_buffer_desc;
  Tsg_buffer_desc = record
      _start_canary : Tuint32_t;
      size : Tsize_t;
      usage : Tsg_buffer_usage;
      data : Tsg_range;
      _label : Pchar;
      gl_buffers : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of Tuint32_t;
      mtl_buffers : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of pointer;
      d3d11_buffer : pointer;
      wgpu_buffer : pointer;
      _end_canary : Tuint32_t;
    end;
{
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
 }

  Psg_image_usage = ^Tsg_image_usage;
  Tsg_image_usage = record
      storage_image : Tbool;
      color_attachment : Tbool;
      resolve_attachment : Tbool;
      depth_stencil_attachment : Tbool;
      immutable : Tbool;
      dynamic_update : Tbool;
      stream_update : Tbool;
    end;
{
    sg_view_type

    Allows to query the type of a view object via the function sg_query_view_type()
 }

  Psg_view_type = ^Tsg_view_type;
  Tsg_view_type =  Longint;
  Const
    SG_VIEWTYPE_INVALID = 0;
    SG_VIEWTYPE_STORAGEBUFFER = 1;
    SG_VIEWTYPE_STORAGEIMAGE = 2;
    SG_VIEWTYPE_TEXTURE = 3;
    SG_VIEWTYPE_COLORATTACHMENT = 4;
    SG_VIEWTYPE_RESOLVEATTACHMENT = 5;
    SG_VIEWTYPE_DEPTHSTENCILATTACHMENT = 6;
    _SG_VIEWTYPE_FORCE_U32 = $7FFFFFFF;
;
{
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
 }
type
  Psg_image_data = ^Tsg_image_data;
  Tsg_image_data = record
      mip_levels : array[0..(SG_MAX_MIPMAPS)-1] of Tsg_range;
    end;
{
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
 }
(* Const before type ignored *)
{ optionally inject backend-specific resources }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Psg_image_desc = ^Tsg_image_desc;
  Tsg_image_desc = record
      _start_canary : Tuint32_t;
      _type : Tsg_image_type;
      usage : Tsg_image_usage;
      width : longint;
      height : longint;
      num_slices : longint;
      num_mipmaps : longint;
      pixel_format : Tsg_pixel_format;
      sample_count : longint;
      data : Tsg_image_data;
      _label : Pchar;
      gl_textures : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of Tuint32_t;
      gl_texture_target : Tuint32_t;
      mtl_textures : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of pointer;
      d3d11_texture : pointer;
      wgpu_texture : pointer;
      _end_canary : Tuint32_t;
    end;
{
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
 }
(* Const before type ignored *)
{ optionally inject backend-specific resources }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Psg_sampler_desc = ^Tsg_sampler_desc;
  Tsg_sampler_desc = record
      _start_canary : Tuint32_t;
      min_filter : Tsg_filter;
      mag_filter : Tsg_filter;
      mipmap_filter : Tsg_filter;
      wrap_u : Tsg_wrap;
      wrap_v : Tsg_wrap;
      wrap_w : Tsg_wrap;
      min_lod : single;
      max_lod : single;
      border_color : Tsg_border_color;
      compare : Tsg_compare_func;
      max_anisotropy : Tuint32_t;
      _label : Pchar;
      gl_sampler : Tuint32_t;
      mtl_sampler : pointer;
      d3d11_sampler : pointer;
      wgpu_sampler : pointer;
      _end_canary : Tuint32_t;
    end;
{
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
 }

  Psg_shader_stage = ^Tsg_shader_stage;
  Tsg_shader_stage =  Longint;
  Const
    SG_SHADERSTAGE_NONE = 0;
    SG_SHADERSTAGE_VERTEX = 1;
    SG_SHADERSTAGE_FRAGMENT = 2;
    SG_SHADERSTAGE_COMPUTE = 3;
    _SG_SHADERSTAGE_FORCE_U32 = $7FFFFFFF;
;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ default: "vs_4_0" or "ps_4_0" }
(* Const before type ignored *)
type
  Psg_shader_function = ^Tsg_shader_function;
  Tsg_shader_function = record
      source : Pchar;
      bytecode : Tsg_range;
      entry : Pchar;
      d3d11_target : Pchar;
      d3d11_filepath : Pchar;
    end;

  Psg_shader_attr_base_type = ^Tsg_shader_attr_base_type;
  Tsg_shader_attr_base_type =  Longint;
  Const
    SG_SHADERATTRBASETYPE_UNDEFINED = 0;
    SG_SHADERATTRBASETYPE_FLOAT = 1;
    SG_SHADERATTRBASETYPE_SINT = 2;
    SG_SHADERATTRBASETYPE_UINT = 3;
    _SG_SHADERATTRBASETYPE_FORCE_U32 = $7FFFFFFF;
;
{ default: UNDEFINED (disables validation) }
(* Const before type ignored *)
{ [optional] GLSL attribute name }
(* Const before type ignored *)
{ HLSL semantic name }
{ HLSL semantic index }
type
  Psg_shader_vertex_attr = ^Tsg_shader_vertex_attr;
  Tsg_shader_vertex_attr = record
      base_type : Tsg_shader_attr_base_type;
      glsl_name : Pchar;
      hlsl_sem_name : Pchar;
      hlsl_sem_index : Tuint8_t;
    end;
{ 0 or 1 for scalars, >1 for arrays }
(* Const before type ignored *)
{ glsl name binding is required on GL 4.1 and WebGL2 }

  Psg_glsl_shader_uniform = ^Tsg_glsl_shader_uniform;
  Tsg_glsl_shader_uniform = record
      _type : Tsg_uniform_type;
      array_count : Tuint16_t;
      glsl_name : Pchar;
    end;
{ HLSL register(bn) }
{ MSL [[buffer(n)]] }
{ WGSL @group(0) @binding(n) }
{ Vulkan GLSL layout(set=0, binding=n) }

  Psg_shader_uniform_block = ^Tsg_shader_uniform_block;
  Tsg_shader_uniform_block = record
      stage : Tsg_shader_stage;
      size : Tuint32_t;
      hlsl_register_b_n : Tuint8_t;
      msl_buffer_n : Tuint8_t;
      wgsl_group0_binding_n : Tuint8_t;
      spirv_set0_binding_n : Tuint8_t;
      layout : Tsg_uniform_layout;
      glsl_uniforms : array[0..(SG_MAX_UNIFORMBLOCK_MEMBERS)-1] of Tsg_glsl_shader_uniform;
    end;
{ HLSL register(tn) bind slot }
{ MSL [[texture(n)]] bind slot }
{ WGSL @group(1) @binding(n) bind slot }
{ Vulkan GLSL layout(set=1, binding=0) }

  Psg_shader_texture_view = ^Tsg_shader_texture_view;
  Tsg_shader_texture_view = record
      stage : Tsg_shader_stage;
      image_type : Tsg_image_type;
      sample_type : Tsg_image_sample_type;
      multisampled : Tbool;
      hlsl_register_t_n : Tuint8_t;
      msl_texture_n : Tuint8_t;
      wgsl_group1_binding_n : Tuint8_t;
      spirv_set1_binding_n : Tuint8_t;
    end;
{ HLSL register(tn) bind slot (for readonly access) }
{ HLSL register(un) bind slot (for read/write access) }
{ MSL [[buffer(n)]] bind slot }
{ WGSL @group(1) @binding(n) bind slot }
{ Vulkan GLSL layout(set=1, binding=0) }
{ GLSL layout(binding=n) }

  Psg_shader_storage_buffer_view = ^Tsg_shader_storage_buffer_view;
  Tsg_shader_storage_buffer_view = record
      stage : Tsg_shader_stage;
      readonly : Tbool;
      hlsl_register_t_n : Tuint8_t;
      hlsl_register_u_n : Tuint8_t;
      msl_buffer_n : Tuint8_t;
      wgsl_group1_binding_n : Tuint8_t;
      spirv_set1_binding_n : Tuint8_t;
      glsl_binding_n : Tuint8_t;
    end;
{ shader-access pixel format }
{ false means read/write access }
{ HLSL register(un) bind slot }
{ MSL [[texture(n)]] bind slot }
{ WGSL @group(2) @binding(n) bind slot }
{ Vulkan GLSL layout(set=1, binding=0) }
{ GLSL layout(binding=n) }

  Psg_shader_storage_image_view = ^Tsg_shader_storage_image_view;
  Tsg_shader_storage_image_view = record
      stage : Tsg_shader_stage;
      image_type : Tsg_image_type;
      access_format : Tsg_pixel_format;
      writeonly : Tbool;
      hlsl_register_u_n : Tuint8_t;
      msl_texture_n : Tuint8_t;
      wgsl_group1_binding_n : Tuint8_t;
      spirv_set1_binding_n : Tuint8_t;
      glsl_binding_n : Tuint8_t;
    end;

  Psg_shader_view = ^Tsg_shader_view;
  Tsg_shader_view = record
      texture : Tsg_shader_texture_view;
      storage_buffer : Tsg_shader_storage_buffer_view;
      storage_image : Tsg_shader_storage_image_view;
    end;
{ HLSL register(sn) bind slot }
{ MSL [[sampler(n)]] bind slot }
{ WGSL @group(1) @binding(n) bind slot }
{ Vulkan GLSL layout(set=1, binding=0) }

  Psg_shader_sampler = ^Tsg_shader_sampler;
  Tsg_shader_sampler = record
      stage : Tsg_shader_stage;
      sampler_type : Tsg_sampler_type;
      hlsl_register_s_n : Tuint8_t;
      msl_sampler_n : Tuint8_t;
      wgsl_group1_binding_n : Tuint8_t;
      spirv_set1_binding_n : Tuint8_t;
    end;
{ must be SG_VIEWTYPE_TEXTURE }
(* Const before type ignored *)
{ glsl name binding required because of GL 4.1 and WebGL2 }

  Psg_shader_texture_sampler_pair = ^Tsg_shader_texture_sampler_pair;
  Tsg_shader_texture_sampler_pair = record
      stage : Tsg_shader_stage;
      view_slot : Tuint8_t;
      sampler_slot : Tuint8_t;
      glsl_name : Pchar;
    end;

  Psg_mtl_shader_threads_per_threadgroup = ^Tsg_mtl_shader_threads_per_threadgroup;
  Tsg_mtl_shader_threads_per_threadgroup = record
      x : longint;
      y : longint;
      z : longint;
    end;
(* Const before type ignored *)

  Psg_shader_desc = ^Tsg_shader_desc;
  Tsg_shader_desc = record
      _start_canary : Tuint32_t;
      vertex_func : Tsg_shader_function;
      fragment_func : Tsg_shader_function;
      compute_func : Tsg_shader_function;
      attrs : array[0..(SG_MAX_VERTEX_ATTRIBUTES)-1] of Tsg_shader_vertex_attr;
      uniform_blocks : array[0..(SG_MAX_UNIFORMBLOCK_BINDSLOTS)-1] of Tsg_shader_uniform_block;
      views : array[0..(SG_MAX_VIEW_BINDSLOTS)-1] of Tsg_shader_view;
      samplers : array[0..(SG_MAX_SAMPLER_BINDSLOTS)-1] of Tsg_shader_sampler;
      texture_sampler_pairs : array[0..(SG_MAX_TEXTURE_SAMPLER_PAIRS)-1] of Tsg_shader_texture_sampler_pair;
      mtl_threads_per_threadgroup : Tsg_mtl_shader_threads_per_threadgroup;
      _label : Pchar;
      _end_canary : Tuint32_t;
    end;
{
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
    .blend_color:               (sg_color)  0.0f, 0.0f, 0.0f, 0.0f 
    .alpha_to_coverage_enabled: false
    .label  0       (optional string label for trace hooks)
 }

  Psg_vertex_buffer_layout_state = ^Tsg_vertex_buffer_layout_state;
  Tsg_vertex_buffer_layout_state = record
      stride : longint;
      step_func : Tsg_vertex_step;
      step_rate : longint;
    end;

  Psg_vertex_attr_state = ^Tsg_vertex_attr_state;
  Tsg_vertex_attr_state = record
      buffer_index : longint;
      offset : longint;
      format : Tsg_vertex_format;
    end;

  Psg_vertex_layout_state = ^Tsg_vertex_layout_state;
  Tsg_vertex_layout_state = record
      buffers : array[0..(SG_MAX_VERTEXBUFFER_BINDSLOTS)-1] of Tsg_vertex_buffer_layout_state;
      attrs : array[0..(SG_MAX_VERTEX_ATTRIBUTES)-1] of Tsg_vertex_attr_state;
    end;

  Psg_stencil_face_state = ^Tsg_stencil_face_state;
  Tsg_stencil_face_state = record
      compare : Tsg_compare_func;
      fail_op : Tsg_stencil_op;
      depth_fail_op : Tsg_stencil_op;
      pass_op : Tsg_stencil_op;
    end;

  Psg_stencil_state = ^Tsg_stencil_state;
  Tsg_stencil_state = record
      enabled : Tbool;
      front : Tsg_stencil_face_state;
      back : Tsg_stencil_face_state;
      read_mask : Tuint8_t;
      write_mask : Tuint8_t;
      ref : Tuint8_t;
    end;

  Psg_depth_state = ^Tsg_depth_state;
  Tsg_depth_state = record
      pixel_format : Tsg_pixel_format;
      compare : Tsg_compare_func;
      write_enabled : Tbool;
      bias : single;
      bias_slope_scale : single;
      bias_clamp : single;
    end;

  Psg_blend_state = ^Tsg_blend_state;
  Tsg_blend_state = record
      enabled : Tbool;
      src_factor_rgb : Tsg_blend_factor;
      dst_factor_rgb : Tsg_blend_factor;
      op_rgb : Tsg_blend_op;
      src_factor_alpha : Tsg_blend_factor;
      dst_factor_alpha : Tsg_blend_factor;
      op_alpha : Tsg_blend_op;
    end;

  Psg_color_target_state = ^Tsg_color_target_state;
  Tsg_color_target_state = record
      pixel_format : Tsg_pixel_format;
      write_mask : Tsg_color_mask;
      blend : Tsg_blend_state;
    end;
(* Const before type ignored *)

  Psg_pipeline_desc = ^Tsg_pipeline_desc;
  Tsg_pipeline_desc = record
      _start_canary : Tuint32_t;
      compute : Tbool;
      shader : Tsg_shader;
      layout : Tsg_vertex_layout_state;
      depth : Tsg_depth_state;
      stencil : Tsg_stencil_state;
      color_count : longint;
      colors : array[0..(SG_MAX_COLOR_ATTACHMENTS)-1] of Tsg_color_target_state;
      primitive_type : Tsg_primitive_type;
      index_type : Tsg_index_type;
      cull_mode : Tsg_cull_mode;
      face_winding : Tsg_face_winding;
      sample_count : longint;
      blend_color : Tsg_color;
      alpha_to_coverage_enabled : Tbool;
      _label : Pchar;
      _end_canary : Tuint32_t;
    end;
{
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
 }

  Psg_buffer_view_desc = ^Tsg_buffer_view_desc;
  Tsg_buffer_view_desc = record
      buffer : Tsg_buffer;
      offset : longint;
    end;
{ cube texture: face; array texture: layer; 3D texture: depth-slice }

  Psg_image_view_desc = ^Tsg_image_view_desc;
  Tsg_image_view_desc = record
      image : Tsg_image;
      mip_level : longint;
      slice : longint;
    end;

  Psg_texture_view_range = ^Tsg_texture_view_range;
  Tsg_texture_view_range = record
      base : longint;
      count : longint;
    end;
{ cube texture: face; array texture: layer; 3D texture: depth-slice }

  Psg_texture_view_desc = ^Tsg_texture_view_desc;
  Tsg_texture_view_desc = record
      image : Tsg_image;
      mip_levels : Tsg_texture_view_range;
      slices : Tsg_texture_view_range;
    end;
(* Const before type ignored *)

  Psg_view_desc = ^Tsg_view_desc;
  Tsg_view_desc = record
      _start_canary : Tuint32_t;
      texture : Tsg_texture_view_desc;
      storage_buffer : Tsg_buffer_view_desc;
      storage_image : Tsg_image_view_desc;
      color_attachment : Tsg_image_view_desc;
      resolve_attachment : Tsg_image_view_desc;
      depth_stencil_attachment : Tsg_image_view_desc;
      _label : Pchar;
      _end_canary : Tuint32_t;
    end;
{
    sg_trace_hooks

    Installable callback functions to keep track of the sokol-gfx calls,
    this is useful for debugging, or keeping track of resource creation
    and destruction.

    Trace hooks are installed with sg_install_trace_hooks(), this returns
    another sg_trace_hooks struct with the previous set of
    trace hook function pointers. These should be invoked by the
    new trace hooks to form a proper call chain.
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Psg_trace_hooks = ^Tsg_trace_hooks;
  Tsg_trace_hooks = record
      user_data : pointer;
      reset_state_cache : procedure (user_data:pointer);cdecl;
      make_buffer : procedure (desc:Psg_buffer_desc; result:Tsg_buffer; user_data:pointer);cdecl;
      make_image : procedure (desc:Psg_image_desc; result:Tsg_image; user_data:pointer);cdecl;
      make_sampler : procedure (desc:Psg_sampler_desc; result:Tsg_sampler; user_data:pointer);cdecl;
      make_shader : procedure (desc:Psg_shader_desc; result:Tsg_shader; user_data:pointer);cdecl;
      make_pipeline : procedure (desc:Psg_pipeline_desc; result:Tsg_pipeline; user_data:pointer);cdecl;
      make_view : procedure (desc:Psg_view_desc; result:Tsg_view; user_data:pointer);cdecl;
      destroy_buffer : procedure (buf:Tsg_buffer; user_data:pointer);cdecl;
      destroy_image : procedure (img:Tsg_image; user_data:pointer);cdecl;
      destroy_sampler : procedure (smp:Tsg_sampler; user_data:pointer);cdecl;
      destroy_shader : procedure (shd:Tsg_shader; user_data:pointer);cdecl;
      destroy_pipeline : procedure (pip:Tsg_pipeline; user_data:pointer);cdecl;
      destroy_view : procedure (view:Tsg_view; user_data:pointer);cdecl;
      update_buffer : procedure (buf:Tsg_buffer; data:Psg_range; user_data:pointer);cdecl;
      update_image : procedure (img:Tsg_image; data:Psg_image_data; user_data:pointer);cdecl;
      append_buffer : procedure (buf:Tsg_buffer; data:Psg_range; result:longint; user_data:pointer);cdecl;
      begin_pass : procedure (pass:Psg_pass; user_data:pointer);cdecl;
      apply_viewport : procedure (x:longint; y:longint; width:longint; height:longint; origin_top_left:Tbool; 
                    user_data:pointer);cdecl;
      apply_scissor_rect : procedure (x:longint; y:longint; width:longint; height:longint; origin_top_left:Tbool; 
                    user_data:pointer);cdecl;
      apply_pipeline : procedure (pip:Tsg_pipeline; user_data:pointer);cdecl;
      apply_bindings : procedure (bindings:Psg_bindings; user_data:pointer);cdecl;
      apply_uniforms : procedure (ub_index:longint; data:Psg_range; user_data:pointer);cdecl;
      draw : procedure (base_element:longint; num_elements:longint; num_instances:longint; user_data:pointer);cdecl;
      draw_ex : procedure (base_element:longint; num_elements:longint; num_instances:longint; base_vertex:longint; base_instance:longint; 
                    user_data:pointer);cdecl;
      dispatch : procedure (num_groups_x:longint; num_groups_y:longint; num_groups_z:longint; user_data:pointer);cdecl;
      end_pass : procedure (user_data:pointer);cdecl;
      commit : procedure (user_data:pointer);cdecl;
      alloc_buffer : procedure (result:Tsg_buffer; user_data:pointer);cdecl;
      alloc_image : procedure (result:Tsg_image; user_data:pointer);cdecl;
      alloc_sampler : procedure (result:Tsg_sampler; user_data:pointer);cdecl;
      alloc_shader : procedure (result:Tsg_shader; user_data:pointer);cdecl;
      alloc_pipeline : procedure (result:Tsg_pipeline; user_data:pointer);cdecl;
      alloc_view : procedure (result:Tsg_view; user_data:pointer);cdecl;
      dealloc_buffer : procedure (buf_id:Tsg_buffer; user_data:pointer);cdecl;
      dealloc_image : procedure (img_id:Tsg_image; user_data:pointer);cdecl;
      dealloc_sampler : procedure (smp_id:Tsg_sampler; user_data:pointer);cdecl;
      dealloc_shader : procedure (shd_id:Tsg_shader; user_data:pointer);cdecl;
      dealloc_pipeline : procedure (pip_id:Tsg_pipeline; user_data:pointer);cdecl;
      dealloc_view : procedure (view_id:Tsg_view; user_data:pointer);cdecl;
      init_buffer : procedure (buf_id:Tsg_buffer; desc:Psg_buffer_desc; user_data:pointer);cdecl;
      init_image : procedure (img_id:Tsg_image; desc:Psg_image_desc; user_data:pointer);cdecl;
      init_sampler : procedure (smp_id:Tsg_sampler; desc:Psg_sampler_desc; user_data:pointer);cdecl;
      init_shader : procedure (shd_id:Tsg_shader; desc:Psg_shader_desc; user_data:pointer);cdecl;
      init_pipeline : procedure (pip_id:Tsg_pipeline; desc:Psg_pipeline_desc; user_data:pointer);cdecl;
      init_view : procedure (view_id:Tsg_view; desc:Psg_view_desc; user_data:pointer);cdecl;
      uninit_buffer : procedure (buf_id:Tsg_buffer; user_data:pointer);cdecl;
      uninit_image : procedure (img_id:Tsg_image; user_data:pointer);cdecl;
      uninit_sampler : procedure (smp_id:Tsg_sampler; user_data:pointer);cdecl;
      uninit_shader : procedure (shd_id:Tsg_shader; user_data:pointer);cdecl;
      uninit_pipeline : procedure (pip_id:Tsg_pipeline; user_data:pointer);cdecl;
      uninit_view : procedure (view_id:Tsg_view; user_data:pointer);cdecl;
      fail_buffer : procedure (buf_id:Tsg_buffer; user_data:pointer);cdecl;
      fail_image : procedure (img_id:Tsg_image; user_data:pointer);cdecl;
      fail_sampler : procedure (smp_id:Tsg_sampler; user_data:pointer);cdecl;
      fail_shader : procedure (shd_id:Tsg_shader; user_data:pointer);cdecl;
      fail_pipeline : procedure (pip_id:Tsg_pipeline; user_data:pointer);cdecl;
      fail_view : procedure (view_id:Tsg_view; user_data:pointer);cdecl;
      push_debug_group : procedure (name:Pchar; user_data:pointer);cdecl;
      pop_debug_group : procedure (user_data:pointer);cdecl;
    end;
{
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
 }
{ the current state of this resource slot }
{ type-neutral resource if (e.g. sg_buffer.id) }

  Psg_slot_info = ^Tsg_slot_info;
  Tsg_slot_info = record
      state : Tsg_resource_state;
      res_id : Tuint32_t;
      uninit_count : Tuint32_t;
    end;
{ resource pool slot info }
{ frame index of last sg_update_buffer() }
{ frame index of last sg_append_buffer() }
{ current position in buffer for sg_append_buffer() }
{ is buffer in overflow state (due to sg_append_buffer) }
{ number of renaming-slots for dynamically updated buffers }
{ currently active write-slot for dynamically updated buffers }

  Psg_buffer_info = ^Tsg_buffer_info;
  Tsg_buffer_info = record
      slot : Tsg_slot_info;
      update_frame_index : Tuint32_t;
      append_frame_index : Tuint32_t;
      append_pos : longint;
      append_overflow : Tbool;
      num_slots : longint;
      active_slot : longint;
    end;
{ resource pool slot info }
{ frame index of last sg_update_image() }
{ number of renaming-slots for dynamically updated images }
{ currently active write-slot for dynamically updated images }

  Psg_image_info = ^Tsg_image_info;
  Tsg_image_info = record
      slot : Tsg_slot_info;
      upd_frame_index : Tuint32_t;
      num_slots : longint;
      active_slot : longint;
    end;
{ resource pool slot info }

  Psg_sampler_info = ^Tsg_sampler_info;
  Tsg_sampler_info = record
      slot : Tsg_slot_info;
    end;
{ resource pool slot info }

  Psg_shader_info = ^Tsg_shader_info;
  Tsg_shader_info = record
      slot : Tsg_slot_info;
    end;
{ resource pool slot info }

  Psg_pipeline_info = ^Tsg_pipeline_info;
  Tsg_pipeline_info = record
      slot : Tsg_slot_info;
    end;
{ resource pool slot info }

  Psg_view_info = ^Tsg_view_info;
  Tsg_view_info = record
      slot : Tsg_slot_info;
    end;
{
    sg_stats

    Allows to track generic and backend-specific rendering stats,
    obtained via sg_query_stats().
 }

  Psg_frame_stats_gl = ^Tsg_frame_stats_gl;
  Tsg_frame_stats_gl = record
      num_bind_buffer : Tuint32_t;
      num_active_texture : Tuint32_t;
      num_bind_texture : Tuint32_t;
      num_bind_sampler : Tuint32_t;
      num_bind_image_texture : Tuint32_t;
      num_use_program : Tuint32_t;
      num_render_state : Tuint32_t;
      num_vertex_attrib_pointer : Tuint32_t;
      num_vertex_attrib_divisor : Tuint32_t;
      num_enable_vertex_attrib_array : Tuint32_t;
      num_disable_vertex_attrib_array : Tuint32_t;
      num_uniform : Tuint32_t;
      num_memory_barriers : Tuint32_t;
    end;

  Psg_frame_stats_d3d11_pass = ^Tsg_frame_stats_d3d11_pass;
  Tsg_frame_stats_d3d11_pass = record
      num_om_set_render_targets : Tuint32_t;
      num_clear_render_target_view : Tuint32_t;
      num_clear_depth_stencil_view : Tuint32_t;
      num_resolve_subresource : Tuint32_t;
    end;

  Psg_frame_stats_d3d11_pipeline = ^Tsg_frame_stats_d3d11_pipeline;
  Tsg_frame_stats_d3d11_pipeline = record
      num_rs_set_state : Tuint32_t;
      num_om_set_depth_stencil_state : Tuint32_t;
      num_om_set_blend_state : Tuint32_t;
      num_ia_set_primitive_topology : Tuint32_t;
      num_ia_set_input_layout : Tuint32_t;
      num_vs_set_shader : Tuint32_t;
      num_vs_set_constant_buffers : Tuint32_t;
      num_ps_set_shader : Tuint32_t;
      num_ps_set_constant_buffers : Tuint32_t;
      num_cs_set_shader : Tuint32_t;
      num_cs_set_constant_buffers : Tuint32_t;
    end;

  Psg_frame_stats_d3d11_bindings = ^Tsg_frame_stats_d3d11_bindings;
  Tsg_frame_stats_d3d11_bindings = record
      num_ia_set_vertex_buffers : Tuint32_t;
      num_ia_set_index_buffer : Tuint32_t;
      num_vs_set_shader_resources : Tuint32_t;
      num_vs_set_samplers : Tuint32_t;
      num_ps_set_shader_resources : Tuint32_t;
      num_ps_set_samplers : Tuint32_t;
      num_cs_set_shader_resources : Tuint32_t;
      num_cs_set_samplers : Tuint32_t;
      num_cs_set_unordered_access_views : Tuint32_t;
    end;

  Psg_frame_stats_d3d11_uniforms = ^Tsg_frame_stats_d3d11_uniforms;
  Tsg_frame_stats_d3d11_uniforms = record
      num_update_subresource : Tuint32_t;
    end;

  Psg_frame_stats_d3d11_draw = ^Tsg_frame_stats_d3d11_draw;
  Tsg_frame_stats_d3d11_draw = record
      num_draw_indexed_instanced : Tuint32_t;
      num_draw_indexed : Tuint32_t;
      num_draw_instanced : Tuint32_t;
      num_draw : Tuint32_t;
    end;

  Psg_frame_stats_d3d11 = ^Tsg_frame_stats_d3d11;
  Tsg_frame_stats_d3d11 = record
      pass : Tsg_frame_stats_d3d11_pass;
      pipeline : Tsg_frame_stats_d3d11_pipeline;
      bindings : Tsg_frame_stats_d3d11_bindings;
      uniforms : Tsg_frame_stats_d3d11_uniforms;
      draw : Tsg_frame_stats_d3d11_draw;
      num_map : Tuint32_t;
      num_unmap : Tuint32_t;
    end;

  Psg_frame_stats_metal_idpool = ^Tsg_frame_stats_metal_idpool;
  Tsg_frame_stats_metal_idpool = record
      num_added : Tuint32_t;
      num_released : Tuint32_t;
      num_garbage_collected : Tuint32_t;
    end;

  Psg_frame_stats_metal_pipeline = ^Tsg_frame_stats_metal_pipeline;
  Tsg_frame_stats_metal_pipeline = record
      num_set_blend_color : Tuint32_t;
      num_set_cull_mode : Tuint32_t;
      num_set_front_facing_winding : Tuint32_t;
      num_set_stencil_reference_value : Tuint32_t;
      num_set_depth_bias : Tuint32_t;
      num_set_render_pipeline_state : Tuint32_t;
      num_set_depth_stencil_state : Tuint32_t;
    end;

  Psg_frame_stats_metal_bindings = ^Tsg_frame_stats_metal_bindings;
  Tsg_frame_stats_metal_bindings = record
      num_set_vertex_buffer : Tuint32_t;
      num_set_vertex_buffer_offset : Tuint32_t;
      num_skip_redundant_vertex_buffer : Tuint32_t;
      num_set_vertex_texture : Tuint32_t;
      num_skip_redundant_vertex_texture : Tuint32_t;
      num_set_vertex_sampler_state : Tuint32_t;
      num_skip_redundant_vertex_sampler_state : Tuint32_t;
      num_set_fragment_buffer : Tuint32_t;
      num_set_fragment_buffer_offset : Tuint32_t;
      num_skip_redundant_fragment_buffer : Tuint32_t;
      num_set_fragment_texture : Tuint32_t;
      num_skip_redundant_fragment_texture : Tuint32_t;
      num_set_fragment_sampler_state : Tuint32_t;
      num_skip_redundant_fragment_sampler_state : Tuint32_t;
      num_set_compute_buffer : Tuint32_t;
      num_set_compute_buffer_offset : Tuint32_t;
      num_skip_redundant_compute_buffer : Tuint32_t;
      num_set_compute_texture : Tuint32_t;
      num_skip_redundant_compute_texture : Tuint32_t;
      num_set_compute_sampler_state : Tuint32_t;
      num_skip_redundant_compute_sampler_state : Tuint32_t;
    end;

  Psg_frame_stats_metal_uniforms = ^Tsg_frame_stats_metal_uniforms;
  Tsg_frame_stats_metal_uniforms = record
      num_set_vertex_buffer_offset : Tuint32_t;
      num_set_fragment_buffer_offset : Tuint32_t;
      num_set_compute_buffer_offset : Tuint32_t;
    end;

  Psg_frame_stats_metal = ^Tsg_frame_stats_metal;
  Tsg_frame_stats_metal = record
      idpool : Tsg_frame_stats_metal_idpool;
      pipeline : Tsg_frame_stats_metal_pipeline;
      bindings : Tsg_frame_stats_metal_bindings;
      uniforms : Tsg_frame_stats_metal_uniforms;
    end;

  Psg_frame_stats_wgpu_uniforms = ^Tsg_frame_stats_wgpu_uniforms;
  Tsg_frame_stats_wgpu_uniforms = record
      num_set_bindgroup : Tuint32_t;
      size_write_buffer : Tuint32_t;
    end;

  Psg_frame_stats_wgpu_bindings = ^Tsg_frame_stats_wgpu_bindings;
  Tsg_frame_stats_wgpu_bindings = record
      num_set_vertex_buffer : Tuint32_t;
      num_skip_redundant_vertex_buffer : Tuint32_t;
      num_set_index_buffer : Tuint32_t;
      num_skip_redundant_index_buffer : Tuint32_t;
      num_create_bindgroup : Tuint32_t;
      num_discard_bindgroup : Tuint32_t;
      num_set_bindgroup : Tuint32_t;
      num_skip_redundant_bindgroup : Tuint32_t;
      num_bindgroup_cache_hits : Tuint32_t;
      num_bindgroup_cache_misses : Tuint32_t;
      num_bindgroup_cache_collisions : Tuint32_t;
      num_bindgroup_cache_invalidates : Tuint32_t;
      num_bindgroup_cache_hash_vs_key_mismatch : Tuint32_t;
    end;

  Psg_frame_stats_wgpu = ^Tsg_frame_stats_wgpu;
  Tsg_frame_stats_wgpu = record
      uniforms : Tsg_frame_stats_wgpu_uniforms;
      bindings : Tsg_frame_stats_wgpu_bindings;
    end;

  Psg_frame_stats_vk = ^Tsg_frame_stats_vk;
  Tsg_frame_stats_vk = record
      num_cmd_pipeline_barrier : Tuint32_t;
      num_allocate_memory : Tuint32_t;
      num_free_memory : Tuint32_t;
      size_allocate_memory : Tuint32_t;
      num_delete_queue_added : Tuint32_t;
      num_delete_queue_collected : Tuint32_t;
      num_cmd_copy_buffer : Tuint32_t;
      num_cmd_copy_buffer_to_image : Tuint32_t;
      num_cmd_set_descriptor_buffer_offsets : Tuint32_t;
      size_descriptor_buffer_writes : Tuint32_t;
    end;
{ number of allocated objects in current frame }
{ number of deallocated object in current frame }
{ number of initialized objects in current frame }
{ number of deinitialized objects in current frame }

  Psg_frame_resource_stats = ^Tsg_frame_resource_stats;
  Tsg_frame_resource_stats = record
      allocated : Tuint32_t;
      deallocated : Tuint32_t;
      inited : Tuint32_t;
      uninited : Tuint32_t;
    end;
{ number of live objects in pool }
{ number of free objects in pool }
{ total number of object allocations }
{ total number of object deallocations }
{ total number of object initializations }
{ total number of object deinitializations }

  Psg_total_resource_stats = ^Tsg_total_resource_stats;
  Tsg_total_resource_stats = record
      alive : Tuint32_t;
      free : Tuint32_t;
      allocated : Tuint32_t;
      deallocated : Tuint32_t;
      inited : Tuint32_t;
      uninited : Tuint32_t;
    end;

  Psg_total_stats = ^Tsg_total_stats;
  Tsg_total_stats = record
      buffers : Tsg_total_resource_stats;
      images : Tsg_total_resource_stats;
      samplers : Tsg_total_resource_stats;
      views : Tsg_total_resource_stats;
      shaders : Tsg_total_resource_stats;
      pipelines : Tsg_total_resource_stats;
    end;
{ current frame counter, starts at 0 }

  Psg_frame_stats = ^Tsg_frame_stats;
  Tsg_frame_stats = record
      frame_index : Tuint32_t;
      num_passes : Tuint32_t;
      num_apply_viewport : Tuint32_t;
      num_apply_scissor_rect : Tuint32_t;
      num_apply_pipeline : Tuint32_t;
      num_apply_bindings : Tuint32_t;
      num_apply_uniforms : Tuint32_t;
      num_draw : Tuint32_t;
      num_draw_ex : Tuint32_t;
      num_dispatch : Tuint32_t;
      num_update_buffer : Tuint32_t;
      num_append_buffer : Tuint32_t;
      num_update_image : Tuint32_t;
      size_apply_uniforms : Tuint32_t;
      size_update_buffer : Tuint32_t;
      size_append_buffer : Tuint32_t;
      size_update_image : Tuint32_t;
      buffers : Tsg_frame_resource_stats;
      images : Tsg_frame_resource_stats;
      samplers : Tsg_frame_resource_stats;
      views : Tsg_frame_resource_stats;
      shaders : Tsg_frame_resource_stats;
      pipelines : Tsg_frame_resource_stats;
      gl : Tsg_frame_stats_gl;
      d3d11 : Tsg_frame_stats_d3d11;
      metal : Tsg_frame_stats_metal;
      wgpu : Tsg_frame_stats_wgpu;
      vk : Tsg_frame_stats_vk;
    end;

  Psg_stats = ^Tsg_stats;
  Tsg_stats = record
      prev_frame : Tsg_frame_stats;
      cur_frame : Tsg_frame_stats;
      total : Tsg_total_stats;
    end;
{
    sg_log_item

    An enum with a unique item for each log message, warning, error
    and validation layer message. Note that these messages are only
    visible when a logger function is installed in the sg_setup() call.
 }

  Psg_environment_defaults = ^Tsg_environment_defaults;
  Tsg_environment_defaults = record
      color_format : Tsg_pixel_format;
      depth_format : Tsg_pixel_format;
      sample_count : longint;
    end;
(* Const before type ignored *)

  Psg_metal_environment = ^Tsg_metal_environment;
  Tsg_metal_environment = record
      device : pointer;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

  Psg_d3d11_environment = ^Tsg_d3d11_environment;
  Tsg_d3d11_environment = record
      device : pointer;
      device_context : pointer;
    end;
(* Const before type ignored *)

  Psg_wgpu_environment = ^Tsg_wgpu_environment;
  Tsg_wgpu_environment = record
      device : pointer;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Psg_vulkan_environment = ^Tsg_vulkan_environment;
  Tsg_vulkan_environment = record
      instance : pointer;
      physical_device : pointer;
      device : pointer;
      queue : pointer;
      queue_family_index : Tuint32_t;
    end;

  Psg_environment = ^Tsg_environment;
  Tsg_environment = record
      defaults : Tsg_environment_defaults;
      metal : Tsg_metal_environment;
      d3d11 : Tsg_d3d11_environment;
      wgpu : Tsg_wgpu_environment;
      vulkan : Tsg_vulkan_environment;
    end;
{
    sg_commit_listener

    Used with function sg_add_commit_listener() to add a callback
    which will be called in sg_commit(). This is useful for libraries
    building on top of sokol-gfx to be notified about when a frame
    ends (instead of having to guess, or add a manual 'new-frame'
    function.
 }

  Psg_commit_listener = ^Tsg_commit_listener;
  Tsg_commit_listener = record
      func : procedure (user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    sg_allocator

    Used in sg_desc to provide custom memory-alloc and -free functions
    to sokol_gfx.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
 }

  Psg_allocator = ^Tsg_allocator;
  Tsg_allocator = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    sg_logger

    Used in sg_desc to provide a logging function. Please be aware
    that without logging function, sokol-gfx will be completely
    silent, e.g. it will not report errors, warnings and
    validation layer messages. For maximum error verbosity,
    compile in debug mode (e.g. NDEBUG *not* defined) and provide a
    compatible logger function in the sg_setup() call
    (for instance the standard logging function from sokol_log.h).
 }
(* Const before type ignored *)
{ always "sg" }
{ 0=panic, 1=error, 2=warning, 3=info }
{ SG_LOGITEM_* }
(* Const before type ignored *)
{ a message string, may be nullptr in release mode }
{ line number in sokol_gfx.h }
(* Const before type ignored *)
{ source filename, may be nullptr in release mode }

  Psg_logger = ^Tsg_logger;
  Tsg_logger = record
      func : procedure (tag:Pchar; log_level:Tuint32_t; log_item_id:Tuint32_t; message_or_null:Pchar; line_nr:Tuint32_t; 
                    filename_or_null:Pchar; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{ if true, HLSL shaders are compiled with D3DCOMPILE_DEBUG | D3DCOMPILE_SKIP_OPTIMIZATION }

  Psg_d3d11_desc = ^Tsg_d3d11_desc;
  Tsg_d3d11_desc = record
      shader_debugging : Tbool;
    end;
{ for debugging: use Metal managed storage mode for resources even with UMA }
{ Metal: use a managed MTLCommandBuffer which ref-counts used resources }

  Psg_metal_desc = ^Tsg_metal_desc;
  Tsg_metal_desc = record
      force_managed_storage_mode : Tbool;
      use_command_buffer_with_retained_references : Tbool;
    end;
{ set to true to disable the WebGPU backend BindGroup cache }
{ number of slots in the WebGPU bindgroup cache (must be 2^N) }

  Psg_wgpu_desc = ^Tsg_wgpu_desc;
  Tsg_wgpu_desc = record
      disable_bindgroups_cache : Tbool;
      bindgroups_cache_size : longint;
    end;
{ size of staging buffer for immutable and dynamic resources (default: 4 MB) }
{ size of per-frame staging buffer for updating streaming resources (default: 16 MB) }
{ size of per-frame descriptor buffer for updating resource bindings (default: 16 MB) }

  Psg_vulkan_desc = ^Tsg_vulkan_desc;
  Tsg_vulkan_desc = record
      copy_staging_buffer_size : longint;
      stream_staging_buffer_size : longint;
      descriptor_buffer_size : longint;
    end;
{ max size of all sg_apply_uniform() calls per frame, with worst-case 256 byte alignment }
{ max number of commit listener hook functions }
{ disable validation layer even in debug mode, useful for tests }
{ if true, enforce portable resource binding limits (SG_MAX_PORTABLE_*) }
{ d3d11-specific setup parameters }
{ metal-specific setup parameters }
{ webgpu-specific setup parameters }
{ vulkan-specific setup parameters }
{ optional memory allocation hooks }
{ optional log function override }
{ required externally provided runtime objects and defaults }

  Psg_desc = ^Tsg_desc;
  Tsg_desc = record
      _start_canary : Tuint32_t;
      buffer_pool_size : longint;
      image_pool_size : longint;
      sampler_pool_size : longint;
      shader_pool_size : longint;
      pipeline_pool_size : longint;
      view_pool_size : longint;
      uniform_buffer_size : longint;
      max_commit_listeners : longint;
      disable_validation : Tbool;
      enforce_portable_limits : Tbool;
      d3d11 : Tsg_d3d11_desc;
      metal : Tsg_metal_desc;
      wgpu : Tsg_wgpu_desc;
      vulkan : Tsg_vulkan_desc;
      allocator : Tsg_allocator;
      logger : Tsg_logger;
      environment : Tsg_environment;
      _end_canary : Tuint32_t;
    end;
{ setup and misc functions }
(* Const before type ignored *)

procedure sg_setup(desc:Psg_desc);cdecl;external;
procedure sg_shutdown;cdecl;external;
function sg_isvalid:Tbool;cdecl;external;
procedure sg_reset_state_cache;cdecl;external;
(* Const before type ignored *)
function sg_install_trace_hooks(trace_hooks:Psg_trace_hooks):Tsg_trace_hooks;cdecl;external;
(* Const before type ignored *)
procedure sg_push_debug_group(name:Pchar);cdecl;external;
procedure sg_pop_debug_group;cdecl;external;
function sg_add_commit_listener(listener:Tsg_commit_listener):Tbool;cdecl;external;
function sg_remove_commit_listener(listener:Tsg_commit_listener):Tbool;cdecl;external;
{ resource creation, destruction and updating }
(* Const before type ignored *)
function sg_make_buffer(desc:Psg_buffer_desc):Tsg_buffer;cdecl;external;
(* Const before type ignored *)
function sg_make_image(desc:Psg_image_desc):Tsg_image;cdecl;external;
(* Const before type ignored *)
function sg_make_sampler(desc:Psg_sampler_desc):Tsg_sampler;cdecl;external;
(* Const before type ignored *)
function sg_make_shader(desc:Psg_shader_desc):Tsg_shader;cdecl;external;
(* Const before type ignored *)
function sg_make_pipeline(desc:Psg_pipeline_desc):Tsg_pipeline;cdecl;external;
(* Const before type ignored *)
function sg_make_view(desc:Psg_view_desc):Tsg_view;cdecl;external;
procedure sg_destroy_buffer(buf:Tsg_buffer);cdecl;external;
procedure sg_destroy_image(img:Tsg_image);cdecl;external;
procedure sg_destroy_sampler(smp:Tsg_sampler);cdecl;external;
procedure sg_destroy_shader(shd:Tsg_shader);cdecl;external;
procedure sg_destroy_pipeline(pip:Tsg_pipeline);cdecl;external;
procedure sg_destroy_view(view:Tsg_view);cdecl;external;
(* Const before type ignored *)
procedure sg_update_buffer(buf:Tsg_buffer; data:Psg_range);cdecl;external;
(* Const before type ignored *)
procedure sg_update_image(img:Tsg_image; data:Psg_image_data);cdecl;external;
(* Const before type ignored *)
function sg_append_buffer(buf:Tsg_buffer; data:Psg_range):longint;cdecl;external;
function sg_query_buffer_overflow(buf:Tsg_buffer):Tbool;cdecl;external;
function sg_query_buffer_will_overflow(buf:Tsg_buffer; size:Tsize_t):Tbool;cdecl;external;
{ render and compute functions }
(* Const before type ignored *)
procedure sg_begin_pass(pass:Psg_pass);cdecl;external;
procedure sg_apply_viewport(x:longint; y:longint; width:longint; height:longint; origin_top_left:Tbool);cdecl;external;
procedure sg_apply_viewportf(x:single; y:single; width:single; height:single; origin_top_left:Tbool);cdecl;external;
procedure sg_apply_scissor_rect(x:longint; y:longint; width:longint; height:longint; origin_top_left:Tbool);cdecl;external;
procedure sg_apply_scissor_rectf(x:single; y:single; width:single; height:single; origin_top_left:Tbool);cdecl;external;
procedure sg_apply_pipeline(pip:Tsg_pipeline);cdecl;external;
(* Const before type ignored *)
procedure sg_apply_bindings(bindings:Psg_bindings);cdecl;external;
(* Const before type ignored *)
procedure sg_apply_uniforms(ub_slot:longint; data:Psg_range);cdecl;external;
procedure sg_draw(base_element:longint; num_elements:longint; num_instances:longint);cdecl;external;
procedure sg_draw_ex(base_element:longint; num_elements:longint; num_instances:longint; base_vertex:longint; base_instance:longint);cdecl;external;
procedure sg_dispatch(num_groups_x:longint; num_groups_y:longint; num_groups_z:longint);cdecl;external;
procedure sg_end_pass;cdecl;external;
procedure sg_commit;cdecl;external;
{ getting information }
function sg_query_desc:Tsg_desc;cdecl;external;
function sg_query_backend:Tsg_backend;cdecl;external;
function sg_query_features:Tsg_features;cdecl;external;
function sg_query_limits:Tsg_limits;cdecl;external;
function sg_query_pixelformat(fmt:Tsg_pixel_format):Tsg_pixelformat_info;cdecl;external;
function sg_query_row_pitch(fmt:Tsg_pixel_format; width:longint; row_align_bytes:longint):longint;cdecl;external;
function sg_query_surface_pitch(fmt:Tsg_pixel_format; width:longint; height:longint; row_align_bytes:longint):longint;cdecl;external;
{ get current state of a resource (INITIAL, ALLOC, VALID, FAILED, INVALID) }
function sg_query_buffer_state(buf:Tsg_buffer):Tsg_resource_state;cdecl;external;
function sg_query_image_state(img:Tsg_image):Tsg_resource_state;cdecl;external;
function sg_query_sampler_state(smp:Tsg_sampler):Tsg_resource_state;cdecl;external;
function sg_query_shader_state(shd:Tsg_shader):Tsg_resource_state;cdecl;external;
function sg_query_pipeline_state(pip:Tsg_pipeline):Tsg_resource_state;cdecl;external;
function sg_query_view_state(view:Tsg_view):Tsg_resource_state;cdecl;external;
{ get runtime information about a resource }
function sg_query_buffer_info(buf:Tsg_buffer):Tsg_buffer_info;cdecl;external;
function sg_query_image_info(img:Tsg_image):Tsg_image_info;cdecl;external;
function sg_query_sampler_info(smp:Tsg_sampler):Tsg_sampler_info;cdecl;external;
function sg_query_shader_info(shd:Tsg_shader):Tsg_shader_info;cdecl;external;
function sg_query_pipeline_info(pip:Tsg_pipeline):Tsg_pipeline_info;cdecl;external;
function sg_query_view_info(view:Tsg_view):Tsg_view_info;cdecl;external;
{ get desc structs matching a specific resource (NOTE that not all creation attributes may be provided) }
function sg_query_buffer_desc(buf:Tsg_buffer):Tsg_buffer_desc;cdecl;external;
function sg_query_image_desc(img:Tsg_image):Tsg_image_desc;cdecl;external;
function sg_query_sampler_desc(smp:Tsg_sampler):Tsg_sampler_desc;cdecl;external;
function sg_query_shader_desc(shd:Tsg_shader):Tsg_shader_desc;cdecl;external;
function sg_query_pipeline_desc(pip:Tsg_pipeline):Tsg_pipeline_desc;cdecl;external;
function sg_query_view_desc(view:Tsg_view):Tsg_view_desc;cdecl;external;
{ get resource creation desc struct with their default values replaced }
(* Const before type ignored *)
function sg_query_buffer_defaults(desc:Psg_buffer_desc):Tsg_buffer_desc;cdecl;external;
(* Const before type ignored *)
function sg_query_image_defaults(desc:Psg_image_desc):Tsg_image_desc;cdecl;external;
(* Const before type ignored *)
function sg_query_sampler_defaults(desc:Psg_sampler_desc):Tsg_sampler_desc;cdecl;external;
(* Const before type ignored *)
function sg_query_shader_defaults(desc:Psg_shader_desc):Tsg_shader_desc;cdecl;external;
(* Const before type ignored *)
function sg_query_pipeline_defaults(desc:Psg_pipeline_desc):Tsg_pipeline_desc;cdecl;external;
(* Const before type ignored *)
function sg_query_view_defaults(desc:Psg_view_desc):Tsg_view_desc;cdecl;external;
{ assorted query functions }
function sg_query_buffer_size(buf:Tsg_buffer):Tsize_t;cdecl;external;
function sg_query_buffer_usage(buf:Tsg_buffer):Tsg_buffer_usage;cdecl;external;
function sg_query_image_type(img:Tsg_image):Tsg_image_type;cdecl;external;
function sg_query_image_width(img:Tsg_image):longint;cdecl;external;
function sg_query_image_height(img:Tsg_image):longint;cdecl;external;
function sg_query_image_num_slices(img:Tsg_image):longint;cdecl;external;
function sg_query_image_num_mipmaps(img:Tsg_image):longint;cdecl;external;
function sg_query_image_pixelformat(img:Tsg_image):Tsg_pixel_format;cdecl;external;
function sg_query_image_usage(img:Tsg_image):Tsg_image_usage;cdecl;external;
function sg_query_image_sample_count(img:Tsg_image):longint;cdecl;external;
function sg_query_view_type(view:Tsg_view):Tsg_view_type;cdecl;external;
function sg_query_view_image(view:Tsg_view):Tsg_image;cdecl;external;
function sg_query_view_buffer(view:Tsg_view):Tsg_buffer;cdecl;external;
{ separate resource allocation and initialization (for async setup) }
function sg_alloc_buffer:Tsg_buffer;cdecl;external;
function sg_alloc_image:Tsg_image;cdecl;external;
function sg_alloc_sampler:Tsg_sampler;cdecl;external;
function sg_alloc_shader:Tsg_shader;cdecl;external;
function sg_alloc_pipeline:Tsg_pipeline;cdecl;external;
function sg_alloc_view:Tsg_view;cdecl;external;
procedure sg_dealloc_buffer(buf:Tsg_buffer);cdecl;external;
procedure sg_dealloc_image(img:Tsg_image);cdecl;external;
procedure sg_dealloc_sampler(smp:Tsg_sampler);cdecl;external;
procedure sg_dealloc_shader(shd:Tsg_shader);cdecl;external;
procedure sg_dealloc_pipeline(pip:Tsg_pipeline);cdecl;external;
procedure sg_dealloc_view(view:Tsg_view);cdecl;external;
(* Const before type ignored *)
procedure sg_init_buffer(buf:Tsg_buffer; desc:Psg_buffer_desc);cdecl;external;
(* Const before type ignored *)
procedure sg_init_image(img:Tsg_image; desc:Psg_image_desc);cdecl;external;
(* Const before type ignored *)
procedure sg_init_sampler(smg:Tsg_sampler; desc:Psg_sampler_desc);cdecl;external;
(* Const before type ignored *)
procedure sg_init_shader(shd:Tsg_shader; desc:Psg_shader_desc);cdecl;external;
(* Const before type ignored *)
procedure sg_init_pipeline(pip:Tsg_pipeline; desc:Psg_pipeline_desc);cdecl;external;
(* Const before type ignored *)
procedure sg_init_view(view:Tsg_view; desc:Psg_view_desc);cdecl;external;
procedure sg_uninit_buffer(buf:Tsg_buffer);cdecl;external;
procedure sg_uninit_image(img:Tsg_image);cdecl;external;
procedure sg_uninit_sampler(smp:Tsg_sampler);cdecl;external;
procedure sg_uninit_shader(shd:Tsg_shader);cdecl;external;
procedure sg_uninit_pipeline(pip:Tsg_pipeline);cdecl;external;
procedure sg_uninit_view(view:Tsg_view);cdecl;external;
procedure sg_fail_buffer(buf:Tsg_buffer);cdecl;external;
procedure sg_fail_image(img:Tsg_image);cdecl;external;
procedure sg_fail_sampler(smp:Tsg_sampler);cdecl;external;
procedure sg_fail_shader(shd:Tsg_shader);cdecl;external;
procedure sg_fail_pipeline(pip:Tsg_pipeline);cdecl;external;
procedure sg_fail_view(view:Tsg_view);cdecl;external;
{ frame and total stats }
procedure sg_enable_stats;cdecl;external;
procedure sg_disable_stats;cdecl;external;
function sg_stats_enabled:Tbool;cdecl;external;
function sg_query_stats:Tsg_stats;cdecl;external;
{ Backend-specific structs and functions, these may come in handy for mixing
   sokol-gfx rendering with 'native backend' rendering functions.

   This group of functions will be expanded as needed.
 }
(* Const before type ignored *)
{ ID3D11Buffer* }
type
  Psg_d3d11_buffer_info = ^Tsg_d3d11_buffer_info;
  Tsg_d3d11_buffer_info = record
      buf : pointer;
    end;
(* Const before type ignored *)
{ ID3D11Texture2D* }
(* Const before type ignored *)
{ ID3D11Texture3D* }
(* Const before type ignored *)
{ ID3D11Resource* (either tex2d or tex3d) }

  Psg_d3d11_image_info = ^Tsg_d3d11_image_info;
  Tsg_d3d11_image_info = record
      tex2d : pointer;
      tex3d : pointer;
      res : pointer;
    end;
(* Const before type ignored *)
{ ID3D11SamplerState* }

  Psg_d3d11_sampler_info = ^Tsg_d3d11_sampler_info;
  Tsg_d3d11_sampler_info = record
      smp : pointer;
    end;
(* Const before type ignored *)
{ ID3D11Buffer* (constant buffers by bind slot) }
(* Const before type ignored *)
{ ID3D11VertexShader* }
(* Const before type ignored *)
{ ID3D11PixelShader* }

  Psg_d3d11_shader_info = ^Tsg_d3d11_shader_info;
  Tsg_d3d11_shader_info = record
      cbufs : array[0..(SG_MAX_UNIFORMBLOCK_BINDSLOTS)-1] of pointer;
      vs : pointer;
      fs : pointer;
    end;
(* Const before type ignored *)
{ ID3D11InputLayout* }
(* Const before type ignored *)
{ ID3D11RasterizerState* }
(* Const before type ignored *)
{ ID3D11DepthStencilState* }
(* Const before type ignored *)
{ ID3D11BlendState* }

  Psg_d3d11_pipeline_info = ^Tsg_d3d11_pipeline_info;
  Tsg_d3d11_pipeline_info = record
      il : pointer;
      rs : pointer;
      dss : pointer;
      bs : pointer;
    end;
(* Const before type ignored *)
{ ID3D11ShaderResourceView }
(* Const before type ignored *)
{ ID3D11UnorderedAccessView }
(* Const before type ignored *)
{ ID3D11RenderTargetView }
(* Const before type ignored *)
{ ID3D11DepthStencilView }

  Psg_d3d11_view_info = ^Tsg_d3d11_view_info;
  Tsg_d3d11_view_info = record
      srv : pointer;
      uav : pointer;
      rtv : pointer;
      dsv : pointer;
    end;
(* Const before type ignored *)
{ id<MTLBuffer> }

  Psg_mtl_buffer_info = ^Tsg_mtl_buffer_info;
  Tsg_mtl_buffer_info = record
      buf : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of pointer;
      active_slot : longint;
    end;
(* Const before type ignored *)
{ id<MTLTexture> }

  Psg_mtl_image_info = ^Tsg_mtl_image_info;
  Tsg_mtl_image_info = record
      tex : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of pointer;
      active_slot : longint;
    end;
(* Const before type ignored *)
{ id<MTLSamplerState> }

  Psg_mtl_sampler_info = ^Tsg_mtl_sampler_info;
  Tsg_mtl_sampler_info = record
      smp : pointer;
    end;
(* Const before type ignored *)
{ id<MTLLibrary> }
(* Const before type ignored *)
{ id<MTLLibrary> }
(* Const before type ignored *)
{ id<MTLFunction> }
(* Const before type ignored *)
{ id<MTLFunction> }

  Psg_mtl_shader_info = ^Tsg_mtl_shader_info;
  Tsg_mtl_shader_info = record
      vertex_lib : pointer;
      fragment_lib : pointer;
      vertex_func : pointer;
      fragment_func : pointer;
    end;
(* Const before type ignored *)
{ id<MTLRenderPipelineState> }
(* Const before type ignored *)
{ id<MTLDepthStencilState> }

  Psg_mtl_pipeline_info = ^Tsg_mtl_pipeline_info;
  Tsg_mtl_pipeline_info = record
      rps : pointer;
      dss : pointer;
    end;
(* Const before type ignored *)
{ WGPUBuffer }

  Psg_wgpu_buffer_info = ^Tsg_wgpu_buffer_info;
  Tsg_wgpu_buffer_info = record
      buf : pointer;
    end;
(* Const before type ignored *)
{ WGPUTexture }

  Psg_wgpu_image_info = ^Tsg_wgpu_image_info;
  Tsg_wgpu_image_info = record
      tex : pointer;
    end;
(* Const before type ignored *)
{ WGPUSampler }

  Psg_wgpu_sampler_info = ^Tsg_wgpu_sampler_info;
  Tsg_wgpu_sampler_info = record
      smp : pointer;
    end;
(* Const before type ignored *)
{ WGPUShaderModule }
(* Const before type ignored *)
{ WGPUShaderModule }
(* Const before type ignored *)
{ WGPUBindGroupLayout; }

  Psg_wgpu_shader_info = ^Tsg_wgpu_shader_info;
  Tsg_wgpu_shader_info = record
      vs_mod : pointer;
      fs_mod : pointer;
      bgl : pointer;
    end;
(* Const before type ignored *)
{ WGPURenderPipeline }
(* Const before type ignored *)
{ WGPUComputePipeline }

  Psg_wgpu_pipeline_info = ^Tsg_wgpu_pipeline_info;
  Tsg_wgpu_pipeline_info = record
      render_pipeline : pointer;
      compute_pipeline : pointer;
    end;
(* Const before type ignored *)
{ WGPUTextureView }

  Psg_wgpu_view_info = ^Tsg_wgpu_view_info;
  Tsg_wgpu_view_info = record
      view : pointer;
    end;

  Psg_gl_buffer_info = ^Tsg_gl_buffer_info;
  Tsg_gl_buffer_info = record
      buf : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of Tuint32_t;
      active_slot : longint;
    end;

  Psg_gl_image_info = ^Tsg_gl_image_info;
  Tsg_gl_image_info = record
      tex : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of Tuint32_t;
      tex_target : Tuint32_t;
      active_slot : longint;
    end;

  Psg_gl_sampler_info = ^Tsg_gl_sampler_info;
  Tsg_gl_sampler_info = record
      smp : Tuint32_t;
    end;

  Psg_gl_shader_info = ^Tsg_gl_shader_info;
  Tsg_gl_shader_info = record
      prog : Tuint32_t;
    end;

  Psg_gl_view_info = ^Tsg_gl_view_info;
  Tsg_gl_view_info = record
      tex_view : array[0..(SG_NUM_INFLIGHT_FRAMES)-1] of Tuint32_t;
      msaa_render_buffer : Tuint32_t;
      msaa_resolve_frame_buffer : Tuint32_t;
    end;
{ D3D11: return ID3D11Device }
(* Const before type ignored *)

function sg_d3d11_device:pointer;cdecl;external;
{ D3D11: return ID3D11DeviceContext }
(* Const before type ignored *)
function sg_d3d11_device_context:pointer;cdecl;external;
{ D3D11: get internal buffer resource objects }
function sg_d3d11_query_buffer_info(buf:Tsg_buffer):Tsg_d3d11_buffer_info;cdecl;external;
{ D3D11: get internal image resource objects }
function sg_d3d11_query_image_info(img:Tsg_image):Tsg_d3d11_image_info;cdecl;external;
{ D3D11: get internal sampler resource objects }
function sg_d3d11_query_sampler_info(smp:Tsg_sampler):Tsg_d3d11_sampler_info;cdecl;external;
{ D3D11: get internal shader resource objects }
function sg_d3d11_query_shader_info(shd:Tsg_shader):Tsg_d3d11_shader_info;cdecl;external;
{ D3D11: get internal pipeline resource objects }
function sg_d3d11_query_pipeline_info(pip:Tsg_pipeline):Tsg_d3d11_pipeline_info;cdecl;external;
{ D3D11: get internal view resource objects }
function sg_d3d11_query_view_info(view:Tsg_view):Tsg_d3d11_view_info;cdecl;external;
{ Metal: return __bridge-casted MTLDevice }
(* Const before type ignored *)
function sg_mtl_device:pointer;cdecl;external;
{ Metal: return __bridge-casted MTLRenderCommandEncoder when inside render pass (otherwise zero) }
(* Const before type ignored *)
function sg_mtl_render_command_encoder:pointer;cdecl;external;
{ Metal: return __bridge-casted MTLComputeCommandEncoder when inside compute pass (otherwise zero) }
(* Const before type ignored *)
function sg_mtl_compute_command_encoder:pointer;cdecl;external;
{ Metal: return __bridge-casted MTLCommandQueue }
(* Const before type ignored *)
function sg_mtl_command_queue:pointer;cdecl;external;
{ Metal: get internal __bridge-casted buffer resource objects }
function sg_mtl_query_buffer_info(buf:Tsg_buffer):Tsg_mtl_buffer_info;cdecl;external;
{ Metal: get internal __bridge-casted image resource objects }
function sg_mtl_query_image_info(img:Tsg_image):Tsg_mtl_image_info;cdecl;external;
{ Metal: get internal __bridge-casted sampler resource objects }
function sg_mtl_query_sampler_info(smp:Tsg_sampler):Tsg_mtl_sampler_info;cdecl;external;
{ Metal: get internal __bridge-casted shader resource objects }
function sg_mtl_query_shader_info(shd:Tsg_shader):Tsg_mtl_shader_info;cdecl;external;
{ Metal: get internal __bridge-casted pipeline resource objects }
function sg_mtl_query_pipeline_info(pip:Tsg_pipeline):Tsg_mtl_pipeline_info;cdecl;external;
{ WebGPU: return WGPUDevice object }
(* Const before type ignored *)
function sg_wgpu_device:pointer;cdecl;external;
{ WebGPU: return WGPUQueue object }
(* Const before type ignored *)
function sg_wgpu_queue:pointer;cdecl;external;
{ WebGPU: return this frame's WGPUCommandEncoder }
(* Const before type ignored *)
function sg_wgpu_command_encoder:pointer;cdecl;external;
{ WebGPU: return WGPURenderPassEncoder of current pass (returns 0 when outside pass or in a compute pass) }
(* Const before type ignored *)
function sg_wgpu_render_pass_encoder:pointer;cdecl;external;
{ WebGPU: return WGPUComputePassEncoder of current pass (returns 0 when outside pass or in a render pass) }
(* Const before type ignored *)
function sg_wgpu_compute_pass_encoder:pointer;cdecl;external;
{ WebGPU: get internal buffer resource objects }
function sg_wgpu_query_buffer_info(buf:Tsg_buffer):Tsg_wgpu_buffer_info;cdecl;external;
{ WebGPU: get internal image resource objects }
function sg_wgpu_query_image_info(img:Tsg_image):Tsg_wgpu_image_info;cdecl;external;
{ WebGPU: get internal sampler resource objects }
function sg_wgpu_query_sampler_info(smp:Tsg_sampler):Tsg_wgpu_sampler_info;cdecl;external;
{ WebGPU: get internal shader resource objects }
function sg_wgpu_query_shader_info(shd:Tsg_shader):Tsg_wgpu_shader_info;cdecl;external;
{ WebGPU: get internal pipeline resource objects }
function sg_wgpu_query_pipeline_info(pip:Tsg_pipeline):Tsg_wgpu_pipeline_info;cdecl;external;
{ WebGPU: get internal view resource objects }
function sg_wgpu_query_view_info(view:Tsg_view):Tsg_wgpu_view_info;cdecl;external;
{ GL: get internal buffer resource objects }
function sg_gl_query_buffer_info(buf:Tsg_buffer):Tsg_gl_buffer_info;cdecl;external;
{ GL: get internal image resource objects }
function sg_gl_query_image_info(img:Tsg_image):Tsg_gl_image_info;cdecl;external;
{ GL: get internal sampler resource objects }
function sg_gl_query_sampler_info(smp:Tsg_sampler):Tsg_gl_sampler_info;cdecl;external;
{ GL: get internal shader resource objects }
function sg_gl_query_shader_info(shd:Tsg_shader):Tsg_gl_shader_info;cdecl;external;
{ GL: get internal view resource objects }
function sg_gl_query_view_info(view:Tsg_view):Tsg_gl_view_info;cdecl;external;

implementation


end.
