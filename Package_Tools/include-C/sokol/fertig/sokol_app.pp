
unit sokol_app;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_app.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_app.h
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
Psapp_allocator  = ^sapp_allocator;
Psapp_android_tooltype  = ^sapp_android_tooltype;
Psapp_d3d11_environment  = ^sapp_d3d11_environment;
Psapp_d3d11_swapchain  = ^sapp_d3d11_swapchain;
Psapp_desc  = ^sapp_desc;
Psapp_environment  = ^sapp_environment;
Psapp_environment_defaults  = ^sapp_environment_defaults;
Psapp_event  = ^sapp_event;
Psapp_event_type  = ^sapp_event_type;
Psapp_gl_desc  = ^sapp_gl_desc;
Psapp_gl_swapchain  = ^sapp_gl_swapchain;
Psapp_html5_desc  = ^sapp_html5_desc;
Psapp_html5_fetch_error  = ^sapp_html5_fetch_error;
Psapp_html5_fetch_request  = ^sapp_html5_fetch_request;
Psapp_html5_fetch_response  = ^sapp_html5_fetch_response;
Psapp_icon_desc  = ^sapp_icon_desc;
Psapp_image_desc  = ^sapp_image_desc;
Psapp_ios_desc  = ^sapp_ios_desc;
Psapp_keycode  = ^sapp_keycode;
Psapp_logger  = ^sapp_logger;
Psapp_metal_environment  = ^sapp_metal_environment;
Psapp_metal_swapchain  = ^sapp_metal_swapchain;
Psapp_mouse_cursor  = ^sapp_mouse_cursor;
Psapp_mousebutton  = ^sapp_mousebutton;
Psapp_pixel_format  = ^sapp_pixel_format;
Psapp_range  = ^sapp_range;
Psapp_swapchain  = ^sapp_swapchain;
Psapp_touchpoint  = ^sapp_touchpoint;
Psapp_vulkan_environment  = ^sapp_vulkan_environment;
Psapp_vulkan_swapchain  = ^sapp_vulkan_swapchain;
Psapp_wgpu_environment  = ^sapp_wgpu_environment;
Psapp_wgpu_swapchain  = ^sapp_wgpu_swapchain;
Psapp_win32_desc  = ^sapp_win32_desc;
Pxxx  = ^xxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Txxx =  Longint;
  Const
    SAPP_MAX_TOUCHPOINTS = 8;
    SAPP_MAX_MOUSEBUTTONS = 3;
    SAPP_MAX_KEYCODES = 512;
    SAPP_MAX_ICONIMAGES = 8;

{
    sapp_event_type

    The type of event that's passed to the event handler callback
    in the sapp_event.type field. These are not just "traditional"
    input events, but also notify the application about state changes
    or other user-invoked actions.
 }
type
  Psapp_event_type = ^Tsapp_event_type;
  Tsapp_event_type =  Longint;
  Const
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
;
{
    sapp_keycode

    The 'virtual keycode' of a KEY_DOWN or KEY_UP event in the
    struct field sapp_event.key_code.

    Note that the keycode values are identical with GLFW.
 }
{ '  }
{ ,  }
{ -  }
{ .  }
{ /  }
{ ;  }
{ =  }
{ [  }
{ \  }
{ ]  }
{ `  }
{ non-US #1  }
{ non-US #2  }
type
  Psapp_keycode = ^Tsapp_keycode;
  Tsapp_keycode =  Longint;
  Const
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
;
{
    Android specific 'tool type' enum for touch events. This lets the
    application check what type of input device was used for
    touch events.

    NOTE: the values must remain in sync with the corresponding
    Android SDK type, so don't change those.

    See https://developer.android.com/reference/android/view/MotionEvent#TOOL_TYPE_UNKNOWN
 }
{ TOOL_TYPE_UNKNOWN }
{ TOOL_TYPE_FINGER }
{ TOOL_TYPE_STYLUS }
{ TOOL_TYPE_MOUSE }
type
  Psapp_android_tooltype = ^Tsapp_android_tooltype;
  Tsapp_android_tooltype =  Longint;
  Const
    SAPP_ANDROIDTOOLTYPE_UNKNOWN = 0;
    SAPP_ANDROIDTOOLTYPE_FINGER = 1;
    SAPP_ANDROIDTOOLTYPE_STYLUS = 2;
    SAPP_ANDROIDTOOLTYPE_MOUSE = 3;
;
{
    sapp_touchpoint

    Describes a single touchpoint in a multitouch event (TOUCHES_BEGAN,
    TOUCHES_MOVED, TOUCHES_ENDED).

    Touch points are stored in the nested array sapp_event.touches[],
    and the number of touches is stored in sapp_event.num_touches.
 }
{ only valid on Android }
type
  Psapp_touchpoint = ^Tsapp_touchpoint;
  Tsapp_touchpoint = record
      identifier : Tuintptr_t;
      pos_x : single;
      pos_y : single;
      android_tooltype : Tsapp_android_tooltype;
      changed : Tbool;
    end;
{
    sapp_mousebutton

    The currently pressed mouse button in the events MOUSE_DOWN
    and MOUSE_UP, stored in the struct field sapp_event.mouse_button.
 }

  Psapp_mousebutton = ^Tsapp_mousebutton;
  Tsapp_mousebutton =  Longint;
  Const
    SAPP_MOUSEBUTTON_LEFT = $0;
    SAPP_MOUSEBUTTON_RIGHT = $1;
    SAPP_MOUSEBUTTON_MIDDLE = $2;
    SAPP_MOUSEBUTTON_INVALID = $100;
;
{
    These are currently pressed modifier keys (and mouse buttons) which are
    passed in the event struct field sapp_event.modifiers.
 }
{ left or right shift key }
{ left or right control key }
{ left or right alt key }
{ left or right 'super' key }
{ left mouse button }
{ right mouse button }
{ middle mouse button }
type
  Txxx =  Longint;
  Const
    SAPP_MODIFIER_SHIFT = $1;
    SAPP_MODIFIER_CTRL = $2;
    SAPP_MODIFIER_ALT = $4;
    SAPP_MODIFIER_SUPER = $8;
    SAPP_MODIFIER_LMB = $100;
    SAPP_MODIFIER_RMB = $200;
    SAPP_MODIFIER_MMB = $400;

{
    sapp_event

    This is an all-in-one event struct passed to the event handler
    user callback function. Note that it depends on the event
    type what struct fields actually contain useful values, so you
    should first check the event type before reading other struct
    fields.
 }
{ current frame counter, always valid, useful for checking if two events were issued in the same frame }
{ the event type, always valid }
{ the virtual key code, only valid in KEY_UP, KEY_DOWN }
{ the UTF-32 character code, only valid in CHAR events }
{ true if this is a key-repeat event, valid in KEY_UP, KEY_DOWN and CHAR }
{ current modifier keys, valid in all key-, char- and mouse-events }
{ mouse button that was pressed or released, valid in MOUSE_DOWN, MOUSE_UP }
{ current horizontal mouse position in pixels, always valid except during mouse lock }
{ current vertical mouse position in pixels, always valid except during mouse lock }
{ relative horizontal mouse movement since last frame, always valid }
{ relative vertical mouse movement since last frame, always valid }
{ horizontal mouse wheel scroll distance, valid in MOUSE_SCROLL events }
{ vertical mouse wheel scroll distance, valid in MOUSE_SCROLL events }
{ number of valid items in the touches[] array }
{ current touch points, valid in TOUCHES_BEGIN, TOUCHES_MOVED, TOUCHES_ENDED }
{ current window- and framebuffer sizes in pixels, always valid }
{ = window_width * dpi_scale }
{ = window_height * dpi_scale }
type
  Psapp_event = ^Tsapp_event;
  Tsapp_event = record
      frame_count : Tuint64_t;
      _type : Tsapp_event_type;
      key_code : Tsapp_keycode;
      char_code : Tuint32_t;
      key_repeat : Tbool;
      modifiers : Tuint32_t;
      mouse_button : Tsapp_mousebutton;
      mouse_x : single;
      mouse_y : single;
      mouse_dx : single;
      mouse_dy : single;
      scroll_x : single;
      scroll_y : single;
      num_touches : longint;
      touches : array[0..(SAPP_MAX_TOUCHPOINTS)-1] of Tsapp_touchpoint;
      window_width : longint;
      window_height : longint;
      framebuffer_width : longint;
      framebuffer_height : longint;
    end;
{
    sg_range

    A general pointer/size-pair struct and constructor macros for passing binary blobs
    into sokol_app.h.
 }
(* Const before type ignored *)

  Psapp_range = ^Tsapp_range;
  Tsapp_range = record
      ptr : pointer;
      size : Tsize_t;
    end;
{
    sapp_image_desc

    This is used to describe image data to sokol_app.h (window icons and cursor images).

    The pixel format is RGBA8.

    cursor_hotspot_x and _y are used only for cursors, to define which pixel
    of the image should be aligned with the mouse position.
 }

  Psapp_image_desc = ^Tsapp_image_desc;
  Tsapp_image_desc = record
      width : longint;
      height : longint;
      cursor_hotspot_x : longint;
      cursor_hotspot_y : longint;
      pixels : Tsapp_range;
    end;
{
    sapp_icon_desc

    An icon description structure for use in sapp_desc.icon and
    sapp_set_icon().

    When setting a custom image, the application can provide a number of
    candidates differing in size, and sokol_app.h will pick the image(s)
    closest to the size expected by the platform's window system.

    To set sokol-app's default icon, set .sokol_default to true.

    Otherwise provide candidate images of different sizes in the
    images[] array.

    If both the sokol_default flag is set to true, any image candidates
    will be ignored and the sokol_app.h default icon will be set.
 }

  Psapp_icon_desc = ^Tsapp_icon_desc;
  Tsapp_icon_desc = record
      sokol_default : Tbool;
      images : array[0..(SAPP_MAX_ICONIMAGES)-1] of Tsapp_image_desc;
    end;
{
    sapp_allocator

    Used in sapp_desc to provide custom memory-alloc and -free functions
    to sokol_app.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
 }

  Psapp_allocator = ^Tsapp_allocator;
  Tsapp_allocator = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    sapp_log_item

    Log items are defined via X-Macros and expanded to an enum
    'sapp_log_item', and in debug mode to corresponding
    human readable error messages.
 }
{
    sapp_pixel_format

    Defines the pixel format for swapchain surfaces.

    NOTE: when using sokol_gfx.h do not assume that the underlying
    values are compatible with sg_pixel_format!

 }

  Psapp_pixel_format = ^Tsapp_pixel_format;
  Tsapp_pixel_format =  Longint;
  Const
    _SAPP_PIXELFORMAT_DEFAULT = 0;
    SAPP_PIXELFORMAT_NONE = 1;
    SAPP_PIXELFORMAT_RGBA8 = 2;
    SAPP_PIXELFORMAT_SRGB8A8 = 3;
    SAPP_PIXELFORMAT_BGRA8 = 4;
    SAPP_PIXELFORMAT_SBGRA8 = 5;
    SAPP_PIXELFORMAT_DEPTH = 6;
    SAPP_PIXELFORMAT_DEPTH_STENCIL = 7;
    _SA_PPPIXELFORMAT_FORCE_U32 = $7FFFFFFF;
;
{
    sapp_environment

    Used to provide runtime environment information to the
    outside world (like default pixel formats and the backend
    3D API device pointer) via a call to sapp_get_environment().

    NOTE: when using sokol_gfx.h, don't assume that sapp_environment
    is binary compatible with sg_environment! Always use a translation
    function like sglue_environment() to populate sg_environment
    from sapp_environment!
 }
type
  Psapp_environment_defaults = ^Tsapp_environment_defaults;
  Tsapp_environment_defaults = record
      color_format : Tsapp_pixel_format;
      depth_format : Tsapp_pixel_format;
      sample_count : longint;
    end;
(* Const before type ignored *)

  Psapp_metal_environment = ^Tsapp_metal_environment;
  Tsapp_metal_environment = record
      device : pointer;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

  Psapp_d3d11_environment = ^Tsapp_d3d11_environment;
  Tsapp_d3d11_environment = record
      device : pointer;
      device_context : pointer;
    end;
(* Const before type ignored *)

  Psapp_wgpu_environment = ^Tsapp_wgpu_environment;
  Tsapp_wgpu_environment = record
      device : pointer;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Psapp_vulkan_environment = ^Tsapp_vulkan_environment;
  Tsapp_vulkan_environment = record
      instance : pointer;
      physical_device : pointer;
      device : pointer;
      queue : pointer;
      queue_family_index : Tuint32_t;
    end;

  Psapp_environment = ^Tsapp_environment;
  Tsapp_environment = record
      defaults : Tsapp_environment_defaults;
      metal : Tsapp_metal_environment;
      d3d11 : Tsapp_d3d11_environment;
      wgpu : Tsapp_wgpu_environment;
      vulkan : Tsapp_vulkan_environment;
    end;
{
    sapp_swapchain

    Provides swapchain information for the current frame to the outside
    world via a call to sapp_get_swapchain().

    NOTE: sapp_get_swapchain() must be called exactly once per frame since
    on some backends it will also acquire the next swapchain image.

    NOTE: when using sokol_gfx.h, don't assume that the sapp_swapchain struct
    has the same memory layout as sg_swapchain! Use the sokol_log.h helper
    function sglue_swapchain() to translate sapp_swapchain into a
    sg_swapchain instead.
 }
(* Const before type ignored *)
{ CAMetalDrawable (NOT MTLDrawable!!!) }
(* Const before type ignored *)
{ MTLTexture }
(* Const before type ignored *)
{ MTLTexture }

  Psapp_metal_swapchain = ^Tsapp_metal_swapchain;
  Tsapp_metal_swapchain = record
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

  Psapp_d3d11_swapchain = ^Tsapp_d3d11_swapchain;
  Tsapp_d3d11_swapchain = record
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

  Psapp_wgpu_swapchain = ^Tsapp_wgpu_swapchain;
  Tsapp_wgpu_swapchain = record
      render_view : pointer;
      resolve_view : pointer;
      depth_stencil_view : pointer;
    end;
(* Const before type ignored *)
{ vkImage }
(* Const before type ignored *)
{ vkImageView }
(* Const before type ignored *)
{ vkImage; }
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

  Psapp_vulkan_swapchain = ^Tsapp_vulkan_swapchain;
  Tsapp_vulkan_swapchain = record
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

  Psapp_gl_swapchain = ^Tsapp_gl_swapchain;
  Tsapp_gl_swapchain = record
      framebuffer : Tuint32_t;
    end;

  Psapp_swapchain = ^Tsapp_swapchain;
  Tsapp_swapchain = record
      width : longint;
      height : longint;
      sample_count : longint;
      color_format : Tsapp_pixel_format;
      depth_format : Tsapp_pixel_format;
      metal : Tsapp_metal_swapchain;
      d3d11 : Tsapp_d3d11_swapchain;
      wgpu : Tsapp_wgpu_swapchain;
      vulkan : Tsapp_vulkan_swapchain;
      gl : Tsapp_gl_swapchain;
    end;
{
    sapp_logger

    Used in sapp_desc to provide a logging function. Please be aware that
    without logging function, sokol-app will be completely silent, e.g. it will
    not report errors or warnings. For maximum error verbosity, compile in
    debug mode (e.g. NDEBUG *not* defined) and install a logger (for instance
    the standard logging function from sokol_log.h).
 }
(* Const before type ignored *)
{ always "sapp" }
{ 0=panic, 1=error, 2=warning, 3=info }
{ SAPP_LOGITEM_* }
(* Const before type ignored *)
{ a message string, may be nullptr in release mode }
{ line number in sokol_app.h }
(* Const before type ignored *)
{ source filename, may be nullptr in release mode }

  Psapp_logger = ^Tsapp_logger;
  Tsapp_logger = record
      func : procedure (tag:Pchar; log_level:Tuint32_t; log_item_id:Tuint32_t; message_or_null:Pchar; line_nr:Tuint32_t; 
                    filename_or_null:Pchar; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    sokol-app initialization options, used as return value of sokol_main()
    or sapp_run() argument.
 }
{ override GL/GLES major and minor version (defaults: GL4.1 (macOS) or GL4.3, GLES3.1 (Android) or GLES3.0 }

  Psapp_gl_desc = ^Tsapp_gl_desc;
  Tsapp_gl_desc = record
      major_version : longint;
      minor_version : longint;
    end;
{ if true, set the output console codepage to UTF-8 }
{ if true, attach stdout/stderr to a new console window }
{ if true, attach stdout/stderr to parent process }

  Psapp_win32_desc = ^Tsapp_win32_desc;
  Tsapp_win32_desc = record
      console_utf8 : Tbool;
      console_create : Tbool;
      console_attach : Tbool;
    end;
(* Const before type ignored *)
{ css selector of the HTML5 canvas element, default is "#canvas" }
{ if true, the HTML5 canvas size is set to sapp_desc.width/height, otherwise canvas size is tracked }
{ HTML5 only: whether to preserve default framebuffer content between frames }
{ HTML5 only: whether the rendered pixels use premultiplied alpha convention }
{ initial state of the internal html5_ask_leave_site flag (see sapp_html5_ask_leave_site()) }
{ if true, update the HTML document.title with sapp_desc.window_title }
{ if true, mouse events will bubble up to the web page }
{ same for touch events }
{ same for wheel events }
{ if true, bubble up *all* key events to browser, not just key events that represent characters }
{ if true, bubble up character events to browser }
{ if true, use emscripten_set_main_loop() instead of emscripten_request_animation_frame_loop() }
{ this will be passed as the simulate_infinite_loop arg to emscripten_set_main_loop() }

  Psapp_html5_desc = ^Tsapp_html5_desc;
  Tsapp_html5_desc = record
      canvas_selector : Pchar;
      canvas_resize : Tbool;
      preserve_drawing_buffer : Tbool;
      premultiplied_alpha : Tbool;
      ask_leave_site : Tbool;
      update_document_title : Tbool;
      bubble_mouse_events : Tbool;
      bubble_touch_events : Tbool;
      bubble_wheel_events : Tbool;
      bubble_key_events : Tbool;
      bubble_char_events : Tbool;
      use_emsc_set_main_loop : Tbool;
      emsc_set_main_loop_simulate_infinite_loop : Tbool;
    end;
{ if true, showing the iOS keyboard shrinks the canvas }

  Psapp_ios_desc = ^Tsapp_ios_desc;
  Tsapp_ios_desc = record
      keyboard_resizes_canvas : Tbool;
    end;
{ these are the user-provided callbacks without user data }
(* Const before type ignored *)
{ these are the user-provided callbacks with user data }
(* Const before type ignored *)
{ the preferred width of the window / canvas }
{ the preferred height of the window / canvas }
{ MSAA sample count }
{ the preferred swap interval (ignored on some platforms) }
{ whether the rendering canvas is full-resolution on HighDPI displays }
{ whether the window should be created in fullscreen mode }
{ whether the framebuffer should have an alpha channel (ignored on some platforms) }
(* Const before type ignored *)
{ the window title as UTF-8 encoded string }
{ enable clipboard access, default is false }
{ max size of clipboard content in bytes }
{ enable file dropping (drag'n'drop), default is false }
{ max number of dropped files to process (default: 1) }
{ max length in bytes of a dropped UTF-8 file path (default: 2048) }
{ the initial window icon to set }
{ optional memory allocation overrides (default: malloc/free) }
{ logging callback override (default: NO LOGGING!) }
{ backend-specific options }

  Psapp_desc = ^Tsapp_desc;
  Tsapp_desc = record
      init_cb : procedure ;cdecl;
      frame_cb : procedure ;cdecl;
      cleanup_cb : procedure ;cdecl;
      event_cb : procedure (para1:Psapp_event);cdecl;
      user_data : pointer;
      init_userdata_cb : procedure (para1:pointer);cdecl;
      frame_userdata_cb : procedure (para1:pointer);cdecl;
      cleanup_userdata_cb : procedure (para1:pointer);cdecl;
      event_userdata_cb : procedure (para1:Psapp_event; para2:pointer);cdecl;
      width : longint;
      height : longint;
      sample_count : longint;
      swap_interval : longint;
      high_dpi : Tbool;
      fullscreen : Tbool;
      alpha : Tbool;
      window_title : Pchar;
      enable_clipboard : Tbool;
      clipboard_size : longint;
      enable_dragndrop : Tbool;
      max_dropped_files : longint;
      max_dropped_file_path_length : longint;
      icon : Tsapp_icon_desc;
      allocator : Tsapp_allocator;
      logger : Tsapp_logger;
      gl : Tsapp_gl_desc;
      win32 : Tsapp_win32_desc;
      html5 : Tsapp_html5_desc;
      ios : Tsapp_ios_desc;
    end;
{ HTML5 specific: request and response structs for
   asynchronously loading dropped-file content.
 }

  Psapp_html5_fetch_error = ^Tsapp_html5_fetch_error;
  Tsapp_html5_fetch_error =  Longint;
  Const
    SAPP_HTML5_FETCH_ERROR_NO_ERROR = 0;
    SAPP_HTML5_FETCH_ERROR_BUFFER_TOO_SMALL = 1;
    SAPP_HTML5_FETCH_ERROR_OTHER = 2;
;
{ true if the loading operation has succeeded }
{ index of the dropped file (0..sapp_get_num_dropped_filed()-1) }
{ pointer and size of the fetched data (data.ptr == buffer.ptr, data.size <= buffer.size) }
{ the user-provided buffer ptr/size pair (buffer.ptr == data.ptr, buffer.size >= data.size) }
{ user-provided user data pointer }
type
  Psapp_html5_fetch_response = ^Tsapp_html5_fetch_response;
  Tsapp_html5_fetch_response = record
      succeeded : Tbool;
      error_code : Tsapp_html5_fetch_error;
      file_index : longint;
      data : Tsapp_range;
      buffer : Tsapp_range;
      user_data : pointer;
    end;
{ 0..sapp_get_num_dropped_files()-1 }
(* Const before type ignored *)
{ response callback function pointer (required) }
{ ptr/size of a memory buffer to load the data into }
{ optional userdata pointer }

  Psapp_html5_fetch_request = ^Tsapp_html5_fetch_request;
  Tsapp_html5_fetch_request = record
      dropped_file_index : longint;
      callback : procedure (para1:Psapp_html5_fetch_response);cdecl;
      buffer : Tsapp_range;
      user_data : pointer;
    end;
{
    sapp_mouse_cursor

    Predefined cursor image definitions, set with sapp_set_mouse_cursor(sapp_mouse_cursor cursor)
 }
{ equivalent with system default cursor }

  Psapp_mouse_cursor = ^Tsapp_mouse_cursor;
  Tsapp_mouse_cursor =  Longint;
  Const
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
;
{ user-provided functions  }

function sokol_main(argc:longint; argv:PPchar):Tsapp_desc;cdecl;external;
{ returns true after sokol-app has been initialized  }
function sapp_isvalid:Tbool;cdecl;external;
{ returns the current framebuffer width in pixels  }
function sapp_width:longint;cdecl;external;
{ same as sapp_width(), but returns float  }
function sapp_widthf:single;cdecl;external;
{ returns the current framebuffer height in pixels  }
function sapp_height:longint;cdecl;external;
{ same as sapp_height(), but returns float  }
function sapp_heightf:single;cdecl;external;
{ get default framebuffer color pixel format  }
function sapp_color_format:Tsapp_pixel_format;cdecl;external;
{ get default framebuffer depth pixel format  }
function sapp_depth_format:Tsapp_pixel_format;cdecl;external;
{ get default framebuffer sample count  }
function sapp_sample_count:longint;cdecl;external;
{ returns true when high_dpi was requested and actually running in a high-dpi scenario  }
function sapp_high_dpi:Tbool;cdecl;external;
{ returns the dpi scaling factor (window pixels to framebuffer pixels)  }
function sapp_dpi_scale:single;cdecl;external;
{ show or hide the mobile device onscreen keyboard  }
procedure sapp_show_keyboard(show:Tbool);cdecl;external;
{ return true if the mobile device onscreen keyboard is currently shown  }
function sapp_keyboard_shown:Tbool;cdecl;external;
{ query fullscreen mode  }
function sapp_is_fullscreen:Tbool;cdecl;external;
{ toggle fullscreen mode  }
procedure sapp_toggle_fullscreen;cdecl;external;
{ show or hide the mouse cursor  }
procedure sapp_show_mouse(show:Tbool);cdecl;external;
{ show or hide the mouse cursor  }
function sapp_mouse_shown:Tbool;cdecl;external;
{ enable/disable mouse-pointer-lock mode  }
procedure sapp_lock_mouse(lock:Tbool);cdecl;external;
{ return true if in mouse-pointer-lock mode (this may toggle a few frames later)  }
function sapp_mouse_locked:Tbool;cdecl;external;
{ set mouse cursor type  }
procedure sapp_set_mouse_cursor(cursor:Tsapp_mouse_cursor);cdecl;external;
{ get current mouse cursor type  }
function sapp_get_mouse_cursor:Tsapp_mouse_cursor;cdecl;external;
{ associate a custom mouse cursor image to a sapp_mouse_cursor enum entry  }
(* Const before type ignored *)
function sapp_bind_mouse_cursor_image(cursor:Tsapp_mouse_cursor; desc:Psapp_image_desc):Tsapp_mouse_cursor;cdecl;external;
{ restore the sapp_mouse_cursor enum entry to it's default system appearance  }
procedure sapp_unbind_mouse_cursor_image(cursor:Tsapp_mouse_cursor);cdecl;external;
{ return the userdata pointer optionally provided in sapp_desc  }
function sapp_userdata:pointer;cdecl;external;
{ return a copy of the sapp_desc structure  }
function sapp_query_desc:Tsapp_desc;cdecl;external;
{ initiate a "soft quit" (sends SAPP_EVENTTYPE_QUIT_REQUESTED)  }
procedure sapp_request_quit;cdecl;external;
{ cancel a pending quit (when SAPP_EVENTTYPE_QUIT_REQUESTED has been received)  }
procedure sapp_cancel_quit;cdecl;external;
{ initiate a "hard quit" (quit application without sending SAPP_EVENTTYPE_QUIT_REQUESTED)  }
procedure sapp_quit;cdecl;external;
{ call from inside event callback to consume the current event (don't forward to platform)  }
procedure sapp_consume_event;cdecl;external;
{ get the current frame counter (for comparison with sapp_event.frame_count)  }
function sapp_frame_count:Tuint64_t;cdecl;external;
{ get an averaged/smoothed frame duration in seconds  }
function sapp_frame_duration:Tdouble;cdecl;external;
{ write string into clipboard  }
(* Const before type ignored *)
procedure sapp_set_clipboard_string(str:Pchar);cdecl;external;
{ read string from clipboard (usually during SAPP_EVENTTYPE_CLIPBOARD_PASTED)  }
(* Const before type ignored *)
function sapp_get_clipboard_string:Pchar;cdecl;external;
{ set the window title (only on desktop platforms)  }
(* Const before type ignored *)
procedure sapp_set_window_title(str:Pchar);cdecl;external;
{ set the window icon (only on Windows and Linux)  }
(* Const before type ignored *)
procedure sapp_set_icon(icon_desc:Psapp_icon_desc);cdecl;external;
{ gets the total number of dropped files (after an SAPP_EVENTTYPE_FILES_DROPPED event)  }
function sapp_get_num_dropped_files:longint;cdecl;external;
{ gets the dropped file paths  }
(* Const before type ignored *)
function sapp_get_dropped_file_path(index:longint):Pchar;cdecl;external;
{ special run-function for SOKOL_NO_ENTRY (in standard mode this is an empty stub)  }
(* Const before type ignored *)
procedure sapp_run(desc:Psapp_desc);cdecl;external;
{ get runtime environment information  }
function sapp_get_environment:Tsapp_environment;cdecl;external;
{ get current frame's swapchain information (call once per frame!)  }
function sapp_get_swapchain:Tsapp_swapchain;cdecl;external;
{ EGL: get EGLDisplay object  }
(* Const before type ignored *)
function sapp_egl_get_display:pointer;cdecl;external;
{ EGL: get EGLContext object  }
(* Const before type ignored *)
function sapp_egl_get_context:pointer;cdecl;external;
{ HTML5: enable or disable the hardwired "Leave Site?" dialog box  }
procedure sapp_html5_ask_leave_site(ask:Tbool);cdecl;external;
{ HTML5: get byte size of a dropped file  }
function sapp_html5_get_dropped_file_size(index:longint):Tuint32_t;cdecl;external;
{ HTML5: asynchronously load the content of a dropped file  }
(* Const before type ignored *)
procedure sapp_html5_fetch_dropped_file(request:Psapp_html5_fetch_request);cdecl;external;
{ macOS: get bridged pointer to macOS NSWindow  }
(* Const before type ignored *)
function sapp_macos_get_window:pointer;cdecl;external;
{ iOS: get bridged pointer to iOS UIWindow  }
(* Const before type ignored *)
function sapp_ios_get_window:pointer;cdecl;external;
{ D3D11: get pointer to IDXGISwapChain object  }
(* Const before type ignored *)
function sapp_d3d11_get_swap_chain:pointer;cdecl;external;
{ Win32: get the HWND window handle  }
(* Const before type ignored *)
function sapp_win32_get_hwnd:pointer;cdecl;external;
{ GL: get major version  }
function sapp_gl_get_major_version:longint;cdecl;external;
{ GL: get minor version  }
function sapp_gl_get_minor_version:longint;cdecl;external;
{ GL: return true if the context is GLES  }
function sapp_gl_is_gles:Tbool;cdecl;external;
{ X11: get Window  }
(* Const before type ignored *)
function sapp_x11_get_window:pointer;cdecl;external;
{ X11: get Display  }
(* Const before type ignored *)
function sapp_x11_get_display:pointer;cdecl;external;
{ Android: get native activity handle  }
(* Const before type ignored *)
function sapp_android_get_native_activity:pointer;cdecl;external;

implementation


end.
