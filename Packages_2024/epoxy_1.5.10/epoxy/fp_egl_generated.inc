  {$IFDEF read_interface}

type
  PAHardwareBuffer = type Pointer;

  PEGLBoolean = ^TEGLBoolean;
  TEGLBoolean = dword;

  PEGLenum = ^TEGLenum;
  TEGLenum = dword;

  PEGLAttribKHR = ^TEGLAttribKHR;
  TEGLAttribKHR = Tintptr_t;

  PEGLAttrib = ^TEGLAttrib;
  TEGLAttrib = Tintptr_t;

  PEGLClientBuffer = ^TEGLClientBuffer;
  TEGLClientBuffer = pointer;

  PEGLConfig = ^TEGLConfig;
  TEGLConfig = pointer;

  PEGLContext = ^TEGLContext;
  TEGLContext = pointer;

  PEGLDeviceEXT = ^TEGLDeviceEXT;
  TEGLDeviceEXT = pointer;

  PEGLDisplay = ^TEGLDisplay;
  TEGLDisplay = pointer;

  PEGLImage = ^TEGLImage;
  TEGLImage = pointer;

  PEGLImageKHR = ^TEGLImageKHR;
  TEGLImageKHR = pointer;

  PEGLLabelKHR = ^TEGLLabelKHR;
  TEGLLabelKHR = pointer;

  PEGLObjectKHR = ^TEGLObjectKHR;
  TEGLObjectKHR = pointer;

  PEGLOutputLayerEXT = ^TEGLOutputLayerEXT;
  TEGLOutputLayerEXT = pointer;

  PEGLOutputPortEXT = ^TEGLOutputPortEXT;
  TEGLOutputPortEXT = pointer;

  PEGLStreamKHR = ^TEGLStreamKHR;
  TEGLStreamKHR = pointer;

  PEGLSurface = ^TEGLSurface;
  TEGLSurface = pointer;

  PEGLSync = ^TEGLSync;
  TEGLSync = pointer;

  PEGLSyncKHR = ^TEGLSyncKHR;
  TEGLSyncKHR = pointer;

  PEGLSyncNV = ^TEGLSyncNV;
  TEGLSyncNV = pointer;

  T_eglMustCastToProperFunctionPointerType = procedure(para1: pointer); cdecl;

  PEGLTimeKHR = ^TEGLTimeKHR;
  TEGLTimeKHR = Tkhronos_utime_nanoseconds_t;

  PEGLTime = ^TEGLTime;
  TEGLTime = Tkhronos_utime_nanoseconds_t;

  PEGLTimeNV = ^TEGLTimeNV;
  TEGLTimeNV = Tkhronos_utime_nanoseconds_t;

  PEGLuint64NV = ^TEGLuint64NV;
  TEGLuint64NV = Tkhronos_utime_nanoseconds_t;

  PEGLuint64KHR = ^TEGLuint64KHR;
  TEGLuint64KHR = Tkhronos_uint64_t;

  PEGLnsecsANDROID = ^TEGLnsecsANDROID;
  TEGLnsecsANDROID = Tkhronos_stime_nanoseconds_t;

  PEGLNativeFileDescriptorKHR = ^TEGLNativeFileDescriptorKHR;
  TEGLNativeFileDescriptorKHR = longint;

  PEGLsizeiANDROID = ^TEGLsizeiANDROID;
  TEGLsizeiANDROID = Tkhronos_ssize_t;

  TEGLSetBlobFuncANDROID = procedure(key: pointer; keySize: TEGLsizeiANDROID; value: pointer; valueSize: TEGLsizeiANDROID); cdecl;

  TEGLGetBlobFuncANDROID = function(key: pointer; keySize: TEGLsizeiANDROID; value: pointer; valueSize: TEGLsizeiANDROID): TEGLsizeiANDROID; cdecl;

  TEGLClientPixmapHI = record
    pData: pointer;
    iWidth: TEGLint;
    iHeight: TEGLint;
    iStride: TEGLint;
  end;
  PEGLClientPixmapHI = ^TEGLClientPixmapHI;

  TEGLDEBUGPROCKHR = procedure(error: TEGLenum; command: pchar; messageType: TEGLint; threadLabel: TEGLLabelKHR; objectLabel: TEGLLabelKHR; message: pchar); cdecl;

const
  EGL_VERSION_1_0 = 1;
  EGL_VERSION_1_1 = 1;
  EGL_VERSION_1_2 = 1;
  EGL_VERSION_1_3 = 1;
  EGL_VERSION_1_4 = 1;
  EGL_VERSION_1_5 = 1;
  EGL_ANDROID_GLES_layers = 1;
  EGL_ANDROID_blob_cache = 1;
  EGL_ANDROID_create_native_client_buffer = 1;
  EGL_ANDROID_framebuffer_target = 1;
  EGL_ANDROID_front_buffer_auto_refresh = 1;
  EGL_ANDROID_get_frame_timestamps = 1;
  EGL_ANDROID_get_native_client_buffer = 1;
  EGL_ANDROID_image_native_buffer = 1;
  EGL_ANDROID_native_fence_sync = 1;
  EGL_ANDROID_presentation_time = 1;
  EGL_ANDROID_recordable = 1;
  EGL_ANGLE_d3d_share_handle_client_buffer = 1;
  EGL_ANGLE_device_d3d = 1;
  EGL_ANGLE_query_surface_pointer = 1;
  EGL_ANGLE_surface_d3d_texture_2d_share_handle = 1;
  EGL_ANGLE_window_fixed_size = 1;
  EGL_ARM_implicit_external_sync = 1;
  EGL_ARM_pixmap_multisample_discard = 1;
  EGL_EXT_bind_to_front = 1;
  EGL_EXT_buffer_age = 1;
  EGL_EXT_client_extensions = 1;
  EGL_EXT_client_sync = 1;
  EGL_EXT_compositor = 1;
  EGL_EXT_create_context_robustness = 1;
  EGL_EXT_device_base = 1;
  EGL_EXT_device_drm = 1;
  EGL_EXT_device_enumeration = 1;
  EGL_EXT_device_openwf = 1;
  EGL_EXT_device_query = 1;
  EGL_EXT_gl_colorspace_bt2020_linear = 1;
  EGL_EXT_gl_colorspace_bt2020_pq = 1;
  EGL_EXT_gl_colorspace_display_p3 = 1;
  EGL_EXT_gl_colorspace_display_p3_linear = 1;
  EGL_EXT_gl_colorspace_display_p3_passthrough = 1;
  EGL_EXT_gl_colorspace_scrgb = 1;
  EGL_EXT_gl_colorspace_scrgb_linear = 1;
  EGL_EXT_image_dma_buf_import = 1;
  EGL_EXT_image_dma_buf_import_modifiers = 1;
  EGL_EXT_image_gl_colorspace = 1;
  EGL_EXT_image_implicit_sync_control = 1;
  EGL_EXT_multiview_window = 1;
  EGL_EXT_output_base = 1;
  EGL_EXT_output_drm = 1;
  EGL_EXT_output_openwf = 1;
  EGL_EXT_pixel_format_float = 1;
  EGL_EXT_platform_base = 1;
  EGL_EXT_platform_device = 1;
  EGL_EXT_platform_wayland = 1;
  EGL_EXT_platform_x11 = 1;
  EGL_EXT_protected_content = 1;
  EGL_EXT_protected_surface = 1;
  EGL_EXT_stream_consumer_egloutput = 1;
  EGL_EXT_surface_CTA861_3_metadata = 1;
  EGL_EXT_surface_SMPTE2086_metadata = 1;
  EGL_EXT_swap_buffers_with_damage = 1;
  EGL_EXT_sync_reuse = 1;
  EGL_EXT_yuv_surface = 1;
  EGL_HI_clientpixmap = 1;
  EGL_HI_colorformats = 1;
  EGL_IMG_context_priority = 1;
  EGL_IMG_image_plane_attribs = 1;
  EGL_KHR_cl_event = 1;
  EGL_KHR_cl_event2 = 1;
  EGL_KHR_client_get_all_proc_addresses = 1;
  EGL_KHR_config_attribs = 1;
  EGL_KHR_context_flush_control = 1;
  EGL_KHR_create_context = 1;
  EGL_KHR_create_context_no_error = 1;
  EGL_KHR_debug = 1;
  EGL_KHR_display_reference = 1;
  EGL_KHR_fence_sync = 1;
  EGL_KHR_get_all_proc_addresses = 1;
  EGL_KHR_gl_colorspace = 1;
  EGL_KHR_gl_renderbuffer_image = 1;
  EGL_KHR_gl_texture_2D_image = 1;
  EGL_KHR_gl_texture_3D_image = 1;
  EGL_KHR_gl_texture_cubemap_image = 1;
  EGL_KHR_image = 1;
  EGL_KHR_image_base = 1;
  EGL_KHR_image_pixmap = 1;
  EGL_KHR_lock_surface = 1;
  EGL_KHR_lock_surface2 = 1;
  EGL_KHR_lock_surface3 = 1;
  EGL_KHR_mutable_render_buffer = 1;
  EGL_KHR_no_config_context = 1;
  EGL_KHR_partial_update = 1;
  EGL_KHR_platform_android = 1;
  EGL_KHR_platform_gbm = 1;
  EGL_KHR_platform_wayland = 1;
  EGL_KHR_platform_x11 = 1;
  EGL_KHR_reusable_sync = 1;
  EGL_KHR_stream = 1;
  EGL_KHR_stream_attrib = 1;
  EGL_KHR_stream_consumer_gltexture = 1;
  EGL_KHR_stream_cross_process_fd = 1;
  EGL_KHR_stream_fifo = 1;
  EGL_KHR_stream_producer_aldatalocator = 1;
  EGL_KHR_stream_producer_eglsurface = 1;
  EGL_KHR_surfaceless_context = 1;
  EGL_KHR_swap_buffers_with_damage = 1;
  EGL_KHR_vg_parent_image = 1;
  EGL_KHR_wait_sync = 1;
  EGL_MESA_drm_image = 1;
  EGL_MESA_image_dma_buf_export = 1;
  EGL_MESA_platform_gbm = 1;
  EGL_MESA_platform_surfaceless = 1;
  EGL_MESA_query_driver = 1;
  EGL_NOK_swap_region = 1;
  EGL_NOK_swap_region2 = 1;
  EGL_NOK_texture_from_pixmap = 1;
  EGL_NV_3dvision_surface = 1;
  EGL_NV_context_priority_realtime = 1;
  EGL_NV_coverage_sample = 1;
  EGL_NV_coverage_sample_resolve = 1;
  EGL_NV_cuda_event = 1;
  EGL_NV_depth_nonlinear = 1;
  EGL_NV_device_cuda = 1;
  EGL_NV_native_query = 1;
  EGL_NV_post_convert_rounding = 1;
  EGL_NV_post_sub_buffer = 1;
  EGL_NV_quadruple_buffer = 1;
  EGL_NV_robustness_video_memory_purge = 1;
  EGL_NV_stream_consumer_gltexture_yuv = 1;
  EGL_NV_stream_cross_display = 1;
  EGL_NV_stream_cross_object = 1;
  EGL_NV_stream_cross_partition = 1;
  EGL_NV_stream_cross_process = 1;
  EGL_NV_stream_cross_system = 1;
  EGL_NV_stream_dma = 1;
  EGL_NV_stream_fifo_next = 1;
  EGL_NV_stream_fifo_synchronous = 1;
  EGL_NV_stream_flush = 1;
  EGL_NV_stream_frame_limits = 1;
  EGL_NV_stream_metadata = 1;
  EGL_NV_stream_origin = 1;
  EGL_NV_stream_remote = 1;
  EGL_NV_stream_reset = 1;
  EGL_NV_stream_socket = 1;
  EGL_NV_stream_socket_inet = 1;
  EGL_NV_stream_socket_unix = 1;
  EGL_NV_stream_sync = 1;
  EGL_NV_sync = 1;
  EGL_NV_system_time = 1;
  EGL_NV_triple_buffer = 1;
  EGL_TIZEN_image_native_buffer = 1;
  EGL_TIZEN_image_native_surface = 1;
  EGL_NO_NATIVE_FENCE_FD_ANDROID = -(1);
  EGL_CONTEXT_RELEASE_BEHAVIOR_NONE_KHR = 0;
  EGL_DEPTH_ENCODING_NONE_NV = 0;
  EGL_FALSE = 0;
  EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT = $00000001;
  EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT_KHR = $00000001;
  EGL_CONTEXT_OPENGL_DEBUG_BIT_KHR = $00000001;
  EGL_DRM_BUFFER_USE_SCANOUT_MESA = $00000001;
  EGL_NATIVE_BUFFER_USAGE_PROTECTED_BIT_ANDROID = $00000001;
  EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT = $00000002;
  EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT_KHR = $00000002;
  EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE_BIT_KHR = $00000002;
  EGL_DRM_BUFFER_USE_SHARE_MESA = $00000002;
  EGL_NATIVE_BUFFER_USAGE_RENDERBUFFER_BIT_ANDROID = $00000002;
  EGL_CONTEXT_OPENGL_ROBUST_ACCESS_BIT_KHR = $00000004;
  EGL_DRM_BUFFER_USE_CURSOR_MESA = $00000004;
  EGL_NATIVE_BUFFER_USAGE_TEXTURE_BIT_ANDROID = $00000004;
  EGL_OPENGL_ES3_BIT = $00000040;
  EGL_OPENGL_ES3_BIT_KHR = $00000040;
  EGL_OPENGL_ES_BIT = $0001;
  EGL_PBUFFER_BIT = $0001;
  EGL_READ_SURFACE_BIT_KHR = $0001;
  EGL_SYNC_FLUSH_COMMANDS_BIT = $0001;
  EGL_SYNC_FLUSH_COMMANDS_BIT_KHR = $0001;
  EGL_SYNC_FLUSH_COMMANDS_BIT_NV = $0001;
  EGL_OPENVG_BIT = $0002;
  EGL_PIXMAP_BIT = $0002;
  EGL_WRITE_SURFACE_BIT_KHR = $0002;
  EGL_OPENGL_ES2_BIT = $0004;
  EGL_WINDOW_BIT = $0004;
  EGL_OPENGL_BIT = $0008;
  EGL_PBUFFER_IMAGE_BIT_TAO = $0008;
  EGL_INTEROP_BIT_KHR = $0010;
  EGL_PBUFFER_PALETTE_IMAGE_BIT_TAO = $0010;
  EGL_OPENMAX_IL_BIT_KHR = $0020;
  EGL_VG_COLORSPACE_LINEAR_BIT = $0020;
  EGL_VG_COLORSPACE_LINEAR_BIT_KHR = $0020;
  EGL_VG_ALPHA_FORMAT_PRE_BIT = $0040;
  EGL_VG_ALPHA_FORMAT_PRE_BIT_KHR = $0040;
  EGL_LOCK_SURFACE_BIT_KHR = $0080;
  EGL_OPTIMAL_FORMAT_BIT_KHR = $0100;
  EGL_MULTISAMPLE_RESOLVE_BOX_BIT = $0200;
  EGL_SWAP_BEHAVIOR_PRESERVED_BIT = $0400;
  EGL_STREAM_BIT_KHR = $0800;
  EGL_MUTABLE_RENDER_BUFFER_BIT_KHR = $1000;
  EGL_CONTEXT_RELEASE_BEHAVIOR_KHR = $2097;
  EGL_CONTEXT_RELEASE_BEHAVIOR_FLUSH_KHR = $2098;
  EGL_SUCCESS = $3000;
  EGL_NOT_INITIALIZED = $3001;
  EGL_BAD_ACCESS = $3002;
  EGL_BAD_ALLOC = $3003;
  EGL_BAD_ATTRIBUTE = $3004;
  EGL_BAD_CONFIG = $3005;
  EGL_BAD_CONTEXT = $3006;
  EGL_BAD_CURRENT_SURFACE = $3007;
  EGL_BAD_DISPLAY = $3008;
  EGL_BAD_MATCH = $3009;
  EGL_BAD_NATIVE_PIXMAP = $300A;
  EGL_BAD_NATIVE_WINDOW = $300B;
  EGL_BAD_PARAMETER = $300C;
  EGL_BAD_SURFACE = $300D;
  EGL_CONTEXT_LOST = $300E;
  EGL_BUFFER_SIZE = $3020;
  EGL_ALPHA_SIZE = $3021;
  EGL_BLUE_SIZE = $3022;
  EGL_GREEN_SIZE = $3023;
  EGL_RED_SIZE = $3024;
  EGL_DEPTH_SIZE = $3025;
  EGL_STENCIL_SIZE = $3026;
  EGL_CONFIG_CAVEAT = $3027;
  EGL_CONFIG_ID = $3028;
  EGL_LEVEL = $3029;
  EGL_MAX_PBUFFER_HEIGHT = $302A;
  EGL_MAX_PBUFFER_PIXELS = $302B;
  EGL_MAX_PBUFFER_WIDTH = $302C;
  EGL_NATIVE_RENDERABLE = $302D;
  EGL_NATIVE_VISUAL_ID = $302E;
  EGL_NATIVE_VISUAL_TYPE = $302F;
  EGL_SAMPLES = $3031;
  EGL_SAMPLE_BUFFERS = $3032;
  EGL_SURFACE_TYPE = $3033;
  EGL_TRANSPARENT_TYPE = $3034;
  EGL_TRANSPARENT_BLUE_VALUE = $3035;
  EGL_TRANSPARENT_GREEN_VALUE = $3036;
  EGL_TRANSPARENT_RED_VALUE = $3037;
  EGL_NONE = $3038;
  EGL_BIND_TO_TEXTURE_RGB = $3039;
  EGL_BIND_TO_TEXTURE_RGBA = $303A;
  EGL_MIN_SWAP_INTERVAL = $303B;
  EGL_MAX_SWAP_INTERVAL = $303C;
  EGL_LUMINANCE_SIZE = $303D;
  EGL_ALPHA_MASK_SIZE = $303E;
  EGL_COLOR_BUFFER_TYPE = $303F;
  EGL_RENDERABLE_TYPE = $3040;
  EGL_MATCH_NATIVE_PIXMAP = $3041;
  EGL_CONFORMANT = $3042;
  EGL_CONFORMANT_KHR = $3042;
  EGL_MATCH_FORMAT_KHR = $3043;
  EGL_SLOW_CONFIG = $3050;
  EGL_NON_CONFORMANT_CONFIG = $3051;
  EGL_TRANSPARENT_RGB = $3052;
  EGL_VENDOR = $3053;
  EGL_VERSION = $3054;
  EGL_EXTENSIONS = $3055;
  EGL_HEIGHT = $3056;
  EGL_WIDTH = $3057;
  EGL_LARGEST_PBUFFER = $3058;
  EGL_DRAW = $3059;
  EGL_READ = $305A;
  EGL_CORE_NATIVE_ENGINE = $305B;
  EGL_NO_TEXTURE = $305C;
  EGL_TEXTURE_RGB = $305D;
  EGL_TEXTURE_RGBA = $305E;
  EGL_TEXTURE_2D = $305F;
  EGL_Y_INVERTED_NOK = $307F;
  EGL_TEXTURE_FORMAT = $3080;
  EGL_TEXTURE_TARGET = $3081;
  EGL_MIPMAP_TEXTURE = $3082;
  EGL_MIPMAP_LEVEL = $3083;
  EGL_BACK_BUFFER = $3084;
  EGL_SINGLE_BUFFER = $3085;
  EGL_RENDER_BUFFER = $3086;
  EGL_COLORSPACE = $3087;
  EGL_VG_COLORSPACE = $3087;
  EGL_ALPHA_FORMAT = $3088;
  EGL_VG_ALPHA_FORMAT = $3088;
  EGL_COLORSPACE_sRGB = $3089;
  EGL_GL_COLORSPACE_SRGB = $3089;
  EGL_GL_COLORSPACE_SRGB_KHR = $3089;
  EGL_VG_COLORSPACE_sRGB = $3089;
  EGL_COLORSPACE_LINEAR = $308A;
  EGL_GL_COLORSPACE_LINEAR = $308A;
  EGL_GL_COLORSPACE_LINEAR_KHR = $308A;
  EGL_VG_COLORSPACE_LINEAR = $308A;
  EGL_ALPHA_FORMAT_NONPRE = $308B;
  EGL_VG_ALPHA_FORMAT_NONPRE = $308B;
  EGL_ALPHA_FORMAT_PRE = $308C;
  EGL_VG_ALPHA_FORMAT_PRE = $308C;
  EGL_CLIENT_APIS = $308D;
  EGL_RGB_BUFFER = $308E;
  EGL_LUMINANCE_BUFFER = $308F;
  EGL_HORIZONTAL_RESOLUTION = $3090;
  EGL_VERTICAL_RESOLUTION = $3091;
  EGL_PIXEL_ASPECT_RATIO = $3092;
  EGL_SWAP_BEHAVIOR = $3093;
  EGL_BUFFER_PRESERVED = $3094;
  EGL_BUFFER_DESTROYED = $3095;
  EGL_OPENVG_IMAGE = $3096;
  EGL_CONTEXT_CLIENT_TYPE = $3097;
  EGL_CONTEXT_CLIENT_VERSION = $3098;
  EGL_CONTEXT_MAJOR_VERSION = $3098;
  EGL_CONTEXT_MAJOR_VERSION_KHR = $3098;
  EGL_MULTISAMPLE_RESOLVE = $3099;
  EGL_MULTISAMPLE_RESOLVE_DEFAULT = $309A;
  EGL_MULTISAMPLE_RESOLVE_BOX = $309B;
  EGL_CL_EVENT_HANDLE = $309C;
  EGL_CL_EVENT_HANDLE_KHR = $309C;
  EGL_GL_COLORSPACE = $309D;
  EGL_GL_COLORSPACE_KHR = $309D;
  EGL_OPENGL_ES_API = $30A0;
  EGL_OPENVG_API = $30A1;
  EGL_OPENGL_API = $30A2;
  EGL_NATIVE_PIXMAP_KHR = $30B0;
  EGL_GL_TEXTURE_2D = $30B1;
  EGL_GL_TEXTURE_2D_KHR = $30B1;
  EGL_GL_TEXTURE_3D = $30B2;
  EGL_GL_TEXTURE_3D_KHR = $30B2;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X = $30B3;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X_KHR = $30B3;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X = $30B4;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X_KHR = $30B4;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y = $30B5;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y_KHR = $30B5;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = $30B6;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_KHR = $30B6;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z = $30B7;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z_KHR = $30B7;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = $30B8;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_KHR = $30B8;
  EGL_GL_RENDERBUFFER = $30B9;
  EGL_GL_RENDERBUFFER_KHR = $30B9;
  EGL_VG_PARENT_IMAGE_KHR = $30BA;
  EGL_GL_TEXTURE_LEVEL = $30BC;
  EGL_GL_TEXTURE_LEVEL_KHR = $30BC;
  EGL_GL_TEXTURE_ZOFFSET = $30BD;
  EGL_GL_TEXTURE_ZOFFSET_KHR = $30BD;
  EGL_POST_SUB_BUFFER_SUPPORTED_NV = $30BE;
  EGL_CONTEXT_OPENGL_ROBUST_ACCESS_EXT = $30BF;
  EGL_FORMAT_RGB_565_EXACT_KHR = $30C0;
  EGL_FORMAT_RGB_565_KHR = $30C1;
  EGL_FORMAT_RGBA_8888_EXACT_KHR = $30C2;
  EGL_FORMAT_RGBA_8888_KHR = $30C3;
  EGL_MAP_PRESERVE_PIXELS_KHR = $30C4;
  EGL_LOCK_USAGE_HINT_KHR = $30C5;
  EGL_BITMAP_POINTER_KHR = $30C6;
  EGL_BITMAP_PITCH_KHR = $30C7;
  EGL_BITMAP_ORIGIN_KHR = $30C8;
  EGL_BITMAP_PIXEL_RED_OFFSET_KHR = $30C9;
  EGL_BITMAP_PIXEL_GREEN_OFFSET_KHR = $30CA;
  EGL_BITMAP_PIXEL_BLUE_OFFSET_KHR = $30CB;
  EGL_BITMAP_PIXEL_ALPHA_OFFSET_KHR = $30CC;
  EGL_BITMAP_PIXEL_LUMINANCE_OFFSET_KHR = $30CD;
  EGL_LOWER_LEFT_KHR = $30CE;
  EGL_UPPER_LEFT_KHR = $30CF;
  EGL_IMAGE_PRESERVED = $30D2;
  EGL_IMAGE_PRESERVED_KHR = $30D2;
  EGL_SHARED_IMAGE_NOK = $30DA;
  EGL_COVERAGE_BUFFERS_NV = $30E0;
  EGL_COVERAGE_SAMPLES_NV = $30E1;
  EGL_DEPTH_ENCODING_NV = $30E2;
  EGL_DEPTH_ENCODING_NONLINEAR_NV = $30E3;
  EGL_SYNC_PRIOR_COMMANDS_COMPLETE_NV = $30E6;
  EGL_SYNC_STATUS_NV = $30E7;
  EGL_SIGNALED_NV = $30E8;
  EGL_UNSIGNALED_NV = $30E9;
  EGL_ALREADY_SIGNALED_NV = $30EA;
  EGL_TIMEOUT_EXPIRED_NV = $30EB;
  EGL_CONDITION_SATISFIED_NV = $30EC;
  EGL_SYNC_TYPE_NV = $30ED;
  EGL_SYNC_CONDITION_NV = $30EE;
  EGL_SYNC_FENCE_NV = $30EF;
  EGL_SYNC_PRIOR_COMMANDS_COMPLETE = $30F0;
  EGL_SYNC_PRIOR_COMMANDS_COMPLETE_KHR = $30F0;
  EGL_SYNC_STATUS = $30F1;
  EGL_SYNC_STATUS_KHR = $30F1;
  EGL_SIGNALED = $30F2;
  EGL_SIGNALED_KHR = $30F2;
  EGL_UNSIGNALED = $30F3;
  EGL_UNSIGNALED_KHR = $30F3;
  EGL_TIMEOUT_EXPIRED = $30F5;
  EGL_TIMEOUT_EXPIRED_KHR = $30F5;
  EGL_CONDITION_SATISFIED = $30F6;
  EGL_CONDITION_SATISFIED_KHR = $30F6;
  EGL_SYNC_TYPE = $30F7;
  EGL_SYNC_TYPE_KHR = $30F7;
  EGL_SYNC_CONDITION = $30F8;
  EGL_SYNC_CONDITION_KHR = $30F8;
  EGL_SYNC_FENCE = $30F9;
  EGL_SYNC_FENCE_KHR = $30F9;
  EGL_SYNC_REUSABLE_KHR = $30FA;
  EGL_CONTEXT_MINOR_VERSION = $30FB;
  EGL_CONTEXT_MINOR_VERSION_KHR = $30FB;
  EGL_CONTEXT_FLAGS_KHR = $30FC;
  EGL_CONTEXT_OPENGL_PROFILE_MASK = $30FD;
  EGL_CONTEXT_OPENGL_PROFILE_MASK_KHR = $30FD;
  EGL_SYNC_CL_EVENT = $30FE;
  EGL_SYNC_CL_EVENT_KHR = $30FE;
  EGL_SYNC_CL_EVENT_COMPLETE = $30FF;
  EGL_SYNC_CL_EVENT_COMPLETE_KHR = $30FF;
  EGL_CONTEXT_PRIORITY_LEVEL_IMG = $3100;
  EGL_CONTEXT_PRIORITY_HIGH_IMG = $3101;
  EGL_CONTEXT_PRIORITY_MEDIUM_IMG = $3102;
  EGL_CONTEXT_PRIORITY_LOW_IMG = $3103;
  EGL_NATIVE_BUFFER_MULTIPLANE_SEPARATE_IMG = $3105;
  EGL_NATIVE_BUFFER_PLANE_OFFSET_IMG = $3106;
  EGL_BITMAP_PIXEL_SIZE_KHR = $3110;
  EGL_NEW_IMAGE_QCOM = $3120;
  EGL_IMAGE_FORMAT_QCOM = $3121;
  EGL_FORMAT_RGBA_8888_QCOM = $3122;
  EGL_FORMAT_RGB_565_QCOM = $3123;
  EGL_FORMAT_YUYV_QCOM = $3124;
  EGL_FORMAT_UYVY_QCOM = $3125;
  EGL_FORMAT_YV12_QCOM = $3126;
  EGL_FORMAT_NV21_QCOM = $3127;
  EGL_FORMAT_NV12_TILED_QCOM = $3128;
  EGL_FORMAT_BGRA_8888_QCOM = $3129;
  EGL_FORMAT_BGRX_8888_QCOM = $312A;
  EGL_FORMAT_RGBX_8888_QCOM = $312F;
  EGL_COVERAGE_SAMPLE_RESOLVE_NV = $3131;
  EGL_COVERAGE_SAMPLE_RESOLVE_DEFAULT_NV = $3132;
  EGL_COVERAGE_SAMPLE_RESOLVE_NONE_NV = $3133;
  EGL_MULTIVIEW_VIEW_COUNT_EXT = $3134;
  EGL_AUTO_STEREO_NV = $3136;
  EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_EXT = $3138;
  EGL_BUFFER_AGE_EXT = $313D;
  EGL_BUFFER_AGE_KHR = $313D;
  EGL_PLATFORM_DEVICE_EXT = $313F;
  EGL_NATIVE_BUFFER_ANDROID = $3140;
  EGL_PLATFORM_ANDROID_KHR = $3141;
  EGL_RECORDABLE_ANDROID = $3142;
  EGL_NATIVE_BUFFER_USAGE_ANDROID = $3143;
  EGL_SYNC_NATIVE_FENCE_ANDROID = $3144;
  EGL_SYNC_NATIVE_FENCE_FD_ANDROID = $3145;
  EGL_SYNC_NATIVE_FENCE_SIGNALED_ANDROID = $3146;
  EGL_FRAMEBUFFER_TARGET_ANDROID = $3147;
  EGL_FRONT_BUFFER_AUTO_REFRESH_ANDROID = $314C;
  EGL_GL_COLORSPACE_DEFAULT_EXT = $314D;
  EGL_CONTEXT_OPENGL_DEBUG = $31B0;
  EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE = $31B1;
  EGL_CONTEXT_OPENGL_ROBUST_ACCESS = $31B2;
  EGL_CONTEXT_OPENGL_NO_ERROR_KHR = $31B3;
  EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY = $31BD;
  EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_KHR = $31BD;
  EGL_NO_RESET_NOTIFICATION = $31BE;
  EGL_NO_RESET_NOTIFICATION_EXT = $31BE;
  EGL_NO_RESET_NOTIFICATION_KHR = $31BE;
  EGL_LOSE_CONTEXT_ON_RESET = $31BF;
  EGL_LOSE_CONTEXT_ON_RESET_EXT = $31BF;
  EGL_LOSE_CONTEXT_ON_RESET_KHR = $31BF;
  EGL_FORMAT_R8_QCOM = $31C0;
  EGL_FORMAT_RG88_QCOM = $31C1;
  EGL_FORMAT_NV12_QCOM = $31C2;
  EGL_FORMAT_SRGBX_8888_QCOM = $31C3;
  EGL_FORMAT_SRGBA_8888_QCOM = $31C4;
  EGL_FORMAT_YVYU_QCOM = $31C5;
  EGL_FORMAT_VYUY_QCOM = $31C6;
  EGL_FORMAT_IYUV_QCOM = $31C7;
  EGL_FORMAT_RGB_888_QCOM = $31C8;
  EGL_FORMAT_RGBA_5551_QCOM = $31C9;
  EGL_FORMAT_RGBA_4444_QCOM = $31CA;
  EGL_FORMAT_R_16_FLOAT_QCOM = $31CB;
  EGL_FORMAT_RG_1616_FLOAT_QCOM = $31CC;
  EGL_FORMAT_RGBA_16_FLOAT_QCOM = $31CD;
  EGL_FORMAT_RGBA_1010102_QCOM = $31CE;
  EGL_FORMAT_FLAG_QCOM = $31CF;
  EGL_DRM_BUFFER_FORMAT_MESA = $31D0;
  EGL_DRM_BUFFER_USE_MESA = $31D1;
  EGL_DRM_BUFFER_FORMAT_ARGB32_MESA = $31D2;
  EGL_DRM_BUFFER_MESA = $31D3;
  EGL_DRM_BUFFER_STRIDE_MESA = $31D4;
  EGL_PLATFORM_X11_EXT = $31D5;
  EGL_PLATFORM_X11_KHR = $31D5;
  EGL_PLATFORM_X11_SCREEN_EXT = $31D6;
  EGL_PLATFORM_X11_SCREEN_KHR = $31D6;
  EGL_PLATFORM_GBM_KHR = $31D7;
  EGL_PLATFORM_GBM_MESA = $31D7;
  EGL_PLATFORM_WAYLAND_EXT = $31D8;
  EGL_PLATFORM_WAYLAND_KHR = $31D8;
  EGL_PLATFORM_SURFACELESS_MESA = $31DD;
  EGL_STREAM_FIFO_LENGTH_KHR = $31FC;
  EGL_STREAM_TIME_NOW_KHR = $31FD;
  EGL_STREAM_TIME_CONSUMER_KHR = $31FE;
  EGL_STREAM_TIME_PRODUCER_KHR = $31FF;
  EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE = $3200;
  EGL_FIXED_SIZE_ANGLE = $3201;
  EGL_CONSUMER_LATENCY_USEC_KHR = $3210;
  EGL_PRODUCER_FRAME_KHR = $3212;
  EGL_CONSUMER_FRAME_KHR = $3213;
  EGL_STREAM_STATE_KHR = $3214;
  EGL_STREAM_STATE_CREATED_KHR = $3215;
  EGL_STREAM_STATE_CONNECTING_KHR = $3216;
  EGL_STREAM_STATE_EMPTY_KHR = $3217;
  EGL_STREAM_STATE_NEW_FRAME_AVAILABLE_KHR = $3218;
  EGL_STREAM_STATE_OLD_FRAME_AVAILABLE_KHR = $3219;
  EGL_STREAM_STATE_DISCONNECTED_KHR = $321A;
  EGL_BAD_STREAM_KHR = $321B;
  EGL_BAD_STATE_KHR = $321C;
  EGL_BUFFER_COUNT_NV = $321D;
  EGL_CONSUMER_ACQUIRE_TIMEOUT_USEC_KHR = $321E;
  EGL_SYNC_NEW_FRAME_NV = $321F;
  EGL_BAD_DEVICE_EXT = $322B;
  EGL_DEVICE_EXT = $322C;
  EGL_BAD_OUTPUT_LAYER_EXT = $322D;
  EGL_BAD_OUTPUT_PORT_EXT = $322E;
  EGL_SWAP_INTERVAL_EXT = $322F;
  EGL_TRIPLE_BUFFER_NV = $3230;
  EGL_QUADRUPLE_BUFFER_NV = $3231;
  EGL_DRM_DEVICE_FILE_EXT = $3233;
  EGL_DRM_CRTC_EXT = $3234;
  EGL_DRM_PLANE_EXT = $3235;
  EGL_DRM_CONNECTOR_EXT = $3236;
  EGL_OPENWF_DEVICE_ID_EXT = $3237;
  EGL_OPENWF_PIPELINE_ID_EXT = $3238;
  EGL_OPENWF_PORT_ID_EXT = $3239;
  EGL_CUDA_DEVICE_NV = $323A;
  EGL_CUDA_EVENT_HANDLE_NV = $323B;
  EGL_SYNC_CUDA_EVENT_NV = $323C;
  EGL_SYNC_CUDA_EVENT_COMPLETE_NV = $323D;
  EGL_STREAM_CROSS_PARTITION_NV = $323F;
  EGL_STREAM_STATE_INITIALIZING_NV = $3240;
  EGL_STREAM_TYPE_NV = $3241;
  EGL_STREAM_PROTOCOL_NV = $3242;
  EGL_STREAM_ENDPOINT_NV = $3243;
  EGL_STREAM_LOCAL_NV = $3244;
  EGL_STREAM_CROSS_PROCESS_NV = $3245;
  EGL_STREAM_PROTOCOL_FD_NV = $3246;
  EGL_STREAM_PRODUCER_NV = $3247;
  EGL_STREAM_CONSUMER_NV = $3248;
  EGL_STREAM_PROTOCOL_SOCKET_NV = $324B;
  EGL_SOCKET_HANDLE_NV = $324C;
  EGL_SOCKET_TYPE_NV = $324D;
  EGL_SOCKET_TYPE_UNIX_NV = $324E;
  EGL_SOCKET_TYPE_INET_NV = $324F;
  EGL_MAX_STREAM_METADATA_BLOCKS_NV = $3250;
  EGL_MAX_STREAM_METADATA_BLOCK_SIZE_NV = $3251;
  EGL_MAX_STREAM_METADATA_TOTAL_SIZE_NV = $3252;
  EGL_PRODUCER_METADATA_NV = $3253;
  EGL_CONSUMER_METADATA_NV = $3254;
  EGL_METADATA0_SIZE_NV = $3255;
  EGL_METADATA1_SIZE_NV = $3256;
  EGL_METADATA2_SIZE_NV = $3257;
  EGL_METADATA3_SIZE_NV = $3258;
  EGL_METADATA0_TYPE_NV = $3259;
  EGL_METADATA1_TYPE_NV = $325A;
  EGL_METADATA2_TYPE_NV = $325B;
  EGL_METADATA3_TYPE_NV = $325C;
  EGL_LINUX_DMA_BUF_EXT = $3270;
  EGL_LINUX_DRM_FOURCC_EXT = $3271;
  EGL_DMA_BUF_PLANE0_FD_EXT = $3272;
  EGL_DMA_BUF_PLANE0_OFFSET_EXT = $3273;
  EGL_DMA_BUF_PLANE0_PITCH_EXT = $3274;
  EGL_DMA_BUF_PLANE1_FD_EXT = $3275;
  EGL_DMA_BUF_PLANE1_OFFSET_EXT = $3276;
  EGL_DMA_BUF_PLANE1_PITCH_EXT = $3277;
  EGL_DMA_BUF_PLANE2_FD_EXT = $3278;
  EGL_DMA_BUF_PLANE2_OFFSET_EXT = $3279;
  EGL_DMA_BUF_PLANE2_PITCH_EXT = $327A;
  EGL_YUV_COLOR_SPACE_HINT_EXT = $327B;
  EGL_SAMPLE_RANGE_HINT_EXT = $327C;
  EGL_YUV_CHROMA_HORIZONTAL_SITING_HINT_EXT = $327D;
  EGL_YUV_CHROMA_VERTICAL_SITING_HINT_EXT = $327E;
  EGL_ITU_REC601_EXT = $327F;
  EGL_ITU_REC709_EXT = $3280;
  EGL_ITU_REC2020_EXT = $3281;
  EGL_YUV_FULL_RANGE_EXT = $3282;
  EGL_YUV_NARROW_RANGE_EXT = $3283;
  EGL_YUV_CHROMA_SITING_0_EXT = $3284;
  EGL_YUV_CHROMA_SITING_0_5_EXT = $3285;
  EGL_DISCARD_SAMPLES_ARM = $3286;
  EGL_SYNC_PRIOR_COMMANDS_IMPLICIT_EXTERNAL_ARM = $328A;
  EGL_NATIVE_BUFFER_TIZEN = $32A0;
  EGL_NATIVE_SURFACE_TIZEN = $32A1;
  EGL_IMAGE_NUM_PLANES_QCOM = $32B0;
  EGL_IMAGE_PLANE_PITCH_0_QCOM = $32B1;
  EGL_IMAGE_PLANE_PITCH_1_QCOM = $32B2;
  EGL_IMAGE_PLANE_PITCH_2_QCOM = $32B3;
  EGL_IMAGE_PLANE_DEPTH_0_QCOM = $32B4;
  EGL_IMAGE_PLANE_DEPTH_1_QCOM = $32B5;
  EGL_IMAGE_PLANE_DEPTH_2_QCOM = $32B6;
  EGL_IMAGE_PLANE_WIDTH_0_QCOM = $32B7;
  EGL_IMAGE_PLANE_WIDTH_1_QCOM = $32B8;
  EGL_IMAGE_PLANE_WIDTH_2_QCOM = $32B9;
  EGL_IMAGE_PLANE_HEIGHT_0_QCOM = $32BA;
  EGL_IMAGE_PLANE_HEIGHT_1_QCOM = $32BB;
  EGL_IMAGE_PLANE_HEIGHT_2_QCOM = $32BC;
  EGL_IMAGE_PLANE_POINTER_0_QCOM = $32BD;
  EGL_IMAGE_PLANE_POINTER_1_QCOM = $32BE;
  EGL_IMAGE_PLANE_POINTER_2_QCOM = $32BF;
  EGL_PROTECTED_CONTENT_EXT = $32C0;
  EGL_GPU_PERF_HINT_QCOM = $32D0;
  EGL_HINT_PERSISTENT_QCOM = $32D1;
  EGL_YUV_BUFFER_EXT = $3300;
  EGL_YUV_ORDER_EXT = $3301;
  EGL_YUV_ORDER_YUV_EXT = $3302;
  EGL_YUV_ORDER_YVU_EXT = $3303;
  EGL_YUV_ORDER_YUYV_EXT = $3304;
  EGL_YUV_ORDER_UYVY_EXT = $3305;
  EGL_YUV_ORDER_YVYU_EXT = $3306;
  EGL_YUV_ORDER_VYUY_EXT = $3307;
  EGL_YUV_ORDER_AYUV_EXT = $3308;
  EGL_YUV_CSC_STANDARD_EXT = $330A;
  EGL_YUV_CSC_STANDARD_601_EXT = $330B;
  EGL_YUV_CSC_STANDARD_709_EXT = $330C;
  EGL_YUV_CSC_STANDARD_2020_EXT = $330D;
  EGL_YUV_NUMBER_OF_PLANES_EXT = $3311;
  EGL_YUV_SUBSAMPLE_EXT = $3312;
  EGL_YUV_SUBSAMPLE_4_2_0_EXT = $3313;
  EGL_YUV_SUBSAMPLE_4_2_2_EXT = $3314;
  EGL_YUV_SUBSAMPLE_4_4_4_EXT = $3315;
  EGL_YUV_DEPTH_RANGE_EXT = $3317;
  EGL_YUV_DEPTH_RANGE_LIMITED_EXT = $3318;
  EGL_YUV_DEPTH_RANGE_FULL_EXT = $3319;
  EGL_YUV_PLANE_BPP_EXT = $331A;
  EGL_YUV_PLANE_BPP_0_EXT = $331B;
  EGL_YUV_PLANE_BPP_8_EXT = $331C;
  EGL_YUV_PLANE_BPP_10_EXT = $331D;
  EGL_PENDING_METADATA_NV = $3328;
  EGL_PENDING_FRAME_NV = $3329;
  EGL_STREAM_TIME_PENDING_NV = $332A;
  EGL_YUV_PLANE0_TEXTURE_UNIT_NV = $332C;
  EGL_YUV_PLANE1_TEXTURE_UNIT_NV = $332D;
  EGL_YUV_PLANE2_TEXTURE_UNIT_NV = $332E;
  EGL_SUPPORT_RESET_NV = $3334;
  EGL_SUPPORT_REUSE_NV = $3335;
  EGL_STREAM_FIFO_SYNCHRONOUS_NV = $3336;
  EGL_PRODUCER_MAX_FRAME_HINT_NV = $3337;
  EGL_CONSUMER_MAX_FRAME_HINT_NV = $3338;
  EGL_COLOR_COMPONENT_TYPE_EXT = $3339;
  EGL_COLOR_COMPONENT_TYPE_FIXED_EXT = $333A;
  EGL_COLOR_COMPONENT_TYPE_FLOAT_EXT = $333B;
  EGL_DRM_MASTER_FD_EXT = $333C;
  EGL_GL_COLORSPACE_BT2020_LINEAR_EXT = $333F;
  EGL_GL_COLORSPACE_BT2020_PQ_EXT = $3340;
  EGL_SMPTE2086_DISPLAY_PRIMARY_RX_EXT = $3341;
  EGL_SMPTE2086_DISPLAY_PRIMARY_RY_EXT = $3342;
  EGL_SMPTE2086_DISPLAY_PRIMARY_GX_EXT = $3343;
  EGL_SMPTE2086_DISPLAY_PRIMARY_GY_EXT = $3344;
  EGL_SMPTE2086_DISPLAY_PRIMARY_BX_EXT = $3345;
  EGL_SMPTE2086_DISPLAY_PRIMARY_BY_EXT = $3346;
  EGL_SMPTE2086_WHITE_POINT_X_EXT = $3347;
  EGL_SMPTE2086_WHITE_POINT_Y_EXT = $3348;
  EGL_SMPTE2086_MAX_LUMINANCE_EXT = $3349;
  EGL_SMPTE2086_MIN_LUMINANCE_EXT = $334A;
  EGL_GENERATE_RESET_ON_VIDEO_MEMORY_PURGE_NV = $334C;
  EGL_STREAM_CROSS_OBJECT_NV = $334D;
  EGL_STREAM_CROSS_DISPLAY_NV = $334E;
  EGL_STREAM_CROSS_SYSTEM_NV = $334F;
  EGL_GL_COLORSPACE_SCRGB_LINEAR_EXT = $3350;
  EGL_GL_COLORSPACE_SCRGB_EXT = $3351;
  EGL_TRACK_REFERENCES_KHR = $3352;
  EGL_CONTEXT_PRIORITY_REALTIME_NV = $3357;
  EGL_CTA861_3_MAX_CONTENT_LIGHT_LEVEL_EXT = $3360;
  EGL_CTA861_3_MAX_FRAME_AVERAGE_LEVEL_EXT = $3361;
  EGL_GL_COLORSPACE_DISPLAY_P3_LINEAR_EXT = $3362;
  EGL_GL_COLORSPACE_DISPLAY_P3_EXT = $3363;
  EGL_SYNC_CLIENT_EXT = $3364;
  EGL_SYNC_CLIENT_SIGNAL_EXT = $3365;
  EGL_STREAM_FRAME_ORIGIN_X_NV = $3366;
  EGL_STREAM_FRAME_ORIGIN_Y_NV = $3367;
  EGL_STREAM_FRAME_MAJOR_AXIS_NV = $3368;
  EGL_CONSUMER_AUTO_ORIENTATION_NV = $3369;
  EGL_PRODUCER_AUTO_ORIENTATION_NV = $336A;
  EGL_LEFT_NV = $336B;
  EGL_RIGHT_NV = $336C;
  EGL_TOP_NV = $336D;
  EGL_BOTTOM_NV = $336E;
  EGL_X_AXIS_NV = $336F;
  EGL_Y_AXIS_NV = $3370;
  EGL_STREAM_DMA_NV = $3371;
  EGL_STREAM_DMA_SERVER_NV = $3372;
  EGL_D3D9_DEVICE_ANGLE = $33A0;
  EGL_D3D11_DEVICE_ANGLE = $33A1;
  EGL_OBJECT_THREAD_KHR = $33B0;
  EGL_OBJECT_DISPLAY_KHR = $33B1;
  EGL_OBJECT_CONTEXT_KHR = $33B2;
  EGL_OBJECT_SURFACE_KHR = $33B3;
  EGL_OBJECT_IMAGE_KHR = $33B4;
  EGL_OBJECT_SYNC_KHR = $33B5;
  EGL_OBJECT_STREAM_KHR = $33B6;
  EGL_DEBUG_CALLBACK_KHR = $33B8;
  EGL_DEBUG_MSG_CRITICAL_KHR = $33B9;
  EGL_DEBUG_MSG_ERROR_KHR = $33BA;
  EGL_DEBUG_MSG_WARN_KHR = $33BB;
  EGL_DEBUG_MSG_INFO_KHR = $33BC;
  EGL_FORMAT_FLAG_UBWC_QCOM = $33E0;
  EGL_FORMAT_FLAG_MACROTILE_QCOM = $33E1;
  EGL_FORMAT_ASTC_4X4_QCOM = $33E2;
  EGL_FORMAT_ASTC_5X4_QCOM = $33E3;
  EGL_FORMAT_ASTC_5X5_QCOM = $33E4;
  EGL_FORMAT_ASTC_6X5_QCOM = $33E5;
  EGL_FORMAT_ASTC_6X6_QCOM = $33E6;
  EGL_FORMAT_ASTC_8X5_QCOM = $33E7;
  EGL_FORMAT_ASTC_8X6_QCOM = $33E8;
  EGL_FORMAT_ASTC_8X8_QCOM = $33E9;
  EGL_FORMAT_ASTC_10X5_QCOM = $33EA;
  EGL_FORMAT_ASTC_10X6_QCOM = $33EB;
  EGL_FORMAT_ASTC_10X8_QCOM = $33EC;
  EGL_FORMAT_ASTC_10X10_QCOM = $33ED;
  EGL_FORMAT_ASTC_12X10_QCOM = $33EE;
  EGL_FORMAT_ASTC_12X12_QCOM = $33EF;
  EGL_FORMAT_ASTC_4X4_SRGB_QCOM = $3400;
  EGL_FORMAT_ASTC_5X4_SRGB_QCOM = $3401;
  EGL_FORMAT_ASTC_5X5_SRGB_QCOM = $3402;
  EGL_FORMAT_ASTC_6X5_SRGB_QCOM = $3403;
  EGL_FORMAT_ASTC_6X6_SRGB_QCOM = $3404;
  EGL_FORMAT_ASTC_8X5_SRGB_QCOM = $3405;
  EGL_FORMAT_ASTC_8X6_SRGB_QCOM = $3406;
  EGL_FORMAT_ASTC_8X8_SRGB_QCOM = $3407;
  EGL_FORMAT_ASTC_10X5_SRGB_QCOM = $3408;
  EGL_FORMAT_ASTC_10X6_SRGB_QCOM = $3409;
  EGL_FORMAT_ASTC_10X8_SRGB_QCOM = $340A;
  EGL_FORMAT_ASTC_10X10_SRGB_QCOM = $340B;
  EGL_FORMAT_ASTC_12X10_SRGB_QCOM = $340C;
  EGL_FORMAT_ASTC_12X12_SRGB_QCOM = $340D;
  EGL_FORMAT_TP10_QCOM = $340E;
  EGL_FORMAT_NV12_Y_QCOM = $340F;
  EGL_FORMAT_NV12_UV_QCOM = $3410;
  EGL_FORMAT_NV21_VU_QCOM = $3411;
  EGL_FORMAT_NV12_4R_QCOM = $3412;
  EGL_FORMAT_NV12_4R_Y_QCOM = $3413;
  EGL_FORMAT_NV12_4R_UV_QCOM = $3414;
  EGL_FORMAT_P010_QCOM = $3415;
  EGL_FORMAT_P010_Y_QCOM = $3416;
  EGL_FORMAT_P010_UV_QCOM = $3417;
  EGL_FORMAT_TP10_Y_QCOM = $3418;
  EGL_FORMAT_TP10_UV_QCOM = $3419;
  EGL_GENERIC_TOKEN_1_QCOM = $3420;
  EGL_GENERIC_TOKEN_2_QCOM = $3421;
  EGL_GENERIC_TOKEN_3_QCOM = $3422;
  EGL_TIMESTAMPS_ANDROID = $3430;
  EGL_COMPOSITE_DEADLINE_ANDROID = $3431;
  EGL_COMPOSITE_INTERVAL_ANDROID = $3432;
  EGL_COMPOSITE_TO_PRESENT_LATENCY_ANDROID = $3433;
  EGL_REQUESTED_PRESENT_TIME_ANDROID = $3434;
  EGL_RENDERING_COMPLETE_TIME_ANDROID = $3435;
  EGL_COMPOSITION_LATCH_TIME_ANDROID = $3436;
  EGL_FIRST_COMPOSITION_START_TIME_ANDROID = $3437;
  EGL_LAST_COMPOSITION_START_TIME_ANDROID = $3438;
  EGL_FIRST_COMPOSITION_GPU_FINISHED_TIME_ANDROID = $3439;
  EGL_DISPLAY_PRESENT_TIME_ANDROID = $343A;
  EGL_DEQUEUE_READY_TIME_ANDROID = $343B;
  EGL_READS_DONE_TIME_ANDROID = $343C;
  EGL_DMA_BUF_PLANE3_FD_EXT = $3440;
  EGL_DMA_BUF_PLANE3_OFFSET_EXT = $3441;
  EGL_DMA_BUF_PLANE3_PITCH_EXT = $3442;
  EGL_DMA_BUF_PLANE0_MODIFIER_LO_EXT = $3443;
  EGL_DMA_BUF_PLANE0_MODIFIER_HI_EXT = $3444;
  EGL_DMA_BUF_PLANE1_MODIFIER_LO_EXT = $3445;
  EGL_DMA_BUF_PLANE1_MODIFIER_HI_EXT = $3446;
  EGL_DMA_BUF_PLANE2_MODIFIER_LO_EXT = $3447;
  EGL_DMA_BUF_PLANE2_MODIFIER_HI_EXT = $3448;
  EGL_DMA_BUF_PLANE3_MODIFIER_LO_EXT = $3449;
  EGL_DMA_BUF_PLANE3_MODIFIER_HI_EXT = $344A;
  EGL_PRIMARY_COMPOSITOR_CONTEXT_EXT = $3460;
  EGL_EXTERNAL_REF_ID_EXT = $3461;
  EGL_COMPOSITOR_DROP_NEWEST_FRAME_EXT = $3462;
  EGL_COMPOSITOR_KEEP_NEWEST_FRAME_EXT = $3463;
  EGL_FRONT_BUFFER_EXT = $3464;
  EGL_IMPORT_SYNC_TYPE_EXT = $3470;
  EGL_IMPORT_IMPLICIT_SYNC_EXT = $3471;
  EGL_IMPORT_EXPLICIT_SYNC_EXT = $3472;
  EGL_GL_COLORSPACE_DISPLAY_P3_PASSTHROUGH_EXT = $3490;
  EGL_COLOR_FORMAT_HI = $8F70;
  EGL_COLOR_RGB_HI = $8F71;
  EGL_COLOR_RGBA_HI = $8F72;
  EGL_COLOR_ARGB_HI = $8F73;
  EGL_CLIENT_PIXMAP_POINTER_HI = $8F74;
  EGL_FOREVER = $FFFFFFFFFFFFFFFF;
  EGL_FOREVER_KHR = $FFFFFFFFFFFFFFFF;
  EGL_FOREVER_NV = $FFFFFFFFFFFFFFFF;
  EGL_TRUE = 1;
  EGL_DISPLAY_SCALING = 10000;
  EGL_METADATA_SCALING_EXT = 50000;

var
  epoxy_eglBindAPI: function(api: TEGLenum): TEGLBoolean; cvar;external libepoxy;
  eglBindAPI: function(api: TEGLenum): TEGLBoolean absolute epoxy_eglBindAPI;

  epoxy_eglBindTexImage: function(dpy: TEGLDisplay; surface: TEGLSurface; buffer: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglBindTexImage: function(dpy: TEGLDisplay; surface: TEGLSurface; buffer: TEGLint): TEGLBoolean absolute epoxy_eglBindTexImage;

  epoxy_eglChooseConfig: function(dpy: TEGLDisplay; attrib_list: PEGLint; configs: PEGLConfig; config_size: TEGLint; num_config: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglChooseConfig: function(dpy: TEGLDisplay; attrib_list: PEGLint; configs: PEGLConfig; config_size: TEGLint; num_config: PEGLint): TEGLBoolean absolute epoxy_eglChooseConfig;

  epoxy_eglClientSignalSyncEXT: function(dpy: TEGLDisplay; sync: TEGLSync; attrib_list: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglClientSignalSyncEXT: function(dpy: TEGLDisplay; sync: TEGLSync; attrib_list: PEGLAttrib): TEGLBoolean absolute epoxy_eglClientSignalSyncEXT;

  epoxy_eglClientWaitSync: function(dpy: TEGLDisplay; sync: TEGLSync; flags: TEGLint; timeout: TEGLTime): TEGLint; cvar;external libepoxy;
  eglClientWaitSync: function(dpy: TEGLDisplay; sync: TEGLSync; flags: TEGLint; timeout: TEGLTime): TEGLint absolute epoxy_eglClientWaitSync;

  epoxy_eglClientWaitSyncKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR; flags: TEGLint; timeout: TEGLTimeKHR): TEGLint; cvar;external libepoxy;
  eglClientWaitSyncKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR; flags: TEGLint; timeout: TEGLTimeKHR): TEGLint absolute epoxy_eglClientWaitSyncKHR;

  epoxy_eglClientWaitSyncNV: function(sync: TEGLSyncNV; flags: TEGLint; timeout: TEGLTimeNV): TEGLint; cvar;external libepoxy;
  eglClientWaitSyncNV: function(sync: TEGLSyncNV; flags: TEGLint; timeout: TEGLTimeNV): TEGLint absolute epoxy_eglClientWaitSyncNV;

  epoxy_eglCompositorBindTexWindowEXT: function(external_win_id: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglCompositorBindTexWindowEXT: function(external_win_id: TEGLint): TEGLBoolean absolute epoxy_eglCompositorBindTexWindowEXT;

  epoxy_eglCompositorSetContextAttributesEXT: function(external_ref_id: TEGLint; context_attributes: PEGLint; num_entries: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglCompositorSetContextAttributesEXT: function(external_ref_id: TEGLint; context_attributes: PEGLint; num_entries: TEGLint): TEGLBoolean absolute epoxy_eglCompositorSetContextAttributesEXT;

  epoxy_eglCompositorSetContextListEXT: function(external_ref_ids: PEGLint; num_entries: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglCompositorSetContextListEXT: function(external_ref_ids: PEGLint; num_entries: TEGLint): TEGLBoolean absolute epoxy_eglCompositorSetContextListEXT;

  epoxy_eglCompositorSetSizeEXT: function(external_win_id: TEGLint; width: TEGLint; height: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglCompositorSetSizeEXT: function(external_win_id: TEGLint; width: TEGLint; height: TEGLint): TEGLBoolean absolute epoxy_eglCompositorSetSizeEXT;

  epoxy_eglCompositorSetWindowAttributesEXT: function(external_win_id: TEGLint; window_attributes: PEGLint; num_entries: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglCompositorSetWindowAttributesEXT: function(external_win_id: TEGLint; window_attributes: PEGLint; num_entries: TEGLint): TEGLBoolean absolute epoxy_eglCompositorSetWindowAttributesEXT;

  epoxy_eglCompositorSetWindowListEXT: function(external_ref_id: TEGLint; external_win_ids: PEGLint; num_entries: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglCompositorSetWindowListEXT: function(external_ref_id: TEGLint; external_win_ids: PEGLint; num_entries: TEGLint): TEGLBoolean absolute epoxy_eglCompositorSetWindowListEXT;

  epoxy_eglCompositorSwapPolicyEXT: function(external_win_id: TEGLint; policy: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglCompositorSwapPolicyEXT: function(external_win_id: TEGLint; policy: TEGLint): TEGLBoolean absolute epoxy_eglCompositorSwapPolicyEXT;

  epoxy_eglCopyBuffers: function(dpy: TEGLDisplay; surface: TEGLSurface; target: TEGLNativePixmapType): TEGLBoolean; cvar;external libepoxy;
  eglCopyBuffers: function(dpy: TEGLDisplay; surface: TEGLSurface; target: TEGLNativePixmapType): TEGLBoolean absolute epoxy_eglCopyBuffers;

  epoxy_eglCreateContext: function(dpy: TEGLDisplay; config: TEGLConfig; share_context: TEGLContext; attrib_list: PEGLint): TEGLContext; cvar;external libepoxy;
  eglCreateContext: function(dpy: TEGLDisplay; config: TEGLConfig; share_context: TEGLContext; attrib_list: PEGLint): TEGLContext absolute epoxy_eglCreateContext;

  epoxy_eglCreateDRMImageMESA: function(dpy: TEGLDisplay; attrib_list: PEGLint): TEGLImageKHR; cvar;external libepoxy;
  eglCreateDRMImageMESA: function(dpy: TEGLDisplay; attrib_list: PEGLint): TEGLImageKHR absolute epoxy_eglCreateDRMImageMESA;

  epoxy_eglCreateFenceSyncNV: function(dpy: TEGLDisplay; condition: TEGLenum; attrib_list: PEGLint): TEGLSyncNV; cvar;external libepoxy;
  eglCreateFenceSyncNV: function(dpy: TEGLDisplay; condition: TEGLenum; attrib_list: PEGLint): TEGLSyncNV absolute epoxy_eglCreateFenceSyncNV;

  epoxy_eglCreateImage: function(dpy: TEGLDisplay; ctx: TEGLContext; target: TEGLenum; buffer: TEGLClientBuffer; attrib_list: PEGLAttrib): TEGLImage; cvar;external libepoxy;
  eglCreateImage: function(dpy: TEGLDisplay; ctx: TEGLContext; target: TEGLenum; buffer: TEGLClientBuffer; attrib_list: PEGLAttrib): TEGLImage absolute epoxy_eglCreateImage;

  epoxy_eglCreateImageKHR: function(dpy: TEGLDisplay; ctx: TEGLContext; target: TEGLenum; buffer: TEGLClientBuffer; attrib_list: PEGLint): TEGLImageKHR; cvar;external libepoxy;
  eglCreateImageKHR: function(dpy: TEGLDisplay; ctx: TEGLContext; target: TEGLenum; buffer: TEGLClientBuffer; attrib_list: PEGLint): TEGLImageKHR absolute epoxy_eglCreateImageKHR;

  epoxy_eglCreateNativeClientBufferANDROID: function(attrib_list: PEGLint): TEGLClientBuffer; cvar;external libepoxy;
  eglCreateNativeClientBufferANDROID: function(attrib_list: PEGLint): TEGLClientBuffer absolute epoxy_eglCreateNativeClientBufferANDROID;

  epoxy_eglCreatePbufferFromClientBuffer: function(dpy: TEGLDisplay; buftype: TEGLenum; buffer: TEGLClientBuffer; config: TEGLConfig; attrib_list: PEGLint): TEGLSurface; cvar;external libepoxy;
  eglCreatePbufferFromClientBuffer: function(dpy: TEGLDisplay; buftype: TEGLenum; buffer: TEGLClientBuffer; config: TEGLConfig; attrib_list: PEGLint): TEGLSurface absolute epoxy_eglCreatePbufferFromClientBuffer;

  epoxy_eglCreatePbufferSurface: function(dpy: TEGLDisplay; config: TEGLConfig; attrib_list: PEGLint): TEGLSurface; cvar;external libepoxy;
  eglCreatePbufferSurface: function(dpy: TEGLDisplay; config: TEGLConfig; attrib_list: PEGLint): TEGLSurface absolute epoxy_eglCreatePbufferSurface;

  epoxy_eglCreatePixmapSurface: function(dpy: TEGLDisplay; config: TEGLConfig; pixmap: TEGLNativePixmapType; attrib_list: PEGLint): TEGLSurface; cvar;external libepoxy;
  eglCreatePixmapSurface: function(dpy: TEGLDisplay; config: TEGLConfig; pixmap: TEGLNativePixmapType; attrib_list: PEGLint): TEGLSurface absolute epoxy_eglCreatePixmapSurface;

  epoxy_eglCreatePixmapSurfaceHI: function(dpy: TEGLDisplay; config: TEGLConfig; pixmap: PEGLClientPixmapHI): TEGLSurface; cvar;external libepoxy;
  eglCreatePixmapSurfaceHI: function(dpy: TEGLDisplay; config: TEGLConfig; pixmap: PEGLClientPixmapHI): TEGLSurface absolute epoxy_eglCreatePixmapSurfaceHI;

  epoxy_eglCreatePlatformPixmapSurface: function(dpy: TEGLDisplay; config: TEGLConfig; native_pixmap: pointer; attrib_list: PEGLAttrib): TEGLSurface; cvar;external libepoxy;
  eglCreatePlatformPixmapSurface: function(dpy: TEGLDisplay; config: TEGLConfig; native_pixmap: pointer; attrib_list: PEGLAttrib): TEGLSurface absolute epoxy_eglCreatePlatformPixmapSurface;

  epoxy_eglCreatePlatformPixmapSurfaceEXT: function(dpy: TEGLDisplay; config: TEGLConfig; native_pixmap: pointer; attrib_list: PEGLint): TEGLSurface; cvar;external libepoxy;
  eglCreatePlatformPixmapSurfaceEXT: function(dpy: TEGLDisplay; config: TEGLConfig; native_pixmap: pointer; attrib_list: PEGLint): TEGLSurface absolute epoxy_eglCreatePlatformPixmapSurfaceEXT;

  epoxy_eglCreatePlatformWindowSurface: function(dpy: TEGLDisplay; config: TEGLConfig; native_window: pointer; attrib_list: PEGLAttrib): TEGLSurface; cvar;external libepoxy;
  eglCreatePlatformWindowSurface: function(dpy: TEGLDisplay; config: TEGLConfig; native_window: pointer; attrib_list: PEGLAttrib): TEGLSurface absolute epoxy_eglCreatePlatformWindowSurface;

  epoxy_eglCreatePlatformWindowSurfaceEXT: function(dpy: TEGLDisplay; config: TEGLConfig; native_window: pointer; attrib_list: PEGLint): TEGLSurface; cvar;external libepoxy;
  eglCreatePlatformWindowSurfaceEXT: function(dpy: TEGLDisplay; config: TEGLConfig; native_window: pointer; attrib_list: PEGLint): TEGLSurface absolute epoxy_eglCreatePlatformWindowSurfaceEXT;

  epoxy_eglCreateStreamAttribKHR: function(dpy: TEGLDisplay; attrib_list: PEGLAttrib): TEGLStreamKHR; cvar;external libepoxy;
  eglCreateStreamAttribKHR: function(dpy: TEGLDisplay; attrib_list: PEGLAttrib): TEGLStreamKHR absolute epoxy_eglCreateStreamAttribKHR;

  epoxy_eglCreateStreamFromFileDescriptorKHR: function(dpy: TEGLDisplay; file_descriptor: TEGLNativeFileDescriptorKHR): TEGLStreamKHR; cvar;external libepoxy;
  eglCreateStreamFromFileDescriptorKHR: function(dpy: TEGLDisplay; file_descriptor: TEGLNativeFileDescriptorKHR): TEGLStreamKHR absolute epoxy_eglCreateStreamFromFileDescriptorKHR;

  epoxy_eglCreateStreamKHR: function(dpy: TEGLDisplay; attrib_list: PEGLint): TEGLStreamKHR; cvar;external libepoxy;
  eglCreateStreamKHR: function(dpy: TEGLDisplay; attrib_list: PEGLint): TEGLStreamKHR absolute epoxy_eglCreateStreamKHR;

  epoxy_eglCreateStreamProducerSurfaceKHR: function(dpy: TEGLDisplay; config: TEGLConfig; stream: TEGLStreamKHR; attrib_list: PEGLint): TEGLSurface; cvar;external libepoxy;
  eglCreateStreamProducerSurfaceKHR: function(dpy: TEGLDisplay; config: TEGLConfig; stream: TEGLStreamKHR; attrib_list: PEGLint): TEGLSurface absolute epoxy_eglCreateStreamProducerSurfaceKHR;

  epoxy_eglCreateStreamSyncNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; _type: TEGLenum; attrib_list: PEGLint): TEGLSyncKHR; cvar;external libepoxy;
  eglCreateStreamSyncNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; _type: TEGLenum; attrib_list: PEGLint): TEGLSyncKHR absolute epoxy_eglCreateStreamSyncNV;

  epoxy_eglCreateSync: function(dpy: TEGLDisplay; _type: TEGLenum; attrib_list: PEGLAttrib): TEGLSync; cvar;external libepoxy;
  eglCreateSync: function(dpy: TEGLDisplay; _type: TEGLenum; attrib_list: PEGLAttrib): TEGLSync absolute epoxy_eglCreateSync;

  epoxy_eglCreateSync64KHR: function(dpy: TEGLDisplay; _type: TEGLenum; attrib_list: PEGLAttribKHR): TEGLSyncKHR; cvar;external libepoxy;
  eglCreateSync64KHR: function(dpy: TEGLDisplay; _type: TEGLenum; attrib_list: PEGLAttribKHR): TEGLSyncKHR absolute epoxy_eglCreateSync64KHR;

  epoxy_eglCreateSyncKHR: function(dpy: TEGLDisplay; _type: TEGLenum; attrib_list: PEGLint): TEGLSyncKHR; cvar;external libepoxy;
  eglCreateSyncKHR: function(dpy: TEGLDisplay; _type: TEGLenum; attrib_list: PEGLint): TEGLSyncKHR absolute epoxy_eglCreateSyncKHR;

  epoxy_eglCreateWindowSurface: function(dpy: TEGLDisplay; config: TEGLConfig; win: TEGLNativeWindowType; attrib_list: PEGLint): TEGLSurface; cvar;external libepoxy;
  eglCreateWindowSurface: function(dpy: TEGLDisplay; config: TEGLConfig; win: TEGLNativeWindowType; attrib_list: PEGLint): TEGLSurface absolute epoxy_eglCreateWindowSurface;

  epoxy_eglDebugMessageControlKHR: function(callback: TEGLDEBUGPROCKHR; attrib_list: PEGLAttrib): TEGLint; cvar;external libepoxy;
  eglDebugMessageControlKHR: function(callback: TEGLDEBUGPROCKHR; attrib_list: PEGLAttrib): TEGLint absolute epoxy_eglDebugMessageControlKHR;

  epoxy_eglDestroyContext: function(dpy: TEGLDisplay; ctx: TEGLContext): TEGLBoolean; cvar;external libepoxy;
  eglDestroyContext: function(dpy: TEGLDisplay; ctx: TEGLContext): TEGLBoolean absolute epoxy_eglDestroyContext;

  epoxy_eglDestroyImage: function(dpy: TEGLDisplay; image: TEGLImage): TEGLBoolean; cvar;external libepoxy;
  eglDestroyImage: function(dpy: TEGLDisplay; image: TEGLImage): TEGLBoolean absolute epoxy_eglDestroyImage;

  epoxy_eglDestroyImageKHR: function(dpy: TEGLDisplay; image: TEGLImageKHR): TEGLBoolean; cvar;external libepoxy;
  eglDestroyImageKHR: function(dpy: TEGLDisplay; image: TEGLImageKHR): TEGLBoolean absolute epoxy_eglDestroyImageKHR;

  epoxy_eglDestroyStreamKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean; cvar;external libepoxy;
  eglDestroyStreamKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean absolute epoxy_eglDestroyStreamKHR;

  epoxy_eglDestroySurface: function(dpy: TEGLDisplay; surface: TEGLSurface): TEGLBoolean; cvar;external libepoxy;
  eglDestroySurface: function(dpy: TEGLDisplay; surface: TEGLSurface): TEGLBoolean absolute epoxy_eglDestroySurface;

  epoxy_eglDestroySync: function(dpy: TEGLDisplay; sync: TEGLSync): TEGLBoolean; cvar;external libepoxy;
  eglDestroySync: function(dpy: TEGLDisplay; sync: TEGLSync): TEGLBoolean absolute epoxy_eglDestroySync;

  epoxy_eglDestroySyncKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR): TEGLBoolean; cvar;external libepoxy;
  eglDestroySyncKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR): TEGLBoolean absolute epoxy_eglDestroySyncKHR;

  epoxy_eglDestroySyncNV: function(sync: TEGLSyncNV): TEGLBoolean; cvar;external libepoxy;
  eglDestroySyncNV: function(sync: TEGLSyncNV): TEGLBoolean absolute epoxy_eglDestroySyncNV;

  epoxy_eglDupNativeFenceFDANDROID: function(dpy: TEGLDisplay; sync: TEGLSyncKHR): TEGLint; cvar;external libepoxy;
  eglDupNativeFenceFDANDROID: function(dpy: TEGLDisplay; sync: TEGLSyncKHR): TEGLint absolute epoxy_eglDupNativeFenceFDANDROID;

  epoxy_eglExportDMABUFImageMESA: function(dpy: TEGLDisplay; image: TEGLImageKHR; fds: Plongint; strides: PEGLint; offsets: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglExportDMABUFImageMESA: function(dpy: TEGLDisplay; image: TEGLImageKHR; fds: Plongint; strides: PEGLint; offsets: PEGLint): TEGLBoolean absolute epoxy_eglExportDMABUFImageMESA;

  epoxy_eglExportDMABUFImageQueryMESA: function(dpy: TEGLDisplay; image: TEGLImageKHR; fourcc: Plongint; num_planes: Plongint; modifiers: PEGLuint64KHR): TEGLBoolean; cvar;external libepoxy;
  eglExportDMABUFImageQueryMESA: function(dpy: TEGLDisplay; image: TEGLImageKHR; fourcc: Plongint; num_planes: Plongint; modifiers: PEGLuint64KHR): TEGLBoolean absolute epoxy_eglExportDMABUFImageQueryMESA;

  epoxy_eglExportDRMImageMESA: function(dpy: TEGLDisplay; image: TEGLImageKHR; name: PEGLint; handle: PEGLint; stride: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglExportDRMImageMESA: function(dpy: TEGLDisplay; image: TEGLImageKHR; name: PEGLint; handle: PEGLint; stride: PEGLint): TEGLBoolean absolute epoxy_eglExportDRMImageMESA;

  epoxy_eglFenceNV: function(sync: TEGLSyncNV): TEGLBoolean; cvar;external libepoxy;
  eglFenceNV: function(sync: TEGLSyncNV): TEGLBoolean absolute epoxy_eglFenceNV;

  epoxy_eglGetCompositorTimingANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; numTimestamps: TEGLint; names: PEGLint; values: PEGLnsecsANDROID): TEGLBoolean; cvar;external libepoxy;
  eglGetCompositorTimingANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; numTimestamps: TEGLint; names: PEGLint; values: PEGLnsecsANDROID): TEGLBoolean absolute epoxy_eglGetCompositorTimingANDROID;

  epoxy_eglGetCompositorTimingSupportedANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; name: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglGetCompositorTimingSupportedANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; name: TEGLint): TEGLBoolean absolute epoxy_eglGetCompositorTimingSupportedANDROID;

  epoxy_eglGetConfigAttrib: function(dpy: TEGLDisplay; config: TEGLConfig; attribute: TEGLint; value: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglGetConfigAttrib: function(dpy: TEGLDisplay; config: TEGLConfig; attribute: TEGLint; value: PEGLint): TEGLBoolean absolute epoxy_eglGetConfigAttrib;

  epoxy_eglGetConfigs: function(dpy: TEGLDisplay; configs: PEGLConfig; config_size: TEGLint; num_config: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglGetConfigs: function(dpy: TEGLDisplay; configs: PEGLConfig; config_size: TEGLint; num_config: PEGLint): TEGLBoolean absolute epoxy_eglGetConfigs;

  epoxy_eglGetCurrentContext: function: TEGLContext; cvar;external libepoxy;
  eglGetCurrentContext: function: TEGLContext absolute epoxy_eglGetCurrentContext;

  epoxy_eglGetCurrentDisplay: function: TEGLDisplay; cvar;external libepoxy;
  eglGetCurrentDisplay: function: TEGLDisplay absolute epoxy_eglGetCurrentDisplay;

  epoxy_eglGetCurrentSurface: function(readdraw: TEGLint): TEGLSurface; cvar;external libepoxy;
  eglGetCurrentSurface: function(readdraw: TEGLint): TEGLSurface absolute epoxy_eglGetCurrentSurface;

  epoxy_eglGetDisplay: function(display_id: TEGLNativeDisplayType): TEGLDisplay; cvar;external libepoxy;
  eglGetDisplay: function(display_id: TEGLNativeDisplayType): TEGLDisplay absolute epoxy_eglGetDisplay;

  epoxy_eglGetDisplayDriverConfig: function(dpy: TEGLDisplay): pchar; cvar;external libepoxy;
  eglGetDisplayDriverConfig: function(dpy: TEGLDisplay): pchar absolute epoxy_eglGetDisplayDriverConfig;

  epoxy_eglGetDisplayDriverName: function(dpy: TEGLDisplay): pchar; cvar;external libepoxy;
  eglGetDisplayDriverName: function(dpy: TEGLDisplay): pchar absolute epoxy_eglGetDisplayDriverName;

  epoxy_eglGetError: function: TEGLint; cvar;external libepoxy;
  eglGetError: function: TEGLint absolute epoxy_eglGetError;

  epoxy_eglGetFrameTimestampSupportedANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; timestamp: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglGetFrameTimestampSupportedANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; timestamp: TEGLint): TEGLBoolean absolute epoxy_eglGetFrameTimestampSupportedANDROID;

  epoxy_eglGetFrameTimestampsANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; frameId: TEGLuint64KHR; numTimestamps: TEGLint; timestamps: PEGLint; values: PEGLnsecsANDROID): TEGLBoolean; cvar;external libepoxy;
  eglGetFrameTimestampsANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; frameId: TEGLuint64KHR; numTimestamps: TEGLint; timestamps: PEGLint; values: PEGLnsecsANDROID): TEGLBoolean absolute epoxy_eglGetFrameTimestampsANDROID;

  epoxy_eglGetNativeClientBufferANDROID: function(buffer: PAHardwareBuffer): TEGLClientBuffer; cvar;external libepoxy;
  eglGetNativeClientBufferANDROID: function(buffer: PAHardwareBuffer): TEGLClientBuffer absolute epoxy_eglGetNativeClientBufferANDROID;

  epoxy_eglGetNextFrameIdANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; frameId: PEGLuint64KHR): TEGLBoolean; cvar;external libepoxy;
  eglGetNextFrameIdANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; frameId: PEGLuint64KHR): TEGLBoolean absolute epoxy_eglGetNextFrameIdANDROID;

  epoxy_eglGetOutputLayersEXT: function(dpy: TEGLDisplay; attrib_list: PEGLAttrib; layers: PEGLOutputLayerEXT; max_layers: TEGLint; num_layers: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglGetOutputLayersEXT: function(dpy: TEGLDisplay; attrib_list: PEGLAttrib; layers: PEGLOutputLayerEXT; max_layers: TEGLint; num_layers: PEGLint): TEGLBoolean absolute epoxy_eglGetOutputLayersEXT;

  epoxy_eglGetOutputPortsEXT: function(dpy: TEGLDisplay; attrib_list: PEGLAttrib; ports: PEGLOutputPortEXT; max_ports: TEGLint; num_ports: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglGetOutputPortsEXT: function(dpy: TEGLDisplay; attrib_list: PEGLAttrib; ports: PEGLOutputPortEXT; max_ports: TEGLint; num_ports: PEGLint): TEGLBoolean absolute epoxy_eglGetOutputPortsEXT;

  epoxy_eglGetPlatformDisplay: function(platform: TEGLenum; native_display: pointer; attrib_list: PEGLAttrib): TEGLDisplay; cvar;external libepoxy;
  eglGetPlatformDisplay: function(platform: TEGLenum; native_display: pointer; attrib_list: PEGLAttrib): TEGLDisplay absolute epoxy_eglGetPlatformDisplay;

  epoxy_eglGetPlatformDisplayEXT: function(platform: TEGLenum; native_display: pointer; attrib_list: PEGLint): TEGLDisplay; cvar;external libepoxy;
  eglGetPlatformDisplayEXT: function(platform: TEGLenum; native_display: pointer; attrib_list: PEGLint): TEGLDisplay absolute epoxy_eglGetPlatformDisplayEXT;

  epoxy_eglGetProcAddress: function(procname: pchar): TeglMustCastToProperFunctionPointerType; cvar;external libepoxy;
  eglGetProcAddress: function(procname: pchar): TeglMustCastToProperFunctionPointerType absolute epoxy_eglGetProcAddress;

  epoxy_eglGetStreamFileDescriptorKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLNativeFileDescriptorKHR; cvar;external libepoxy;
  eglGetStreamFileDescriptorKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLNativeFileDescriptorKHR absolute epoxy_eglGetStreamFileDescriptorKHR;

  epoxy_eglGetSyncAttrib: function(dpy: TEGLDisplay; sync: TEGLSync; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglGetSyncAttrib: function(dpy: TEGLDisplay; sync: TEGLSync; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglGetSyncAttrib;

  epoxy_eglGetSyncAttribKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR; attribute: TEGLint; value: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglGetSyncAttribKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR; attribute: TEGLint; value: PEGLint): TEGLBoolean absolute epoxy_eglGetSyncAttribKHR;

  epoxy_eglGetSyncAttribNV: function(sync: TEGLSyncNV; attribute: TEGLint; value: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglGetSyncAttribNV: function(sync: TEGLSyncNV; attribute: TEGLint; value: PEGLint): TEGLBoolean absolute epoxy_eglGetSyncAttribNV;

  epoxy_eglGetSystemTimeFrequencyNV: function: TEGLuint64NV; cvar;external libepoxy;
  eglGetSystemTimeFrequencyNV: function: TEGLuint64NV absolute epoxy_eglGetSystemTimeFrequencyNV;

  epoxy_eglGetSystemTimeNV: function: TEGLuint64NV; cvar;external libepoxy;
  eglGetSystemTimeNV: function: TEGLuint64NV absolute epoxy_eglGetSystemTimeNV;

  epoxy_eglInitialize: function(dpy: TEGLDisplay; major: PEGLint; minor: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglInitialize: function(dpy: TEGLDisplay; major: PEGLint; minor: PEGLint): TEGLBoolean absolute epoxy_eglInitialize;

  epoxy_eglLabelObjectKHR: function(display: TEGLDisplay; objectType: TEGLenum; obj: TEGLObjectKHR; _label: TEGLLabelKHR): TEGLint; cvar;external libepoxy;
  eglLabelObjectKHR: function(display: TEGLDisplay; objectType: TEGLenum; obj: TEGLObjectKHR; _label: TEGLLabelKHR): TEGLint absolute epoxy_eglLabelObjectKHR;

  epoxy_eglLockSurfaceKHR: function(dpy: TEGLDisplay; surface: TEGLSurface; attrib_list: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglLockSurfaceKHR: function(dpy: TEGLDisplay; surface: TEGLSurface; attrib_list: PEGLint): TEGLBoolean absolute epoxy_eglLockSurfaceKHR;

  epoxy_eglMakeCurrent: function(dpy: TEGLDisplay; draw: TEGLSurface; read: TEGLSurface; ctx: TEGLContext): TEGLBoolean; cvar;external libepoxy;
  eglMakeCurrent: function(dpy: TEGLDisplay; draw: TEGLSurface; read: TEGLSurface; ctx: TEGLContext): TEGLBoolean absolute epoxy_eglMakeCurrent;

  epoxy_eglOutputLayerAttribEXT: function(dpy: TEGLDisplay; layer: TEGLOutputLayerEXT; attribute: TEGLint; value: TEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglOutputLayerAttribEXT: function(dpy: TEGLDisplay; layer: TEGLOutputLayerEXT; attribute: TEGLint; value: TEGLAttrib): TEGLBoolean absolute epoxy_eglOutputLayerAttribEXT;

  epoxy_eglOutputPortAttribEXT: function(dpy: TEGLDisplay; port: TEGLOutputPortEXT; attribute: TEGLint; value: TEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglOutputPortAttribEXT: function(dpy: TEGLDisplay; port: TEGLOutputPortEXT; attribute: TEGLint; value: TEGLAttrib): TEGLBoolean absolute epoxy_eglOutputPortAttribEXT;

  epoxy_eglPostSubBufferNV: function(dpy: TEGLDisplay; surface: TEGLSurface; x: TEGLint; y: TEGLint; width: TEGLint; height: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglPostSubBufferNV: function(dpy: TEGLDisplay; surface: TEGLSurface; x: TEGLint; y: TEGLint; width: TEGLint; height: TEGLint): TEGLBoolean absolute epoxy_eglPostSubBufferNV;

  epoxy_eglPresentationTimeANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; time: TEGLnsecsANDROID): TEGLBoolean; cvar;external libepoxy;
  eglPresentationTimeANDROID: function(dpy: TEGLDisplay; surface: TEGLSurface; time: TEGLnsecsANDROID): TEGLBoolean absolute epoxy_eglPresentationTimeANDROID;

  epoxy_eglQueryAPI: function: TEGLenum; cvar;external libepoxy;
  eglQueryAPI: function: TEGLenum absolute epoxy_eglQueryAPI;

  epoxy_eglQueryContext: function(dpy: TEGLDisplay; ctx: TEGLContext; attribute: TEGLint; value: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglQueryContext: function(dpy: TEGLDisplay; ctx: TEGLContext; attribute: TEGLint; value: PEGLint): TEGLBoolean absolute epoxy_eglQueryContext;

  epoxy_eglQueryDebugKHR: function(attribute: TEGLint; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglQueryDebugKHR: function(attribute: TEGLint; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglQueryDebugKHR;

  epoxy_eglQueryDeviceAttribEXT: function(device: TEGLDeviceEXT; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglQueryDeviceAttribEXT: function(device: TEGLDeviceEXT; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglQueryDeviceAttribEXT;

  epoxy_eglQueryDeviceStringEXT: function(device: TEGLDeviceEXT; name: TEGLint): pchar; cvar;external libepoxy;
  eglQueryDeviceStringEXT: function(device: TEGLDeviceEXT; name: TEGLint): pchar absolute epoxy_eglQueryDeviceStringEXT;

  epoxy_eglQueryDevicesEXT: function(max_devices: TEGLint; devices: PEGLDeviceEXT; num_devices: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglQueryDevicesEXT: function(max_devices: TEGLint; devices: PEGLDeviceEXT; num_devices: PEGLint): TEGLBoolean absolute epoxy_eglQueryDevicesEXT;

  epoxy_eglQueryDisplayAttribEXT: function(dpy: TEGLDisplay; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglQueryDisplayAttribEXT: function(dpy: TEGLDisplay; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglQueryDisplayAttribEXT;

  epoxy_eglQueryDisplayAttribKHR: function(dpy: TEGLDisplay; name: TEGLint; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglQueryDisplayAttribKHR: function(dpy: TEGLDisplay; name: TEGLint; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglQueryDisplayAttribKHR;

  epoxy_eglQueryDisplayAttribNV: function(dpy: TEGLDisplay; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglQueryDisplayAttribNV: function(dpy: TEGLDisplay; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglQueryDisplayAttribNV;

  epoxy_eglQueryDmaBufFormatsEXT: function(dpy: TEGLDisplay; max_formats: TEGLint; formats: PEGLint; num_formats: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglQueryDmaBufFormatsEXT: function(dpy: TEGLDisplay; max_formats: TEGLint; formats: PEGLint; num_formats: PEGLint): TEGLBoolean absolute epoxy_eglQueryDmaBufFormatsEXT;

  epoxy_eglQueryDmaBufModifiersEXT: function(dpy: TEGLDisplay; format: TEGLint; max_modifiers: TEGLint; modifiers: PEGLuint64KHR; external_only: PEGLBoolean; num_modifiers: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglQueryDmaBufModifiersEXT: function(dpy: TEGLDisplay; format: TEGLint; max_modifiers: TEGLint; modifiers: PEGLuint64KHR; external_only: PEGLBoolean; num_modifiers: PEGLint): TEGLBoolean absolute epoxy_eglQueryDmaBufModifiersEXT;

  epoxy_eglQueryNativeDisplayNV: function(dpy: TEGLDisplay; display_id: PEGLNativeDisplayType): TEGLBoolean; cvar;external libepoxy;
  eglQueryNativeDisplayNV: function(dpy: TEGLDisplay; display_id: PEGLNativeDisplayType): TEGLBoolean absolute epoxy_eglQueryNativeDisplayNV;

  epoxy_eglQueryNativePixmapNV: function(dpy: TEGLDisplay; surf: TEGLSurface; pixmap: PEGLNativePixmapType): TEGLBoolean; cvar;external libepoxy;
  eglQueryNativePixmapNV: function(dpy: TEGLDisplay; surf: TEGLSurface; pixmap: PEGLNativePixmapType): TEGLBoolean absolute epoxy_eglQueryNativePixmapNV;

  epoxy_eglQueryNativeWindowNV: function(dpy: TEGLDisplay; surf: TEGLSurface; window: PEGLNativeWindowType): TEGLBoolean; cvar;external libepoxy;
  eglQueryNativeWindowNV: function(dpy: TEGLDisplay; surf: TEGLSurface; window: PEGLNativeWindowType): TEGLBoolean absolute epoxy_eglQueryNativeWindowNV;

  epoxy_eglQueryOutputLayerAttribEXT: function(dpy: TEGLDisplay; layer: TEGLOutputLayerEXT; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglQueryOutputLayerAttribEXT: function(dpy: TEGLDisplay; layer: TEGLOutputLayerEXT; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglQueryOutputLayerAttribEXT;

  epoxy_eglQueryOutputLayerStringEXT: function(dpy: TEGLDisplay; layer: TEGLOutputLayerEXT; name: TEGLint): pchar; cvar;external libepoxy;
  eglQueryOutputLayerStringEXT: function(dpy: TEGLDisplay; layer: TEGLOutputLayerEXT; name: TEGLint): pchar absolute epoxy_eglQueryOutputLayerStringEXT;

  epoxy_eglQueryOutputPortAttribEXT: function(dpy: TEGLDisplay; port: TEGLOutputPortEXT; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglQueryOutputPortAttribEXT: function(dpy: TEGLDisplay; port: TEGLOutputPortEXT; attribute: TEGLint; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglQueryOutputPortAttribEXT;

  epoxy_eglQueryOutputPortStringEXT: function(dpy: TEGLDisplay; port: TEGLOutputPortEXT; name: TEGLint): pchar; cvar;external libepoxy;
  eglQueryOutputPortStringEXT: function(dpy: TEGLDisplay; port: TEGLOutputPortEXT; name: TEGLint): pchar absolute epoxy_eglQueryOutputPortStringEXT;

  epoxy_eglQueryStreamAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglQueryStreamAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: PEGLAttrib): TEGLBoolean absolute epoxy_eglQueryStreamAttribKHR;

  epoxy_eglQueryStreamKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglQueryStreamKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: PEGLint): TEGLBoolean absolute epoxy_eglQueryStreamKHR;

  epoxy_eglQueryStreamMetadataNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; name: TEGLenum; n: TEGLint; offset: TEGLint; size: TEGLint; data: pointer): TEGLBoolean; cvar;external libepoxy;
  eglQueryStreamMetadataNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; name: TEGLenum; n: TEGLint; offset: TEGLint; size: TEGLint; data: pointer): TEGLBoolean absolute epoxy_eglQueryStreamMetadataNV;

  epoxy_eglQueryStreamTimeKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: PEGLTimeKHR): TEGLBoolean; cvar;external libepoxy;
  eglQueryStreamTimeKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: PEGLTimeKHR): TEGLBoolean absolute epoxy_eglQueryStreamTimeKHR;

  epoxy_eglQueryStreamu64KHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: PEGLuint64KHR): TEGLBoolean; cvar;external libepoxy;
  eglQueryStreamu64KHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: PEGLuint64KHR): TEGLBoolean absolute epoxy_eglQueryStreamu64KHR;

  epoxy_eglQueryString: function(dpy: TEGLDisplay; name: TEGLint): pchar; cvar;external libepoxy;
  eglQueryString: function(dpy: TEGLDisplay; name: TEGLint): pchar absolute epoxy_eglQueryString;

  epoxy_eglQuerySurface: function(dpy: TEGLDisplay; surface: TEGLSurface; attribute: TEGLint; value: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglQuerySurface: function(dpy: TEGLDisplay; surface: TEGLSurface; attribute: TEGLint; value: PEGLint): TEGLBoolean absolute epoxy_eglQuerySurface;

  epoxy_eglQuerySurface64KHR: function(dpy: TEGLDisplay; surface: TEGLSurface; attribute: TEGLint; value: PEGLAttribKHR): TEGLBoolean; cvar;external libepoxy;
  eglQuerySurface64KHR: function(dpy: TEGLDisplay; surface: TEGLSurface; attribute: TEGLint; value: PEGLAttribKHR): TEGLBoolean absolute epoxy_eglQuerySurface64KHR;

  epoxy_eglQuerySurfacePointerANGLE: function(dpy: TEGLDisplay; surface: TEGLSurface; attribute: TEGLint; value: Ppointer): TEGLBoolean; cvar;external libepoxy;
  eglQuerySurfacePointerANGLE: function(dpy: TEGLDisplay; surface: TEGLSurface; attribute: TEGLint; value: Ppointer): TEGLBoolean absolute epoxy_eglQuerySurfacePointerANGLE;

  epoxy_eglReleaseTexImage: function(dpy: TEGLDisplay; surface: TEGLSurface; buffer: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglReleaseTexImage: function(dpy: TEGLDisplay; surface: TEGLSurface; buffer: TEGLint): TEGLBoolean absolute epoxy_eglReleaseTexImage;

  epoxy_eglReleaseThread: function: TEGLBoolean; cvar;external libepoxy;
  eglReleaseThread: function: TEGLBoolean absolute epoxy_eglReleaseThread;

  epoxy_eglResetStreamNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean; cvar;external libepoxy;
  eglResetStreamNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean absolute epoxy_eglResetStreamNV;

  epoxy_eglSetBlobCacheFuncsANDROID: procedure(dpy: TEGLDisplay; set_: TEGLSetBlobFuncANDROID; get: TEGLGetBlobFuncANDROID); cvar;external libepoxy;
  eglSetBlobCacheFuncsANDROID: procedure(dpy: TEGLDisplay; set_: TEGLSetBlobFuncANDROID; get: TEGLGetBlobFuncANDROID) absolute epoxy_eglSetBlobCacheFuncsANDROID;

  epoxy_eglSetDamageRegionKHR: function(dpy: TEGLDisplay; surface: TEGLSurface; rects: PEGLint; n_rects: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglSetDamageRegionKHR: function(dpy: TEGLDisplay; surface: TEGLSurface; rects: PEGLint; n_rects: TEGLint): TEGLBoolean absolute epoxy_eglSetDamageRegionKHR;

  epoxy_eglSetStreamAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: TEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglSetStreamAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: TEGLAttrib): TEGLBoolean absolute epoxy_eglSetStreamAttribKHR;

  epoxy_eglSetStreamMetadataNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; n: TEGLint; offset: TEGLint; size: TEGLint; data: pointer): TEGLBoolean; cvar;external libepoxy;
  eglSetStreamMetadataNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; n: TEGLint; offset: TEGLint; size: TEGLint; data: pointer): TEGLBoolean absolute epoxy_eglSetStreamMetadataNV;

  epoxy_eglSignalSyncKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR; mode: TEGLenum): TEGLBoolean; cvar;external libepoxy;
  eglSignalSyncKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR; mode: TEGLenum): TEGLBoolean absolute epoxy_eglSignalSyncKHR;

  epoxy_eglSignalSyncNV: function(sync: TEGLSyncNV; mode: TEGLenum): TEGLBoolean; cvar;external libepoxy;
  eglSignalSyncNV: function(sync: TEGLSyncNV; mode: TEGLenum): TEGLBoolean absolute epoxy_eglSignalSyncNV;

  epoxy_eglStreamAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglStreamAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attribute: TEGLenum; value: TEGLint): TEGLBoolean absolute epoxy_eglStreamAttribKHR;

  epoxy_eglStreamConsumerAcquireAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attrib_list: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglStreamConsumerAcquireAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attrib_list: PEGLAttrib): TEGLBoolean absolute epoxy_eglStreamConsumerAcquireAttribKHR;

  epoxy_eglStreamConsumerAcquireKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean; cvar;external libepoxy;
  eglStreamConsumerAcquireKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean absolute epoxy_eglStreamConsumerAcquireKHR;

  epoxy_eglStreamConsumerGLTextureExternalAttribsNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attrib_list: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglStreamConsumerGLTextureExternalAttribsNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attrib_list: PEGLAttrib): TEGLBoolean absolute epoxy_eglStreamConsumerGLTextureExternalAttribsNV;

  epoxy_eglStreamConsumerGLTextureExternalKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean; cvar;external libepoxy;
  eglStreamConsumerGLTextureExternalKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean absolute epoxy_eglStreamConsumerGLTextureExternalKHR;

  epoxy_eglStreamConsumerOutputEXT: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; layer: TEGLOutputLayerEXT): TEGLBoolean; cvar;external libepoxy;
  eglStreamConsumerOutputEXT: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; layer: TEGLOutputLayerEXT): TEGLBoolean absolute epoxy_eglStreamConsumerOutputEXT;

  epoxy_eglStreamConsumerReleaseAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attrib_list: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglStreamConsumerReleaseAttribKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR; attrib_list: PEGLAttrib): TEGLBoolean absolute epoxy_eglStreamConsumerReleaseAttribKHR;

  epoxy_eglStreamConsumerReleaseKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean; cvar;external libepoxy;
  eglStreamConsumerReleaseKHR: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean absolute epoxy_eglStreamConsumerReleaseKHR;

  epoxy_eglStreamFlushNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean; cvar;external libepoxy;
  eglStreamFlushNV: function(dpy: TEGLDisplay; stream: TEGLStreamKHR): TEGLBoolean absolute epoxy_eglStreamFlushNV;

  epoxy_eglSurfaceAttrib: function(dpy: TEGLDisplay; surface: TEGLSurface; attribute: TEGLint; value: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglSurfaceAttrib: function(dpy: TEGLDisplay; surface: TEGLSurface; attribute: TEGLint; value: TEGLint): TEGLBoolean absolute epoxy_eglSurfaceAttrib;

  epoxy_eglSwapBuffers: function(dpy: TEGLDisplay; surface: TEGLSurface): TEGLBoolean; cvar;external libepoxy;
  eglSwapBuffers: function(dpy: TEGLDisplay; surface: TEGLSurface): TEGLBoolean absolute epoxy_eglSwapBuffers;

  epoxy_eglSwapBuffersRegion2NOK: function(dpy: TEGLDisplay; surface: TEGLSurface; numRects: TEGLint; rects: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglSwapBuffersRegion2NOK: function(dpy: TEGLDisplay; surface: TEGLSurface; numRects: TEGLint; rects: PEGLint): TEGLBoolean absolute epoxy_eglSwapBuffersRegion2NOK;

  epoxy_eglSwapBuffersRegionNOK: function(dpy: TEGLDisplay; surface: TEGLSurface; numRects: TEGLint; rects: PEGLint): TEGLBoolean; cvar;external libepoxy;
  eglSwapBuffersRegionNOK: function(dpy: TEGLDisplay; surface: TEGLSurface; numRects: TEGLint; rects: PEGLint): TEGLBoolean absolute epoxy_eglSwapBuffersRegionNOK;

  epoxy_eglSwapBuffersWithDamageEXT: function(dpy: TEGLDisplay; surface: TEGLSurface; rects: PEGLint; n_rects: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglSwapBuffersWithDamageEXT: function(dpy: TEGLDisplay; surface: TEGLSurface; rects: PEGLint; n_rects: TEGLint): TEGLBoolean absolute epoxy_eglSwapBuffersWithDamageEXT;

  epoxy_eglSwapBuffersWithDamageKHR: function(dpy: TEGLDisplay; surface: TEGLSurface; rects: PEGLint; n_rects: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglSwapBuffersWithDamageKHR: function(dpy: TEGLDisplay; surface: TEGLSurface; rects: PEGLint; n_rects: TEGLint): TEGLBoolean absolute epoxy_eglSwapBuffersWithDamageKHR;

  epoxy_eglSwapInterval: function(dpy: TEGLDisplay; interval: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglSwapInterval: function(dpy: TEGLDisplay; interval: TEGLint): TEGLBoolean absolute epoxy_eglSwapInterval;

  epoxy_eglTerminate: function(dpy: TEGLDisplay): TEGLBoolean; cvar;external libepoxy;
  eglTerminate: function(dpy: TEGLDisplay): TEGLBoolean absolute epoxy_eglTerminate;

  epoxy_eglUnlockSurfaceKHR: function(dpy: TEGLDisplay; surface: TEGLSurface): TEGLBoolean; cvar;external libepoxy;
  eglUnlockSurfaceKHR: function(dpy: TEGLDisplay; surface: TEGLSurface): TEGLBoolean absolute epoxy_eglUnlockSurfaceKHR;

  epoxy_eglUnsignalSyncEXT: function(dpy: TEGLDisplay; sync: TEGLSync; attrib_list: PEGLAttrib): TEGLBoolean; cvar;external libepoxy;
  eglUnsignalSyncEXT: function(dpy: TEGLDisplay; sync: TEGLSync; attrib_list: PEGLAttrib): TEGLBoolean absolute epoxy_eglUnsignalSyncEXT;

  epoxy_eglWaitClient: function: TEGLBoolean; cvar;external libepoxy;
  eglWaitClient: function: TEGLBoolean absolute epoxy_eglWaitClient;

  epoxy_eglWaitGL: function: TEGLBoolean; cvar;external libepoxy;
  eglWaitGL: function: TEGLBoolean absolute epoxy_eglWaitGL;

  epoxy_eglWaitNative: function(engine: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglWaitNative: function(engine: TEGLint): TEGLBoolean absolute epoxy_eglWaitNative;

  epoxy_eglWaitSync: function(dpy: TEGLDisplay; sync: TEGLSync; flags: TEGLint): TEGLBoolean; cvar;external libepoxy;
  eglWaitSync: function(dpy: TEGLDisplay; sync: TEGLSync; flags: TEGLint): TEGLBoolean absolute epoxy_eglWaitSync;

  epoxy_eglWaitSyncKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR; flags: TEGLint): TEGLint; cvar;external libepoxy;
  eglWaitSyncKHR: function(dpy: TEGLDisplay; sync: TEGLSyncKHR; flags: TEGLint): TEGLint absolute epoxy_eglWaitSyncKHR;


  // === Konventiert am: 4-5-26 15:03:43 ===


  {$ENDIF read_interface}


  {$IFDEF read_implementation}



  {$ENDIF read_implementation}
