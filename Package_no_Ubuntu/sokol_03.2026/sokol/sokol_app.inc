{$IFDEF read_interface}


type
  Txxx = longint;

const
  SAPP_MAX_TOUCHPOINTS = 8;
  SAPP_MAX_MOUSEBUTTONS = 3;
  SAPP_MAX_KEYCODES = 512;
  SAPP_MAX_ICONIMAGES = 8;

type
  Psapp_event_type = ^Tsapp_event_type;
  Tsapp_event_type = longint;

const
  SAPP_EVENTTYPE_INVALID = 0;
  SAPP_EVENTTYPE_KEY_DOWN = 1;
  SAPP_EVENTTYPE_KEY_UP = 2;
  SAPP_EVENTTYPE_CHAR = 3;
  SAPP_EVENTTYPE_MOUSE_DOWN = 4;
  SAPP_EVENTTYPE_MOUSE_UP = 5;
  SAPP_EVENTTYPE_MOUSE_SCROLL = 6;
  SAPP_EVENTTYPE_MOUSE_MOVE = 7;
  SAPP_EVENTTYPE_MOUSE_ENTER = 8;
  SAPP_EVENTTYPE_MOUSE_LEAVE = 9;
  SAPP_EVENTTYPE_TOUCHES_BEGAN = 10;
  SAPP_EVENTTYPE_TOUCHES_MOVED = 11;
  SAPP_EVENTTYPE_TOUCHES_ENDED = 12;
  SAPP_EVENTTYPE_TOUCHES_CANCELLED = 13;
  SAPP_EVENTTYPE_RESIZED = 14;
  SAPP_EVENTTYPE_ICONIFIED = 15;
  SAPP_EVENTTYPE_RESTORED = 16;
  SAPP_EVENTTYPE_FOCUSED = 17;
  SAPP_EVENTTYPE_UNFOCUSED = 18;
  SAPP_EVENTTYPE_SUSPENDED = 19;
  SAPP_EVENTTYPE_RESUMED = 20;
  SAPP_EVENTTYPE_QUIT_REQUESTED = 21;
  SAPP_EVENTTYPE_CLIPBOARD_PASTED = 22;
  SAPP_EVENTTYPE_FILES_DROPPED = 23;
  _SAPP_EVENTTYPE_NUM = 24;
  _SAPP_EVENTTYPE_FORCE_U32 = $7FFFFFFF;

type
  Psapp_keycode = ^Tsapp_keycode;
  Tsapp_keycode = longint;

const
  SAPP_KEYCODE_INVALID = 0;
  SAPP_KEYCODE_SPACE = 32;
  SAPP_KEYCODE_APOSTROPHE = 39;
  SAPP_KEYCODE_COMMA = 44;
  SAPP_KEYCODE_MINUS = 45;
  SAPP_KEYCODE_PERIOD = 46;
  SAPP_KEYCODE_SLASH = 47;
  SAPP_KEYCODE_0 = 48;
  SAPP_KEYCODE_1 = 49;
  SAPP_KEYCODE_2 = 50;
  SAPP_KEYCODE_3 = 51;
  SAPP_KEYCODE_4 = 52;
  SAPP_KEYCODE_5 = 53;
  SAPP_KEYCODE_6 = 54;
  SAPP_KEYCODE_7 = 55;
  SAPP_KEYCODE_8 = 56;
  SAPP_KEYCODE_9 = 57;
  SAPP_KEYCODE_SEMICOLON = 59;
  SAPP_KEYCODE_EQUAL = 61;
  SAPP_KEYCODE_A = 65;
  SAPP_KEYCODE_B = 66;
  SAPP_KEYCODE_C = 67;
  SAPP_KEYCODE_D = 68;
  SAPP_KEYCODE_E = 69;
  SAPP_KEYCODE_F = 70;
  SAPP_KEYCODE_G = 71;
  SAPP_KEYCODE_H = 72;
  SAPP_KEYCODE_I = 73;
  SAPP_KEYCODE_J = 74;
  SAPP_KEYCODE_K = 75;
  SAPP_KEYCODE_L = 76;
  SAPP_KEYCODE_M = 77;
  SAPP_KEYCODE_N = 78;
  SAPP_KEYCODE_O = 79;
  SAPP_KEYCODE_P = 80;
  SAPP_KEYCODE_Q = 81;
  SAPP_KEYCODE_R = 82;
  SAPP_KEYCODE_S = 83;
  SAPP_KEYCODE_T = 84;
  SAPP_KEYCODE_U = 85;
  SAPP_KEYCODE_V = 86;
  SAPP_KEYCODE_W = 87;
  SAPP_KEYCODE_X = 88;
  SAPP_KEYCODE_Y = 89;
  SAPP_KEYCODE_Z = 90;
  SAPP_KEYCODE_LEFT_BRACKET = 91;
  SAPP_KEYCODE_BACKSLASH = 92;
  SAPP_KEYCODE_RIGHT_BRACKET = 93;
  SAPP_KEYCODE_GRAVE_ACCENT = 96;
  SAPP_KEYCODE_WORLD_1 = 161;
  SAPP_KEYCODE_WORLD_2 = 162;
  SAPP_KEYCODE_ESCAPE = 256;
  SAPP_KEYCODE_ENTER = 257;
  SAPP_KEYCODE_TAB = 258;
  SAPP_KEYCODE_BACKSPACE = 259;
  SAPP_KEYCODE_INSERT = 260;
  SAPP_KEYCODE_DELETE = 261;
  SAPP_KEYCODE_RIGHT = 262;
  SAPP_KEYCODE_LEFT = 263;
  SAPP_KEYCODE_DOWN = 264;
  SAPP_KEYCODE_UP = 265;
  SAPP_KEYCODE_PAGE_UP = 266;
  SAPP_KEYCODE_PAGE_DOWN = 267;
  SAPP_KEYCODE_HOME = 268;
  SAPP_KEYCODE_END = 269;
  SAPP_KEYCODE_CAPS_LOCK = 280;
  SAPP_KEYCODE_SCROLL_LOCK = 281;
  SAPP_KEYCODE_NUM_LOCK = 282;
  SAPP_KEYCODE_PRINT_SCREEN = 283;
  SAPP_KEYCODE_PAUSE = 284;
  SAPP_KEYCODE_F1 = 290;
  SAPP_KEYCODE_F2 = 291;
  SAPP_KEYCODE_F3 = 292;
  SAPP_KEYCODE_F4 = 293;
  SAPP_KEYCODE_F5 = 294;
  SAPP_KEYCODE_F6 = 295;
  SAPP_KEYCODE_F7 = 296;
  SAPP_KEYCODE_F8 = 297;
  SAPP_KEYCODE_F9 = 298;
  SAPP_KEYCODE_F10 = 299;
  SAPP_KEYCODE_F11 = 300;
  SAPP_KEYCODE_F12 = 301;
  SAPP_KEYCODE_F13 = 302;
  SAPP_KEYCODE_F14 = 303;
  SAPP_KEYCODE_F15 = 304;
  SAPP_KEYCODE_F16 = 305;
  SAPP_KEYCODE_F17 = 306;
  SAPP_KEYCODE_F18 = 307;
  SAPP_KEYCODE_F19 = 308;
  SAPP_KEYCODE_F20 = 309;
  SAPP_KEYCODE_F21 = 310;
  SAPP_KEYCODE_F22 = 311;
  SAPP_KEYCODE_F23 = 312;
  SAPP_KEYCODE_F24 = 313;
  SAPP_KEYCODE_F25 = 314;
  SAPP_KEYCODE_KP_0 = 320;
  SAPP_KEYCODE_KP_1 = 321;
  SAPP_KEYCODE_KP_2 = 322;
  SAPP_KEYCODE_KP_3 = 323;
  SAPP_KEYCODE_KP_4 = 324;
  SAPP_KEYCODE_KP_5 = 325;
  SAPP_KEYCODE_KP_6 = 326;
  SAPP_KEYCODE_KP_7 = 327;
  SAPP_KEYCODE_KP_8 = 328;
  SAPP_KEYCODE_KP_9 = 329;
  SAPP_KEYCODE_KP_DECIMAL = 330;
  SAPP_KEYCODE_KP_DIVIDE = 331;
  SAPP_KEYCODE_KP_MULTIPLY = 332;
  SAPP_KEYCODE_KP_SUBTRACT = 333;
  SAPP_KEYCODE_KP_ADD = 334;
  SAPP_KEYCODE_KP_ENTER = 335;
  SAPP_KEYCODE_KP_EQUAL = 336;
  SAPP_KEYCODE_LEFT_SHIFT = 340;
  SAPP_KEYCODE_LEFT_CONTROL = 341;
  SAPP_KEYCODE_LEFT_ALT = 342;
  SAPP_KEYCODE_LEFT_SUPER = 343;
  SAPP_KEYCODE_RIGHT_SHIFT = 344;
  SAPP_KEYCODE_RIGHT_CONTROL = 345;
  SAPP_KEYCODE_RIGHT_ALT = 346;
  SAPP_KEYCODE_RIGHT_SUPER = 347;
  SAPP_KEYCODE_MENU = 348;

type
  Psapp_android_tooltype = ^Tsapp_android_tooltype;
  Tsapp_android_tooltype = longint;

const
  SAPP_ANDROIDTOOLTYPE_UNKNOWN = 0;
  SAPP_ANDROIDTOOLTYPE_FINGER = 1;
  SAPP_ANDROIDTOOLTYPE_STYLUS = 2;
  SAPP_ANDROIDTOOLTYPE_MOUSE = 3;

type
  Tsapp_touchpoint = record
    identifier: Tuintptr_t;
    pos_x: single;
    pos_y: single;
    android_tooltype: Tsapp_android_tooltype;
    changed: Boolean;
  end;
  Psapp_touchpoint = ^Tsapp_touchpoint;

type
  Psapp_mousebutton = ^Tsapp_mousebutton;
  Tsapp_mousebutton = longint;

const
  SAPP_MOUSEBUTTON_LEFT = $0;
  SAPP_MOUSEBUTTON_RIGHT = $1;
  SAPP_MOUSEBUTTON_MIDDLE = $2;
  SAPP_MOUSEBUTTON_INVALID = $100;

const
  SAPP_MODIFIER_SHIFT = $1;
  SAPP_MODIFIER_CTRL = $2;
  SAPP_MODIFIER_ALT = $4;
  SAPP_MODIFIER_SUPER = $8;
  SAPP_MODIFIER_LMB = $100;
  SAPP_MODIFIER_RMB = $200;
  SAPP_MODIFIER_MMB = $400;

type
  Tsapp_event = record
    frame_count: Tuint64_t;
    _type: Tsapp_event_type;
    key_code: Tsapp_keycode;
    char_code: Tuint32_t;
    key_repeat: Boolean;
    modifiers: Tuint32_t;
    mouse_button: Tsapp_mousebutton;
    mouse_x: single;
    mouse_y: single;
    mouse_dx: single;
    mouse_dy: single;
    scroll_x: single;
    scroll_y: single;
    num_touches: longint;
    touches: array[0..(SAPP_MAX_TOUCHPOINTS) - 1] of Tsapp_touchpoint;
    window_width: longint;
    window_height: longint;
    framebuffer_width: longint;
    framebuffer_height: longint;
  end;
  Psapp_event = ^Tsapp_event;

  Tsapp_range = record
    ptr: pointer;
    size: Tsize_t;
  end;
  Psapp_range = ^Tsapp_range;

  Tsapp_image_desc = record
    width: longint;
    height: longint;
    cursor_hotspot_x: longint;
    cursor_hotspot_y: longint;
    pixels: Tsapp_range;
  end;
  Psapp_image_desc = ^Tsapp_image_desc;

  Tsapp_icon_desc = record
    sokol_default: Boolean;
    images: array[0..(SAPP_MAX_ICONIMAGES) - 1] of Tsapp_image_desc;
  end;
  Psapp_icon_desc = ^Tsapp_icon_desc;

  Tsapp_allocator = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psapp_allocator = ^Tsapp_allocator;

type
  Psapp_pixel_format = ^Tsapp_pixel_format;
  Tsapp_pixel_format = longint;

const
  _SAPP_PIXELFORMAT_DEFAULT = 0;
  SAPP_PIXELFORMAT_NONE = 1;
  SAPP_PIXELFORMAT_RGBA8 = 2;
  SAPP_PIXELFORMAT_SRGB8A8 = 3;
  SAPP_PIXELFORMAT_BGRA8 = 4;
  SAPP_PIXELFORMAT_SBGRA8 = 5;
  SAPP_PIXELFORMAT_DEPTH = 6;
  SAPP_PIXELFORMAT_DEPTH_STENCIL = 7;
  _SA_PPPIXELFORMAT_FORCE_U32 = $7FFFFFFF;

type
  Tsapp_environment_defaults = record
    color_format: Tsapp_pixel_format;
    depth_format: Tsapp_pixel_format;
    sample_count: longint;
  end;
  Psapp_environment_defaults = ^Tsapp_environment_defaults;

  Tsapp_metal_environment = record
    device: pointer;
  end;
  Psapp_metal_environment = ^Tsapp_metal_environment;

  Tsapp_d3d11_environment = record
    device: pointer;
    device_context: pointer;
  end;
  Psapp_d3d11_environment = ^Tsapp_d3d11_environment;

  Tsapp_wgpu_environment = record
    device: pointer;
  end;
  Psapp_wgpu_environment = ^Tsapp_wgpu_environment;

  Tsapp_vulkan_environment = record
    instance: pointer;
    physical_device: pointer;
    device: pointer;
    queue: pointer;
    queue_family_index: Tuint32_t;
  end;
  Psapp_vulkan_environment = ^Tsapp_vulkan_environment;

  Tsapp_environment = record
    defaults: Tsapp_environment_defaults;
    metal: Tsapp_metal_environment;
    d3d11: Tsapp_d3d11_environment;
    wgpu: Tsapp_wgpu_environment;
    vulkan: Tsapp_vulkan_environment;
  end;
  Psapp_environment = ^Tsapp_environment;

  Tsapp_metal_swapchain = record
    current_drawable: pointer;
    depth_stencil_texture: pointer;
    msaa_color_texture: pointer;
  end;
  Psapp_metal_swapchain = ^Tsapp_metal_swapchain;

  Tsapp_d3d11_swapchain = record
    render_view: pointer;
    resolve_view: pointer;
    depth_stencil_view: pointer;
  end;
  Psapp_d3d11_swapchain = ^Tsapp_d3d11_swapchain;

  Tsapp_wgpu_swapchain = record
    render_view: pointer;
    resolve_view: pointer;
    depth_stencil_view: pointer;
  end;
  Psapp_wgpu_swapchain = ^Tsapp_wgpu_swapchain;

  Tsapp_vulkan_swapchain = record
    render_image: pointer;
    render_view: pointer;
    resolve_image: pointer;
    resolve_view: pointer;
    depth_stencil_image: pointer;
    depth_stencil_view: pointer;
    render_finished_semaphore: pointer;
    present_complete_semaphore: pointer;
  end;
  Psapp_vulkan_swapchain = ^Tsapp_vulkan_swapchain;

  Tsapp_gl_swapchain = record
    framebuffer: Tuint32_t;
  end;
  Psapp_gl_swapchain = ^Tsapp_gl_swapchain;

  Tsapp_swapchain = record
    width: longint;
    height: longint;
    sample_count: longint;
    color_format: Tsapp_pixel_format;
    depth_format: Tsapp_pixel_format;
    metal: Tsapp_metal_swapchain;
    d3d11: Tsapp_d3d11_swapchain;
    wgpu: Tsapp_wgpu_swapchain;
    vulkan: Tsapp_vulkan_swapchain;
    gl: Tsapp_gl_swapchain;
  end;
  Psapp_swapchain = ^Tsapp_swapchain;

  Tsapp_logger = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psapp_logger = ^Tsapp_logger;

  Tsapp_gl_desc = record
    major_version: longint;
    minor_version: longint;
  end;
  Psapp_gl_desc = ^Tsapp_gl_desc;

  Tsapp_win32_desc = record
    console_utf8: Boolean;
    console_create: Boolean;
    console_attach: Boolean;
  end;
  Psapp_win32_desc = ^Tsapp_win32_desc;

  Tsapp_html5_desc = record
    canvas_selector: pchar;
    canvas_resize: Boolean;
    preserve_drawing_buffer: Boolean;
    premultiplied_alpha: Boolean;
    ask_leave_site: Boolean;
    update_document_title: Boolean;
    bubble_mouse_events: Boolean;
    bubble_touch_events: Boolean;
    bubble_wheel_events: Boolean;
    bubble_key_events: Boolean;
    bubble_char_events: Boolean;
    use_emsc_set_main_loop: Boolean;
    emsc_set_main_loop_simulate_infinite_loop: Boolean;
  end;
  Psapp_html5_desc = ^Tsapp_html5_desc;

  Tsapp_ios_desc = record
    keyboard_resizes_canvas: Boolean;
  end;
  Psapp_ios_desc = ^Tsapp_ios_desc;

  Tsapp_desc = record
    init_cb: procedure; cdecl;
    frame_cb: procedure; cdecl;
    cleanup_cb: procedure; cdecl;
    event_cb: procedure(para1: Psapp_event); cdecl;
    user_data: pointer;
    init_userdata_cb: procedure(para1: pointer); cdecl;
    frame_userdata_cb: procedure(para1: pointer); cdecl;
    cleanup_userdata_cb: procedure(para1: pointer); cdecl;
    event_userdata_cb: procedure(para1: Psapp_event; para2: pointer); cdecl;
    width: longint;
    height: longint;
    sample_count: longint;
    swap_interval: longint;
    high_dpi: Boolean;
    fullscreen: Boolean;
    alpha: Boolean;
    window_title: pchar;
    enable_clipboard: Boolean;
    clipboard_size: longint;
    enable_dragndrop: Boolean;
    max_dropped_files: longint;
    max_dropped_file_path_length: longint;
    icon: Tsapp_icon_desc;
    allocator: Tsapp_allocator;
    logger: Tsapp_logger;
    gl: Tsapp_gl_desc;
    win32: Tsapp_win32_desc;
    html5: Tsapp_html5_desc;
    ios: Tsapp_ios_desc;
  end;
  Psapp_desc = ^Tsapp_desc;

type
  Psapp_html5_fetch_error = ^Tsapp_html5_fetch_error;
  Tsapp_html5_fetch_error = longint;

const
  SAPP_HTML5_FETCH_ERROR_NO_ERROR = 0;
  SAPP_HTML5_FETCH_ERROR_BUFFER_TOO_SMALL = 1;
  SAPP_HTML5_FETCH_ERROR_OTHER = 2;

type
  Tsapp_html5_fetch_response = record
    succeeded: Boolean;
    error_code: Tsapp_html5_fetch_error;
    file_index: longint;
    data: Tsapp_range;
    buffer: Tsapp_range;
    user_data: pointer;
  end;
  Psapp_html5_fetch_response = ^Tsapp_html5_fetch_response;

  Tsapp_html5_fetch_request = record
    dropped_file_index: longint;
    callback: procedure(para1: Psapp_html5_fetch_response); cdecl;
    buffer: Tsapp_range;
    user_data: pointer;
  end;
  Psapp_html5_fetch_request = ^Tsapp_html5_fetch_request;

type
  Psapp_mouse_cursor = ^Tsapp_mouse_cursor;
  Tsapp_mouse_cursor = longint;

const
  SAPP_MOUSECURSOR_DEFAULT = 0;
  SAPP_MOUSECURSOR_ARROW = 1;
  SAPP_MOUSECURSOR_IBEAM = 2;
  SAPP_MOUSECURSOR_CROSSHAIR = 3;
  SAPP_MOUSECURSOR_POINTING_HAND = 4;
  SAPP_MOUSECURSOR_RESIZE_EW = 5;
  SAPP_MOUSECURSOR_RESIZE_NS = 6;
  SAPP_MOUSECURSOR_RESIZE_NWSE = 7;
  SAPP_MOUSECURSOR_RESIZE_NESW = 8;
  SAPP_MOUSECURSOR_RESIZE_ALL = 9;
  SAPP_MOUSECURSOR_NOT_ALLOWED = 10;
  SAPP_MOUSECURSOR_CUSTOM_0 = 11;
  SAPP_MOUSECURSOR_CUSTOM_1 = 12;
  SAPP_MOUSECURSOR_CUSTOM_2 = 13;
  SAPP_MOUSECURSOR_CUSTOM_3 = 14;
  SAPP_MOUSECURSOR_CUSTOM_4 = 15;
  SAPP_MOUSECURSOR_CUSTOM_5 = 16;
  SAPP_MOUSECURSOR_CUSTOM_6 = 17;
  SAPP_MOUSECURSOR_CUSTOM_7 = 18;
  SAPP_MOUSECURSOR_CUSTOM_8 = 19;
  SAPP_MOUSECURSOR_CUSTOM_9 = 20;
  SAPP_MOUSECURSOR_CUSTOM_10 = 21;
  SAPP_MOUSECURSOR_CUSTOM_11 = 22;
  SAPP_MOUSECURSOR_CUSTOM_12 = 23;
  SAPP_MOUSECURSOR_CUSTOM_13 = 24;
  SAPP_MOUSECURSOR_CUSTOM_14 = 25;
  SAPP_MOUSECURSOR_CUSTOM_15 = 26;
  _SAPP_MOUSECURSOR_NUM = 27;

function sokol_main(argc: longint; argv: PPchar): Tsapp_desc; cdecl; external libsokol;
function sapp_isvalid: Boolean; cdecl; external libsokol;
function sapp_width: longint; cdecl; external libsokol;
function sapp_widthf: single; cdecl; external libsokol;
function sapp_height: longint; cdecl; external libsokol;
function sapp_heightf: single; cdecl; external libsokol;
function sapp_color_format: Tsapp_pixel_format; cdecl; external libsokol;
function sapp_depth_format: Tsapp_pixel_format; cdecl; external libsokol;
function sapp_sample_count: longint; cdecl; external libsokol;
function sapp_high_dpi: Boolean; cdecl; external libsokol;
function sapp_dpi_scale: single; cdecl; external libsokol;
procedure sapp_show_keyboard(show: Boolean); cdecl; external libsokol;
function sapp_keyboard_shown: Boolean; cdecl; external libsokol;
function sapp_is_fullscreen: Boolean; cdecl; external libsokol;
procedure sapp_toggle_fullscreen; cdecl; external libsokol;
procedure sapp_show_mouse(show: Boolean); cdecl; external libsokol;
function sapp_mouse_shown: Boolean; cdecl; external libsokol;
procedure sapp_lock_mouse(lock: Boolean); cdecl; external libsokol;
function sapp_mouse_locked: Boolean; cdecl; external libsokol;
procedure sapp_set_mouse_cursor(cursor: Tsapp_mouse_cursor); cdecl; external libsokol;
function sapp_get_mouse_cursor: Tsapp_mouse_cursor; cdecl; external libsokol;
function sapp_bind_mouse_cursor_image(cursor: Tsapp_mouse_cursor; desc: Psapp_image_desc): Tsapp_mouse_cursor; cdecl; external libsokol;
procedure sapp_unbind_mouse_cursor_image(cursor: Tsapp_mouse_cursor); cdecl; external libsokol;
function sapp_userdata: pointer; cdecl; external libsokol;
function sapp_query_desc: Tsapp_desc; cdecl; external libsokol;
procedure sapp_request_quit; cdecl; external libsokol;
procedure sapp_cancel_quit; cdecl; external libsokol;
procedure sapp_quit; cdecl; external libsokol;
procedure sapp_consume_event; cdecl; external libsokol;
function sapp_frame_count: Tuint64_t; cdecl; external libsokol;
function sapp_frame_duration: double; cdecl; external libsokol;
procedure sapp_set_clipboard_string(str: pchar); cdecl; external libsokol;
function sapp_get_clipboard_string: pchar; cdecl; external libsokol;
procedure sapp_set_window_title(str: pchar); cdecl; external libsokol;
procedure sapp_set_icon(icon_desc: Psapp_icon_desc); cdecl; external libsokol;
function sapp_get_num_dropped_files: longint; cdecl; external libsokol;
function sapp_get_dropped_file_path(index: longint): pchar; cdecl; external libsokol;
procedure sapp_run(desc: Psapp_desc); cdecl; external libsokol;
function sapp_get_environment: Tsapp_environment; cdecl; external libsokol;
function sapp_get_swapchain: Tsapp_swapchain; cdecl; external libsokol;
function sapp_egl_get_display: pointer; cdecl; external libsokol;
function sapp_egl_get_context: pointer; cdecl; external libsokol;
procedure sapp_html5_ask_leave_site(ask: Boolean); cdecl; external libsokol;
function sapp_html5_get_dropped_file_size(index: longint): Tuint32_t; cdecl; external libsokol;
procedure sapp_html5_fetch_dropped_file(request: Psapp_html5_fetch_request); cdecl; external libsokol;
function sapp_macos_get_window: pointer; cdecl; external libsokol;
function sapp_ios_get_window: pointer; cdecl; external libsokol;
function sapp_d3d11_get_swap_chain: pointer; cdecl; external libsokol;
function sapp_win32_get_hwnd: pointer; cdecl; external libsokol;
function sapp_gl_get_major_version: longint; cdecl; external libsokol;
function sapp_gl_get_minor_version: longint; cdecl; external libsokol;
function sapp_gl_is_gles: Boolean; cdecl; external libsokol;
function sapp_x11_get_window: pointer; cdecl; external libsokol;
function sapp_x11_get_display: pointer; cdecl; external libsokol;
function sapp_android_get_native_activity: pointer; cdecl; external libsokol;

// === Konventiert am: 22-3-26 16:22:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
