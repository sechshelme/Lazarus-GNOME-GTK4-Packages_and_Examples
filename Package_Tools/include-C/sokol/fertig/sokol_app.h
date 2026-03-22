enum xxx {
    SAPP_MAX_TOUCHPOINTS = 8,
    SAPP_MAX_MOUSEBUTTONS = 3,
    SAPP_MAX_KEYCODES = 512,
    SAPP_MAX_ICONIMAGES = 8,
};

/*
    sapp_event_type

    The type of event that's passed to the event handler callback
    in the sapp_event.type field. These are not just "traditional"
    input events, but also notify the application about state changes
    or other user-invoked actions.
*/
typedef enum sapp_event_type {
    SAPP_EVENTTYPE_INVALID,
    SAPP_EVENTTYPE_KEY_DOWN,
    SAPP_EVENTTYPE_KEY_UP,
    SAPP_EVENTTYPE_CHAR,
    SAPP_EVENTTYPE_MOUSE_DOWN,
    SAPP_EVENTTYPE_MOUSE_UP,
    SAPP_EVENTTYPE_MOUSE_SCROLL,
    SAPP_EVENTTYPE_MOUSE_MOVE,
    SAPP_EVENTTYPE_MOUSE_ENTER,
    SAPP_EVENTTYPE_MOUSE_LEAVE,
    SAPP_EVENTTYPE_TOUCHES_BEGAN,
    SAPP_EVENTTYPE_TOUCHES_MOVED,
    SAPP_EVENTTYPE_TOUCHES_ENDED,
    SAPP_EVENTTYPE_TOUCHES_CANCELLED,
    SAPP_EVENTTYPE_RESIZED,
    SAPP_EVENTTYPE_ICONIFIED,
    SAPP_EVENTTYPE_RESTORED,
    SAPP_EVENTTYPE_FOCUSED,
    SAPP_EVENTTYPE_UNFOCUSED,
    SAPP_EVENTTYPE_SUSPENDED,
    SAPP_EVENTTYPE_RESUMED,
    SAPP_EVENTTYPE_QUIT_REQUESTED,
    SAPP_EVENTTYPE_CLIPBOARD_PASTED,
    SAPP_EVENTTYPE_FILES_DROPPED,
    _SAPP_EVENTTYPE_NUM,
    _SAPP_EVENTTYPE_FORCE_U32 = 0x7FFFFFFF
} sapp_event_type;

/*
    sapp_keycode

    The 'virtual keycode' of a KEY_DOWN or KEY_UP event in the
    struct field sapp_event.key_code.

    Note that the keycode values are identical with GLFW.
*/
typedef enum sapp_keycode {
    SAPP_KEYCODE_INVALID          = 0,
    SAPP_KEYCODE_SPACE            = 32,
    SAPP_KEYCODE_APOSTROPHE       = 39,  /* ' */
    SAPP_KEYCODE_COMMA            = 44,  /* , */
    SAPP_KEYCODE_MINUS            = 45,  /* - */
    SAPP_KEYCODE_PERIOD           = 46,  /* . */
    SAPP_KEYCODE_SLASH            = 47,  /* / */
    SAPP_KEYCODE_0                = 48,
    SAPP_KEYCODE_1                = 49,
    SAPP_KEYCODE_2                = 50,
    SAPP_KEYCODE_3                = 51,
    SAPP_KEYCODE_4                = 52,
    SAPP_KEYCODE_5                = 53,
    SAPP_KEYCODE_6                = 54,
    SAPP_KEYCODE_7                = 55,
    SAPP_KEYCODE_8                = 56,
    SAPP_KEYCODE_9                = 57,
    SAPP_KEYCODE_SEMICOLON        = 59,  /* ; */
    SAPP_KEYCODE_EQUAL            = 61,  /* = */
    SAPP_KEYCODE_A                = 65,
    SAPP_KEYCODE_B                = 66,
    SAPP_KEYCODE_C                = 67,
    SAPP_KEYCODE_D                = 68,
    SAPP_KEYCODE_E                = 69,
    SAPP_KEYCODE_F                = 70,
    SAPP_KEYCODE_G                = 71,
    SAPP_KEYCODE_H                = 72,
    SAPP_KEYCODE_I                = 73,
    SAPP_KEYCODE_J                = 74,
    SAPP_KEYCODE_K                = 75,
    SAPP_KEYCODE_L                = 76,
    SAPP_KEYCODE_M                = 77,
    SAPP_KEYCODE_N                = 78,
    SAPP_KEYCODE_O                = 79,
    SAPP_KEYCODE_P                = 80,
    SAPP_KEYCODE_Q                = 81,
    SAPP_KEYCODE_R                = 82,
    SAPP_KEYCODE_S                = 83,
    SAPP_KEYCODE_T                = 84,
    SAPP_KEYCODE_U                = 85,
    SAPP_KEYCODE_V                = 86,
    SAPP_KEYCODE_W                = 87,
    SAPP_KEYCODE_X                = 88,
    SAPP_KEYCODE_Y                = 89,
    SAPP_KEYCODE_Z                = 90,
    SAPP_KEYCODE_LEFT_BRACKET     = 91,  /* [ */
    SAPP_KEYCODE_BACKSLASH        = 92,  /* \ */
    SAPP_KEYCODE_RIGHT_BRACKET    = 93,  /* ] */
    SAPP_KEYCODE_GRAVE_ACCENT     = 96,  /* ` */
    SAPP_KEYCODE_WORLD_1          = 161, /* non-US #1 */
    SAPP_KEYCODE_WORLD_2          = 162, /* non-US #2 */
    SAPP_KEYCODE_ESCAPE           = 256,
    SAPP_KEYCODE_ENTER            = 257,
    SAPP_KEYCODE_TAB              = 258,
    SAPP_KEYCODE_BACKSPACE        = 259,
    SAPP_KEYCODE_INSERT           = 260,
    SAPP_KEYCODE_DELETE           = 261,
    SAPP_KEYCODE_RIGHT            = 262,
    SAPP_KEYCODE_LEFT             = 263,
    SAPP_KEYCODE_DOWN             = 264,
    SAPP_KEYCODE_UP               = 265,
    SAPP_KEYCODE_PAGE_UP          = 266,
    SAPP_KEYCODE_PAGE_DOWN        = 267,
    SAPP_KEYCODE_HOME             = 268,
    SAPP_KEYCODE_END              = 269,
    SAPP_KEYCODE_CAPS_LOCK        = 280,
    SAPP_KEYCODE_SCROLL_LOCK      = 281,
    SAPP_KEYCODE_NUM_LOCK         = 282,
    SAPP_KEYCODE_PRINT_SCREEN     = 283,
    SAPP_KEYCODE_PAUSE            = 284,
    SAPP_KEYCODE_F1               = 290,
    SAPP_KEYCODE_F2               = 291,
    SAPP_KEYCODE_F3               = 292,
    SAPP_KEYCODE_F4               = 293,
    SAPP_KEYCODE_F5               = 294,
    SAPP_KEYCODE_F6               = 295,
    SAPP_KEYCODE_F7               = 296,
    SAPP_KEYCODE_F8               = 297,
    SAPP_KEYCODE_F9               = 298,
    SAPP_KEYCODE_F10              = 299,
    SAPP_KEYCODE_F11              = 300,
    SAPP_KEYCODE_F12              = 301,
    SAPP_KEYCODE_F13              = 302,
    SAPP_KEYCODE_F14              = 303,
    SAPP_KEYCODE_F15              = 304,
    SAPP_KEYCODE_F16              = 305,
    SAPP_KEYCODE_F17              = 306,
    SAPP_KEYCODE_F18              = 307,
    SAPP_KEYCODE_F19              = 308,
    SAPP_KEYCODE_F20              = 309,
    SAPP_KEYCODE_F21              = 310,
    SAPP_KEYCODE_F22              = 311,
    SAPP_KEYCODE_F23              = 312,
    SAPP_KEYCODE_F24              = 313,
    SAPP_KEYCODE_F25              = 314,
    SAPP_KEYCODE_KP_0             = 320,
    SAPP_KEYCODE_KP_1             = 321,
    SAPP_KEYCODE_KP_2             = 322,
    SAPP_KEYCODE_KP_3             = 323,
    SAPP_KEYCODE_KP_4             = 324,
    SAPP_KEYCODE_KP_5             = 325,
    SAPP_KEYCODE_KP_6             = 326,
    SAPP_KEYCODE_KP_7             = 327,
    SAPP_KEYCODE_KP_8             = 328,
    SAPP_KEYCODE_KP_9             = 329,
    SAPP_KEYCODE_KP_DECIMAL       = 330,
    SAPP_KEYCODE_KP_DIVIDE        = 331,
    SAPP_KEYCODE_KP_MULTIPLY      = 332,
    SAPP_KEYCODE_KP_SUBTRACT      = 333,
    SAPP_KEYCODE_KP_ADD           = 334,
    SAPP_KEYCODE_KP_ENTER         = 335,
    SAPP_KEYCODE_KP_EQUAL         = 336,
    SAPP_KEYCODE_LEFT_SHIFT       = 340,
    SAPP_KEYCODE_LEFT_CONTROL     = 341,
    SAPP_KEYCODE_LEFT_ALT         = 342,
    SAPP_KEYCODE_LEFT_SUPER       = 343,
    SAPP_KEYCODE_RIGHT_SHIFT      = 344,
    SAPP_KEYCODE_RIGHT_CONTROL    = 345,
    SAPP_KEYCODE_RIGHT_ALT        = 346,
    SAPP_KEYCODE_RIGHT_SUPER      = 347,
    SAPP_KEYCODE_MENU             = 348,
} sapp_keycode;

/*
    Android specific 'tool type' enum for touch events. This lets the
    application check what type of input device was used for
    touch events.

    NOTE: the values must remain in sync with the corresponding
    Android SDK type, so don't change those.

    See https://developer.android.com/reference/android/view/MotionEvent#TOOL_TYPE_UNKNOWN
*/
typedef enum sapp_android_tooltype {
    SAPP_ANDROIDTOOLTYPE_UNKNOWN = 0,   // TOOL_TYPE_UNKNOWN
    SAPP_ANDROIDTOOLTYPE_FINGER = 1,    // TOOL_TYPE_FINGER
    SAPP_ANDROIDTOOLTYPE_STYLUS = 2,    // TOOL_TYPE_STYLUS
    SAPP_ANDROIDTOOLTYPE_MOUSE = 3,     // TOOL_TYPE_MOUSE
} sapp_android_tooltype;

/*
    sapp_touchpoint

    Describes a single touchpoint in a multitouch event (TOUCHES_BEGAN,
    TOUCHES_MOVED, TOUCHES_ENDED).

    Touch points are stored in the nested array sapp_event.touches[],
    and the number of touches is stored in sapp_event.num_touches.
*/
typedef struct sapp_touchpoint {
    uintptr_t identifier;
    float pos_x;
    float pos_y;
    sapp_android_tooltype android_tooltype; // only valid on Android
    bool changed;
} sapp_touchpoint;

/*
    sapp_mousebutton

    The currently pressed mouse button in the events MOUSE_DOWN
    and MOUSE_UP, stored in the struct field sapp_event.mouse_button.
*/
typedef enum sapp_mousebutton {
    SAPP_MOUSEBUTTON_LEFT = 0x0,
    SAPP_MOUSEBUTTON_RIGHT = 0x1,
    SAPP_MOUSEBUTTON_MIDDLE = 0x2,
    SAPP_MOUSEBUTTON_INVALID = 0x100,
} sapp_mousebutton;

/*
    These are currently pressed modifier keys (and mouse buttons) which are
    passed in the event struct field sapp_event.modifiers.
*/
enum xxx{
    SAPP_MODIFIER_SHIFT = 0x1,      // left or right shift key
    SAPP_MODIFIER_CTRL  = 0x2,      // left or right control key
    SAPP_MODIFIER_ALT   = 0x4,      // left or right alt key
    SAPP_MODIFIER_SUPER = 0x8,      // left or right 'super' key
    SAPP_MODIFIER_LMB   = 0x100,    // left mouse button
    SAPP_MODIFIER_RMB   = 0x200,    // right mouse button
    SAPP_MODIFIER_MMB   = 0x400,    // middle mouse button
};

/*
    sapp_event

    This is an all-in-one event struct passed to the event handler
    user callback function. Note that it depends on the event
    type what struct fields actually contain useful values, so you
    should first check the event type before reading other struct
    fields.
*/
typedef struct sapp_event {
    uint64_t frame_count;               // current frame counter, always valid, useful for checking if two events were issued in the same frame
    sapp_event_type type;               // the event type, always valid
    sapp_keycode key_code;              // the virtual key code, only valid in KEY_UP, KEY_DOWN
    uint32_t char_code;                 // the UTF-32 character code, only valid in CHAR events
    bool key_repeat;                    // true if this is a key-repeat event, valid in KEY_UP, KEY_DOWN and CHAR
    uint32_t modifiers;                 // current modifier keys, valid in all key-, char- and mouse-events
    sapp_mousebutton mouse_button;      // mouse button that was pressed or released, valid in MOUSE_DOWN, MOUSE_UP
    float mouse_x;                      // current horizontal mouse position in pixels, always valid except during mouse lock
    float mouse_y;                      // current vertical mouse position in pixels, always valid except during mouse lock
    float mouse_dx;                     // relative horizontal mouse movement since last frame, always valid
    float mouse_dy;                     // relative vertical mouse movement since last frame, always valid
    float scroll_x;                     // horizontal mouse wheel scroll distance, valid in MOUSE_SCROLL events
    float scroll_y;                     // vertical mouse wheel scroll distance, valid in MOUSE_SCROLL events
    int num_touches;                    // number of valid items in the touches[] array
    sapp_touchpoint touches[SAPP_MAX_TOUCHPOINTS];  // current touch points, valid in TOUCHES_BEGIN, TOUCHES_MOVED, TOUCHES_ENDED
    int window_width;                   // current window- and framebuffer sizes in pixels, always valid
    int window_height;
    int framebuffer_width;              // = window_width * dpi_scale
    int framebuffer_height;             // = window_height * dpi_scale
} sapp_event;

/*
    sg_range

    A general pointer/size-pair struct and constructor macros for passing binary blobs
    into sokol_app.h.
*/
typedef struct sapp_range {
    const void* ptr;
    size_t size;
} sapp_range;

/*
    sapp_image_desc

    This is used to describe image data to sokol_app.h (window icons and cursor images).

    The pixel format is RGBA8.

    cursor_hotspot_x and _y are used only for cursors, to define which pixel
    of the image should be aligned with the mouse position.
*/
typedef struct sapp_image_desc {
    int width;
    int height;
    int cursor_hotspot_x;
    int cursor_hotspot_y;
    sapp_range pixels;
} sapp_image_desc;

/*
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
*/
typedef struct sapp_icon_desc {
    bool sokol_default;
    sapp_image_desc images[SAPP_MAX_ICONIMAGES];
} sapp_icon_desc;

/*
    sapp_allocator

    Used in sapp_desc to provide custom memory-alloc and -free functions
    to sokol_app.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct sapp_allocator {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sapp_allocator;

/*
    sapp_log_item

    Log items are defined via X-Macros and expanded to an enum
    'sapp_log_item', and in debug mode to corresponding
    human readable error messages.
*/

/*
    sapp_pixel_format

    Defines the pixel format for swapchain surfaces.

    NOTE: when using sokol_gfx.h do not assume that the underlying
    values are compatible with sg_pixel_format!

*/
typedef enum sapp_pixel_format {
    _SAPP_PIXELFORMAT_DEFAULT,
    SAPP_PIXELFORMAT_NONE,
    SAPP_PIXELFORMAT_RGBA8,
    SAPP_PIXELFORMAT_SRGB8A8,
    SAPP_PIXELFORMAT_BGRA8,
    SAPP_PIXELFORMAT_SBGRA8,
    SAPP_PIXELFORMAT_DEPTH,
    SAPP_PIXELFORMAT_DEPTH_STENCIL,
    _SA_PPPIXELFORMAT_FORCE_U32 = 0x7FFFFFFF
} sapp_pixel_format;

/*
    sapp_environment

    Used to provide runtime environment information to the
    outside world (like default pixel formats and the backend
    3D API device pointer) via a call to sapp_get_environment().

    NOTE: when using sokol_gfx.h, don't assume that sapp_environment
    is binary compatible with sg_environment! Always use a translation
    function like sglue_environment() to populate sg_environment
    from sapp_environment!
*/
typedef struct sapp_environment_defaults {
    sapp_pixel_format color_format;
    sapp_pixel_format depth_format;
    int sample_count;
} sapp_environment_defaults;

typedef struct sapp_metal_environment {
    const void* device;
} sapp_metal_environment;

typedef struct sapp_d3d11_environment {
    const void* device;
    const void* device_context;
} sapp_d3d11_environment;

typedef struct sapp_wgpu_environment {
    const void* device;
} sapp_wgpu_environment;

typedef struct sapp_vulkan_environment {
    const void* instance;
    const void* physical_device;
    const void* device;
    const void* queue;
    uint32_t queue_family_index;
} sapp_vulkan_environment;

typedef struct sapp_environment {
    sapp_environment_defaults defaults;
    sapp_metal_environment metal;
    sapp_d3d11_environment d3d11;
    sapp_wgpu_environment wgpu;
    sapp_vulkan_environment vulkan;
} sapp_environment;

/*
    sapp_swapchain

    Provides swapchain information for the current frame to the outside
    world via a call to sapp_get_swapchain().

    NOTE: sapp_get_swapchain() must be called exactly once per frame since
    on some backends it will also acquire the next swapchain image.

    NOTE: when using sokol_gfx.h, don't assume that the sapp_swapchain struct
    has the same memory layout as sg_swapchain! Use the sokol_log.h helper
    function sglue_swapchain() to translate sapp_swapchain into a
    sg_swapchain instead.
*/
typedef struct sapp_metal_swapchain {
    const void* current_drawable;       // CAMetalDrawable (NOT MTLDrawable!!!)
    const void* depth_stencil_texture;  // MTLTexture
    const void* msaa_color_texture;     // MTLTexture
} sapp_metal_swapchain;

typedef struct sapp_d3d11_swapchain {
    const void* render_view;            // ID3D11RenderTargetView
    const void* resolve_view;           // ID3D11RenderTargetView
    const void* depth_stencil_view;     // ID3D11DepthStencilView
} sapp_d3d11_swapchain;

typedef struct sapp_wgpu_swapchain {
    const void* render_view;            // WGPUTextureView
    const void* resolve_view;           // WGPUTextureView
    const void* depth_stencil_view;     // WGPUTextureView
} sapp_wgpu_swapchain;

typedef struct sapp_vulkan_swapchain {
    const void* render_image;           // vkImage
    const void* render_view;            // vkImageView
    const void* resolve_image;          // vkImage;
    const void* resolve_view;           // vkImageView
    const void* depth_stencil_image;    // vkImage
    const void* depth_stencil_view;     // vkImageView
    const void* render_finished_semaphore;  // vkSemaphore
    const void* present_complete_semaphore; // vkSemaphore
} sapp_vulkan_swapchain;

typedef struct sapp_gl_swapchain {
    uint32_t framebuffer;               // GL framebuffer object
} sapp_gl_swapchain;

typedef struct sapp_swapchain {
    int width;
    int height;
    int sample_count;
    sapp_pixel_format color_format;
    sapp_pixel_format depth_format;
    sapp_metal_swapchain metal;
    sapp_d3d11_swapchain d3d11;
    sapp_wgpu_swapchain wgpu;
    sapp_vulkan_swapchain vulkan;
    sapp_gl_swapchain gl;
} sapp_swapchain;

/*
    sapp_logger

    Used in sapp_desc to provide a logging function. Please be aware that
    without logging function, sokol-app will be completely silent, e.g. it will
    not report errors or warnings. For maximum error verbosity, compile in
    debug mode (e.g. NDEBUG *not* defined) and install a logger (for instance
    the standard logging function from sokol_log.h).
*/
typedef struct sapp_logger {
    void (*func)(
        const char* tag,                // always "sapp"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SAPP_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_app.h
        const char* filename_or_null,   // source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} sapp_logger;

/*
    sokol-app initialization options, used as return value of sokol_main()
    or sapp_run() argument.
*/
typedef struct sapp_gl_desc {
    int major_version;            // override GL/GLES major and minor version (defaults: GL4.1 (macOS) or GL4.3, GLES3.1 (Android) or GLES3.0
    int minor_version;
} sapp_gl_desc;

typedef struct sapp_win32_desc {
    bool console_utf8;            // if true, set the output console codepage to UTF-8
    bool console_create;          // if true, attach stdout/stderr to a new console window
    bool console_attach;          // if true, attach stdout/stderr to parent process
} sapp_win32_desc;

typedef struct sapp_html5_desc {
    const char* canvas_selector;  // css selector of the HTML5 canvas element, default is "#canvas"
    bool canvas_resize;           // if true, the HTML5 canvas size is set to sapp_desc.width/height, otherwise canvas size is tracked
    bool preserve_drawing_buffer; // HTML5 only: whether to preserve default framebuffer content between frames
    bool premultiplied_alpha;     // HTML5 only: whether the rendered pixels use premultiplied alpha convention
    bool ask_leave_site;          // initial state of the internal html5_ask_leave_site flag (see sapp_html5_ask_leave_site())
    bool update_document_title;   // if true, update the HTML document.title with sapp_desc.window_title
    bool bubble_mouse_events;     // if true, mouse events will bubble up to the web page
    bool bubble_touch_events;     // same for touch events
    bool bubble_wheel_events;     // same for wheel events
    bool bubble_key_events;       // if true, bubble up *all* key events to browser, not just key events that represent characters
    bool bubble_char_events;      // if true, bubble up character events to browser
    bool use_emsc_set_main_loop;  // if true, use emscripten_set_main_loop() instead of emscripten_request_animation_frame_loop()
    bool emsc_set_main_loop_simulate_infinite_loop;   // this will be passed as the simulate_infinite_loop arg to emscripten_set_main_loop()
} sapp_html5_desc;

typedef struct sapp_ios_desc {
    bool keyboard_resizes_canvas; // if true, showing the iOS keyboard shrinks the canvas
} sapp_ios_desc;

typedef struct sapp_desc {
    void (*init_cb)(void);                  // these are the user-provided callbacks without user data
    void (*frame_cb)(void);
    void (*cleanup_cb)(void);
    void (*event_cb)(const sapp_event*);

    void* user_data;                        // these are the user-provided callbacks with user data
    void (*init_userdata_cb)(void*);
    void (*frame_userdata_cb)(void*);
    void (*cleanup_userdata_cb)(void*);
    void (*event_userdata_cb)(const sapp_event*, void*);

    int width;                          // the preferred width of the window / canvas
    int height;                         // the preferred height of the window / canvas
    int sample_count;                   // MSAA sample count
    int swap_interval;                  // the preferred swap interval (ignored on some platforms)
    bool high_dpi;                      // whether the rendering canvas is full-resolution on HighDPI displays
    bool fullscreen;                    // whether the window should be created in fullscreen mode
    bool alpha;                         // whether the framebuffer should have an alpha channel (ignored on some platforms)
    const char* window_title;           // the window title as UTF-8 encoded string
    bool enable_clipboard;              // enable clipboard access, default is false
    int clipboard_size;                 // max size of clipboard content in bytes
    bool enable_dragndrop;              // enable file dropping (drag'n'drop), default is false
    int max_dropped_files;              // max number of dropped files to process (default: 1)
    int max_dropped_file_path_length;   // max length in bytes of a dropped UTF-8 file path (default: 2048)
    sapp_icon_desc icon;                // the initial window icon to set
    sapp_allocator allocator;           // optional memory allocation overrides (default: malloc/free)
    sapp_logger logger;                 // logging callback override (default: NO LOGGING!)

    // backend-specific options
    sapp_gl_desc gl;
    sapp_win32_desc win32;
    sapp_html5_desc html5;
    sapp_ios_desc ios;
} sapp_desc;

/* HTML5 specific: request and response structs for
   asynchronously loading dropped-file content.
*/
typedef enum sapp_html5_fetch_error {
    SAPP_HTML5_FETCH_ERROR_NO_ERROR,
    SAPP_HTML5_FETCH_ERROR_BUFFER_TOO_SMALL,
    SAPP_HTML5_FETCH_ERROR_OTHER,
} sapp_html5_fetch_error;

typedef struct sapp_html5_fetch_response {
    bool succeeded;         // true if the loading operation has succeeded
    sapp_html5_fetch_error error_code;
    int file_index;         // index of the dropped file (0..sapp_get_num_dropped_filed()-1)
    sapp_range data;        // pointer and size of the fetched data (data.ptr == buffer.ptr, data.size <= buffer.size)
    sapp_range buffer;      // the user-provided buffer ptr/size pair (buffer.ptr == data.ptr, buffer.size >= data.size)
    void* user_data;        // user-provided user data pointer
} sapp_html5_fetch_response;

typedef struct sapp_html5_fetch_request {
    int dropped_file_index; // 0..sapp_get_num_dropped_files()-1
    void (*callback)(const sapp_html5_fetch_response*);     // response callback function pointer (required)
    sapp_range buffer;      // ptr/size of a memory buffer to load the data into
    void* user_data;        // optional userdata pointer
} sapp_html5_fetch_request;

/*
    sapp_mouse_cursor

    Predefined cursor image definitions, set with sapp_set_mouse_cursor(sapp_mouse_cursor cursor)
*/
typedef enum sapp_mouse_cursor {
    SAPP_MOUSECURSOR_DEFAULT = 0,   // equivalent with system default cursor
    SAPP_MOUSECURSOR_ARROW,
    SAPP_MOUSECURSOR_IBEAM,
    SAPP_MOUSECURSOR_CROSSHAIR,
    SAPP_MOUSECURSOR_POINTING_HAND,
    SAPP_MOUSECURSOR_RESIZE_EW,
    SAPP_MOUSECURSOR_RESIZE_NS,
    SAPP_MOUSECURSOR_RESIZE_NWSE,
    SAPP_MOUSECURSOR_RESIZE_NESW,
    SAPP_MOUSECURSOR_RESIZE_ALL,
    SAPP_MOUSECURSOR_NOT_ALLOWED,
    SAPP_MOUSECURSOR_CUSTOM_0,
    SAPP_MOUSECURSOR_CUSTOM_1,
    SAPP_MOUSECURSOR_CUSTOM_2,
    SAPP_MOUSECURSOR_CUSTOM_3,
    SAPP_MOUSECURSOR_CUSTOM_4,
    SAPP_MOUSECURSOR_CUSTOM_5,
    SAPP_MOUSECURSOR_CUSTOM_6,
    SAPP_MOUSECURSOR_CUSTOM_7,
    SAPP_MOUSECURSOR_CUSTOM_8,
    SAPP_MOUSECURSOR_CUSTOM_9,
    SAPP_MOUSECURSOR_CUSTOM_10,
    SAPP_MOUSECURSOR_CUSTOM_11,
    SAPP_MOUSECURSOR_CUSTOM_12,
    SAPP_MOUSECURSOR_CUSTOM_13,
    SAPP_MOUSECURSOR_CUSTOM_14,
    SAPP_MOUSECURSOR_CUSTOM_15,
    _SAPP_MOUSECURSOR_NUM,
} sapp_mouse_cursor;

/* user-provided functions */
extern sapp_desc sokol_main(int argc, char* argv[]);

/* returns true after sokol-app has been initialized */
extern bool sapp_isvalid(void);
/* returns the current framebuffer width in pixels */
extern int sapp_width(void);
/* same as sapp_width(), but returns float */
extern float sapp_widthf(void);
/* returns the current framebuffer height in pixels */
extern int sapp_height(void);
/* same as sapp_height(), but returns float */
extern float sapp_heightf(void);
/* get default framebuffer color pixel format */
extern sapp_pixel_format sapp_color_format(void);
/* get default framebuffer depth pixel format */
extern sapp_pixel_format sapp_depth_format(void);
/* get default framebuffer sample count */
extern int sapp_sample_count(void);
/* returns true when high_dpi was requested and actually running in a high-dpi scenario */
extern bool sapp_high_dpi(void);
/* returns the dpi scaling factor (window pixels to framebuffer pixels) */
extern float sapp_dpi_scale(void);
/* show or hide the mobile device onscreen keyboard */
extern void sapp_show_keyboard(bool show);
/* return true if the mobile device onscreen keyboard is currently shown */
extern bool sapp_keyboard_shown(void);
/* query fullscreen mode */
extern bool sapp_is_fullscreen(void);
/* toggle fullscreen mode */
extern void sapp_toggle_fullscreen(void);
/* show or hide the mouse cursor */
extern void sapp_show_mouse(bool show);
/* show or hide the mouse cursor */
extern bool sapp_mouse_shown(void);
/* enable/disable mouse-pointer-lock mode */
extern void sapp_lock_mouse(bool lock);
/* return true if in mouse-pointer-lock mode (this may toggle a few frames later) */
extern bool sapp_mouse_locked(void);
/* set mouse cursor type */
extern void sapp_set_mouse_cursor(sapp_mouse_cursor cursor);
/* get current mouse cursor type */
extern sapp_mouse_cursor sapp_get_mouse_cursor(void);
/* associate a custom mouse cursor image to a sapp_mouse_cursor enum entry */
extern sapp_mouse_cursor sapp_bind_mouse_cursor_image(sapp_mouse_cursor cursor, const sapp_image_desc* desc);
/* restore the sapp_mouse_cursor enum entry to it's default system appearance */
extern void sapp_unbind_mouse_cursor_image(sapp_mouse_cursor cursor);
/* return the userdata pointer optionally provided in sapp_desc */
extern void* sapp_userdata(void);
/* return a copy of the sapp_desc structure */
extern sapp_desc sapp_query_desc(void);
/* initiate a "soft quit" (sends SAPP_EVENTTYPE_QUIT_REQUESTED) */
extern void sapp_request_quit(void);
/* cancel a pending quit (when SAPP_EVENTTYPE_QUIT_REQUESTED has been received) */
extern void sapp_cancel_quit(void);
/* initiate a "hard quit" (quit application without sending SAPP_EVENTTYPE_QUIT_REQUESTED) */
extern void sapp_quit(void);
/* call from inside event callback to consume the current event (don't forward to platform) */
extern void sapp_consume_event(void);
/* get the current frame counter (for comparison with sapp_event.frame_count) */
extern uint64_t sapp_frame_count(void);
/* get an averaged/smoothed frame duration in seconds */
extern double sapp_frame_duration(void);
/* write string into clipboard */
extern void sapp_set_clipboard_string(const char* str);
/* read string from clipboard (usually during SAPP_EVENTTYPE_CLIPBOARD_PASTED) */
extern const char* sapp_get_clipboard_string(void);
/* set the window title (only on desktop platforms) */
extern void sapp_set_window_title(const char* str);
/* set the window icon (only on Windows and Linux) */
extern void sapp_set_icon(const sapp_icon_desc* icon_desc);
/* gets the total number of dropped files (after an SAPP_EVENTTYPE_FILES_DROPPED event) */
extern int sapp_get_num_dropped_files(void);
/* gets the dropped file paths */
extern const char* sapp_get_dropped_file_path(int index);

/* special run-function for SOKOL_NO_ENTRY (in standard mode this is an empty stub) */
extern void sapp_run(const sapp_desc* desc);

/* get runtime environment information */
sapp_environment sapp_get_environment(void);
/* get current frame's swapchain information (call once per frame!) */
sapp_swapchain sapp_get_swapchain(void);

/* EGL: get EGLDisplay object */
extern const void* sapp_egl_get_display(void);
/* EGL: get EGLContext object */
extern const void* sapp_egl_get_context(void);

/* HTML5: enable or disable the hardwired "Leave Site?" dialog box */
extern void sapp_html5_ask_leave_site(bool ask);
/* HTML5: get byte size of a dropped file */
extern uint32_t sapp_html5_get_dropped_file_size(int index);
/* HTML5: asynchronously load the content of a dropped file */
extern void sapp_html5_fetch_dropped_file(const sapp_html5_fetch_request* request);

/* macOS: get bridged pointer to macOS NSWindow */
extern const void* sapp_macos_get_window(void);
/* iOS: get bridged pointer to iOS UIWindow */
extern const void* sapp_ios_get_window(void);

/* D3D11: get pointer to IDXGISwapChain object */
extern const void* sapp_d3d11_get_swap_chain(void);

/* Win32: get the HWND window handle */
extern const void* sapp_win32_get_hwnd(void);

/* GL: get major version */
extern int sapp_gl_get_major_version(void);
/* GL: get minor version */
extern int sapp_gl_get_minor_version(void);
/* GL: return true if the context is GLES */
extern bool sapp_gl_is_gles(void);

/* X11: get Window */
extern const void* sapp_x11_get_window(void);
/* X11: get Display */
extern const void* sapp_x11_get_display(void);

/* Android: get native activity handle */
extern const void* sapp_android_get_native_activity(void);


