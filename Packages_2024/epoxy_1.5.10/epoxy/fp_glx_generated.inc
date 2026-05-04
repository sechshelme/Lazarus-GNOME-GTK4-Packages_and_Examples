{$IFDEF read_interface}

  {$ifdef linux}
  type
    PGLXFBConfigID = ^TGLXFBConfigID;
    TGLXFBConfigID = TXID;

    PGLXFBConfig = ^TGLXFBConfig;
    TGLXFBConfig = P_GLXFBConfigRec;

    PGLXContextID = ^TGLXContextID;
    TGLXContextID = TXID;

    PGLXContext = ^TGLXContext;
    TGLXContext = P_GLXcontextRec;

    PGLXPixmap = ^TGLXPixmap;
    TGLXPixmap = TXID;

    PGLXDrawable = ^TGLXDrawable;
    TGLXDrawable = TXID;

    PGLXWindow = ^TGLXWindow;
    TGLXWindow = TXID;

    PGLXPbuffer = ^TGLXPbuffer;
    TGLXPbuffer = TXID;

    T_GLXextFuncPtr = procedure (para1:pointer);cdecl;

    PGLXVideoCaptureDeviceNV = ^TGLXVideoCaptureDeviceNV;
    TGLXVideoCaptureDeviceNV = TXID;

    PGLXVideoDeviceNV = ^TGLXVideoDeviceNV;
    TGLXVideoDeviceNV = dword;

    PGLXVideoSourceSGIX = ^TGLXVideoSourceSGIX;
    TGLXVideoSourceSGIX = TXID;

    PGLXFBConfigIDSGIX = ^TGLXFBConfigIDSGIX;
    TGLXFBConfigIDSGIX = TXID;

    PGLXFBConfigSGIX = ^TGLXFBConfigSGIX;
    TGLXFBConfigSGIX = P_GLXFBConfigRec;

    PGLXPbufferSGIX = ^TGLXPbufferSGIX;
    TGLXPbufferSGIX = TXID;

    TGLXPbufferClobberEvent = record
        event_type : longint;
        draw_type : longint;
        serial : dword;
        send_event : TBool;
        display : PDisplay;
        drawable : TGLXDrawable;
        buffer_mask : dword;
        aux_buffer : dword;
        x : longint;
        y : longint;
        width : longint;
        height : longint;
        count : longint;
      end;
    PGLXPbufferClobberEvent = ^TGLXPbufferClobberEvent;

    TGLXBufferSwapComplete = record
        _type : longint;
        serial : dword;
        send_event : TBool;
        display : PDisplay;
        drawable : TGLXDrawable;
        event_type : longint;
        ust : Tint64_t;
        msc : Tint64_t;
        sbc : Tint64_t;
      end;
    PGLXBufferSwapComplete = ^TGLXBufferSwapComplete;

    T_GLXEvent = record
        case longint of
          0 : ( glxpbufferclobber : TGLXPbufferClobberEvent );
          1 : ( glxbufferswapcomplete : TGLXBufferSwapComplete );
          2 : ( pad : array[0..23] of longint );
        end;
    P_GLXEvent = ^T_GLXEvent;

    TGLXEvent = T_GLXEvent;
    PGLXEvent = ^TGLXEvent;

    TGLXStereoNotifyEventEXT = record
        _type : longint;
        serial : dword;
        send_event : TBool;
        display : PDisplay;
        extension : longint;
        evtype : longint;
        window : TGLXDrawable;
        stereo_tree : TBool;
      end;
    PGLXStereoNotifyEventEXT = ^TGLXStereoNotifyEventEXT;

    TGLXBufferClobberEventSGIX = record
        _type : longint;
        serial : dword;
        send_event : TBool;
        display : PDisplay;
        drawable : TGLXDrawable;
        event_type : longint;
        draw_type : longint;
        mask : dword;
        x : longint;
        y : longint;
        width : longint;
        height : longint;
        count : longint;
      end;
    PGLXBufferClobberEventSGIX = ^TGLXBufferClobberEventSGIX;

    TGLXHyperpipeNetworkSGIX = record
        pipeName : array[0..79] of char;
        networkId : longint;
      end;
    PGLXHyperpipeNetworkSGIX = ^TGLXHyperpipeNetworkSGIX;

    TGLXHyperpipeConfigSGIX = record
        pipeName : array[0..79] of char;
        channel : longint;
        participationType : dword;
        timeSlice : longint;
      end;
    PGLXHyperpipeConfigSGIX = ^TGLXHyperpipeConfigSGIX;

    TGLXPipeRect = record
        pipeName : array[0..79] of char;
        srcXOrigin : longint;
        srcYOrigin : longint;
        srcWidth : longint;
        srcHeight : longint;
        destXOrigin : longint;
        destYOrigin : longint;
        destWidth : longint;
        destHeight : longint;
      end;
    PGLXPipeRect = ^TGLXPipeRect;

    TGLXPipeRectLimits = record
        pipeName : array[0..79] of char;
        XOrigin : longint;
        YOrigin : longint;
        maxHeight : longint;
        maxWidth : longint;
      end;
    PGLXPipeRectLimits = ^TGLXPipeRectLimits;

  const
    GLX_VERSION_1_0 = 1;
    GLX_VERSION_1_1 = 1;
    GLX_VERSION_1_2 = 1;
    GLX_VERSION_1_3 = 1;
    GLX_VERSION_1_4 = 1;
    GLX_3DFX_multisample = 1;
    GLX_AMD_gpu_association = 1;
    GLX_ARB_context_flush_control = 1;
    GLX_ARB_create_context = 1;
    GLX_ARB_create_context_no_error = 1;
    GLX_ARB_create_context_profile = 1;
    GLX_ARB_create_context_robustness = 1;
    GLX_ARB_fbconfig_float = 1;
    GLX_ARB_framebuffer_sRGB = 1;
    GLX_ARB_get_proc_address = 1;
    GLX_ARB_multisample = 1;
    GLX_ARB_robustness_application_isolation = 1;
    GLX_ARB_robustness_share_group_isolation = 1;
    GLX_ARB_vertex_buffer_object = 1;
    GLX_EXT_buffer_age = 1;
    GLX_EXT_context_priority = 1;
    GLX_EXT_create_context_es2_profile = 1;
    GLX_EXT_create_context_es_profile = 1;
    GLX_EXT_fbconfig_packed_float = 1;
    GLX_EXT_framebuffer_sRGB = 1;
    GLX_EXT_import_context = 1;
    GLX_EXT_libglvnd = 1;
    GLX_EXT_no_config_context = 1;
    GLX_EXT_stereo_tree = 1;
    GLX_EXT_swap_control = 1;
    GLX_EXT_swap_control_tear = 1;
    GLX_EXT_texture_from_pixmap = 1;
    GLX_EXT_visual_info = 1;
    GLX_EXT_visual_rating = 1;
    GLX_INTEL_swap_event = 1;
    GLX_MESA_agp_offset = 1;
    GLX_MESA_copy_sub_buffer = 1;
    GLX_MESA_pixmap_colormap = 1;
    GLX_MESA_query_renderer = 1;
    GLX_MESA_release_buffers = 1;
    GLX_MESA_set_3dfx_mode = 1;
    GLX_MESA_swap_control = 1;
    GLX_NV_copy_buffer = 1;
    GLX_NV_copy_image = 1;
    GLX_NV_delay_before_swap = 1;
    GLX_NV_float_buffer = 1;
    GLX_NV_multisample_coverage = 1;
    GLX_NV_present_video = 1;
    GLX_NV_robustness_video_memory_purge = 1;
    GLX_NV_swap_group = 1;
    GLX_NV_video_capture = 1;
    GLX_NV_video_out = 1;
    GLX_OML_swap_method = 1;
    GLX_OML_sync_control = 1;
    GLX_SGIS_blended_overlay = 1;
    GLX_SGIS_multisample = 1;
    GLX_SGIS_shared_multisample = 1;
    GLX_SGIX_dmbuffer = 1;
    GLX_SGIX_fbconfig = 1;
    GLX_SGIX_hyperpipe = 1;
    GLX_SGIX_pbuffer = 1;
    GLX_SGIX_swap_barrier = 1;
    GLX_SGIX_swap_group = 1;
    GLX_SGIX_video_resize = 1;
    GLX_SGIX_video_source = 1;
    GLX_SGIX_visual_select_group = 1;
    GLX_SGI_cushion = 1;
    GLX_SGI_make_current_read = 1;
    GLX_SGI_swap_control = 1;
    GLX_SGI_video_sync = 1;
    GLX_SUN_get_transparent_index = 1;
    GLX_EXTENSION_NAME = 'GLX';
    GLX_CONTEXT_RELEASE_BEHAVIOR_NONE_ARB = 0;
    GLX_PbufferClobber = 0;
    GLX_STEREO_NOTIFY_EXT = $00000000;
    GLX_SYNC_FRAME_SGIX = $00000000;
    GLX_CONTEXT_CORE_PROFILE_BIT_ARB = $00000001;
    GLX_CONTEXT_DEBUG_BIT_ARB = $00000001;
    GLX_FRONT_LEFT_BUFFER_BIT = $00000001;
    GLX_FRONT_LEFT_BUFFER_BIT_SGIX = $00000001;
    GLX_HYPERPIPE_DISPLAY_PIPE_SGIX = $00000001;
    GLX_PIPE_RECT_SGIX = $00000001;
    GLX_RGBA_BIT = $00000001;
    GLX_RGBA_BIT_SGIX = $00000001;
    GLX_STEREO_NOTIFY_MASK_EXT = $00000001;
    GLX_SYNC_SWAP_SGIX = $00000001;
    GLX_TEXTURE_1D_BIT_EXT = $00000001;
    GLX_WINDOW_BIT = $00000001;
    GLX_WINDOW_BIT_SGIX = $00000001;
    GLX_COLOR_INDEX_BIT = $00000002;
    GLX_COLOR_INDEX_BIT_SGIX = $00000002;
    GLX_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB = $00000002;
    GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB = $00000002;
    GLX_FRONT_RIGHT_BUFFER_BIT = $00000002;
    GLX_FRONT_RIGHT_BUFFER_BIT_SGIX = $00000002;
    GLX_HYPERPIPE_RENDER_PIPE_SGIX = $00000002;
    GLX_PIPE_RECT_LIMITS_SGIX = $00000002;
    GLX_PIXMAP_BIT = $00000002;
    GLX_PIXMAP_BIT_SGIX = $00000002;
    GLX_TEXTURE_2D_BIT_EXT = $00000002;
    GLX_HYPERPIPE_STEREO_SGIX = $00000003;
    GLX_BACK_LEFT_BUFFER_BIT = $00000004;
    GLX_BACK_LEFT_BUFFER_BIT_SGIX = $00000004;
    GLX_CONTEXT_ES2_PROFILE_BIT_EXT = $00000004;
    GLX_CONTEXT_ES_PROFILE_BIT_EXT = $00000004;
    GLX_CONTEXT_ROBUST_ACCESS_BIT_ARB = $00000004;
    GLX_HYPERPIPE_PIXEL_AVERAGE_SGIX = $00000004;
    GLX_PBUFFER_BIT = $00000004;
    GLX_PBUFFER_BIT_SGIX = $00000004;
    GLX_RGBA_FLOAT_BIT_ARB = $00000004;
    GLX_TEXTURE_RECTANGLE_BIT_EXT = $00000004;
    GLX_BACK_RIGHT_BUFFER_BIT = $00000008;
    GLX_BACK_RIGHT_BUFFER_BIT_SGIX = $00000008;
    GLX_CONTEXT_RESET_ISOLATION_BIT_ARB = $00000008;
    GLX_RGBA_UNSIGNED_FLOAT_BIT_EXT = $00000008;
    GLX_AUX_BUFFERS_BIT = $00000010;
    GLX_AUX_BUFFERS_BIT_SGIX = $00000010;
    GLX_DEPTH_BUFFER_BIT = $00000020;
    GLX_DEPTH_BUFFER_BIT_SGIX = $00000020;
    GLX_STENCIL_BUFFER_BIT = $00000040;
    GLX_STENCIL_BUFFER_BIT_SGIX = $00000040;
    GLX_ACCUM_BUFFER_BIT = $00000080;
    GLX_ACCUM_BUFFER_BIT_SGIX = $00000080;
    GLX_SAMPLE_BUFFERS_BIT_SGIX = $00000100;
    GLX_BUFFER_SWAP_COMPLETE_INTEL_MASK = $04000000;
    GLX_BUFFER_CLOBBER_MASK_SGIX = $08000000;
    GLX_PBUFFER_CLOBBER_MASK = $08000000;
    GLX_3DFX_WINDOW_MODE_MESA = $1;
    GLX_VENDOR = $1;
    GLX_GPU_VENDOR_AMD = $1F00;
    GLX_GPU_RENDERER_STRING_AMD = $1F01;
    GLX_GPU_OPENGL_VERSION_STRING_AMD = $1F02;
    GLX_3DFX_FULLSCREEN_MODE_MESA = $2;
    GLX_VERSION = $2;
    GLX_CONFIG_CAVEAT = $20;
    GLX_VISUAL_CAVEAT_EXT = $20;
    GLX_CONTEXT_MAJOR_VERSION_ARB = $2091;
    GLX_CONTEXT_MINOR_VERSION_ARB = $2092;
    GLX_CONTEXT_FLAGS_ARB = $2094;
    GLX_CONTEXT_ALLOW_BUFFER_BYTE_ORDER_MISMATCH_ARB = $2095;
    GLX_CONTEXT_RELEASE_BEHAVIOR_ARB = $2097;
    GLX_CONTEXT_RELEASE_BEHAVIOR_FLUSH_ARB = $2098;
    GLX_FLOAT_COMPONENTS_NV = $20B0;
    GLX_RGBA_UNSIGNED_FLOAT_TYPE_EXT = $20B1;
    GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB = $20B2;
    GLX_FRAMEBUFFER_SRGB_CAPABLE_EXT = $20B2;
    GLX_COLOR_SAMPLES_NV = $20B3;
    GLX_RGBA_FLOAT_TYPE_ARB = $20B9;
    GLX_VIDEO_OUT_COLOR_NV = $20C3;
    GLX_VIDEO_OUT_ALPHA_NV = $20C4;
    GLX_VIDEO_OUT_DEPTH_NV = $20C5;
    GLX_VIDEO_OUT_COLOR_AND_ALPHA_NV = $20C6;
    GLX_VIDEO_OUT_COLOR_AND_DEPTH_NV = $20C7;
    GLX_VIDEO_OUT_FRAME_NV = $20C8;
    GLX_VIDEO_OUT_FIELD_1_NV = $20C9;
    GLX_VIDEO_OUT_FIELD_2_NV = $20CA;
    GLX_VIDEO_OUT_STACKED_FIELDS_1_2_NV = $20CB;
    GLX_VIDEO_OUT_STACKED_FIELDS_2_1_NV = $20CC;
    GLX_DEVICE_ID_NV = $20CD;
    GLX_UNIQUE_ID_NV = $20CE;
    GLX_NUM_VIDEO_CAPTURE_SLOTS_NV = $20CF;
    GLX_BIND_TO_TEXTURE_RGB_EXT = $20D0;
    GLX_BIND_TO_TEXTURE_RGBA_EXT = $20D1;
    GLX_BIND_TO_MIPMAP_TEXTURE_EXT = $20D2;
    GLX_BIND_TO_TEXTURE_TARGETS_EXT = $20D3;
    GLX_Y_INVERTED_EXT = $20D4;
    GLX_TEXTURE_FORMAT_EXT = $20D5;
    GLX_TEXTURE_TARGET_EXT = $20D6;
    GLX_MIPMAP_TEXTURE_EXT = $20D7;
    GLX_TEXTURE_FORMAT_NONE_EXT = $20D8;
    GLX_TEXTURE_FORMAT_RGB_EXT = $20D9;
    GLX_TEXTURE_FORMAT_RGBA_EXT = $20DA;
    GLX_TEXTURE_1D_EXT = $20DB;
    GLX_TEXTURE_2D_EXT = $20DC;
    GLX_TEXTURE_RECTANGLE_EXT = $20DD;
    GLX_FRONT_EXT = $20DE;
    GLX_FRONT_LEFT_EXT = $20DE;
    GLX_FRONT_RIGHT_EXT = $20DF;
    GLX_BACK_EXT = $20E0;
    GLX_BACK_LEFT_EXT = $20E0;
    GLX_BACK_RIGHT_EXT = $20E1;
    GLX_AUX0_EXT = $20E2;
    GLX_AUX1_EXT = $20E3;
    GLX_AUX2_EXT = $20E4;
    GLX_AUX3_EXT = $20E5;
    GLX_AUX4_EXT = $20E6;
    GLX_AUX5_EXT = $20E7;
    GLX_AUX6_EXT = $20E8;
    GLX_AUX7_EXT = $20E9;
    GLX_AUX8_EXT = $20EA;
    GLX_AUX9_EXT = $20EB;
    GLX_NUM_VIDEO_SLOTS_NV = $20F0;
    GLX_SWAP_INTERVAL_EXT = $20F1;
    GLX_MAX_SWAP_INTERVAL_EXT = $20F2;
    GLX_LATE_SWAPS_TEAR_EXT = $20F3;
    GLX_BACK_BUFFER_AGE_EXT = $20F4;
    GLX_STEREO_TREE_EXT = $20F5;
    GLX_VENDOR_NAMES_EXT = $20F6;
    GLX_GENERATE_RESET_ON_VIDEO_MEMORY_PURGE_NV = $20F7;
    GLX_GPU_FASTEST_TARGET_GPUS_AMD = $21A2;
    GLX_GPU_RAM_AMD = $21A3;
    GLX_GPU_CLOCK_AMD = $21A4;
    GLX_GPU_NUM_PIPES_AMD = $21A5;
    GLX_GPU_NUM_SIMD_AMD = $21A6;
    GLX_GPU_NUM_RB_AMD = $21A7;
    GLX_GPU_NUM_SPI_AMD = $21A8;
    GLX_X_VISUAL_TYPE = $22;
    GLX_X_VISUAL_TYPE_EXT = $22;
    GLX_TRANSPARENT_TYPE = $23;
    GLX_TRANSPARENT_TYPE_EXT = $23;
    GLX_TRANSPARENT_INDEX_VALUE = $24;
    GLX_TRANSPARENT_INDEX_VALUE_EXT = $24;
    GLX_TRANSPARENT_RED_VALUE = $25;
    GLX_TRANSPARENT_RED_VALUE_EXT = $25;
    GLX_TRANSPARENT_GREEN_VALUE = $26;
    GLX_TRANSPARENT_GREEN_VALUE_EXT = $26;
    GLX_TRANSPARENT_BLUE_VALUE = $27;
    GLX_TRANSPARENT_BLUE_VALUE_EXT = $27;
    GLX_TRANSPARENT_ALPHA_VALUE = $28;
    GLX_TRANSPARENT_ALPHA_VALUE_EXT = $28;
    GLX_EXTENSIONS = $3;
    GLX_CONTEXT_PRIORITY_LEVEL_EXT = $3100;
    GLX_CONTEXT_PRIORITY_HIGH_EXT = $3101;
    GLX_CONTEXT_PRIORITY_MEDIUM_EXT = $3102;
    GLX_CONTEXT_PRIORITY_LOW_EXT = $3103;
    GLX_CONTEXT_OPENGL_NO_ERROR_ARB = $31B3;
    GLX_NONE = $8000;
    GLX_NONE_EXT = $8000;
    GLX_SLOW_CONFIG = $8001;
    GLX_SLOW_VISUAL_EXT = $8001;
    GLX_TRUE_COLOR = $8002;
    GLX_TRUE_COLOR_EXT = $8002;
    GLX_DIRECT_COLOR = $8003;
    GLX_DIRECT_COLOR_EXT = $8003;
    GLX_PSEUDO_COLOR = $8004;
    GLX_PSEUDO_COLOR_EXT = $8004;
    GLX_STATIC_COLOR = $8005;
    GLX_STATIC_COLOR_EXT = $8005;
    GLX_GRAY_SCALE = $8006;
    GLX_GRAY_SCALE_EXT = $8006;
    GLX_STATIC_GRAY = $8007;
    GLX_STATIC_GRAY_EXT = $8007;
    GLX_TRANSPARENT_RGB = $8008;
    GLX_TRANSPARENT_RGB_EXT = $8008;
    GLX_TRANSPARENT_INDEX = $8009;
    GLX_TRANSPARENT_INDEX_EXT = $8009;
    GLX_SHARE_CONTEXT_EXT = $800A;
    GLX_VISUAL_ID = $800B;
    GLX_VISUAL_ID_EXT = $800B;
    GLX_SCREEN = $800C;
    GLX_SCREEN_EXT = $800C;
    GLX_NON_CONFORMANT_CONFIG = $800D;
    GLX_NON_CONFORMANT_VISUAL_EXT = $800D;
    GLX_DRAWABLE_TYPE = $8010;
    GLX_DRAWABLE_TYPE_SGIX = $8010;
    GLX_RENDER_TYPE = $8011;
    GLX_RENDER_TYPE_SGIX = $8011;
    GLX_X_RENDERABLE = $8012;
    GLX_X_RENDERABLE_SGIX = $8012;
    GLX_FBCONFIG_ID = $8013;
    GLX_FBCONFIG_ID_SGIX = $8013;
    GLX_RGBA_TYPE = $8014;
    GLX_RGBA_TYPE_SGIX = $8014;
    GLX_COLOR_INDEX_TYPE = $8015;
    GLX_COLOR_INDEX_TYPE_SGIX = $8015;
    GLX_MAX_PBUFFER_WIDTH = $8016;
    GLX_MAX_PBUFFER_WIDTH_SGIX = $8016;
    GLX_MAX_PBUFFER_HEIGHT = $8017;
    GLX_MAX_PBUFFER_HEIGHT_SGIX = $8017;
    GLX_MAX_PBUFFER_PIXELS = $8018;
    GLX_MAX_PBUFFER_PIXELS_SGIX = $8018;
    GLX_OPTIMAL_PBUFFER_WIDTH_SGIX = $8019;
    GLX_OPTIMAL_PBUFFER_HEIGHT_SGIX = $801A;
    GLX_PRESERVED_CONTENTS = $801B;
    GLX_PRESERVED_CONTENTS_SGIX = $801B;
    GLX_LARGEST_PBUFFER = $801C;
    GLX_LARGEST_PBUFFER_SGIX = $801C;
    GLX_WIDTH = $801D;
    GLX_WIDTH_SGIX = $801D;
    GLX_HEIGHT = $801E;
    GLX_HEIGHT_SGIX = $801E;
    GLX_EVENT_MASK = $801F;
    GLX_EVENT_MASK_SGIX = $801F;
    GLX_DAMAGED = $8020;
    GLX_DAMAGED_SGIX = $8020;
    GLX_SAVED = $8021;
    GLX_SAVED_SGIX = $8021;
    GLX_WINDOW = $8022;
    GLX_WINDOW_SGIX = $8022;
    GLX_PBUFFER = $8023;
    GLX_PBUFFER_SGIX = $8023;
    GLX_DIGITAL_MEDIA_PBUFFER_SGIX = $8024;
    GLX_BLENDED_RGBA_SGIS = $8025;
    GLX_MULTISAMPLE_SUB_RECT_WIDTH_SGIS = $8026;
    GLX_MULTISAMPLE_SUB_RECT_HEIGHT_SGIS = $8027;
    GLX_VISUAL_SELECT_GROUP_SGIX = $8028;
    GLX_HYPERPIPE_ID_SGIX = $8030;
    GLX_PBUFFER_HEIGHT = $8040;
    GLX_PBUFFER_WIDTH = $8041;
    GLX_SAMPLE_BUFFERS_3DFX = $8050;
    GLX_SAMPLES_3DFX = $8051;
    GLX_SWAP_METHOD_OML = $8060;
    GLX_SWAP_EXCHANGE_OML = $8061;
    GLX_SWAP_COPY_OML = $8062;
    GLX_SWAP_UNDEFINED_OML = $8063;
    GLX_EXCHANGE_COMPLETE_INTEL = $8180;
    GLX_COPY_COMPLETE_INTEL = $8181;
    GLX_FLIP_COMPLETE_INTEL = $8182;
    GLX_RENDERER_VENDOR_ID_MESA = $8183;
    GLX_RENDERER_DEVICE_ID_MESA = $8184;
    GLX_RENDERER_VERSION_MESA = $8185;
    GLX_RENDERER_ACCELERATED_MESA = $8186;
    GLX_RENDERER_VIDEO_MEMORY_MESA = $8187;
    GLX_RENDERER_UNIFIED_MEMORY_ARCHITECTURE_MESA = $8188;
    GLX_RENDERER_PREFERRED_PROFILE_MESA = $8189;
    GLX_RENDERER_OPENGL_CORE_PROFILE_VERSION_MESA = $818A;
    GLX_RENDERER_OPENGL_COMPATIBILITY_PROFILE_VERSION_MESA = $818B;
    GLX_RENDERER_OPENGL_ES_PROFILE_VERSION_MESA = $818C;
    GLX_RENDERER_OPENGL_ES2_PROFILE_VERSION_MESA = $818D;
    GLX_LOSE_CONTEXT_ON_RESET_ARB = $8252;
    GLX_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB = $8256;
    GLX_NO_RESET_NOTIFICATION_ARB = $8261;
    GLX_CONTEXT_PROFILE_MASK_ARB = $9126;
    GLX_DONT_CARE = $FFFFFFFF;
    GLX_BAD_SCREEN = 1;
    GLX_BufferSwapComplete = 1;
    GLX_USE_GL = 1;
    GLX_BLUE_SIZE = 10;
    GLX_SAMPLE_BUFFERS = 100000;
    GLX_SAMPLE_BUFFERS_ARB = 100000;
    GLX_SAMPLE_BUFFERS_SGIS = 100000;
    GLX_COVERAGE_SAMPLES_NV = 100001;
    GLX_SAMPLES = 100001;
    GLX_SAMPLES_ARB = 100001;
    GLX_SAMPLES_SGIS = 100001;
    GLX_ALPHA_SIZE = 11;
    GLX_DEPTH_SIZE = 12;
    GLX_STENCIL_SIZE = 13;
    GLX_ACCUM_RED_SIZE = 14;
    GLX_ACCUM_GREEN_SIZE = 15;
    GLX_ACCUM_BLUE_SIZE = 16;
    GLX_ACCUM_ALPHA_SIZE = 17;
    __GLX_NUMBER_EVENTS = 17;
    GLX_BAD_ATTRIBUTE = 2;
    GLX_BUFFER_SIZE = 2;
    GLX_LEVEL = 3;
    GLX_NO_EXTENSION = 3;
    GLX_BAD_VISUAL = 4;
    GLX_RGBA = 4;
    GLX_BAD_CONTEXT = 5;
    GLX_DOUBLEBUFFER = 5;
    GLX_BAD_VALUE = 6;
    GLX_STEREO = 6;
    GLX_AUX_BUFFERS = 7;
    GLX_BAD_ENUM = 7;
    GLX_RED_SIZE = 8;
    GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX = 80;
    GLX_GREEN_SIZE = 9;
    GLX_BAD_HYPERPIPE_CONFIG_SGIX = 91;
    GLX_BAD_HYPERPIPE_SGIX = 92;
  type

    TPFNGLXBINDCHANNELTOWINDOWSGIXPROC = function (display:PDisplay; screen:longint; channel:longint; window:TWindow):longint;cdecl;

    TPFNGLXBINDHYPERPIPESGIXPROC = function (dpy:PDisplay; hpId:longint):longint;cdecl;

    TPFNGLXBINDSWAPBARRIERNVPROC = function (dpy:PDisplay; group:TGLuint; barrier:TGLuint):TBool;cdecl;

    TPFNGLXBINDSWAPBARRIERSGIXPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable; barrier:longint);cdecl;

    TPFNGLXBINDTEXIMAGEEXTPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable; buffer:longint; attrib_list:Plongint);cdecl;

    TPFNGLXBINDVIDEOCAPTUREDEVICENVPROC = function (dpy:PDisplay; video_capture_slot:dword; device:TGLXVideoCaptureDeviceNV):longint;cdecl;

    TPFNGLXBINDVIDEODEVICENVPROC = function (dpy:PDisplay; video_slot:dword; video_device:dword; attrib_list:Plongint):longint;cdecl;

    TPFNGLXBINDVIDEOIMAGENVPROC = function (dpy:PDisplay; VideoDevice:TGLXVideoDeviceNV; pbuf:TGLXPbuffer; iVideoBuffer:longint):longint;cdecl;

    TPFNGLXBLITCONTEXTFRAMEBUFFERAMDPROC = procedure (dstCtx:TGLXContext; srcX0:TGLint; srcY0:TGLint; srcX1:TGLint; srcY1:TGLint;
                  dstX0:TGLint; dstY0:TGLint; dstX1:TGLint; dstY1:TGLint; mask:TGLbitfield;
                  filter:TGLenum);cdecl;

    TPFNGLXCHANNELRECTSGIXPROC = function (display:PDisplay; screen:longint; channel:longint; x:longint; y:longint;
                 w:longint; h:longint):longint;cdecl;

    TPFNGLXCHANNELRECTSYNCSGIXPROC = function (display:PDisplay; screen:longint; channel:longint; synctype:TGLenum):longint;cdecl;

    PPFNGLXCHOOSEFBCONFIGPROC = ^TPFNGLXCHOOSEFBCONFIGPROC;
    TPFNGLXCHOOSEFBCONFIGPROC = function (dpy:PDisplay; screen:longint; attrib_list:Plongint; nelements:Plongint):PGLXFBConfig;cdecl;

    PPFNGLXCHOOSEFBCONFIGSGIXPROC = ^TPFNGLXCHOOSEFBCONFIGSGIXPROC;
    TPFNGLXCHOOSEFBCONFIGSGIXPROC = function (dpy:PDisplay; screen:longint; attrib_list:Plongint; nelements:Plongint):PGLXFBConfigSGIX;cdecl;

    PPFNGLXCHOOSEVISUALPROC = ^TPFNGLXCHOOSEVISUALPROC;
    TPFNGLXCHOOSEVISUALPROC = function (dpy:PDisplay; screen:longint; attribList:Plongint):PXVisualInfo;cdecl;

    TPFNGLXCOPYBUFFERSUBDATANVPROC = procedure (dpy:PDisplay; readCtx:TGLXContext; writeCtx:TGLXContext; readTarget:TGLenum; writeTarget:TGLenum;
                  readOffset:TGLintptr; writeOffset:TGLintptr; size:TGLsizeiptr);cdecl;

    TPFNGLXCOPYCONTEXTPROC = procedure (dpy:PDisplay; src:TGLXContext; dst:TGLXContext; mask:dword);cdecl;

    TPFNGLXCOPYIMAGESUBDATANVPROC = procedure (dpy:PDisplay; srcCtx:TGLXContext; srcName:TGLuint; srcTarget:TGLenum; srcLevel:TGLint;
                  srcX:TGLint; srcY:TGLint; srcZ:TGLint; dstCtx:TGLXContext; dstName:TGLuint;
                  dstTarget:TGLenum; dstLevel:TGLint; dstX:TGLint; dstY:TGLint; dstZ:TGLint;
                  width:TGLsizei; height:TGLsizei; depth:TGLsizei);cdecl;

    TPFNGLXCOPYSUBBUFFERMESAPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable; x:longint; y:longint; width:longint;
                  height:longint);cdecl;

    TPFNGLXCREATEASSOCIATEDCONTEXTAMDPROC = function (id:dword; share_list:TGLXContext):TGLXContext;cdecl;

    TPFNGLXCREATEASSOCIATEDCONTEXTATTRIBSAMDPROC = function (id:dword; share_context:TGLXContext; attribList:Plongint):TGLXContext;cdecl;

    TPFNGLXCREATECONTEXTPROC = function (dpy:PDisplay; vis:PXVisualInfo; shareList:TGLXContext; direct:TBool):TGLXContext;cdecl;

    TPFNGLXCREATECONTEXTATTRIBSARBPROC = function (dpy:PDisplay; config:TGLXFBConfig; share_context:TGLXContext; direct:TBool; attrib_list:Plongint):TGLXContext;cdecl;

    TPFNGLXCREATECONTEXTWITHCONFIGSGIXPROC = function (dpy:PDisplay; config:TGLXFBConfigSGIX; render_type:longint; share_list:TGLXContext; direct:TBool):TGLXContext;cdecl;

    TPFNGLXCREATEGLXPBUFFERSGIXPROC = function (dpy:PDisplay; config:TGLXFBConfigSGIX; width:dword; height:dword; attrib_list:Plongint):TGLXPbufferSGIX;cdecl;

    TPFNGLXCREATEGLXPIXMAPPROC = function (dpy:PDisplay; visual:PXVisualInfo; pixmap:TPixmap):TGLXPixmap;cdecl;

    TPFNGLXCREATEGLXPIXMAPMESAPROC = function (dpy:PDisplay; visual:PXVisualInfo; pixmap:TPixmap; cmap:TColormap):TGLXPixmap;cdecl;

    TPFNGLXCREATEGLXPIXMAPWITHCONFIGSGIXPROC = function (dpy:PDisplay; config:TGLXFBConfigSGIX; pixmap:TPixmap):TGLXPixmap;cdecl;

    TPFNGLXCREATENEWCONTEXTPROC = function (dpy:PDisplay; config:TGLXFBConfig; render_type:longint; share_list:TGLXContext; direct:TBool):TGLXContext;cdecl;

    TPFNGLXCREATEPBUFFERPROC = function (dpy:PDisplay; config:TGLXFBConfig; attrib_list:Plongint):TGLXPbuffer;cdecl;

    TPFNGLXCREATEPIXMAPPROC = function (dpy:PDisplay; config:TGLXFBConfig; pixmap:TPixmap; attrib_list:Plongint):TGLXPixmap;cdecl;

    TPFNGLXCREATEWINDOWPROC = function (dpy:PDisplay; config:TGLXFBConfig; win:TWindow; attrib_list:Plongint):TGLXWindow;cdecl;

    TPFNGLXCUSHIONSGIPROC = procedure (dpy:PDisplay; window:TWindow; cushion:single);cdecl;

    TPFNGLXDELAYBEFORESWAPNVPROC = function (dpy:PDisplay; drawable:TGLXDrawable; seconds:TGLfloat):TBool;cdecl;

    TPFNGLXDELETEASSOCIATEDCONTEXTAMDPROC = function (ctx:TGLXContext):TBool;cdecl;

    TPFNGLXDESTROYCONTEXTPROC = procedure (dpy:PDisplay; ctx:TGLXContext);cdecl;

    TPFNGLXDESTROYGLXPBUFFERSGIXPROC = procedure (dpy:PDisplay; pbuf:TGLXPbufferSGIX);cdecl;

    TPFNGLXDESTROYGLXPIXMAPPROC = procedure (dpy:PDisplay; pixmap:TGLXPixmap);cdecl;

    TPFNGLXDESTROYGLXVIDEOSOURCESGIXPROC = procedure (dpy:PDisplay; glxvideosource:TGLXVideoSourceSGIX);cdecl;

    TPFNGLXDESTROYHYPERPIPECONFIGSGIXPROC = function (dpy:PDisplay; hpId:longint):longint;cdecl;

    TPFNGLXDESTROYPBUFFERPROC = procedure (dpy:PDisplay; pbuf:TGLXPbuffer);cdecl;

    TPFNGLXDESTROYPIXMAPPROC = procedure (dpy:PDisplay; pixmap:TGLXPixmap);cdecl;

    TPFNGLXDESTROYWINDOWPROC = procedure (dpy:PDisplay; win:TGLXWindow);cdecl;

    PPFNGLXENUMERATEVIDEOCAPTUREDEVICESNVPROC = ^TPFNGLXENUMERATEVIDEOCAPTUREDEVICESNVPROC;
    TPFNGLXENUMERATEVIDEOCAPTUREDEVICESNVPROC = function (dpy:PDisplay; screen:longint; nelements:Plongint):PGLXVideoCaptureDeviceNV;cdecl;

    PPFNGLXENUMERATEVIDEODEVICESNVPROC = ^TPFNGLXENUMERATEVIDEODEVICESNVPROC;
    TPFNGLXENUMERATEVIDEODEVICESNVPROC = function (dpy:PDisplay; screen:longint; nelements:Plongint):Pdword;cdecl;

    TPFNGLXFREECONTEXTEXTPROC = procedure (dpy:PDisplay; context:TGLXContext);cdecl;

    TPFNGLXGETAGPOFFSETMESAPROC = function (pointer:pointer):dword;cdecl;

    PPFNGLXGETCLIENTSTRINGPROC = ^TPFNGLXGETCLIENTSTRINGPROC;
    TPFNGLXGETCLIENTSTRINGPROC = function (dpy:PDisplay; name:longint):Pchar;cdecl;

    TPFNGLXGETCONFIGPROC = function (dpy:PDisplay; visual:PXVisualInfo; attrib:longint; value:Plongint):longint;cdecl;

    TPFNGLXGETCONTEXTGPUIDAMDPROC = function (ctx:TGLXContext):dword;cdecl;

    TPFNGLXGETCONTEXTIDEXTPROC = function (context:TGLXContext):TGLXContextID;cdecl;

    TPFNGLXGETCURRENTASSOCIATEDCONTEXTAMDPROC = function (para1:pointer):TGLXContext;cdecl;

    TPFNGLXGETCURRENTCONTEXTPROC = function (para1:pointer):TGLXContext;cdecl;

    PPFNGLXGETCURRENTDISPLAYPROC = ^TPFNGLXGETCURRENTDISPLAYPROC;
    TPFNGLXGETCURRENTDISPLAYPROC = function :PDisplay;cdecl;

    PPFNGLXGETCURRENTDISPLAYEXTPROC = ^TPFNGLXGETCURRENTDISPLAYEXTPROC;
    TPFNGLXGETCURRENTDISPLAYEXTPROC = function :PDisplay;cdecl;

    TPFNGLXGETCURRENTDRAWABLEPROC = function (para1:pointer):TGLXDrawable;cdecl;

    TPFNGLXGETCURRENTREADDRAWABLEPROC = function (para1:pointer):TGLXDrawable;cdecl;

    TPFNGLXGETCURRENTREADDRAWABLESGIPROC = function (para1:pointer):TGLXDrawable;cdecl;

    TPFNGLXGETFBCONFIGATTRIBPROC = function (dpy:PDisplay; config:TGLXFBConfig; attribute:longint; value:Plongint):longint;cdecl;

    TPFNGLXGETFBCONFIGATTRIBSGIXPROC = function (dpy:PDisplay; config:TGLXFBConfigSGIX; attribute:longint; value:Plongint):longint;cdecl;

    TPFNGLXGETFBCONFIGFROMVISUALSGIXPROC = function (dpy:PDisplay; vis:PXVisualInfo):TGLXFBConfigSGIX;cdecl;

    PPFNGLXGETFBCONFIGSPROC = ^TPFNGLXGETFBCONFIGSPROC;
    TPFNGLXGETFBCONFIGSPROC = function (dpy:PDisplay; screen:longint; nelements:Plongint):PGLXFBConfig;cdecl;

    TPFNGLXGETGPUIDSAMDPROC = function (maxCount:dword; ids:Pdword):dword;cdecl;

    TPFNGLXGETGPUINFOAMDPROC = function (id:dword; _property:longint; dataType:TGLenum; size:dword; data:pointer):longint;cdecl;

    TPFNGLXGETMSCRATEOMLPROC = function (dpy:PDisplay; drawable:TGLXDrawable; numerator:Pint32_t; denominator:Pint32_t):TBool;cdecl;

    TPFNGLXGETPROCADDRESSPROC = function (procName:PGLubyte):TGLXextFuncPtr;cdecl;

    TPFNGLXGETPROCADDRESSARBPROC = function (procName:PGLubyte):TGLXextFuncPtr;cdecl;

    TPFNGLXGETSELECTEDEVENTPROC = procedure (dpy:PDisplay; draw:TGLXDrawable; event_mask:Pdword);cdecl;

    TPFNGLXGETSELECTEDEVENTSGIXPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable; mask:Pdword);cdecl;

    TPFNGLXGETSWAPINTERVALMESAPROC = function (para1:pointer):longint;cdecl;

    TPFNGLXGETSYNCVALUESOMLPROC = function (dpy:PDisplay; drawable:TGLXDrawable; ust:Pint64_t; msc:Pint64_t; sbc:Pint64_t):TBool;cdecl;

    TPFNGLXGETTRANSPARENTINDEXSUNPROC = function (dpy:PDisplay; overlay:TWindow; underlay:TWindow; pTransparentIndex:Pdword):TStatus;cdecl;

    TPFNGLXGETVIDEODEVICENVPROC = function (dpy:PDisplay; screen:longint; numVideoDevices:longint; pVideoDevice:PGLXVideoDeviceNV):longint;cdecl;

    TPFNGLXGETVIDEOINFONVPROC = function (dpy:PDisplay; screen:longint; VideoDevice:TGLXVideoDeviceNV; pulCounterOutputPbuffer:Pdword; pulCounterOutputVideo:Pdword):longint;cdecl;

    TPFNGLXGETVIDEOSYNCSGIPROC = function (count:Pdword):longint;cdecl;

    PPFNGLXGETVISUALFROMFBCONFIGPROC = ^TPFNGLXGETVISUALFROMFBCONFIGPROC;
    TPFNGLXGETVISUALFROMFBCONFIGPROC = function (dpy:PDisplay; config:TGLXFBConfig):PXVisualInfo;cdecl;

    PPFNGLXGETVISUALFROMFBCONFIGSGIXPROC = ^TPFNGLXGETVISUALFROMFBCONFIGSGIXPROC;
    TPFNGLXGETVISUALFROMFBCONFIGSGIXPROC = function (dpy:PDisplay; config:TGLXFBConfigSGIX):PXVisualInfo;cdecl;

    TPFNGLXHYPERPIPEATTRIBSGIXPROC = function (dpy:PDisplay; timeSlice:longint; attrib:longint; size:longint; attribList:pointer):longint;cdecl;

    TPFNGLXHYPERPIPECONFIGSGIXPROC = function (dpy:PDisplay; networkId:longint; npipes:longint; cfg:PGLXHyperpipeConfigSGIX; hpId:Plongint):longint;cdecl;

    TPFNGLXIMPORTCONTEXTEXTPROC = function (dpy:PDisplay; contextID:TGLXContextID):TGLXContext;cdecl;

    TPFNGLXISDIRECTPROC = function (dpy:PDisplay; ctx:TGLXContext):TBool;cdecl;

    TPFNGLXJOINSWAPGROUPNVPROC = function (dpy:PDisplay; drawable:TGLXDrawable; group:TGLuint):TBool;cdecl;

    TPFNGLXJOINSWAPGROUPSGIXPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable; member:TGLXDrawable);cdecl;

    TPFNGLXLOCKVIDEOCAPTUREDEVICENVPROC = procedure (dpy:PDisplay; device:TGLXVideoCaptureDeviceNV);cdecl;

    TPFNGLXMAKEASSOCIATEDCONTEXTCURRENTAMDPROC = function (ctx:TGLXContext):TBool;cdecl;

    TPFNGLXMAKECONTEXTCURRENTPROC = function (dpy:PDisplay; draw:TGLXDrawable; read:TGLXDrawable; ctx:TGLXContext):TBool;cdecl;

    TPFNGLXMAKECURRENTPROC = function (dpy:PDisplay; drawable:TGLXDrawable; ctx:TGLXContext):TBool;cdecl;

    TPFNGLXMAKECURRENTREADSGIPROC = function (dpy:PDisplay; draw:TGLXDrawable; read:TGLXDrawable; ctx:TGLXContext):TBool;cdecl;

    TPFNGLXNAMEDCOPYBUFFERSUBDATANVPROC = procedure (dpy:PDisplay; readCtx:TGLXContext; writeCtx:TGLXContext; readBuffer:TGLuint; writeBuffer:TGLuint;
                  readOffset:TGLintptr; writeOffset:TGLintptr; size:TGLsizeiptr);cdecl;

    TPFNGLXQUERYCHANNELDELTASSGIXPROC = function (display:PDisplay; screen:longint; channel:longint; x:Plongint; y:Plongint;
                 w:Plongint; h:Plongint):longint;cdecl;

    TPFNGLXQUERYCHANNELRECTSGIXPROC = function (display:PDisplay; screen:longint; channel:longint; dx:Plongint; dy:Plongint;
                 dw:Plongint; dh:Plongint):longint;cdecl;

    TPFNGLXQUERYCONTEXTPROC = function (dpy:PDisplay; ctx:TGLXContext; attribute:longint; value:Plongint):longint;cdecl;

    TPFNGLXQUERYCONTEXTINFOEXTPROC = function (dpy:PDisplay; context:TGLXContext; attribute:longint; value:Plongint):longint;cdecl;

    TPFNGLXQUERYCURRENTRENDERERINTEGERMESAPROC = function (attribute:longint; value:Pdword):TBool;cdecl;

    PPFNGLXQUERYCURRENTRENDERERSTRINGMESAPROC = ^TPFNGLXQUERYCURRENTRENDERERSTRINGMESAPROC;
    TPFNGLXQUERYCURRENTRENDERERSTRINGMESAPROC = function (attribute:longint):Pchar;cdecl;

    TPFNGLXQUERYDRAWABLEPROC = procedure (dpy:PDisplay; draw:TGLXDrawable; attribute:longint; value:Pdword);cdecl;

    TPFNGLXQUERYEXTENSIONPROC = function (dpy:PDisplay; errorb:Plongint; event:Plongint):TBool;cdecl;

    PPFNGLXQUERYEXTENSIONSSTRINGPROC = ^TPFNGLXQUERYEXTENSIONSSTRINGPROC;
    TPFNGLXQUERYEXTENSIONSSTRINGPROC = function (dpy:PDisplay; screen:longint):Pchar;cdecl;

    TPFNGLXQUERYFRAMECOUNTNVPROC = function (dpy:PDisplay; screen:longint; count:PGLuint):TBool;cdecl;

    TPFNGLXQUERYGLXPBUFFERSGIXPROC = procedure (dpy:PDisplay; pbuf:TGLXPbufferSGIX; attribute:longint; value:Pdword);cdecl;

    TPFNGLXQUERYHYPERPIPEATTRIBSGIXPROC = function (dpy:PDisplay; timeSlice:longint; attrib:longint; size:longint; returnAttribList:pointer):longint;cdecl;

    TPFNGLXQUERYHYPERPIPEBESTATTRIBSGIXPROC = function (dpy:PDisplay; timeSlice:longint; attrib:longint; size:longint; attribList:pointer;
                 returnAttribList:pointer):longint;cdecl;

    PPFNGLXQUERYHYPERPIPECONFIGSGIXPROC = ^TPFNGLXQUERYHYPERPIPECONFIGSGIXPROC;
    TPFNGLXQUERYHYPERPIPECONFIGSGIXPROC = function (dpy:PDisplay; hpId:longint; npipes:Plongint):PGLXHyperpipeConfigSGIX;cdecl;

    PPFNGLXQUERYHYPERPIPENETWORKSGIXPROC = ^TPFNGLXQUERYHYPERPIPENETWORKSGIXPROC;
    TPFNGLXQUERYHYPERPIPENETWORKSGIXPROC = function (dpy:PDisplay; npipes:Plongint):PGLXHyperpipeNetworkSGIX;cdecl;

    TPFNGLXQUERYMAXSWAPBARRIERSSGIXPROC = function (dpy:PDisplay; screen:longint; max:Plongint):TBool;cdecl;

    TPFNGLXQUERYMAXSWAPGROUPSNVPROC = function (dpy:PDisplay; screen:longint; maxGroups:PGLuint; maxBarriers:PGLuint):TBool;cdecl;

    TPFNGLXQUERYRENDERERINTEGERMESAPROC = function (dpy:PDisplay; screen:longint; renderer:longint; attribute:longint; value:Pdword):TBool;cdecl;

    PPFNGLXQUERYRENDERERSTRINGMESAPROC = ^TPFNGLXQUERYRENDERERSTRINGMESAPROC;
    TPFNGLXQUERYRENDERERSTRINGMESAPROC = function (dpy:PDisplay; screen:longint; renderer:longint; attribute:longint):Pchar;cdecl;

    PPFNGLXQUERYSERVERSTRINGPROC = ^TPFNGLXQUERYSERVERSTRINGPROC;
    TPFNGLXQUERYSERVERSTRINGPROC = function (dpy:PDisplay; screen:longint; name:longint):Pchar;cdecl;

    TPFNGLXQUERYSWAPGROUPNVPROC = function (dpy:PDisplay; drawable:TGLXDrawable; group:PGLuint; barrier:PGLuint):TBool;cdecl;

    TPFNGLXQUERYVERSIONPROC = function (dpy:PDisplay; maj:Plongint; min:Plongint):TBool;cdecl;

    TPFNGLXQUERYVIDEOCAPTUREDEVICENVPROC = function (dpy:PDisplay; device:TGLXVideoCaptureDeviceNV; attribute:longint; value:Plongint):longint;cdecl;

    TPFNGLXRELEASEBUFFERSMESAPROC = function (dpy:PDisplay; drawable:TGLXDrawable):TBool;cdecl;

    TPFNGLXRELEASETEXIMAGEEXTPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable; buffer:longint);cdecl;

    TPFNGLXRELEASEVIDEOCAPTUREDEVICENVPROC = procedure (dpy:PDisplay; device:TGLXVideoCaptureDeviceNV);cdecl;

    TPFNGLXRELEASEVIDEODEVICENVPROC = function (dpy:PDisplay; screen:longint; VideoDevice:TGLXVideoDeviceNV):longint;cdecl;

    TPFNGLXRELEASEVIDEOIMAGENVPROC = function (dpy:PDisplay; pbuf:TGLXPbuffer):longint;cdecl;

    TPFNGLXRESETFRAMECOUNTNVPROC = function (dpy:PDisplay; screen:longint):TBool;cdecl;

    TPFNGLXSELECTEVENTPROC = procedure (dpy:PDisplay; draw:TGLXDrawable; event_mask:dword);cdecl;

    TPFNGLXSELECTEVENTSGIXPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable; mask:dword);cdecl;

    TPFNGLXSENDPBUFFERTOVIDEONVPROC = function (dpy:PDisplay; pbuf:TGLXPbuffer; iBufferType:longint; pulCounterPbuffer:Pdword; bBlock:TGLboolean):longint;cdecl;

    TPFNGLXSET3DFXMODEMESAPROC = function (mode:TGLint):TGLboolean;cdecl;

    TPFNGLXSWAPBUFFERSPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable);cdecl;

    TPFNGLXSWAPBUFFERSMSCOMLPROC = function (dpy:PDisplay; drawable:TGLXDrawable; target_msc:Tint64_t; divisor:Tint64_t; remainder:Tint64_t):Tint64_t;cdecl;

    TPFNGLXSWAPINTERVALEXTPROC = procedure (dpy:PDisplay; drawable:TGLXDrawable; interval:longint);cdecl;

    TPFNGLXSWAPINTERVALMESAPROC = function (interval:dword):longint;cdecl;

    TPFNGLXSWAPINTERVALSGIPROC = function (interval:longint):longint;cdecl;

    TPFNGLXUSEXFONTPROC = procedure (font:TFont; first:longint; count:longint; list:longint);cdecl;

    TPFNGLXWAITFORMSCOMLPROC = function (dpy:PDisplay; drawable:TGLXDrawable; target_msc:Tint64_t; divisor:Tint64_t; remainder:Tint64_t;
                 ust:Pint64_t; msc:Pint64_t; sbc:Pint64_t):TBool;cdecl;

    TPFNGLXWAITFORSBCOMLPROC = function (dpy:PDisplay; drawable:TGLXDrawable; target_sbc:Tint64_t; ust:Pint64_t; msc:Pint64_t;
                 sbc:Pint64_t):TBool;cdecl;

    TPFNGLXWAITGLPROC = procedure (para1:pointer);cdecl;

    TPFNGLXWAITVIDEOSYNCSGIPROC = function (divisor:longint; remainder:longint; count:Pdword):longint;cdecl;

    TPFNGLXWAITXPROC = procedure (para1:pointer);cdecl;
    var
      epoxy_glXBindChannelToWindowSGIX : function (display:PDisplay; screen:longint; channel:longint; window:TWindow):longint;cvar;external libepoxy;
      epoxy_glXBindHyperpipeSGIX : function (dpy:PDisplay; hpId:longint):longint;cvar;external libepoxy;
      epoxy_glXBindSwapBarrierNV : function (dpy:PDisplay; group:TGLuint; barrier:TGLuint):TBool;cvar;external libepoxy;
      epoxy_glXBindSwapBarrierSGIX : procedure (dpy:PDisplay; drawable:TGLXDrawable; barrier:longint);cvar;external libepoxy;
      epoxy_glXBindTexImageEXT : procedure (dpy:PDisplay; drawable:TGLXDrawable; buffer:longint; attrib_list:Plongint);cvar;external libepoxy;
      epoxy_glXBindVideoCaptureDeviceNV : function (dpy:PDisplay; video_capture_slot:dword; device:TGLXVideoCaptureDeviceNV):longint;cvar;external libepoxy;
      epoxy_glXBindVideoDeviceNV : function (dpy:PDisplay; video_slot:dword; video_device:dword; attrib_list:Plongint):longint;cvar;external libepoxy;
      epoxy_glXBindVideoImageNV : function (dpy:PDisplay; VideoDevice:TGLXVideoDeviceNV; pbuf:TGLXPbuffer; iVideoBuffer:longint):longint;cvar;external libepoxy;
      epoxy_glXBlitContextFramebufferAMD : procedure (dstCtx:TGLXContext; srcX0:TGLint; srcY0:TGLint; srcX1:TGLint; srcY1:TGLint;
                    dstX0:TGLint; dstY0:TGLint; dstX1:TGLint; dstY1:TGLint; mask:TGLbitfield;
                    filter:TGLenum);cvar;external libepoxy;
      epoxy_glXChannelRectSGIX : function (display:PDisplay; screen:longint; channel:longint; x:longint; y:longint;
                   w:longint; h:longint):longint;cvar;external libepoxy;
      epoxy_glXChannelRectSyncSGIX : function (display:PDisplay; screen:longint; channel:longint; synctype:TGLenum):longint;cvar;external libepoxy;
      epoxy_glXChooseFBConfig : function (dpy:PDisplay; screen:longint; attrib_list:Plongint; nelements:Plongint):PGLXFBConfig;cvar;external libepoxy;
      epoxy_glXChooseFBConfigSGIX : function (dpy:PDisplay; screen:longint; attrib_list:Plongint; nelements:Plongint):PGLXFBConfigSGIX;cvar;external libepoxy;
      epoxy_glXChooseVisual : function (dpy:PDisplay; screen:longint; attribList:Plongint):PXVisualInfo;cvar;external libepoxy;
      epoxy_glXCopyBufferSubDataNV : procedure (dpy:PDisplay; readCtx:TGLXContext; writeCtx:TGLXContext; readTarget:TGLenum; writeTarget:TGLenum;
                    readOffset:TGLintptr; writeOffset:TGLintptr; size:TGLsizeiptr);cvar;external libepoxy;
      epoxy_glXCopyContext : procedure (dpy:PDisplay; src:TGLXContext; dst:TGLXContext; mask:dword);cvar;external libepoxy;
      epoxy_glXCopyImageSubDataNV : procedure (dpy:PDisplay; srcCtx:TGLXContext; srcName:TGLuint; srcTarget:TGLenum; srcLevel:TGLint;
                    srcX:TGLint; srcY:TGLint; srcZ:TGLint; dstCtx:TGLXContext; dstName:TGLuint;
                    dstTarget:TGLenum; dstLevel:TGLint; dstX:TGLint; dstY:TGLint; dstZ:TGLint;
                    width:TGLsizei; height:TGLsizei; depth:TGLsizei);cvar;external libepoxy;
      epoxy_glXCopySubBufferMESA : procedure (dpy:PDisplay; drawable:TGLXDrawable; x:longint; y:longint; width:longint;
                    height:longint);cvar;external libepoxy;
      epoxy_glXCreateAssociatedContextAMD : function (id:dword; share_list:TGLXContext):TGLXContext;cvar;external libepoxy;
      epoxy_glXCreateAssociatedContextAttribsAMD : function (id:dword; share_context:TGLXContext; attribList:Plongint):TGLXContext;cvar;external libepoxy;
      epoxy_glXCreateContext : function (dpy:PDisplay; vis:PXVisualInfo; shareList:TGLXContext; direct:TBool):TGLXContext;cvar;external libepoxy;
      epoxy_glXCreateContextAttribsARB : function (dpy:PDisplay; config:TGLXFBConfig; share_context:TGLXContext; direct:TBool; attrib_list:Plongint):TGLXContext;cvar;external libepoxy;
      epoxy_glXCreateContextWithConfigSGIX : function (dpy:PDisplay; config:TGLXFBConfigSGIX; render_type:longint; share_list:TGLXContext; direct:TBool):TGLXContext;cvar;external libepoxy;
      epoxy_glXCreateGLXPbufferSGIX : function (dpy:PDisplay; config:TGLXFBConfigSGIX; width:dword; height:dword; attrib_list:Plongint):TGLXPbufferSGIX;cvar;external libepoxy;
      epoxy_glXCreateGLXPixmap : function (dpy:PDisplay; visual:PXVisualInfo; pixmap:TPixmap):TGLXPixmap;cvar;external libepoxy;
      epoxy_glXCreateGLXPixmapMESA : function (dpy:PDisplay; visual:PXVisualInfo; pixmap:TPixmap; cmap:TColormap):TGLXPixmap;cvar;external libepoxy;
      epoxy_glXCreateGLXPixmapWithConfigSGIX : function (dpy:PDisplay; config:TGLXFBConfigSGIX; pixmap:TPixmap):TGLXPixmap;cvar;external libepoxy;
      epoxy_glXCreateNewContext : function (dpy:PDisplay; config:TGLXFBConfig; render_type:longint; share_list:TGLXContext; direct:TBool):TGLXContext;cvar;external libepoxy;
      epoxy_glXCreatePbuffer : function (dpy:PDisplay; config:TGLXFBConfig; attrib_list:Plongint):TGLXPbuffer;cvar;external libepoxy;
      epoxy_glXCreatePixmap : function (dpy:PDisplay; config:TGLXFBConfig; pixmap:TPixmap; attrib_list:Plongint):TGLXPixmap;cvar;external libepoxy;
      epoxy_glXCreateWindow : function (dpy:PDisplay; config:TGLXFBConfig; win:TWindow; attrib_list:Plongint):TGLXWindow;cvar;external libepoxy;
      epoxy_glXCushionSGI : procedure (dpy:PDisplay; window:TWindow; cushion:single);cvar;external libepoxy;
      epoxy_glXDelayBeforeSwapNV : function (dpy:PDisplay; drawable:TGLXDrawable; seconds:TGLfloat):TBool;cvar;external libepoxy;
      epoxy_glXDeleteAssociatedContextAMD : function (ctx:TGLXContext):TBool;cvar;external libepoxy;
      epoxy_glXDestroyContext : procedure (dpy:PDisplay; ctx:TGLXContext);cvar;external libepoxy;
      epoxy_glXDestroyGLXPbufferSGIX : procedure (dpy:PDisplay; pbuf:TGLXPbufferSGIX);cvar;external libepoxy;
      epoxy_glXDestroyGLXPixmap : procedure (dpy:PDisplay; pixmap:TGLXPixmap);cvar;external libepoxy;
      epoxy_glXDestroyGLXVideoSourceSGIX : procedure (dpy:PDisplay; glxvideosource:TGLXVideoSourceSGIX);cvar;external libepoxy;
      epoxy_glXDestroyHyperpipeConfigSGIX : function (dpy:PDisplay; hpId:longint):longint;cvar;external libepoxy;
      epoxy_glXDestroyPbuffer : procedure (dpy:PDisplay; pbuf:TGLXPbuffer);cvar;external libepoxy;
      epoxy_glXDestroyPixmap : procedure (dpy:PDisplay; pixmap:TGLXPixmap);cvar;external libepoxy;
      epoxy_glXDestroyWindow : procedure (dpy:PDisplay; win:TGLXWindow);cvar;external libepoxy;
      epoxy_glXEnumerateVideoCaptureDevicesNV : function (dpy:PDisplay; screen:longint; nelements:Plongint):PGLXVideoCaptureDeviceNV;cvar;external libepoxy;
      epoxy_glXEnumerateVideoDevicesNV : function (dpy:PDisplay; screen:longint; nelements:Plongint):Pdword;cvar;external libepoxy;
      epoxy_glXFreeContextEXT : procedure (dpy:PDisplay; context:TGLXContext);cvar;external libepoxy;
      epoxy_glXGetAGPOffsetMESA : function (pointer:pointer):dword;cvar;external libepoxy;
      epoxy_glXGetClientString : function (dpy:PDisplay; name:longint):Pchar;cvar;external libepoxy;
      epoxy_glXGetConfig : function (dpy:PDisplay; visual:PXVisualInfo; attrib:longint; value:Plongint):longint;cvar;external libepoxy;
      epoxy_glXGetContextGPUIDAMD : function (ctx:TGLXContext):dword;cvar;external libepoxy;
      epoxy_glXGetContextIDEXT : function (context:TGLXContext):TGLXContextID;cvar;external libepoxy;
      epoxy_glXGetCurrentAssociatedContextAMD : function :TGLXContext;cvar;external libepoxy;
      epoxy_glXGetCurrentContext : function :TGLXContext;cvar;external libepoxy;
      epoxy_glXGetCurrentDisplay : function :PDisplay;cvar;external libepoxy;
      epoxy_glXGetCurrentDisplayEXT : function :PDisplay;cvar;external libepoxy;
      epoxy_glXGetCurrentDrawable : function :TGLXDrawable;cvar;external libepoxy;
      epoxy_glXGetCurrentReadDrawable : function :TGLXDrawable;cvar;external libepoxy;
      epoxy_glXGetCurrentReadDrawableSGI : function :TGLXDrawable;cvar;external libepoxy;
      epoxy_glXGetFBConfigAttrib : function (dpy:PDisplay; config:TGLXFBConfig; attribute:longint; value:Plongint):longint;cvar;external libepoxy;
      epoxy_glXGetFBConfigAttribSGIX : function (dpy:PDisplay; config:TGLXFBConfigSGIX; attribute:longint; value:Plongint):longint;cvar;external libepoxy;
      epoxy_glXGetFBConfigFromVisualSGIX : function (dpy:PDisplay; vis:PXVisualInfo):TGLXFBConfigSGIX;cvar;external libepoxy;
      epoxy_glXGetFBConfigs : function (dpy:PDisplay; screen:longint; nelements:Plongint):PGLXFBConfig;cvar;external libepoxy;
      epoxy_glXGetGPUIDsAMD : function (maxCount:dword; ids:Pdword):dword;cvar;external libepoxy;
      epoxy_glXGetGPUInfoAMD : function (id:dword; _property:longint; dataType:TGLenum; size:dword; data:pointer):longint;cvar;external libepoxy;
      epoxy_glXGetMscRateOML : function (dpy:PDisplay; drawable:TGLXDrawable; numerator:Pint32_t; denominator:Pint32_t):TBool;cvar;external libepoxy;
      epoxy_glXGetProcAddress : function (procName:PGLubyte):TGLXextFuncPtr;cvar;external libepoxy;
      epoxy_glXGetProcAddressARB : function (procName:PGLubyte):TGLXextFuncPtr;cvar;external libepoxy;
      epoxy_glXGetSelectedEvent : procedure (dpy:PDisplay; draw:TGLXDrawable; event_mask:Pdword);cvar;external libepoxy;
      epoxy_glXGetSelectedEventSGIX : procedure (dpy:PDisplay; drawable:TGLXDrawable; mask:Pdword);cvar;external libepoxy;
      epoxy_glXGetSwapIntervalMESA : function :longint;cvar;external libepoxy;
      epoxy_glXGetSyncValuesOML : function (dpy:PDisplay; drawable:TGLXDrawable; ust:Pint64_t; msc:Pint64_t; sbc:Pint64_t):TBool;cvar;external libepoxy;
      epoxy_glXGetTransparentIndexSUN : function (dpy:PDisplay; overlay:TWindow; underlay:TWindow; pTransparentIndex:Pdword):TStatus;cvar;external libepoxy;
      epoxy_glXGetVideoDeviceNV : function (dpy:PDisplay; screen:longint; numVideoDevices:longint; pVideoDevice:PGLXVideoDeviceNV):longint;cvar;external libepoxy;
      epoxy_glXGetVideoInfoNV : function (dpy:PDisplay; screen:longint; VideoDevice:TGLXVideoDeviceNV; pulCounterOutputPbuffer:Pdword; pulCounterOutputVideo:Pdword):longint;cvar;external libepoxy;
      epoxy_glXGetVideoSyncSGI : function (count:Pdword):longint;cvar;external libepoxy;
      epoxy_glXGetVisualFromFBConfig : function (dpy:PDisplay; config:TGLXFBConfig):PXVisualInfo;cvar;external libepoxy;
      epoxy_glXGetVisualFromFBConfigSGIX : function (dpy:PDisplay; config:TGLXFBConfigSGIX):PXVisualInfo;cvar;external libepoxy;
      epoxy_glXHyperpipeAttribSGIX : function (dpy:PDisplay; timeSlice:longint; attrib:longint; size:longint; attribList:pointer):longint;cvar;external libepoxy;
      epoxy_glXHyperpipeConfigSGIX : function (dpy:PDisplay; networkId:longint; npipes:longint; cfg:PGLXHyperpipeConfigSGIX; hpId:Plongint):longint;cvar;external libepoxy;
      epoxy_glXImportContextEXT : function (dpy:PDisplay; contextID:TGLXContextID):TGLXContext;cvar;external libepoxy;
      epoxy_glXIsDirect : function (dpy:PDisplay; ctx:TGLXContext):TBool;cvar;external libepoxy;
      epoxy_glXJoinSwapGroupNV : function (dpy:PDisplay; drawable:TGLXDrawable; group:TGLuint):TBool;cvar;external libepoxy;
      epoxy_glXJoinSwapGroupSGIX : procedure (dpy:PDisplay; drawable:TGLXDrawable; member:TGLXDrawable);cvar;external libepoxy;
      epoxy_glXLockVideoCaptureDeviceNV : procedure (dpy:PDisplay; device:TGLXVideoCaptureDeviceNV);cvar;external libepoxy;
      epoxy_glXMakeAssociatedContextCurrentAMD : function (ctx:TGLXContext):TBool;cvar;external libepoxy;
      epoxy_glXMakeContextCurrent : function (dpy:PDisplay; draw:TGLXDrawable; read:TGLXDrawable; ctx:TGLXContext):TBool;cvar;external libepoxy;
      epoxy_glXMakeCurrent : function (dpy:PDisplay; drawable:TGLXDrawable; ctx:TGLXContext):TBool;cvar;external libepoxy;
      epoxy_glXMakeCurrentReadSGI : function (dpy:PDisplay; draw:TGLXDrawable; read:TGLXDrawable; ctx:TGLXContext):TBool;cvar;external libepoxy;
      epoxy_glXNamedCopyBufferSubDataNV : procedure (dpy:PDisplay; readCtx:TGLXContext; writeCtx:TGLXContext; readBuffer:TGLuint; writeBuffer:TGLuint;
                    readOffset:TGLintptr; writeOffset:TGLintptr; size:TGLsizeiptr);cvar;external libepoxy;
      epoxy_glXQueryChannelDeltasSGIX : function (display:PDisplay; screen:longint; channel:longint; x:Plongint; y:Plongint;
                   w:Plongint; h:Plongint):longint;cvar;external libepoxy;
      epoxy_glXQueryChannelRectSGIX : function (display:PDisplay; screen:longint; channel:longint; dx:Plongint; dy:Plongint;
                   dw:Plongint; dh:Plongint):longint;cvar;external libepoxy;
      epoxy_glXQueryContext : function (dpy:PDisplay; ctx:TGLXContext; attribute:longint; value:Plongint):longint;cvar;external libepoxy;
      epoxy_glXQueryContextInfoEXT : function (dpy:PDisplay; context:TGLXContext; attribute:longint; value:Plongint):longint;cvar;external libepoxy;
      epoxy_glXQueryCurrentRendererIntegerMESA : function (attribute:longint; value:Pdword):TBool;cvar;external libepoxy;
      epoxy_glXQueryCurrentRendererStringMESA : function (attribute:longint):Pchar;cvar;external libepoxy;
      epoxy_glXQueryDrawable : procedure (dpy:PDisplay; draw:TGLXDrawable; attribute:longint; value:Pdword);cvar;external libepoxy;
      epoxy_glXQueryExtension : function (dpy:PDisplay; errorb:Plongint; event:Plongint):TBool;cvar;external libepoxy;
      epoxy_glXQueryExtensionsString : function (dpy:PDisplay; screen:longint):Pchar;cvar;external libepoxy;
      epoxy_glXQueryFrameCountNV : function (dpy:PDisplay; screen:longint; count:PGLuint):TBool;cvar;external libepoxy;
      epoxy_glXQueryGLXPbufferSGIX : procedure (dpy:PDisplay; pbuf:TGLXPbufferSGIX; attribute:longint; value:Pdword);cvar;external libepoxy;
      epoxy_glXQueryHyperpipeAttribSGIX : function (dpy:PDisplay; timeSlice:longint; attrib:longint; size:longint; returnAttribList:pointer):longint;cvar;external libepoxy;
      epoxy_glXQueryHyperpipeBestAttribSGIX : function (dpy:PDisplay; timeSlice:longint; attrib:longint; size:longint; attribList:pointer;
                   returnAttribList:pointer):longint;cvar;external libepoxy;
      epoxy_glXQueryHyperpipeConfigSGIX : function (dpy:PDisplay; hpId:longint; npipes:Plongint):PGLXHyperpipeConfigSGIX;cvar;external libepoxy;
      epoxy_glXQueryHyperpipeNetworkSGIX : function (dpy:PDisplay; npipes:Plongint):PGLXHyperpipeNetworkSGIX;cvar;external libepoxy;
      epoxy_glXQueryMaxSwapBarriersSGIX : function (dpy:PDisplay; screen:longint; max:Plongint):TBool;cvar;external libepoxy;
      epoxy_glXQueryMaxSwapGroupsNV : function (dpy:PDisplay; screen:longint; maxGroups:PGLuint; maxBarriers:PGLuint):TBool;cvar;external libepoxy;
      epoxy_glXQueryRendererIntegerMESA : function (dpy:PDisplay; screen:longint; renderer:longint; attribute:longint; value:Pdword):TBool;cvar;external libepoxy;
      epoxy_glXQueryRendererStringMESA : function (dpy:PDisplay; screen:longint; renderer:longint; attribute:longint):Pchar;cvar;external libepoxy;
      epoxy_glXQueryServerString : function (dpy:PDisplay; screen:longint; name:longint):Pchar;cvar;external libepoxy;
      epoxy_glXQuerySwapGroupNV : function (dpy:PDisplay; drawable:TGLXDrawable; group:PGLuint; barrier:PGLuint):TBool;cvar;external libepoxy;
      epoxy_glXQueryVersion : function (dpy:PDisplay; maj:Plongint; min:Plongint):TBool;cvar;external libepoxy;
      epoxy_glXQueryVideoCaptureDeviceNV : function (dpy:PDisplay; device:TGLXVideoCaptureDeviceNV; attribute:longint; value:Plongint):longint;cvar;external libepoxy;
      epoxy_glXReleaseBuffersMESA : function (dpy:PDisplay; drawable:TGLXDrawable):TBool;cvar;external libepoxy;
      epoxy_glXReleaseTexImageEXT : procedure (dpy:PDisplay; drawable:TGLXDrawable; buffer:longint);cvar;external libepoxy;
      epoxy_glXReleaseVideoCaptureDeviceNV : procedure (dpy:PDisplay; device:TGLXVideoCaptureDeviceNV);cvar;external libepoxy;
      epoxy_glXReleaseVideoDeviceNV : function (dpy:PDisplay; screen:longint; VideoDevice:TGLXVideoDeviceNV):longint;cvar;external libepoxy;
      epoxy_glXReleaseVideoImageNV : function (dpy:PDisplay; pbuf:TGLXPbuffer):longint;cvar;external libepoxy;
      epoxy_glXResetFrameCountNV : function (dpy:PDisplay; screen:longint):TBool;cvar;external libepoxy;
      epoxy_glXSelectEvent : procedure (dpy:PDisplay; draw:TGLXDrawable; event_mask:dword);cvar;external libepoxy;
      epoxy_glXSelectEventSGIX : procedure (dpy:PDisplay; drawable:TGLXDrawable; mask:dword);cvar;external libepoxy;
      epoxy_glXSendPbufferToVideoNV : function (dpy:PDisplay; pbuf:TGLXPbuffer; iBufferType:longint; pulCounterPbuffer:Pdword; bBlock:TGLboolean):longint;cvar;external libepoxy;
      epoxy_glXSet3DfxModeMESA : function (mode:TGLint):TGLboolean;cvar;external libepoxy;
      epoxy_glXSwapBuffers : procedure (dpy:PDisplay; drawable:TGLXDrawable);cvar;external libepoxy;
      epoxy_glXSwapBuffersMscOML : function (dpy:PDisplay; drawable:TGLXDrawable; target_msc:Tint64_t; divisor:Tint64_t; remainder:Tint64_t):Tint64_t;cvar;external libepoxy;
      epoxy_glXSwapIntervalEXT : procedure (dpy:PDisplay; drawable:TGLXDrawable; interval:longint);cvar;external libepoxy;
      epoxy_glXSwapIntervalMESA : function (interval:dword):longint;cvar;external libepoxy;
      epoxy_glXSwapIntervalSGI : function (interval:longint):longint;cvar;external libepoxy;
      epoxy_glXUseXFont : procedure (font:TFont; first:longint; count:longint; list:longint);cvar;external libepoxy;
      epoxy_glXWaitForMscOML : function (dpy:PDisplay; drawable:TGLXDrawable; target_msc:Tint64_t; divisor:Tint64_t; remainder:Tint64_t;
                   ust:Pint64_t; msc:Pint64_t; sbc:Pint64_t):TBool;cvar;external libepoxy;
      epoxy_glXWaitForSbcOML : function (dpy:PDisplay; drawable:TGLXDrawable; target_sbc:Tint64_t; ust:Pint64_t; msc:Pint64_t;
                   sbc:Pint64_t):TBool;cvar;external libepoxy;
      epoxy_glXWaitGL : procedure ;cvar;external libepoxy;
      epoxy_glXWaitVideoSyncSGI : function (divisor:longint; remainder:longint; count:Pdword):longint;cvar;external libepoxy;
      epoxy_glXWaitX : procedure ;cvar;external libepoxy;

  //const
  //  glXBindChannelToWindowSGIX = epoxy_glXBindChannelToWindowSGIX;
  //  glXBindHyperpipeSGIX = epoxy_glXBindHyperpipeSGIX;
  //  glXBindSwapBarrierNV = epoxy_glXBindSwapBarrierNV;
  //  glXBindSwapBarrierSGIX = epoxy_glXBindSwapBarrierSGIX;
  //  glXBindTexImageEXT = epoxy_glXBindTexImageEXT;
  //  glXBindVideoCaptureDeviceNV = epoxy_glXBindVideoCaptureDeviceNV;
  //  glXBindVideoDeviceNV = epoxy_glXBindVideoDeviceNV;
  //  glXBindVideoImageNV = epoxy_glXBindVideoImageNV;
  //  glXBlitContextFramebufferAMD = epoxy_glXBlitContextFramebufferAMD;
  //  glXChannelRectSGIX = epoxy_glXChannelRectSGIX;
  //  glXChannelRectSyncSGIX = epoxy_glXChannelRectSyncSGIX;
  //  glXChooseFBConfig = epoxy_glXChooseFBConfig;
  //  glXChooseFBConfigSGIX = epoxy_glXChooseFBConfigSGIX;
  //  glXChooseVisual = epoxy_glXChooseVisual;
  //  glXCopyBufferSubDataNV = epoxy_glXCopyBufferSubDataNV;
  //  glXCopyContext = epoxy_glXCopyContext;
  //  glXCopyImageSubDataNV = epoxy_glXCopyImageSubDataNV;
  //  glXCopySubBufferMESA = epoxy_glXCopySubBufferMESA;
  //  glXCreateAssociatedContextAMD = epoxy_glXCreateAssociatedContextAMD;
  //  glXCreateAssociatedContextAttribsAMD = epoxy_glXCreateAssociatedContextAttribsAMD;
  //  glXCreateContext = epoxy_glXCreateContext;
  //  glXCreateContextAttribsARB = epoxy_glXCreateContextAttribsARB;
  //  glXCreateContextWithConfigSGIX = epoxy_glXCreateContextWithConfigSGIX;
  //  glXCreateGLXPbufferSGIX = epoxy_glXCreateGLXPbufferSGIX;
  //  glXCreateGLXPixmap = epoxy_glXCreateGLXPixmap;
  //  glXCreateGLXPixmapMESA = epoxy_glXCreateGLXPixmapMESA;
  //  glXCreateGLXPixmapWithConfigSGIX = epoxy_glXCreateGLXPixmapWithConfigSGIX;
  //  glXCreateNewContext = epoxy_glXCreateNewContext;
  //  glXCreatePbuffer = epoxy_glXCreatePbuffer;
  //  glXCreatePixmap = epoxy_glXCreatePixmap;
  //  glXCreateWindow = epoxy_glXCreateWindow;
  //  glXCushionSGI = epoxy_glXCushionSGI;
  //  glXDelayBeforeSwapNV = epoxy_glXDelayBeforeSwapNV;
  //  glXDeleteAssociatedContextAMD = epoxy_glXDeleteAssociatedContextAMD;
  //  glXDestroyContext = epoxy_glXDestroyContext;
  //  glXDestroyGLXPbufferSGIX = epoxy_glXDestroyGLXPbufferSGIX;
  //  glXDestroyGLXPixmap = epoxy_glXDestroyGLXPixmap;
  //  glXDestroyGLXVideoSourceSGIX = epoxy_glXDestroyGLXVideoSourceSGIX;
  //  glXDestroyHyperpipeConfigSGIX = epoxy_glXDestroyHyperpipeConfigSGIX;
  //  glXDestroyPbuffer = epoxy_glXDestroyPbuffer;
  //  glXDestroyPixmap = epoxy_glXDestroyPixmap;
  //  glXDestroyWindow = epoxy_glXDestroyWindow;
  //  glXEnumerateVideoCaptureDevicesNV = epoxy_glXEnumerateVideoCaptureDevicesNV;
  //  glXEnumerateVideoDevicesNV = epoxy_glXEnumerateVideoDevicesNV;
  //  glXFreeContextEXT = epoxy_glXFreeContextEXT;
  //  glXGetAGPOffsetMESA = epoxy_glXGetAGPOffsetMESA;
  //  glXGetClientString = epoxy_glXGetClientString;
  //  glXGetConfig = epoxy_glXGetConfig;
  //  glXGetContextGPUIDAMD = epoxy_glXGetContextGPUIDAMD;
  //  glXGetContextIDEXT = epoxy_glXGetContextIDEXT;
  //  glXGetCurrentAssociatedContextAMD = epoxy_glXGetCurrentAssociatedContextAMD;
  //  glXGetCurrentContext = epoxy_glXGetCurrentContext;
  //  glXGetCurrentDisplay = epoxy_glXGetCurrentDisplay;
  //  glXGetCurrentDisplayEXT = epoxy_glXGetCurrentDisplayEXT;
  //  glXGetCurrentDrawable = epoxy_glXGetCurrentDrawable;
  //  glXGetCurrentReadDrawable = epoxy_glXGetCurrentReadDrawable;
  //  glXGetCurrentReadDrawableSGI = epoxy_glXGetCurrentReadDrawableSGI;
  //  glXGetFBConfigAttrib = epoxy_glXGetFBConfigAttrib;
  //  glXGetFBConfigAttribSGIX = epoxy_glXGetFBConfigAttribSGIX;
  //  glXGetFBConfigFromVisualSGIX = epoxy_glXGetFBConfigFromVisualSGIX;
  //  glXGetFBConfigs = epoxy_glXGetFBConfigs;
  //  glXGetGPUIDsAMD = epoxy_glXGetGPUIDsAMD;
  //  glXGetGPUInfoAMD = epoxy_glXGetGPUInfoAMD;
  //  glXGetMscRateOML = epoxy_glXGetMscRateOML;
  //  glXGetProcAddress = epoxy_glXGetProcAddress;
  //  glXGetProcAddressARB = epoxy_glXGetProcAddressARB;
  //  glXGetSelectedEvent = epoxy_glXGetSelectedEvent;
  //  glXGetSelectedEventSGIX = epoxy_glXGetSelectedEventSGIX;
  //  glXGetSwapIntervalMESA = epoxy_glXGetSwapIntervalMESA;
  //  glXGetSyncValuesOML = epoxy_glXGetSyncValuesOML;
  //  glXGetTransparentIndexSUN = epoxy_glXGetTransparentIndexSUN;
  //  glXGetVideoDeviceNV = epoxy_glXGetVideoDeviceNV;
  //  glXGetVideoInfoNV = epoxy_glXGetVideoInfoNV;
  //  glXGetVideoSyncSGI = epoxy_glXGetVideoSyncSGI;
  //  glXGetVisualFromFBConfig = epoxy_glXGetVisualFromFBConfig;
  //  glXGetVisualFromFBConfigSGIX = epoxy_glXGetVisualFromFBConfigSGIX;
  //  glXHyperpipeAttribSGIX = epoxy_glXHyperpipeAttribSGIX;
  //  glXHyperpipeConfigSGIX = epoxy_glXHyperpipeConfigSGIX;
  //  glXImportContextEXT = epoxy_glXImportContextEXT;
  //  glXIsDirect = epoxy_glXIsDirect;
  //  glXJoinSwapGroupNV = epoxy_glXJoinSwapGroupNV;
  //  glXJoinSwapGroupSGIX = epoxy_glXJoinSwapGroupSGIX;
  //  glXLockVideoCaptureDeviceNV = epoxy_glXLockVideoCaptureDeviceNV;
  //  glXMakeAssociatedContextCurrentAMD = epoxy_glXMakeAssociatedContextCurrentAMD;
  //  glXMakeContextCurrent = epoxy_glXMakeContextCurrent;
  //  glXMakeCurrent = epoxy_glXMakeCurrent;
  //  glXMakeCurrentReadSGI = epoxy_glXMakeCurrentReadSGI;
  //  glXNamedCopyBufferSubDataNV = epoxy_glXNamedCopyBufferSubDataNV;
  //  glXQueryChannelDeltasSGIX = epoxy_glXQueryChannelDeltasSGIX;
  //  glXQueryChannelRectSGIX = epoxy_glXQueryChannelRectSGIX;
  //  glXQueryContext = epoxy_glXQueryContext;
  //  glXQueryContextInfoEXT = epoxy_glXQueryContextInfoEXT;
  //  glXQueryCurrentRendererIntegerMESA = epoxy_glXQueryCurrentRendererIntegerMESA;
  //  glXQueryCurrentRendererStringMESA = epoxy_glXQueryCurrentRendererStringMESA;
  //  glXQueryDrawable = epoxy_glXQueryDrawable;
  //  glXQueryExtension = epoxy_glXQueryExtension;
  //  glXQueryExtensionsString = epoxy_glXQueryExtensionsString;
  //  glXQueryFrameCountNV = epoxy_glXQueryFrameCountNV;
  //  glXQueryGLXPbufferSGIX = epoxy_glXQueryGLXPbufferSGIX;
  //  glXQueryHyperpipeAttribSGIX = epoxy_glXQueryHyperpipeAttribSGIX;
  //  glXQueryHyperpipeBestAttribSGIX = epoxy_glXQueryHyperpipeBestAttribSGIX;
  //  glXQueryHyperpipeConfigSGIX = epoxy_glXQueryHyperpipeConfigSGIX;
  //  glXQueryHyperpipeNetworkSGIX = epoxy_glXQueryHyperpipeNetworkSGIX;
  //  glXQueryMaxSwapBarriersSGIX = epoxy_glXQueryMaxSwapBarriersSGIX;
  //  glXQueryMaxSwapGroupsNV = epoxy_glXQueryMaxSwapGroupsNV;
  //  glXQueryRendererIntegerMESA = epoxy_glXQueryRendererIntegerMESA;
  //  glXQueryRendererStringMESA = epoxy_glXQueryRendererStringMESA;
  //  glXQueryServerString = epoxy_glXQueryServerString;
  //  glXQuerySwapGroupNV = epoxy_glXQuerySwapGroupNV;
  //  glXQueryVersion = epoxy_glXQueryVersion;
  //  glXQueryVideoCaptureDeviceNV = epoxy_glXQueryVideoCaptureDeviceNV;
  //  glXReleaseBuffersMESA = epoxy_glXReleaseBuffersMESA;
  //  glXReleaseTexImageEXT = epoxy_glXReleaseTexImageEXT;
  //  glXReleaseVideoCaptureDeviceNV = epoxy_glXReleaseVideoCaptureDeviceNV;
  //  glXReleaseVideoDeviceNV = epoxy_glXReleaseVideoDeviceNV;
  //  glXReleaseVideoImageNV = epoxy_glXReleaseVideoImageNV;
  //  glXResetFrameCountNV = epoxy_glXResetFrameCountNV;
  //  glXSelectEvent = epoxy_glXSelectEvent;
  //  glXSelectEventSGIX = epoxy_glXSelectEventSGIX;
  //  glXSendPbufferToVideoNV = epoxy_glXSendPbufferToVideoNV;
  //  glXSet3DfxModeMESA = epoxy_glXSet3DfxModeMESA;
  //  glXSwapBuffers = epoxy_glXSwapBuffers;
  //  glXSwapBuffersMscOML = epoxy_glXSwapBuffersMscOML;
  //  glXSwapIntervalEXT = epoxy_glXSwapIntervalEXT;
  //  glXSwapIntervalMESA = epoxy_glXSwapIntervalMESA;
  //  glXSwapIntervalSGI = epoxy_glXSwapIntervalSGI;
  //  glXUseXFont = epoxy_glXUseXFont;
  //  glXWaitForMscOML = epoxy_glXWaitForMscOML;
  //  glXWaitForSbcOML = epoxy_glXWaitForSbcOML;
  //  glXWaitGL = epoxy_glXWaitGL;
  //  glXWaitVideoSyncSGI = epoxy_glXWaitVideoSyncSGI;
  //  glXWaitX = epoxy_glXWaitX;

  {$endif}

// === Konventiert am: 4-5-26 15:03:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
