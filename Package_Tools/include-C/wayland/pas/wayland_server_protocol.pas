unit wayland_server_protocol;

interface

uses
  fp_wayland, wayland_server_core;

type
  { Opake Typen für Vorwärtsdeklarationen } //[cite: 1]
  Pwl_client = Pointer;
  Pwl_resource = Pointer;
  Pwl_buffer = Pointer;
  Pwl_callback = Pointer;
  Pwl_compositor = Pointer;
  Pwl_data_device = Pointer;
  Pwl_data_device_manager = Pointer;
  Pwl_data_offer = Pointer;
  Pwl_data_source = Pointer;
  Pwl_display = Pointer;
  Pwl_keyboard = Pointer;
  Pwl_output = Pointer;
  Pwl_pointer = Pointer;
  Pwl_region = Pointer;
  Pwl_registry = Pointer;
  Pwl_seat = Pointer;
  Pwl_shell = Pointer;
  Pwl_shell_surface = Pointer;
  Pwl_shm = Pointer;
  Pwl_shm_pool = Pointer;
  Pwl_subcompositor = Pointer;
  Pwl_subsurface = Pointer;
  Pwl_surface = Pointer;
  Pwl_touch = Pointer;
  Pwl_array = Pointer;
  
  wl_fixed_t = Tint32_t;

  { Wayland Interface Deklarationen } //[cite: 1]
  Twl_interface = record end;
  Pwl_interface = ^Twl_interface;

var
  wl_display_interface: Twl_interface; cvar; external libwayland_client;
  wl_registry_interface: Twl_interface; cvar; external libwayland_client;
  wl_callback_interface: Twl_interface; cvar; external libwayland_client;
  wl_compositor_interface: Twl_interface; cvar; external libwayland_client;
  wl_shm_pool_interface: Twl_interface; cvar; external libwayland_client;
  wl_shm_interface: Twl_interface; cvar; external libwayland_client;
  wl_buffer_interface: Twl_interface; cvar; external libwayland_client;
  wl_data_offer_interface: Twl_interface; cvar; external libwayland_client;
  wl_data_source_interface: Twl_interface; cvar; external libwayland_client;
  wl_data_device_interface: Twl_interface; cvar; external libwayland_client;
  wl_data_device_manager_interface: Twl_interface; cvar; external libwayland_client;
  wl_shell_interface: Twl_interface; cvar; external libwayland_client;
  wl_shell_surface_interface: Twl_interface; cvar; external libwayland_client;
  wl_surface_interface: Twl_interface; cvar; external libwayland_client;
  wl_seat_interface: Twl_interface; cvar; external libwayland_client;
  wl_pointer_interface: Twl_interface; cvar; external libwayland_client;
  wl_keyboard_interface: Twl_interface; cvar; external libwayland_client;
  wl_touch_interface: Twl_interface; cvar; external libwayland_client;
  wl_output_interface: Twl_interface; cvar; external libwayland_client;
  wl_region_interface: Twl_interface; cvar; external libwayland_client;
  wl_subcompositor_interface: Twl_interface; cvar; external libwayland_client;
  wl_subsurface_interface: Twl_interface; cvar; external libwayland_client;

const
  { wl_display } //[cite: 1]
  WL_DISPLAY_ERROR_INVALID_OBJECT = 0;
  WL_DISPLAY_ERROR_INVALID_METHOD = 1;
  WL_DISPLAY_ERROR_NO_MEMORY = 2;
  WL_DISPLAY_ERROR_IMPLEMENTATION = 3;

  WL_DISPLAY_ERROR = 0;
  WL_DISPLAY_DELETE_ID = 1;

  WL_DISPLAY_ERROR_SINCE_VERSION = 1;
  WL_DISPLAY_DELETE_ID_SINCE_VERSION = 1;
  WL_DISPLAY_SYNC_SINCE_VERSION = 1;
  WL_DISPLAY_GET_REGISTRY_SINCE_VERSION = 1;

type
  Twl_display_interface = record
    sync: procedure(client: Pwl_client; resource: Pwl_resource; callback: Tuint32_t); cdecl;
    get_registry: procedure(client: Pwl_client; resource: Pwl_resource; registry: Tuint32_t); cdecl;
  end;

const
  { wl_registry } //[cite: 1]
  WL_REGISTRY_GLOBAL = 0;
  WL_REGISTRY_GLOBAL_REMOVE = 1;

  WL_REGISTRY_GLOBAL_SINCE_VERSION = 1;
  WL_REGISTRY_GLOBAL_REMOVE_SINCE_VERSION = 1;
  WL_REGISTRY_BIND_SINCE_VERSION = 1;

type
  Twl_registry_interface = record
    bind: procedure(client: Pwl_client; resource: Pwl_resource; name: Tuint32_t; interface_: PChar; version: Tuint32_t; id: Tuint32_t); cdecl;
  end;

const
  { wl_callback } //[cite: 1]
  WL_CALLBACK_DONE = 0;
  WL_CALLBACK_DONE_SINCE_VERSION = 1;

type
  { wl_compositor } //[cite: 1]
  Twl_compositor_interface = record
    create_surface: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    create_region: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
  end;

const
  WL_COMPOSITOR_CREATE_SURFACE_SINCE_VERSION = 1;
  WL_COMPOSITOR_CREATE_REGION_SINCE_VERSION = 1;

type
  { wl_shm_pool } //[cite: 1]
  Twl_shm_pool_interface = record
    create_buffer: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; offset: Tint32_t; width: Tint32_t; height: Tint32_t; stride: Tint32_t; format: Tuint32_t); cdecl;
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    resize: procedure(client: Pwl_client; resource: Pwl_resource; size: Tint32_t); cdecl;
  end;

const
  WL_SHM_POOL_CREATE_BUFFER_SINCE_VERSION = 1;
  WL_SHM_POOL_DESTROY_SINCE_VERSION = 1;
  WL_SHM_POOL_RESIZE_SINCE_VERSION = 1;

  { wl_shm_error } //[cite: 1]
  WL_SHM_ERROR_INVALID_FORMAT = 0;
  WL_SHM_ERROR_INVALID_STRIDE = 1;
  WL_SHM_ERROR_INVALID_FD = 2;

  { wl_shm_format } //[cite: 1]
  WL_SHM_FORMAT_ARGB8888 = 0;
  WL_SHM_FORMAT_XRGB8888 = 1;
  WL_SHM_FORMAT_C8 = $20203843;
  WL_SHM_FORMAT_RGB332 = $38424752;
  WL_SHM_FORMAT_BGR233 = $38524742;
  WL_SHM_FORMAT_XRGB4444 = $32315258;
  WL_SHM_FORMAT_XBGR4444 = $32314258;
  WL_SHM_FORMAT_RGBX4444 = $32315852;
  WL_SHM_FORMAT_BGRX4444 = $32315842;
  WL_SHM_FORMAT_ARGB4444 = $32315241;
  WL_SHM_FORMAT_ABGR4444 = $32314241;
  WL_SHM_FORMAT_RGBA4444 = $32314152;
  WL_SHM_FORMAT_BGRA4444 = $32314142;
  WL_SHM_FORMAT_XRGB1555 = $35315258;
  WL_SHM_FORMAT_XBGR1555 = $35314258;
  WL_SHM_FORMAT_RGBX5551 = $35315852;
  WL_SHM_FORMAT_BGRX5551 = $35315842;
  WL_SHM_FORMAT_ARGB1555 = $35315241;
  WL_SHM_FORMAT_ABGR1555 = $35314241;
  WL_SHM_FORMAT_RGBA5551 = $35314152;
  WL_SHM_FORMAT_BGRA5551 = $35314142;
  WL_SHM_FORMAT_RGB565 = $36314752;
  WL_SHM_FORMAT_BGR565 = $36314742;
  WL_SHM_FORMAT_RGB888 = $34324752;
  WL_SHM_FORMAT_BGR888 = $34324742;
  WL_SHM_FORMAT_XBGR8888 = $34324258;
  WL_SHM_FORMAT_RGBX8888 = $34325852;
  WL_SHM_FORMAT_BGRX8888 = $34325842;
  WL_SHM_FORMAT_ABGR8888 = $34324241;
  WL_SHM_FORMAT_RGBA8888 = $34324152;
  WL_SHM_FORMAT_BGRA8888 = $34324142;
  WL_SHM_FORMAT_XRGB2101010 = $30335258;
  WL_SHM_FORMAT_XBGR2101010 = $30334258;
  WL_SHM_FORMAT_RGBX1010102 = $30335852;
  WL_SHM_FORMAT_BGRX1010102 = $30335842;
  WL_SHM_FORMAT_ARGB2101010 = $30335241;
  WL_SHM_FORMAT_ABGR2101010 = $30334241;
  WL_SHM_FORMAT_RGBA1010102 = $30334152;
  WL_SHM_FORMAT_BGRA1010102 = $30334142;
  WL_SHM_FORMAT_YUYV = $56595559;
  WL_SHM_FORMAT_YVYU = $55595659;
  WL_SHM_FORMAT_UYVY = $59565955;
  WL_SHM_FORMAT_VYUY = $59555956;
  WL_SHM_FORMAT_AYUV = $56555941;
  WL_SHM_FORMAT_NV12 = $3231564e;
  WL_SHM_FORMAT_NV21 = $3132564e;
  WL_SHM_FORMAT_NV16 = $3631564e;
  WL_SHM_FORMAT_NV61 = $3136564e;
  WL_SHM_FORMAT_YUV410 = $39565559;
  WL_SHM_FORMAT_YVU410 = $39555659;
  WL_SHM_FORMAT_YUV411 = $31315559;
  WL_SHM_FORMAT_YVU411 = $31315659;
  WL_SHM_FORMAT_YUV420 = $32315559;
  WL_SHM_FORMAT_YVU420 = $32315659;
  WL_SHM_FORMAT_YUV422 = $36315559;
  WL_SHM_FORMAT_YVU422 = $36315659;
  WL_SHM_FORMAT_YUV444 = $34325559;
  WL_SHM_FORMAT_YVU444 = $34325659;
  WL_SHM_FORMAT_R8 = $20203852;
  WL_SHM_FORMAT_R16 = $20363152;
  WL_SHM_FORMAT_RG88 = $38384752;
  WL_SHM_FORMAT_GR88 = $38385247;
  WL_SHM_FORMAT_RG1616 = $32334752;
  WL_SHM_FORMAT_GR1616 = $32335247;
  WL_SHM_FORMAT_XRGB16161616F = $48345258;
  WL_SHM_FORMAT_XBGR16161616F = $48344258;
  WL_SHM_FORMAT_ARGB16161616F = $48345241;
  WL_SHM_FORMAT_ABGR16161616F = $48344241;
  WL_SHM_FORMAT_XYUV8888 = $56555958;
  WL_SHM_FORMAT_VUY888 = $34325556;
  WL_SHM_FORMAT_VUY101010 = $30335556;
  WL_SHM_FORMAT_Y210 = $30313259;
  WL_SHM_FORMAT_Y212 = $32313259;
  WL_SHM_FORMAT_Y216 = $36313259;
  WL_SHM_FORMAT_Y410 = $30313459;
  WL_SHM_FORMAT_Y412 = $32313459;
  WL_SHM_FORMAT_Y416 = $36313459;
  WL_SHM_FORMAT_XVYU2101010 = $30335658;
  WL_SHM_FORMAT_XVYU12_16161616 = $36335658;
  WL_SHM_FORMAT_XVYU16161616 = $38345658;
  WL_SHM_FORMAT_Y0L0 = $304c3059;
  WL_SHM_FORMAT_X0L0 = $304c3058;
  WL_SHM_FORMAT_Y0L2 = $324c3059;
  WL_SHM_FORMAT_X0L2 = $324c3058;
  WL_SHM_FORMAT_YUV420_8BIT = $38305559;
  WL_SHM_FORMAT_YUV420_10BIT = $30315559;
  WL_SHM_FORMAT_XRGB8888_A8 = $38415258;
  WL_SHM_FORMAT_XBGR8888_A8 = $38414258;
  WL_SHM_FORMAT_RGBX8888_A8 = $38415852;
  WL_SHM_FORMAT_BGRX8888_A8 = $38415842;
  WL_SHM_FORMAT_RGB888_A8 = $38413852;
  WL_SHM_FORMAT_BGR888_A8 = $38413842;
  WL_SHM_FORMAT_RGB565_A8 = $38413552;
  WL_SHM_FORMAT_BGR565_A8 = $38413542;
  WL_SHM_FORMAT_NV24 = $3432564e;
  WL_SHM_FORMAT_NV42 = $3234564e;
  WL_SHM_FORMAT_P210 = $30313250;
  WL_SHM_FORMAT_P010 = $30313050;
  WL_SHM_FORMAT_P012 = $32313050;
  WL_SHM_FORMAT_P016 = $36313050;
  WL_SHM_FORMAT_AXBXGXRX106106106106 = $30314241;
  WL_SHM_FORMAT_NV15 = $3531564e;
  WL_SHM_FORMAT_Q410 = $30313451;
  WL_SHM_FORMAT_Q401 = $31303451;
  WL_SHM_FORMAT_XRGB16161616 = $38345258;
  WL_SHM_FORMAT_XBGR16161616 = $38344258;
  WL_SHM_FORMAT_ARGB16161616 = $38345241;
  WL_SHM_FORMAT_ABGR16161616 = $38344241;

type
  { wl_shm } //[cite: 1]
  Twl_shm_interface = record
    create_pool: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; fd: Tint32_t; size: Tint32_t); cdecl;
  end;

const
  WL_SHM_FORMAT = 0;
  WL_SHM_FORMAT_SINCE_VERSION = 1;
  WL_SHM_CREATE_POOL_SINCE_VERSION = 1;

type
  { wl_buffer } //[cite: 1]
  Twl_buffer_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;

const
  WL_BUFFER_RELEASE = 0;
  WL_BUFFER_RELEASE_SINCE_VERSION = 1;
  WL_BUFFER_DESTROY_SINCE_VERSION = 1;

  { wl_data_offer } //[cite: 1]
  WL_DATA_OFFER_ERROR_INVALID_FINISH = 0;
  WL_DATA_OFFER_ERROR_INVALID_ACTION_MASK = 1;
  WL_DATA_OFFER_ERROR_INVALID_ACTION = 2;
  WL_DATA_OFFER_ERROR_INVALID_OFFER = 3;

type
  Twl_data_offer_interface = record
    accept: procedure(client: Pwl_client; resource: Pwl_resource; serial: Tuint32_t; mime_type: PChar); cdecl;
    receive: procedure(client: Pwl_client; resource: Pwl_resource; mime_type: PChar; fd: Tint32_t); cdecl;
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    finish: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_actions: procedure(client: Pwl_client; resource: Pwl_resource; dnd_actions: Tuint32_t; preferred_action: Tuint32_t); cdecl;
  end;

const
  WL_DATA_OFFER_OFFER = 0;
  WL_DATA_OFFER_SOURCE_ACTIONS = 1;
  WL_DATA_OFFER_ACTION = 2;

  WL_DATA_OFFER_OFFER_SINCE_VERSION = 1;
  WL_DATA_OFFER_SOURCE_ACTIONS_SINCE_VERSION = 3;
  WL_DATA_OFFER_ACTION_SINCE_VERSION = 3;
  WL_DATA_OFFER_ACCEPT_SINCE_VERSION = 1;
  WL_DATA_OFFER_RECEIVE_SINCE_VERSION = 1;
  WL_DATA_OFFER_DESTROY_SINCE_VERSION = 1;
  WL_DATA_OFFER_FINISH_SINCE_VERSION = 3;
  WL_DATA_OFFER_SET_ACTIONS_SINCE_VERSION = 3;

  { wl_data_source } //[cite: 1]
  WL_DATA_SOURCE_ERROR_INVALID_ACTION_MASK = 0;
  WL_DATA_SOURCE_ERROR_INVALID_SOURCE = 1;

type
  Twl_data_source_interface = record
    offer: procedure(client: Pwl_client; resource: Pwl_resource; mime_type: PChar); cdecl;
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_actions: procedure(client: Pwl_client; resource: Pwl_resource; dnd_actions: Tuint32_t); cdecl;
  end;

const
  WL_DATA_SOURCE_TARGET = 0;
  WL_DATA_SOURCE_SEND = 1;
  WL_DATA_SOURCE_CANCELLED = 2;
  WL_DATA_SOURCE_DND_DROP_PERFORMED = 3;
  WL_DATA_SOURCE_DND_FINISHED = 4;
  WL_DATA_SOURCE_ACTION = 5;

  WL_DATA_SOURCE_TARGET_SINCE_VERSION = 1;
  WL_DATA_SOURCE_SEND_SINCE_VERSION = 1;
  WL_DATA_SOURCE_CANCELLED_SINCE_VERSION = 1;
  WL_DATA_SOURCE_DND_DROP_PERFORMED_SINCE_VERSION = 3;
  WL_DATA_SOURCE_DND_FINISHED_SINCE_VERSION = 3;
  WL_DATA_SOURCE_ACTION_SINCE_VERSION = 3;
  WL_DATA_SOURCE_OFFER_SINCE_VERSION = 1;
  WL_DATA_SOURCE_DESTROY_SINCE_VERSION = 1;
  WL_DATA_SOURCE_SET_ACTIONS_SINCE_VERSION = 3;

  { wl_data_device } //[cite: 1]
  WL_DATA_DEVICE_ERROR_ROLE = 0;

type
  Twl_data_device_interface = record
    start_drag: procedure(client: Pwl_client; resource: Pwl_resource; source: Pwl_resource; origin: Pwl_resource; icon: Pwl_resource; serial: Tuint32_t); cdecl;
    set_selection: procedure(client: Pwl_client; resource: Pwl_resource; source: Pwl_resource; serial: Tuint32_t); cdecl;
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;

const
  WL_DATA_DEVICE_DATA_OFFER = 0;
  WL_DATA_DEVICE_ENTER = 1;
  WL_DATA_DEVICE_LEAVE = 2;
  WL_DATA_DEVICE_MOTION = 3;
  WL_DATA_DEVICE_DROP = 4;
  WL_DATA_DEVICE_SELECTION = 5;

  WL_DATA_DEVICE_DATA_OFFER_SINCE_VERSION = 1;
  WL_DATA_DEVICE_ENTER_SINCE_VERSION = 1;
  WL_DATA_DEVICE_LEAVE_SINCE_VERSION = 1;
  WL_DATA_DEVICE_MOTION_SINCE_VERSION = 1;
  WL_DATA_DEVICE_DROP_SINCE_VERSION = 1;
  WL_DATA_DEVICE_SELECTION_SINCE_VERSION = 1;
  WL_DATA_DEVICE_START_DRAG_SINCE_VERSION = 1;
  WL_DATA_DEVICE_SET_SELECTION_SINCE_VERSION = 1;
  WL_DATA_DEVICE_RELEASE_SINCE_VERSION = 2;

  { wl_data_device_manager } //[cite: 1]
  WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE = 0;
  WL_DATA_DEVICE_MANAGER_DND_ACTION_COPY = 1;
  WL_DATA_DEVICE_MANAGER_DND_ACTION_MOVE = 2;
  WL_DATA_DEVICE_MANAGER_DND_ACTION_ASK = 4;

type
  Twl_data_device_manager_interface = record
    create_data_source: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    get_data_device: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; seat: Pwl_resource); cdecl;
  end;

const
  WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE_SINCE_VERSION = 1;
  WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE_SINCE_VERSION = 1;

  { wl_shell } //[cite: 1]
  WL_SHELL_ERROR_ROLE = 0;

type
  Twl_shell_interface = record
    get_shell_surface: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; surface: Pwl_resource); cdecl;
  end;

const
  WL_SHELL_GET_SHELL_SURFACE_SINCE_VERSION = 1;

  { wl_shell_surface } //[cite: 1]
  WL_SHELL_SURFACE_RESIZE_NONE = 0;
  WL_SHELL_SURFACE_RESIZE_TOP = 1;
  WL_SHELL_SURFACE_RESIZE_BOTTOM = 2;
  WL_SHELL_SURFACE_RESIZE_LEFT = 4;
  WL_SHELL_SURFACE_RESIZE_TOP_LEFT = 5;
  WL_SHELL_SURFACE_RESIZE_BOTTOM_LEFT = 6;
  WL_SHELL_SURFACE_RESIZE_RIGHT = 8;
  WL_SHELL_SURFACE_RESIZE_TOP_RIGHT = 9;
  WL_SHELL_SURFACE_RESIZE_BOTTOM_RIGHT = 10;

  WL_SHELL_SURFACE_TRANSIENT_INACTIVE = $1;

  WL_SHELL_SURFACE_FULLSCREEN_METHOD_DEFAULT = 0;
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_SCALE = 1;
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_DRIVER = 2;
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_FILL = 3;

type
  Twl_shell_surface_interface = record
    pong: procedure(client: Pwl_client; resource: Pwl_resource; serial: Tuint32_t); cdecl;
    move: procedure(client: Pwl_client; resource: Pwl_resource; seat: Pwl_resource; serial: Tuint32_t); cdecl;
    resize: procedure(client: Pwl_client; resource: Pwl_resource; seat: Pwl_resource; serial: Tuint32_t; edges: Tuint32_t); cdecl;
    set_toplevel: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_transient: procedure(client: Pwl_client; resource: Pwl_resource; parent: Pwl_resource; x: Tint32_t; y: Tint32_t; flags: Tuint32_t); cdecl;
    set_fullscreen: procedure(client: Pwl_client; resource: Pwl_resource; method: Tuint32_t; framerate: Tuint32_t; output: Pwl_resource); cdecl;
    set_popup: procedure(client: Pwl_client; resource: Pwl_resource; seat: Pwl_resource; serial: Tuint32_t; parent: Pwl_resource; x: Tint32_t; y: Tint32_t; flags: Tuint32_t); cdecl;
    set_maximized: procedure(client: Pwl_client; resource: Pwl_resource; output: Pwl_resource); cdecl;
    set_title: procedure(client: Pwl_client; resource: Pwl_resource; title: PChar); cdecl;
    set_class: procedure(client: Pwl_client; resource: Pwl_resource; class_: PChar); cdecl;
  end;

const
  WL_SHELL_SURFACE_PING = 0;
  WL_SHELL_SURFACE_CONFIGURE = 1;
  WL_SHELL_SURFACE_POPUP_DONE = 2;

  WL_SHELL_SURFACE_PING_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_CONFIGURE_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_POPUP_DONE_SINCE_VERSION = 1;

  WL_SHELL_SURFACE_PONG_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_MOVE_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_RESIZE_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_SET_TOPLEVEL_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_SET_TRANSIENT_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_SET_FULLSCREEN_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_SET_POPUP_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_SET_MAXIMIZED_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_SET_TITLE_SINCE_VERSION = 1;
  WL_SHELL_SURFACE_SET_CLASS_SINCE_VERSION = 1;

  { wl_surface } //[cite: 1]
  WL_SURFACE_ERROR_INVALID_SCALE = 0;
  WL_SURFACE_ERROR_INVALID_TRANSFORM = 1;
  WL_SURFACE_ERROR_INVALID_SIZE = 2;
  WL_SURFACE_ERROR_INVALID_OFFSET = 3;
  WL_SURFACE_ERROR_DEFUNCT_ROLE_OBJECT = 4;

type
  Twl_surface_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    attach: procedure(client: Pwl_client; resource: Pwl_resource; buffer: Pwl_resource; x: Tint32_t; y: Tint32_t); cdecl;
    damage: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t; width: Tint32_t; height: Tint32_t); cdecl;
    frame: procedure(client: Pwl_client; resource: Pwl_resource; callback: Tuint32_t); cdecl;
    set_opaque_region: procedure(client: Pwl_client; resource: Pwl_resource; region: Pwl_resource); cdecl;
    set_input_region: procedure(client: Pwl_client; resource: Pwl_resource; region: Pwl_resource); cdecl;
    commit: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_buffer_transform: procedure(client: Pwl_client; resource: Pwl_resource; transform: Tint32_t); cdecl;
    set_buffer_scale: procedure(client: Pwl_client; resource: Pwl_resource; scale: Tint32_t); cdecl;
    damage_buffer: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t; width: Tint32_t; height: Tint32_t); cdecl;
    offset: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t); cdecl;
  end;

const
  WL_SURFACE_ENTER = 0;
  WL_SURFACE_LEAVE = 1;
  WL_SURFACE_PREFERRED_BUFFER_SCALE = 2;
  WL_SURFACE_PREFERRED_BUFFER_TRANSFORM = 3;

  WL_SURFACE_ENTER_SINCE_VERSION = 1;
  WL_SURFACE_LEAVE_SINCE_VERSION = 1;
  WL_SURFACE_PREFERRED_BUFFER_SCALE_SINCE_VERSION = 6;
  WL_SURFACE_PREFERRED_BUFFER_TRANSFORM_SINCE_VERSION = 6;

  WL_SURFACE_DESTROY_SINCE_VERSION = 1;
  WL_SURFACE_ATTACH_SINCE_VERSION = 1;
  WL_SURFACE_DAMAGE_SINCE_VERSION = 1;
  WL_SURFACE_FRAME_SINCE_VERSION = 1;
  WL_SURFACE_SET_OPAQUE_REGION_SINCE_VERSION = 1;
  WL_SURFACE_SET_INPUT_REGION_SINCE_VERSION = 1;
  WL_SURFACE_COMMIT_SINCE_VERSION = 1;
  WL_SURFACE_SET_BUFFER_TRANSFORM_SINCE_VERSION = 2;
  WL_SURFACE_SET_BUFFER_SCALE_SINCE_VERSION = 3;
  WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION = 4;
  WL_SURFACE_OFFSET_SINCE_VERSION = 5;

  { wl_seat } //[cite: 1]
  WL_SEAT_CAPABILITY_POINTER = 1;
  WL_SEAT_CAPABILITY_KEYBOARD = 2;
  WL_SEAT_CAPABILITY_TOUCH = 4;

  WL_SEAT_ERROR_MISSING_CAPABILITY = 0;

type
  Twl_seat_interface = record
    get_pointer: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    get_keyboard: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    get_touch: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t); cdecl;
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;

const
  WL_SEAT_CAPABILITIES = 0;
  WL_SEAT_NAME = 1;

  WL_SEAT_CAPABILITIES_SINCE_VERSION = 1;
  WL_SEAT_NAME_SINCE_VERSION = 2;
  WL_SEAT_GET_POINTER_SINCE_VERSION = 1;
  WL_SEAT_GET_KEYBOARD_SINCE_VERSION = 1;
  WL_SEAT_GET_TOUCH_SINCE_VERSION = 1;
  WL_SEAT_RELEASE_SINCE_VERSION = 5;

  { wl_pointer } //[cite: 1]
  WL_POINTER_ERROR_ROLE = 0;
  
  WL_POINTER_BUTTON_STATE_RELEASED = 0;
  WL_POINTER_BUTTON_STATE_PRESSED = 1;

  WL_POINTER_AXIS_VERTICAL_SCROLL = 0;
  WL_POINTER_AXIS_HORIZONTAL_SCROLL = 1;

  WL_POINTER_AXIS_SOURCE_WHEEL = 0;
  WL_POINTER_AXIS_SOURCE_FINGER = 1;
  WL_POINTER_AXIS_SOURCE_CONTINUOUS = 2;
  WL_POINTER_AXIS_SOURCE_WHEEL_TILT = 3;
  WL_POINTER_AXIS_SOURCE_WHEEL_TILT_SINCE_VERSION = 6;

  WL_POINTER_AXIS_RELATIVE_DIRECTION_IDENTICAL = 0;
  WL_POINTER_AXIS_RELATIVE_DIRECTION_INVERTED = 1;

type
  Twl_pointer_interface = record
    set_cursor: procedure(client: Pwl_client; resource: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; hotspot_x: Tint32_t; hotspot_y: Tint32_t); cdecl;
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;

const
  WL_POINTER_ENTER = 0;
  WL_POINTER_LEAVE = 1;
  WL_POINTER_MOTION = 2;
  WL_POINTER_BUTTON = 3;
  WL_POINTER_AXIS = 4;
  WL_POINTER_FRAME = 5;
  WL_POINTER_AXIS_SOURCE = 6;
  WL_POINTER_AXIS_STOP = 7;
  WL_POINTER_AXIS_DISCRETE = 8;
  WL_POINTER_AXIS_VALUE120 = 9;
  WL_POINTER_AXIS_RELATIVE_DIRECTION = 10;

  WL_POINTER_ENTER_SINCE_VERSION = 1;
  WL_POINTER_LEAVE_SINCE_VERSION = 1;
  WL_POINTER_MOTION_SINCE_VERSION = 1;
  WL_POINTER_BUTTON_SINCE_VERSION = 1;
  WL_POINTER_AXIS_SINCE_VERSION = 1;
  WL_POINTER_FRAME_SINCE_VERSION = 5;
  WL_POINTER_AXIS_SOURCE_SINCE_VERSION = 5;
  WL_POINTER_AXIS_STOP_SINCE_VERSION = 5;
  WL_POINTER_AXIS_DISCRETE_SINCE_VERSION = 5;
  WL_POINTER_AXIS_VALUE120_SINCE_VERSION = 8;
  WL_POINTER_AXIS_RELATIVE_DIRECTION_SINCE_VERSION = 9;
  WL_POINTER_SET_CURSOR_SINCE_VERSION = 1;
  WL_POINTER_RELEASE_SINCE_VERSION = 3;

  { wl_keyboard } //[cite: 1]
  WL_KEYBOARD_KEYMAP_FORMAT_NO_KEYMAP = 0;
  WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1 = 1;

  WL_KEYBOARD_KEY_STATE_RELEASED = 0;
  WL_KEYBOARD_KEY_STATE_PRESSED = 1;

type
  Twl_keyboard_interface = record
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;

const
  WL_KEYBOARD_KEYMAP = 0;
  WL_KEYBOARD_ENTER = 1;
  WL_KEYBOARD_LEAVE = 2;
  WL_KEYBOARD_KEY = 3;
  WL_KEYBOARD_MODIFIERS = 4;
  WL_KEYBOARD_REPEAT_INFO = 5;

  WL_KEYBOARD_KEYMAP_SINCE_VERSION = 1;
  WL_KEYBOARD_ENTER_SINCE_VERSION = 1;
  WL_KEYBOARD_LEAVE_SINCE_VERSION = 1;
  WL_KEYBOARD_KEY_SINCE_VERSION = 1;
  WL_KEYBOARD_MODIFIERS_SINCE_VERSION = 1;
  WL_KEYBOARD_REPEAT_INFO_SINCE_VERSION = 4;
  WL_KEYBOARD_RELEASE_SINCE_VERSION = 3;

type
  { wl_touch } //[cite: 1]
  Twl_touch_interface = record
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;

const
  WL_TOUCH_DOWN = 0;
  WL_TOUCH_UP = 1;
  WL_TOUCH_MOTION = 2;
  WL_TOUCH_FRAME = 3;
  WL_TOUCH_CANCEL = 4;
  WL_TOUCH_SHAPE = 5;
  WL_TOUCH_ORIENTATION = 6;

  WL_TOUCH_DOWN_SINCE_VERSION = 1;
  WL_TOUCH_UP_SINCE_VERSION = 1;
  WL_TOUCH_MOTION_SINCE_VERSION = 1;
  WL_TOUCH_FRAME_SINCE_VERSION = 1;
  WL_TOUCH_CANCEL_SINCE_VERSION = 1;
  WL_TOUCH_SHAPE_SINCE_VERSION = 6;
  WL_TOUCH_ORIENTATION_SINCE_VERSION = 6;
  WL_TOUCH_RELEASE_SINCE_VERSION = 3;

  { wl_output } //[cite: 1]
  WL_OUTPUT_SUBPIXEL_UNKNOWN = 0;
  WL_OUTPUT_SUBPIXEL_NONE = 1;
  WL_OUTPUT_SUBPIXEL_HORIZONTAL_RGB = 2;
  WL_OUTPUT_SUBPIXEL_HORIZONTAL_BGR = 3;
  WL_OUTPUT_SUBPIXEL_VERTICAL_RGB = 4;
  WL_OUTPUT_SUBPIXEL_VERTICAL_BGR = 5;

  WL_OUTPUT_TRANSFORM_NORMAL = 0;
  WL_OUTPUT_TRANSFORM_90 = 1;
  WL_OUTPUT_TRANSFORM_180 = 2;
  WL_OUTPUT_TRANSFORM_270 = 3;
  WL_OUTPUT_TRANSFORM_FLIPPED = 4;
  WL_OUTPUT_TRANSFORM_FLIPPED_90 = 5;
  WL_OUTPUT_TRANSFORM_FLIPPED_180 = 6;
  WL_OUTPUT_TRANSFORM_FLIPPED_270 = 7;

  WL_OUTPUT_MODE_CURRENT = $1;
  WL_OUTPUT_MODE_PREFERRED = $2;

type
  Twl_output_interface = record
    release: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;

const
  WL_OUTPUT_GEOMETRY = 0;
  WL_OUTPUT_MODE = 1;
  WL_OUTPUT_DONE = 2;
  WL_OUTPUT_SCALE = 3;
  WL_OUTPUT_NAME = 4;
  WL_OUTPUT_DESCRIPTION = 5;

  WL_OUTPUT_GEOMETRY_SINCE_VERSION = 1;
  WL_OUTPUT_MODE_SINCE_VERSION = 1;
  WL_OUTPUT_DONE_SINCE_VERSION = 2;
  WL_OUTPUT_SCALE_SINCE_VERSION = 2;
  WL_OUTPUT_NAME_SINCE_VERSION = 4;
  WL_OUTPUT_DESCRIPTION_SINCE_VERSION = 4;
  WL_OUTPUT_RELEASE_SINCE_VERSION = 3;

type
  { wl_region } //[cite: 1]
  Twl_region_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    add: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t; width: Tint32_t; height: Tint32_t); cdecl;
    subtract: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t; width: Tint32_t; height: Tint32_t); cdecl;
  end;

const
  WL_REGION_DESTROY_SINCE_VERSION = 1;
  WL_REGION_ADD_SINCE_VERSION = 1;
  WL_REGION_SUBTRACT_SINCE_VERSION = 1;

  { wl_subcompositor } //[cite: 1]
  WL_SUBCOMPOSITOR_ERROR_BAD_SURFACE = 0;
  WL_SUBCOMPOSITOR_ERROR_BAD_PARENT = 1;

type
  Twl_subcompositor_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    get_subsurface: procedure(client: Pwl_client; resource: Pwl_resource; id: Tuint32_t; surface: Pwl_resource; parent: Pwl_resource); cdecl;
  end;

const
  WL_SUBCOMPOSITOR_DESTROY_SINCE_VERSION = 1;
  WL_SUBCOMPOSITOR_GET_SUBSURFACE_SINCE_VERSION = 1;

  { wl_subsurface } //[cite: 1]
  WL_SUBSURFACE_ERROR_BAD_SURFACE = 0;

type
  Twl_subsurface_interface = record
    destroy: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_position: procedure(client: Pwl_client; resource: Pwl_resource; x: Tint32_t; y: Tint32_t); cdecl;
    place_above: procedure(client: Pwl_client; resource: Pwl_resource; sibling: Pwl_resource); cdecl;
    place_below: procedure(client: Pwl_client; resource: Pwl_resource; sibling: Pwl_resource); cdecl;
    set_sync: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
    set_desync: procedure(client: Pwl_client; resource: Pwl_resource); cdecl;
  end;

const
  WL_SUBSURFACE_DESTROY_SINCE_VERSION = 1;
  WL_SUBSURFACE_SET_POSITION_SINCE_VERSION = 1;
  WL_SUBSURFACE_PLACE_ABOVE_SINCE_VERSION = 1;
  WL_SUBSURFACE_PLACE_BELOW_SINCE_VERSION = 1;
  WL_SUBSURFACE_SET_SYNC_SINCE_VERSION = 1;
  WL_SUBSURFACE_SET_DESYNC_SINCE_VERSION = 1;



{ Übersetzte Inline-Funktionen } //[cite: 1]
procedure wl_registry_send_global(resource_: Pwl_resource; name: Tuint32_t; interface_: PChar; version: Tuint32_t); inline;
procedure wl_registry_send_global_remove(resource_: Pwl_resource; name: Tuint32_t); inline;
procedure wl_callback_send_done(resource_: Pwl_resource; callback_data: Tuint32_t); inline;
procedure wl_shm_send_format(resource_: Pwl_resource; format: Tuint32_t); inline;
procedure wl_buffer_send_release(resource_: Pwl_resource); inline;
procedure wl_data_offer_send_offer(resource_: Pwl_resource; mime_type: PChar); inline;
procedure wl_data_offer_send_source_actions(resource_: Pwl_resource; source_actions: Tuint32_t); inline;
procedure wl_data_offer_send_action(resource_: Pwl_resource; dnd_action: Tuint32_t); inline;
procedure wl_data_source_send_target(resource_: Pwl_resource; mime_type: PChar); inline;
procedure wl_data_source_send_send(resource_: Pwl_resource; mime_type: PChar; fd: Tint32_t); inline;
procedure wl_data_source_send_cancelled(resource_: Pwl_resource); inline;
procedure wl_data_source_send_dnd_drop_performed(resource_: Pwl_resource); inline;
procedure wl_data_source_send_dnd_finished(resource_: Pwl_resource); inline;
procedure wl_data_source_send_action(resource_: Pwl_resource; dnd_action: Tuint32_t); inline;
procedure wl_data_device_send_data_offer(resource_: Pwl_resource; id: Pwl_resource); inline;
procedure wl_data_device_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; x: wl_fixed_t; y: wl_fixed_t; id: Pwl_resource); inline;
procedure wl_data_device_send_leave(resource_: Pwl_resource); inline;
procedure wl_data_device_send_motion(resource_: Pwl_resource; time: Tuint32_t; x: wl_fixed_t; y: wl_fixed_t); inline;
procedure wl_data_device_send_drop(resource_: Pwl_resource); inline;
procedure wl_data_device_send_selection(resource_: Pwl_resource; id: Pwl_resource); inline;
procedure wl_shell_surface_send_ping(resource_: Pwl_resource; serial: Tuint32_t); inline;
procedure wl_shell_surface_send_configure(resource_: Pwl_resource; edges: Tuint32_t; width: Tint32_t; height: Tint32_t); inline;
procedure wl_shell_surface_send_popup_done(resource_: Pwl_resource); inline;
procedure wl_surface_send_enter(resource_: Pwl_resource; output: Pwl_resource); inline;
procedure wl_surface_send_leave(resource_: Pwl_resource; output: Pwl_resource); inline;
procedure wl_surface_send_preferred_buffer_scale(resource_: Pwl_resource; factor: Tint32_t); inline;
procedure wl_surface_send_preferred_buffer_transform(resource_: Pwl_resource; transform: Tuint32_t); inline;
procedure wl_seat_send_capabilities(resource_: Pwl_resource; capabilities: Tuint32_t); inline;
procedure wl_seat_send_name(resource_: Pwl_resource; name: PChar); inline;
procedure wl_pointer_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; surface_x: wl_fixed_t; surface_y: wl_fixed_t); inline;
procedure wl_pointer_send_leave(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource); inline;
procedure wl_pointer_send_motion(resource_: Pwl_resource; time: Tuint32_t; surface_x: wl_fixed_t; surface_y: wl_fixed_t); inline;
procedure wl_pointer_send_button(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; button: Tuint32_t; state: Tuint32_t); inline;
procedure wl_pointer_send_axis(resource_: Pwl_resource; time: Tuint32_t; axis: Tuint32_t; value: wl_fixed_t); inline;
procedure wl_pointer_send_frame(resource_: Pwl_resource); inline;
procedure wl_pointer_send_axis_source(resource_: Pwl_resource; axis_source: Tuint32_t); inline;
procedure wl_pointer_send_axis_stop(resource_: Pwl_resource; time: Tuint32_t; axis: Tuint32_t); inline;
procedure wl_pointer_send_axis_discrete(resource_: Pwl_resource; axis: Tuint32_t; discrete: Tint32_t); inline;
procedure wl_pointer_send_axis_value120(resource_: Pwl_resource; axis: Tuint32_t; value120: Tint32_t); inline;
procedure wl_pointer_send_axis_relative_direction(resource_: Pwl_resource; axis: Tuint32_t; direction: Tuint32_t); inline;
procedure wl_keyboard_send_keymap(resource_: Pwl_resource; format: Tuint32_t; fd: Tint32_t; size: Tuint32_t); inline;
procedure wl_keyboard_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; keys: Pwl_array); inline;
procedure wl_keyboard_send_leave(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource); inline;
procedure wl_keyboard_send_key(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; key: Tuint32_t; state: Tuint32_t); inline;
procedure wl_keyboard_send_modifiers(resource_: Pwl_resource; serial: Tuint32_t; mods_depressed: Tuint32_t; mods_latched: Tuint32_t; mods_locked: Tuint32_t; group: Tuint32_t); inline;
procedure wl_keyboard_send_repeat_info(resource_: Pwl_resource; rate: Tint32_t; delay: Tint32_t); inline;
procedure wl_touch_send_down(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; surface: Pwl_resource; id: Tint32_t; x: wl_fixed_t; y: wl_fixed_t); inline;
procedure wl_touch_send_up(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; id: Tint32_t); inline;
procedure wl_touch_send_motion(resource_: Pwl_resource; time: Tuint32_t; id: Tint32_t; x: wl_fixed_t; y: wl_fixed_t); inline;
procedure wl_touch_send_frame(resource_: Pwl_resource); inline;
procedure wl_touch_send_cancel(resource_: Pwl_resource); inline;
procedure wl_touch_send_shape(resource_: Pwl_resource; id: Tint32_t; major: wl_fixed_t; minor: wl_fixed_t); inline;
procedure wl_touch_send_orientation(resource_: Pwl_resource; id: Tint32_t; orientation: wl_fixed_t); inline;
procedure wl_output_send_geometry(resource_: Pwl_resource; x: Tint32_t; y: Tint32_t; physical_width: Tint32_t; physical_height: Tint32_t; subpixel: Tint32_t; make: PChar; model: PChar; transform: Tint32_t); inline;
procedure wl_output_send_mode(resource_: Pwl_resource; flags: Tuint32_t; width: Tint32_t; height: Tint32_t; refresh: Tint32_t); inline;
procedure wl_output_send_done(resource_: Pwl_resource); inline;
procedure wl_output_send_scale(resource_: Pwl_resource; factor: Tint32_t); inline;
procedure wl_output_send_name(resource_: Pwl_resource; name: PChar); inline;
procedure wl_output_send_description(resource_: Pwl_resource; description: PChar); inline;

implementation

{ Implementierung der Inline-Funktionen } //[cite: 1]

procedure wl_registry_send_global(resource_: Pwl_resource; name: Tuint32_t; interface_: PChar; version: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_REGISTRY_GLOBAL, name, interface_, version);
end;

procedure wl_registry_send_global_remove(resource_: Pwl_resource; name: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_REGISTRY_GLOBAL_REMOVE, name);
end;

procedure wl_callback_send_done(resource_: Pwl_resource; callback_data: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_CALLBACK_DONE, callback_data);
end;

procedure wl_shm_send_format(resource_: Pwl_resource; format: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SHM_FORMAT, format);
end;

procedure wl_buffer_send_release(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_BUFFER_RELEASE);
end;

procedure wl_data_offer_send_offer(resource_: Pwl_resource; mime_type: PChar); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_OFFER_OFFER, mime_type);
end;

procedure wl_data_offer_send_source_actions(resource_: Pwl_resource; source_actions: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_OFFER_SOURCE_ACTIONS, source_actions);
end;

procedure wl_data_offer_send_action(resource_: Pwl_resource; dnd_action: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_OFFER_ACTION, dnd_action);
end;

procedure wl_data_source_send_target(resource_: Pwl_resource; mime_type: PChar); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_TARGET, mime_type);
end;

procedure wl_data_source_send_send(resource_: Pwl_resource; mime_type: PChar; fd: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_SEND, mime_type, fd);
end;

procedure wl_data_source_send_cancelled(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_CANCELLED);
end;

procedure wl_data_source_send_dnd_drop_performed(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_DND_DROP_PERFORMED);
end;

procedure wl_data_source_send_dnd_finished(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_DND_FINISHED);
end;

procedure wl_data_source_send_action(resource_: Pwl_resource; dnd_action: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_SOURCE_ACTION, dnd_action);
end;

procedure wl_data_device_send_data_offer(resource_: Pwl_resource; id: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_DATA_OFFER, id);
end;

procedure wl_data_device_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; x: wl_fixed_t; y: wl_fixed_t; id: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_ENTER, serial, surface, x, y, id);
end;

procedure wl_data_device_send_leave(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_LEAVE);
end;

procedure wl_data_device_send_motion(resource_: Pwl_resource; time: Tuint32_t; x: wl_fixed_t; y: wl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_MOTION, time, x, y);
end;

procedure wl_data_device_send_drop(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_DROP);
end;

procedure wl_data_device_send_selection(resource_: Pwl_resource; id: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_DATA_DEVICE_SELECTION, id);
end;

procedure wl_shell_surface_send_ping(resource_: Pwl_resource; serial: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SHELL_SURFACE_PING, serial);
end;

procedure wl_shell_surface_send_configure(resource_: Pwl_resource; edges: Tuint32_t; width: Tint32_t; height: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SHELL_SURFACE_CONFIGURE, edges, width, height);
end;

procedure wl_shell_surface_send_popup_done(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_SHELL_SURFACE_POPUP_DONE);
end;

procedure wl_surface_send_enter(resource_: Pwl_resource; output: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_SURFACE_ENTER, output);
end;

procedure wl_surface_send_leave(resource_: Pwl_resource; output: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_SURFACE_LEAVE, output);
end;

procedure wl_surface_send_preferred_buffer_scale(resource_: Pwl_resource; factor: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SURFACE_PREFERRED_BUFFER_SCALE, factor);
end;

procedure wl_surface_send_preferred_buffer_transform(resource_: Pwl_resource; transform: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SURFACE_PREFERRED_BUFFER_TRANSFORM, transform);
end;

procedure wl_seat_send_capabilities(resource_: Pwl_resource; capabilities: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_SEAT_CAPABILITIES, capabilities);
end;

procedure wl_seat_send_name(resource_: Pwl_resource; name: PChar); inline;
begin
  wl_resource_post_event(resource_, WL_SEAT_NAME, name);
end;

procedure wl_pointer_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; surface_x: wl_fixed_t; surface_y: wl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_ENTER, serial, surface, surface_x, surface_y);
end;

procedure wl_pointer_send_leave(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_LEAVE, serial, surface);
end;

procedure wl_pointer_send_motion(resource_: Pwl_resource; time: Tuint32_t; surface_x: wl_fixed_t; surface_y: wl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_MOTION, time, surface_x, surface_y);
end;

procedure wl_pointer_send_button(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; button: Tuint32_t; state: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_BUTTON, serial, time, button, state);
end;

procedure wl_pointer_send_axis(resource_: Pwl_resource; time: Tuint32_t; axis: Tuint32_t; value: wl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS, time, axis, value);
end;

procedure wl_pointer_send_frame(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_FRAME);
end;

procedure wl_pointer_send_axis_source(resource_: Pwl_resource; axis_source: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_SOURCE, axis_source);
end;

procedure wl_pointer_send_axis_stop(resource_: Pwl_resource; time: Tuint32_t; axis: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_STOP, time, axis);
end;

procedure wl_pointer_send_axis_discrete(resource_: Pwl_resource; axis: Tuint32_t; discrete: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_DISCRETE, axis, discrete);
end;

procedure wl_pointer_send_axis_value120(resource_: Pwl_resource; axis: Tuint32_t; value120: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_VALUE120, axis, value120);
end;

procedure wl_pointer_send_axis_relative_direction(resource_: Pwl_resource; axis: Tuint32_t; direction: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_POINTER_AXIS_RELATIVE_DIRECTION, axis, direction);
end;

procedure wl_keyboard_send_keymap(resource_: Pwl_resource; format: Tuint32_t; fd: Tint32_t; size: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_KEYMAP, format, fd, size);
end;

procedure wl_keyboard_send_enter(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource; keys: Pwl_array); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_ENTER, serial, surface, keys);
end;

procedure wl_keyboard_send_leave(resource_: Pwl_resource; serial: Tuint32_t; surface: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_LEAVE, serial, surface);
end;

procedure wl_keyboard_send_key(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; key: Tuint32_t; state: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_KEY, serial, time, key, state);
end;

procedure wl_keyboard_send_modifiers(resource_: Pwl_resource; serial: Tuint32_t; mods_depressed: Tuint32_t; mods_latched: Tuint32_t; mods_locked: Tuint32_t; group: Tuint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_MODIFIERS, serial, mods_depressed, mods_latched, mods_locked, group);
end;

procedure wl_keyboard_send_repeat_info(resource_: Pwl_resource; rate: Tint32_t; delay: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_KEYBOARD_REPEAT_INFO, rate, delay);
end;

procedure wl_touch_send_down(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; surface: Pwl_resource; id: Tint32_t; x: wl_fixed_t; y: wl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_DOWN, serial, time, surface, id, x, y);
end;

procedure wl_touch_send_up(resource_: Pwl_resource; serial: Tuint32_t; time: Tuint32_t; id: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_UP, serial, time, id);
end;

procedure wl_touch_send_motion(resource_: Pwl_resource; time: Tuint32_t; id: Tint32_t; x: wl_fixed_t; y: wl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_MOTION, time, id, x, y);
end;

procedure wl_touch_send_frame(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_FRAME);
end;

procedure wl_touch_send_cancel(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_CANCEL);
end;

procedure wl_touch_send_shape(resource_: Pwl_resource; id: Tint32_t; major: wl_fixed_t; minor: wl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_SHAPE, id, major, minor);
end;

procedure wl_touch_send_orientation(resource_: Pwl_resource; id: Tint32_t; orientation: wl_fixed_t); inline;
begin
  wl_resource_post_event(resource_, WL_TOUCH_ORIENTATION, id, orientation);
end;

procedure wl_output_send_geometry(resource_: Pwl_resource; x: Tint32_t; y: Tint32_t; physical_width: Tint32_t; physical_height: Tint32_t; subpixel: Tint32_t; make: PChar; model: PChar; transform: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_GEOMETRY, x, y, physical_width, physical_height, subpixel, make, model, transform);
end;

procedure wl_output_send_mode(resource_: Pwl_resource; flags: Tuint32_t; width: Tint32_t; height: Tint32_t; refresh: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_MODE, flags, width, height, refresh);
end;

procedure wl_output_send_done(resource_: Pwl_resource); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_DONE);
end;

procedure wl_output_send_scale(resource_: Pwl_resource; factor: Tint32_t); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_SCALE, factor);
end;

procedure wl_output_send_name(resource_: Pwl_resource; name: PChar); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_NAME, name);
end;

procedure wl_output_send_description(resource_: Pwl_resource; description: PChar); inline;
begin
  wl_resource_post_event(resource_, WL_OUTPUT_DESCRIPTION, description);
end;

end.
