
unit wayland_client_protocol;
interface

uses
fp_wayland, wayland_util;


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  Pwl_buffer =        type Pointer;
  Pwl_callback =        type Pointer;
  Pwl_compositor =        type Pointer;
  Pwl_data_device =        type Pointer;
  Pwl_data_device_manager =        type Pointer;
  Pwl_data_offer =        type Pointer;
  Pwl_data_source =        type Pointer;
  Pwl_display =        type Pointer;
  Pwl_keyboard =        type Pointer;
  Pwl_output =        type Pointer;
  Pwl_pointer =        type Pointer;
  Pwl_region =        type Pointer;
  Pwl_registry =        type Pointer;
  Pwl_seat =        type Pointer;
  Pwl_shell =        type Pointer;
  Pwl_shell_surface =        type Pointer;
  Pwl_shm =        type Pointer;
  Pwl_shm_pool =        type Pointer;
  Pwl_subcompositor =        type Pointer;
  Pwl_subsurface =        type Pointer;
  Pwl_surface =        type Pointer;
  Pwl_touch =        type Pointer;

  var
    wl_display_interface : Twl_interface;cvar;external libwayland_client;
    wl_registry_interface : Twl_interface;cvar;external libwayland_client;
    wl_callback_interface : Twl_interface;cvar;external libwayland_client;
    wl_compositor_interface : Twl_interface;cvar;external libwayland_client;
    wl_shm_pool_interface : Twl_interface;cvar;external libwayland_client;
    wl_shm_interface : Twl_interface;cvar;external libwayland_client;
    wl_buffer_interface : Twl_interface;cvar;external libwayland_client;
    wl_data_offer_interface : Twl_interface;cvar;external libwayland_client;
    wl_data_source_interface : Twl_interface;cvar;external libwayland_client;
    wl_data_device_interface : Twl_interface;cvar;external libwayland_client;
    wl_data_device_manager_interface : Twl_interface;cvar;external libwayland_client;
    wl_shell_interface : Twl_interface;cvar;external libwayland_client;
    wl_shell_surface_interface : Twl_interface;cvar;external libwayland_client;
    wl_surface_interface : Twl_interface;cvar;external libwayland_client;
    wl_seat_interface : Twl_interface;cvar;external libwayland_client;
    wl_pointer_interface : Twl_interface;cvar;external libwayland_client;
    wl_keyboard_interface : Twl_interface;cvar;external libwayland_client;
    wl_touch_interface : Twl_interface;cvar;external libwayland_client;
    wl_output_interface : Twl_interface;cvar;external libwayland_client;
    wl_region_interface : Twl_interface;cvar;external libwayland_client;
    wl_subcompositor_interface : Twl_interface;cvar;external libwayland_client;
    wl_subsurface_interface : Twl_interface;cvar;external libwayland_client;
type
  Twl_display_error =  Longint;
  Const
    WL_DISPLAY_ERROR_INVALID_OBJECT = 0;
    WL_DISPLAY_ERROR_INVALID_METHOD = 1;
    WL_DISPLAY_ERROR_NO_MEMORY = 2;
    WL_DISPLAY_ERROR_IMPLEMENTATION = 3;

type
  Pwl_display_listener = ^Twl_display_listener;
  Twl_display_listener = record
      error : procedure (data:pointer; wl_display:Pwl_display; object_id:pointer; code:Tuint32_t; message:Pchar);cdecl;
      delete_id : procedure (data:pointer; wl_display:Pwl_display; id:Tuint32_t);cdecl;
    end;

const
  WL_DISPLAY_SYNC_ = 0;
  WL_DISPLAY_GET_REGISTRY_ = 1;
  WL_DISPLAY_ERROR_SINCE_VERSION = 1;
  WL_DISPLAY_DELETE_ID_SINCE_VERSION = 1;
  WL_DISPLAY_SYNC_SINCE_VERSION = 1;
  WL_DISPLAY_GET_REGISTRY_SINCE_VERSION = 1;
type
  Pwl_registry_listener = ^Twl_registry_listener;
  Twl_registry_listener = record
      global : procedure (data:pointer; wl_registry:Pwl_registry; name:Tuint32_t; iface:Pchar; version:Tuint32_t);cdecl;
      global_remove : procedure (data:pointer; wl_registry:Pwl_registry; name:Tuint32_t);cdecl;
    end;

const
  WL_REGISTRY_BIND_ = 0;
  WL_REGISTRY_GLOBAL_SINCE_VERSION = 1;
  WL_REGISTRY_GLOBAL_REMOVE_SINCE_VERSION = 1;
  WL_REGISTRY_BIND_SINCE_VERSION = 1;
type
  Pwl_callback_listener = ^Twl_callback_listener;
  Twl_callback_listener = record
      done : procedure (data:pointer; wl_callback:Pwl_callback; callback_data:Tuint32_t);cdecl;
    end;

          const
  WL_CALLBACK_DONE_SINCE_VERSION = 1;
  WL_COMPOSITOR_CREATE_SURFACE_ = 0;
  WL_COMPOSITOR_CREATE_REGION_ = 1;
  WL_COMPOSITOR_CREATE_SURFACE_SINCE_VERSION = 1;
  WL_COMPOSITOR_CREATE_REGION_SINCE_VERSION = 1;
  WL_SHM_POOL_CREATE_BUFFER_ = 0;
  WL_SHM_POOL_DESTROY_ = 1;
  WL_SHM_POOL_RESIZE_ = 2;
  WL_SHM_POOL_CREATE_BUFFER_SINCE_VERSION = 1;
  WL_SHM_POOL_DESTROY_SINCE_VERSION = 1;
  WL_SHM_POOL_RESIZE_SINCE_VERSION = 1;
type
  Twl_shm_error =  Longint;
  Const
    WL_SHM_ERROR_INVALID_FORMAT = 0;
    WL_SHM_ERROR_INVALID_STRIDE = 1;
    WL_SHM_ERROR_INVALID_FD = 2;

type
  Twl_shm_format =  Longint;
  Const
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
  Pwl_shm_listener = ^Twl_shm_listener;
  Twl_shm_listener = record
      format : procedure (data:pointer; wl_shm:Pwl_shm; format:Tuint32_t);cdecl;
    end;

               const
  WL_SHM_CREATE_POOL_ = 0;
  WL_SHM_FORMAT_SINCE_VERSION = 1;
  WL_SHM_CREATE_POOL_SINCE_VERSION = 1;
type
  Pwl_buffer_listener = ^Twl_buffer_listener;
  Twl_buffer_listener = record
      release : procedure (data:pointer; wl_buffer:Pwl_buffer);cdecl;
    end;

            const
  WL_BUFFER_DESTROY_ = 0;
  WL_BUFFER_RELEASE_SINCE_VERSION = 1;
  WL_BUFFER_DESTROY_SINCE_VERSION = 1;
type
  Twl_data_offer_error =  Longint;
  Const
    WL_DATA_OFFER_ERROR_INVALID_FINISH = 0;
    WL_DATA_OFFER_ERROR_INVALID_ACTION_MASK = 1;
    WL_DATA_OFFER_ERROR_INVALID_ACTION = 2;
    WL_DATA_OFFER_ERROR_INVALID_OFFER = 3;

type
  Pwl_data_offer_listener = ^Twl_data_offer_listener;
  Twl_data_offer_listener = record
      offer : procedure (data:pointer; wl_data_offer:Pwl_data_offer; mime_type:Pchar);cdecl;
      source_actions : procedure (data:pointer; wl_data_offer:Pwl_data_offer; source_actions:Tuint32_t);cdecl;
      action : procedure (data:pointer; wl_data_offer:Pwl_data_offer; dnd_action:Tuint32_t);cdecl;
    end;

const
  WL_DATA_OFFER_ACCEPT_ = 0;
  WL_DATA_OFFER_RECEIVE_ = 1;
  WL_DATA_OFFER_DESTROY_ = 2;
  WL_DATA_OFFER_FINISH_ = 3;
  WL_DATA_OFFER_SET_ACTIONS_ = 4;
  WL_DATA_OFFER_OFFER_SINCE_VERSION = 1;
  WL_DATA_OFFER_SOURCE_ACTIONS_SINCE_VERSION = 3;
  WL_DATA_OFFER_ACTION_SINCE_VERSION = 3;
  WL_DATA_OFFER_ACCEPT_SINCE_VERSION = 1;
  WL_DATA_OFFER_RECEIVE_SINCE_VERSION = 1;
  WL_DATA_OFFER_DESTROY_SINCE_VERSION = 1;
  WL_DATA_OFFER_FINISH_SINCE_VERSION = 3;
  WL_DATA_OFFER_SET_ACTIONS_SINCE_VERSION = 3;
type
  Twl_data_source_error =  Longint;
  Const
    WL_DATA_SOURCE_ERROR_INVALID_ACTION_MASK = 0;
    WL_DATA_SOURCE_ERROR_INVALID_SOURCE = 1;

type
  Pwl_data_source_listener = ^Twl_data_source_listener;
  Twl_data_source_listener = record
      target : procedure (data:pointer; wl_data_source:Pwl_data_source; mime_type:Pchar);cdecl;
      send : procedure (data:pointer; wl_data_source:Pwl_data_source; mime_type:Pchar; fd:Tint32_t);cdecl;
      cancelled : procedure (data:pointer; wl_data_source:Pwl_data_source);cdecl;
      dnd_drop_performed : procedure (data:pointer; wl_data_source:Pwl_data_source);cdecl;
      dnd_finished : procedure (data:pointer; wl_data_source:Pwl_data_source);cdecl;
      action : procedure (data:pointer; wl_data_source:Pwl_data_source; dnd_action:Tuint32_t);cdecl;
    end;

const
  WL_DATA_SOURCE_OFFER_ = 0;
  WL_DATA_SOURCE_DESTROY_ = 1;
  WL_DATA_SOURCE_SET_ACTIONS_ = 2;
  WL_DATA_SOURCE_TARGET_SINCE_VERSION = 1;
  WL_DATA_SOURCE_SEND_SINCE_VERSION = 1;
  WL_DATA_SOURCE_CANCELLED_SINCE_VERSION = 1;
  WL_DATA_SOURCE_DND_DROP_PERFORMED_SINCE_VERSION = 3;
  WL_DATA_SOURCE_DND_FINISHED_SINCE_VERSION = 3;
  WL_DATA_SOURCE_ACTION_SINCE_VERSION = 3;
  WL_DATA_SOURCE_OFFER_SINCE_VERSION = 1;
  WL_DATA_SOURCE_DESTROY_SINCE_VERSION = 1;
  WL_DATA_SOURCE_SET_ACTIONS_SINCE_VERSION = 3;
type
  Twl_data_device_error =  Longint;
  Const
    WL_DATA_DEVICE_ERROR_ROLE = 0;

type
  Pwl_data_device_listener = ^Twl_data_device_listener;
  Twl_data_device_listener = record
      data_offer : procedure (data:pointer; wl_data_device:Pwl_data_device; id:Pwl_data_offer);cdecl;
      enter : procedure (data:pointer; wl_data_device:Pwl_data_device; serial:Tuint32_t; surface:Pwl_surface; x:Twl_fixed_t;
                    y:Twl_fixed_t; id:Pwl_data_offer);cdecl;
      leave : procedure (data:pointer; wl_data_device:Pwl_data_device);cdecl;
      motion : procedure (data:pointer; wl_data_device:Pwl_data_device; time:Tuint32_t; x:Twl_fixed_t; y:Twl_fixed_t);cdecl;
      drop : procedure (data:pointer; wl_data_device:Pwl_data_device);cdecl;
      selection : procedure (data:pointer; wl_data_device:Pwl_data_device; id:Pwl_data_offer);cdecl;
    end;

const
  WL_DATA_DEVICE_START_DRAG_ = 0;
  WL_DATA_DEVICE_SET_SELECTION_ = 1;
  WL_DATA_DEVICE_RELEASE_ = 2;
  WL_DATA_DEVICE_DATA_OFFER_SINCE_VERSION = 1;
  WL_DATA_DEVICE_ENTER_SINCE_VERSION = 1;
  WL_DATA_DEVICE_LEAVE_SINCE_VERSION = 1;
  WL_DATA_DEVICE_MOTION_SINCE_VERSION = 1;
  WL_DATA_DEVICE_DROP_SINCE_VERSION = 1;
  WL_DATA_DEVICE_SELECTION_SINCE_VERSION = 1;
  WL_DATA_DEVICE_START_DRAG_SINCE_VERSION = 1;
  WL_DATA_DEVICE_SET_SELECTION_SINCE_VERSION = 1;
  WL_DATA_DEVICE_RELEASE_SINCE_VERSION = 2;
type
  Twl_data_device_manager_dnd_action =  Longint;
  Const
    WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE = 0;
    WL_DATA_DEVICE_MANAGER_DND_ACTION_COPY = 1;
    WL_DATA_DEVICE_MANAGER_DND_ACTION_MOVE = 2;
    WL_DATA_DEVICE_MANAGER_DND_ACTION_ASK = 4;

  WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE_ = 0;
  WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE_ = 1;
  WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE_SINCE_VERSION = 1;
  WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE_SINCE_VERSION = 1;
type
  Twl_shell_error =  Longint;
  Const
    WL_SHELL_ERROR_ROLE = 0;

  WL_SHELL_GET_SHELL_SURFACE_ = 0;
  WL_SHELL_GET_SHELL_SURFACE_SINCE_VERSION = 1;
type
  Twl_shell_surface_resize =  Longint;
  Const
    WL_SHELL_SURFACE_RESIZE_NONE = 0;
    WL_SHELL_SURFACE_RESIZE_TOP = 1;
    WL_SHELL_SURFACE_RESIZE_BOTTOM = 2;
    WL_SHELL_SURFACE_RESIZE_LEFT = 4;
    WL_SHELL_SURFACE_RESIZE_TOP_LEFT = 5;
    WL_SHELL_SURFACE_RESIZE_BOTTOM_LEFT = 6;
    WL_SHELL_SURFACE_RESIZE_RIGHT = 8;
    WL_SHELL_SURFACE_RESIZE_TOP_RIGHT = 9;
    WL_SHELL_SURFACE_RESIZE_BOTTOM_RIGHT = 10;

type
  Twl_shell_surface_transient =  Longint;
  Const
    WL_SHELL_SURFACE_TRANSIENT_INACTIVE = $1;

type
  Twl_shell_surface_fullscreen_method =  Longint;
  Const
    WL_SHELL_SURFACE_FULLSCREEN_METHOD_DEFAULT = 0;
    WL_SHELL_SURFACE_FULLSCREEN_METHOD_SCALE = 1;
    WL_SHELL_SURFACE_FULLSCREEN_METHOD_DRIVER = 2;
    WL_SHELL_SURFACE_FULLSCREEN_METHOD_FILL = 3;

type
  Pwl_shell_surface_listener = ^Twl_shell_surface_listener;
  Twl_shell_surface_listener = record
      ping : procedure (data:pointer; wl_shell_surface:Pwl_shell_surface; serial:Tuint32_t);cdecl;
      configure : procedure (data:pointer; wl_shell_surface:Pwl_shell_surface; edges:Tuint32_t; width:Tint32_t; height:Tint32_t);cdecl;
      popup_done : procedure (data:pointer; wl_shell_surface:Pwl_shell_surface);cdecl;
    end;

const
  WL_SHELL_SURFACE_PONG_ = 0;
  WL_SHELL_SURFACE_MOVE_ = 1;
  WL_SHELL_SURFACE_RESIZE_ = 2;
  WL_SHELL_SURFACE_SET_TOPLEVEL_ = 3;
  WL_SHELL_SURFACE_SET_TRANSIENT_ = 4;
  WL_SHELL_SURFACE_SET_FULLSCREEN_ = 5;
  WL_SHELL_SURFACE_SET_POPUP_ = 6;
  WL_SHELL_SURFACE_SET_MAXIMIZED_ = 7;
  WL_SHELL_SURFACE_SET_TITLE_ = 8;
  WL_SHELL_SURFACE_SET_CLASS_ = 9;
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
type
  Twl_surface_error =  Longint;
  Const
    WL_SURFACE_ERROR_INVALID_SCALE = 0;
    WL_SURFACE_ERROR_INVALID_TRANSFORM = 1;
    WL_SURFACE_ERROR_INVALID_SIZE = 2;
    WL_SURFACE_ERROR_INVALID_OFFSET = 3;
    WL_SURFACE_ERROR_DEFUNCT_ROLE_OBJECT = 4;

type
  Pwl_surface_listener = ^Twl_surface_listener;
  Twl_surface_listener = record
      enter : procedure (data:pointer; wl_surface:Pwl_surface; output:Pwl_output);cdecl;
      leave : procedure (data:pointer; wl_surface:Pwl_surface; output:Pwl_output);cdecl;
      preferred_buffer_scale : procedure (data:pointer; wl_surface:Pwl_surface; factor:Tint32_t);cdecl;
      preferred_buffer_transform : procedure (data:pointer; wl_surface:Pwl_surface; transform:Tuint32_t);cdecl;
    end;

const
  WL_SURFACE_DESTROY_ = 0;
  WL_SURFACE_ATTACH_ = 1;
  WL_SURFACE_DAMAGE_ = 2;
  WL_SURFACE_FRAME_ = 3;
  WL_SURFACE_SET_OPAQUE_REGION_ = 4;
  WL_SURFACE_SET_INPUT_REGION_ = 5;
  WL_SURFACE_COMMIT_ = 6;
  WL_SURFACE_SET_BUFFER_TRANSFORM_ = 7;
  WL_SURFACE_SET_BUFFER_SCALE_ = 8;
  WL_SURFACE_DAMAGE_BUFFER_ = 9;
  WL_SURFACE_OFFSET_ = 10;
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
type
  Twl_seat_capability =  Longint;
  Const
    WL_SEAT_CAPABILITY_POINTER = 1;
    WL_SEAT_CAPABILITY_KEYBOARD = 2;
    WL_SEAT_CAPABILITY_TOUCH = 4;

type
  Twl_seat_error =  Longint;
  Const
    WL_SEAT_ERROR_MISSING_CAPABILITY = 0;

type
  Pwl_seat_listener = ^Twl_seat_listener;
  Twl_seat_listener = record
      capabilities : procedure (data:pointer; wl_seat:Pwl_seat; capabilities:Tuint32_t);cdecl;
      name : procedure (data:pointer; wl_seat:Pwl_seat; name:Pchar);cdecl;
    end;

const
  WL_SEAT_GET_POINTER_ = 0;
  WL_SEAT_GET_KEYBOARD_ = 1;
  WL_SEAT_GET_TOUCH_ = 2;
  WL_SEAT_RELEASE_ = 3;
  WL_SEAT_CAPABILITIES_SINCE_VERSION = 1;
  WL_SEAT_NAME_SINCE_VERSION = 2;
  WL_SEAT_GET_POINTER_SINCE_VERSION = 1;
  WL_SEAT_GET_KEYBOARD_SINCE_VERSION = 1;
  WL_SEAT_GET_TOUCH_SINCE_VERSION = 1;
  WL_SEAT_RELEASE_SINCE_VERSION = 5;
type
  Twl_pointer_error =  Longint;
  Const
    WL_POINTER_ERROR_ROLE = 0;

type
  Twl_pointer_button_state =  Longint;
  Const
    WL_POINTER_BUTTON_STATE_RELEASED = 0;
    WL_POINTER_BUTTON_STATE_PRESSED = 1;

type
  Twl_pointer_axis =  Longint;
  Const
    WL_POINTER_AXIS_VERTICAL_SCROLL = 0;
    WL_POINTER_AXIS_HORIZONTAL_SCROLL = 1;

type
  Twl_pointer_axis_source =  Longint;
  Const
    WL_POINTER_AXIS_SOURCE_WHEEL = 0;
    WL_POINTER_AXIS_SOURCE_FINGER = 1;
    WL_POINTER_AXIS_SOURCE_CONTINUOUS = 2;
    WL_POINTER_AXIS_SOURCE_WHEEL_TILT = 3;

  WL_POINTER_AXIS_SOURCE_WHEEL_TILT_SINCE_VERSION = 6;
type
  Twl_pointer_axis_relative_direction =  Longint;
  Const
    WL_POINTER_AXIS_RELATIVE_DIRECTION_IDENTICAL = 0;
    WL_POINTER_AXIS_RELATIVE_DIRECTION_INVERTED = 1;

type
  Pwl_pointer_listener = ^Twl_pointer_listener;
  Twl_pointer_listener = record
      enter : procedure (data:pointer; wl_pointer:Pwl_pointer; serial:Tuint32_t; surface:Pwl_surface; surface_x:Twl_fixed_t;
                    surface_y:Twl_fixed_t);cdecl;
      leave : procedure (data:pointer; wl_pointer:Pwl_pointer; serial:Tuint32_t; surface:Pwl_surface);cdecl;
      motion : procedure (data:pointer; wl_pointer:Pwl_pointer; time:Tuint32_t; surface_x:Twl_fixed_t; surface_y:Twl_fixed_t);cdecl;
      button : procedure (data:pointer; wl_pointer:Pwl_pointer; serial:Tuint32_t; time:Tuint32_t; button:Tuint32_t;
                    state:Tuint32_t);cdecl;
      axis : procedure (data:pointer; wl_pointer:Pwl_pointer; time:Tuint32_t; axis:Tuint32_t; value:Twl_fixed_t);cdecl;
      frame : procedure (data:pointer; wl_pointer:Pwl_pointer);cdecl;
      axis_source : procedure (data:pointer; wl_pointer:Pwl_pointer; axis_source:Tuint32_t);cdecl;
      axis_stop : procedure (data:pointer; wl_pointer:Pwl_pointer; time:Tuint32_t; axis:Tuint32_t);cdecl;
      axis_discrete : procedure (data:pointer; wl_pointer:Pwl_pointer; axis:Tuint32_t; discrete:Tint32_t);cdecl;
      axis_value120 : procedure (data:pointer; wl_pointer:Pwl_pointer; axis:Tuint32_t; value120:Tint32_t);cdecl;
      axis_relative_direction : procedure (data:pointer; wl_pointer:Pwl_pointer; axis:Tuint32_t; direction:Tuint32_t);cdecl;
    end;

const
  WL_POINTER_SET_CURSOR_ = 0;
  WL_POINTER_RELEASE_ = 1;
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
type
  Twl_keyboard_keymap_format =  Longint;
  Const
    WL_KEYBOARD_KEYMAP_FORMAT_NO_KEYMAP = 0;
    WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1 = 1;

type
  Twl_keyboard_key_state =  Longint;
  Const
    WL_KEYBOARD_KEY_STATE_RELEASED = 0;
    WL_KEYBOARD_KEY_STATE_PRESSED = 1;

type
  Pwl_keyboard_listener = ^Twl_keyboard_listener;
  Twl_keyboard_listener = record
      keymap : procedure (data:pointer; wl_keyboard:Pwl_keyboard; format:Tuint32_t; fd:Tint32_t; size:Tuint32_t);cdecl;
      enter : procedure (data:pointer; wl_keyboard:Pwl_keyboard; serial:Tuint32_t; surface:Pwl_surface; keys:Pwl_array);cdecl;
      leave : procedure (data:pointer; wl_keyboard:Pwl_keyboard; serial:Tuint32_t; surface:Pwl_surface);cdecl;
      key : procedure (data:pointer; wl_keyboard:Pwl_keyboard; serial:Tuint32_t; time:Tuint32_t; key:Tuint32_t;
                    state:Tuint32_t);cdecl;
      modifiers : procedure (data:pointer; wl_keyboard:Pwl_keyboard; serial:Tuint32_t; mods_depressed:Tuint32_t; mods_latched:Tuint32_t;
                    mods_locked:Tuint32_t; group:Tuint32_t);cdecl;
      repeat_info : procedure (data:pointer; wl_keyboard:Pwl_keyboard; rate:Tint32_t; delay:Tint32_t);cdecl;
    end;

           const
  WL_KEYBOARD_RELEASE_ = 0;
  WL_KEYBOARD_KEYMAP_SINCE_VERSION = 1;
  WL_KEYBOARD_ENTER_SINCE_VERSION = 1;
  WL_KEYBOARD_LEAVE_SINCE_VERSION = 1;
  WL_KEYBOARD_KEY_SINCE_VERSION = 1;
  WL_KEYBOARD_MODIFIERS_SINCE_VERSION = 1;
  WL_KEYBOARD_REPEAT_INFO_SINCE_VERSION = 4;
  WL_KEYBOARD_RELEASE_SINCE_VERSION = 3;
type
  Pwl_touch_listener = ^Twl_touch_listener;
  Twl_touch_listener = record
      down : procedure (data:pointer; wl_touch:Pwl_touch; serial:Tuint32_t; time:Tuint32_t; surface:Pwl_surface;
                    id:Tint32_t; x:Twl_fixed_t; y:Twl_fixed_t);cdecl;
      up : procedure (data:pointer; wl_touch:Pwl_touch; serial:Tuint32_t; time:Tuint32_t; id:Tint32_t);cdecl;
      motion : procedure (data:pointer; wl_touch:Pwl_touch; time:Tuint32_t; id:Tint32_t; x:Twl_fixed_t;
                    y:Twl_fixed_t);cdecl;
      frame : procedure (data:pointer; wl_touch:Pwl_touch);cdecl;
      cancel : procedure (data:pointer; wl_touch:Pwl_touch);cdecl;
      shape : procedure (data:pointer; wl_touch:Pwl_touch; id:Tint32_t; major:Twl_fixed_t; minor:Twl_fixed_t);cdecl;
      orientation : procedure (data:pointer; wl_touch:Pwl_touch; id:Tint32_t; orientation:Twl_fixed_t);cdecl;
    end;

const
  WL_TOUCH_RELEASE_ = 0;
  WL_TOUCH_DOWN_SINCE_VERSION = 1;
  WL_TOUCH_UP_SINCE_VERSION = 1;
  WL_TOUCH_MOTION_SINCE_VERSION = 1;
  WL_TOUCH_FRAME_SINCE_VERSION = 1;
  WL_TOUCH_CANCEL_SINCE_VERSION = 1;
  WL_TOUCH_SHAPE_SINCE_VERSION = 6;
  WL_TOUCH_ORIENTATION_SINCE_VERSION = 6;
  WL_TOUCH_RELEASE_SINCE_VERSION = 3;
type
  Twl_output_subpixel =  Longint;
  Const
    WL_OUTPUT_SUBPIXEL_UNKNOWN = 0;
    WL_OUTPUT_SUBPIXEL_NONE = 1;
    WL_OUTPUT_SUBPIXEL_HORIZONTAL_RGB = 2;
    WL_OUTPUT_SUBPIXEL_HORIZONTAL_BGR = 3;
    WL_OUTPUT_SUBPIXEL_VERTICAL_RGB = 4;
    WL_OUTPUT_SUBPIXEL_VERTICAL_BGR = 5;

type
  Twl_output_transform =  Longint;
  Const
    WL_OUTPUT_TRANSFORM_NORMAL = 0;
    WL_OUTPUT_TRANSFORM_90 = 1;
    WL_OUTPUT_TRANSFORM_180 = 2;
    WL_OUTPUT_TRANSFORM_270 = 3;
    WL_OUTPUT_TRANSFORM_FLIPPED = 4;
    WL_OUTPUT_TRANSFORM_FLIPPED_90 = 5;
    WL_OUTPUT_TRANSFORM_FLIPPED_180 = 6;
    WL_OUTPUT_TRANSFORM_FLIPPED_270 = 7;

type
  Twl_output_mode =  Longint;
  Const
    WL_OUTPUT_MODE_CURRENT = $1;
    WL_OUTPUT_MODE_PREFERRED = $2;

type
  Pwl_output_listener = ^Twl_output_listener;
  Twl_output_listener = record
      geometry : procedure (data:pointer; wl_output:Pwl_output; x:Tint32_t; y:Tint32_t; physical_width:Tint32_t;
                    physical_height:Tint32_t; subpixel:Tint32_t; make:Pchar; model:Pchar; transform:Tint32_t);cdecl;
      mode : procedure (data:pointer; wl_output:Pwl_output; flags:Tuint32_t; width:Tint32_t; height:Tint32_t;
                    refresh:Tint32_t);cdecl;
      done : procedure (data:pointer; wl_output:Pwl_output);cdecl;
      scale : procedure (data:pointer; wl_output:Pwl_output; factor:Tint32_t);cdecl;
      name : procedure (data:pointer; wl_output:Pwl_output; name:Pchar);cdecl;
      description : procedure (data:pointer; wl_output:Pwl_output; description:Pchar);cdecl;
    end;

const
  WL_OUTPUT_RELEASE = 0;
  WL_OUTPUT_GEOMETRY_SINCE_VERSION = 1;
  WL_OUTPUT_MODE_SINCE_VERSION = 1;
  WL_OUTPUT_DONE_SINCE_VERSION = 2;
  WL_OUTPUT_SCALE_SINCE_VERSION = 2;
  WL_OUTPUT_NAME_SINCE_VERSION = 4;
  WL_OUTPUT_DESCRIPTION_SINCE_VERSION = 4;
  WL_OUTPUT_RELEASE_SINCE_VERSION = 3;
  WL_REGION_DESTROY = 0;
  WL_REGION_ADD = 1;
  WL_REGION_SUBTRACT = 2;
  WL_REGION_DESTROY_SINCE_VERSION = 1;
  WL_REGION_ADD_SINCE_VERSION = 1;
  WL_REGION_SUBTRACT_SINCE_VERSION = 1;
type
  Twl_subcompositor_error =  Longint;
  Const
    WL_SUBCOMPOSITOR_ERROR_BAD_SURFACE = 0;
    WL_SUBCOMPOSITOR_ERROR_BAD_PARENT = 1;

  WL_SUBCOMPOSITOR_DESTROY_SINCE_VERSION = 1;
  WL_SUBCOMPOSITOR_GET_SUBSURFACE_SINCE_VERSION = 1;
type
  Twl_subsurface_error =  Longint;
  Const
    WL_SUBSURFACE_ERROR_BAD_SURFACE = 0;

  WL_SUBSURFACE_DESTROY = 0;
  WL_SUBSURFACE_SET_POSITION = 1;
  WL_SUBSURFACE_PLACE_ABOVE = 2;
  WL_SUBSURFACE_PLACE_BELOW = 3;
  WL_SUBSURFACE_SET_SYNC = 4;
  WL_SUBSURFACE_SET_DESYNC = 5;
  WL_SUBSURFACE_DESTROY_SINCE_VERSION = 1;
  WL_SUBSURFACE_SET_POSITION_SINCE_VERSION = 1;
  WL_SUBSURFACE_PLACE_ABOVE_SINCE_VERSION = 1;
  WL_SUBSURFACE_PLACE_BELOW_SINCE_VERSION = 1;
  WL_SUBSURFACE_SET_SYNC_SINCE_VERSION = 1;
  WL_SUBSURFACE_SET_DESYNC_SINCE_VERSION = 1;

// === Konventiert am: 9-6-26 16:36:17 ===

type
  PTwl_display=Pointer;
  PTwl_display_listener=Pointer;
  PTwl_callback=Pointer;
  PTwl_registry=Pointer;
  PTwl_registry_listener=Pointer;
  PTwl_interface=Pointer;
  PTwl_callback_listener=Pointer;
  PTwl_compositor=Pointer;
  PTwl_surface=Pointer;
  PTwl_region=Pointer;
  PTwl_shm_pool=Pointer;
  PTwl_buffer=Pointer;
  PTwl_shm=Pointer;
  PTwl_shm_listener=Pointer;
  PTwl_buffer_listener=Pointer;
  PTwl_data_offer=Pointer;
  PTwl_data_offer_listener=Pointer;
  PTwl_data_source=Pointer;
  PTwl_data_source_listener=Pointer;
  PTwl_data_device=Pointer;
  PTwl_data_device_listener=Pointer;
  PTwl_data_device_manager=Pointer;
  PTwl_seat=Pointer;
  PTwl_shell=Pointer;
  PTwl_shell_surface=Pointer;
  PTwl_shell_surface_listener=Pointer;
  PTwl_output=Pointer;
  PTwl_surface_listener=Pointer;
  PTwl_seat_listener=Pointer;
  PTwl_pointer=Pointer;
  PTwl_keyboard=Pointer;
  PTwl_touch=Pointer;
  PTwl_pointer_listener=Pointer;
  PTwl_keyboard_listener=Pointer;
  PTwl_touch_listener=Pointer;

function wl_display_add_listener(wl_display: PTwl_display; listener: PTwl_display_listener; data: Pointer): Integer; inline;
procedure wl_display_set_user_data(wl_display: PTwl_display; user_data: Pointer); inline;
function wl_display_get_user_data(wl_display: PTwl_display): Pointer; inline;
function wl_display_get_version(wl_display: PTwl_display): Tuint32_t; inline;
function wl_display_sync(wl_display: PTwl_display): PTwl_callback; inline;
function wl_display_get_registry(wl_display: PTwl_display): PTwl_registry; inline;
function wl_registry_add_listener(wl_registry: PTwl_registry; listener: PTwl_registry_listener; data: Pointer): Integer; inline;
procedure wl_registry_set_user_data(wl_registry: PTwl_registry; user_data: Pointer); inline;
function wl_registry_get_user_data(wl_registry: PTwl_registry): Pointer; inline;
function wl_registry_get_version(wl_registry: PTwl_registry): Tuint32_t; inline;
procedure wl_registry_destroy(wl_registry: PTwl_registry); inline;
function wl_registry_bind(wl_registry: PTwl_registry; name: Tuint32_t; interface_: PTwl_interface; version: Tuint32_t): Pointer; inline;
function wl_callback_add_listener(wl_callback: PTwl_callback; listener: PTwl_callback_listener; data: Pointer): Integer; inline;
procedure wl_callback_set_user_data(wl_callback: PTwl_callback; user_data: Pointer); inline;
function wl_callback_get_user_data(wl_callback: PTwl_callback): Pointer; inline;
function wl_callback_get_version(wl_callback: PTwl_callback): Tuint32_t; inline;
procedure wl_callback_destroy(wl_callback: PTwl_callback); inline;
procedure wl_compositor_set_user_data(wl_compositor: PTwl_compositor; user_data: Pointer); inline;
function wl_compositor_get_user_data(wl_compositor: PTwl_compositor): Pointer; inline;
function wl_compositor_get_version(wl_compositor: PTwl_compositor): Tuint32_t; inline;
procedure wl_compositor_destroy(wl_compositor: PTwl_compositor); inline;
function wl_compositor_create_surface(wl_compositor: PTwl_compositor): PTwl_surface; inline;
function wl_compositor_create_region(wl_compositor: PTwl_compositor): PTwl_region; inline;
procedure wl_shm_pool_set_user_data(wl_shm_pool: PTwl_shm_pool; user_data: Pointer); inline;
function wl_shm_pool_get_user_data(wl_shm_pool: PTwl_shm_pool): Pointer; inline;
function wl_shm_pool_get_version(wl_shm_pool: PTwl_shm_pool): Tuint32_t; inline;
function wl_shm_pool_create_buffer(wl_shm_pool: PTwl_shm_pool; offset, width, height, stride: Tint32_t; format: Tuint32_t): PTwl_buffer; inline;
procedure wl_shm_pool_destroy(wl_shm_pool: PTwl_shm_pool); inline;
procedure wl_shm_pool_resize(wl_shm_pool: PTwl_shm_pool; size: Tint32_t); inline;
function wl_shm_add_listener(wl_shm: PTwl_shm; listener: PTwl_shm_listener; data: Pointer): Integer; inline;
procedure wl_shm_set_user_data(wl_shm: PTwl_shm; user_data: Pointer); inline;
function wl_shm_get_user_data(wl_shm: PTwl_shm): Pointer; inline;
function wl_shm_get_version(wl_shm: PTwl_shm): Tuint32_t; inline;
procedure wl_shm_destroy(wl_shm: PTwl_shm); inline;
function wl_shm_create_pool(wl_shm: PTwl_shm; fd: Tint32_t; size: Tint32_t): PTwl_shm_pool; inline;
function wl_buffer_add_listener(wl_buffer: PTwl_buffer; listener: PTwl_buffer_listener; data: Pointer): Integer; inline;
procedure wl_buffer_set_user_data(wl_buffer: PTwl_buffer; user_data: Pointer); inline;
function wl_buffer_get_user_data(wl_buffer: PTwl_buffer): Pointer; inline;
function wl_buffer_get_version(wl_buffer: PTwl_buffer): Tuint32_t; inline;
procedure wl_buffer_destroy(wl_buffer: PTwl_buffer); inline;
function wl_data_offer_add_listener(wl_data_offer: PTwl_data_offer; listener: PTwl_data_offer_listener; data: Pointer): Integer; inline;
procedure wl_data_offer_set_user_data(wl_data_offer: PTwl_data_offer; user_data: Pointer); inline;
function wl_data_offer_get_user_data(wl_data_offer: PTwl_data_offer): Pointer; inline;
function wl_data_offer_get_version(wl_data_offer: PTwl_data_offer): Tuint32_t; inline;
procedure wl_data_offer_accept(wl_data_offer: PTwl_data_offer; serial: Tuint32_t; mime_type: PChar); inline;
procedure wl_data_offer_receive(wl_data_offer: PTwl_data_offer; mime_type: PChar; fd: Tint32_t); inline;
procedure wl_data_offer_destroy(wl_data_offer: PTwl_data_offer); inline;
procedure wl_data_offer_finish(wl_data_offer: PTwl_data_offer); inline;
procedure wl_data_offer_set_actions(wl_data_offer: PTwl_data_offer; dnd_actions: Tuint32_t; preferred_action: Tuint32_t); inline;
function wl_data_source_add_listener(wl_data_source: PTwl_data_source; listener: PTwl_data_source_listener; data: Pointer): Integer; inline;
procedure wl_data_source_set_user_data(wl_data_source: PTwl_data_source; user_data: Pointer); inline;
function wl_data_source_get_user_data(wl_data_source: PTwl_data_source): Pointer; inline;
function wl_data_source_get_version(wl_data_source: PTwl_data_source): Tuint32_t; inline;
procedure wl_data_source_offer(wl_data_source: PTwl_data_source; mime_type: PChar); inline;
procedure wl_data_source_destroy(wl_data_source: PTwl_data_source); inline;
procedure wl_data_source_set_actions(wl_data_source: PTwl_data_source; dnd_actions: Tuint32_t); inline;
function wl_data_device_add_listener(wl_data_device: PTwl_data_device; listener: PTwl_data_device_listener; data: Pointer): Integer; inline;
procedure wl_data_device_set_user_data(wl_data_device: PTwl_data_device; user_data: Pointer); inline;
function wl_data_device_get_user_data(wl_data_device: PTwl_data_device): Pointer; inline;
function wl_data_device_get_version(wl_data_device: PTwl_data_device): Tuint32_t; inline;
procedure wl_data_device_destroy(wl_data_device: PTwl_data_device); inline;
procedure wl_data_device_start_drag(wl_data_device: PTwl_data_device; source: PTwl_data_source; origin: PTwl_surface; icon: PTwl_surface; serial: Tuint32_t); inline;
procedure wl_data_device_set_selection(wl_data_device: PTwl_data_device; source: PTwl_data_source; serial: Tuint32_t); inline;
procedure wl_data_device_release(wl_data_device: PTwl_data_device); inline;
procedure wl_data_device_manager_set_user_data(wl_data_device_manager: PTwl_data_device_manager; user_data: Pointer); inline;
function wl_data_device_manager_get_user_data(wl_data_device_manager: PTwl_data_device_manager): Pointer; inline;
function wl_data_device_manager_get_version(wl_data_device_manager: PTwl_data_device_manager): Tuint32_t; inline;
procedure wl_data_device_manager_destroy(wl_data_device_manager: PTwl_data_device_manager); inline;
function wl_data_device_manager_create_data_source(wl_data_device_manager: PTwl_data_device_manager): PTwl_data_source; inline;
function wl_data_device_manager_get_data_device(wl_data_device_manager: PTwl_data_device_manager; seat: PTwl_seat): PTwl_data_device; inline;
procedure wl_shell_set_user_data(wl_shell: PTwl_shell; user_data: Pointer); inline;
function wl_shell_get_user_data(wl_shell: PTwl_shell): Pointer; inline;
function wl_shell_get_version(wl_shell: PTwl_shell): Tuint32_t; inline;
procedure wl_shell_destroy(wl_shell: PTwl_shell); inline;
function wl_shell_get_shell_surface(wl_shell: PTwl_shell; surface: PTwl_surface): PTwl_shell_surface; inline;
function wl_shell_surface_add_listener(wl_shell_surface: PTwl_shell_surface; listener: PTwl_shell_surface_listener; data: Pointer): Integer; inline;
procedure wl_shell_surface_set_user_data(wl_shell_surface: PTwl_shell_surface; user_data: Pointer); inline;
function wl_shell_surface_get_user_data(wl_shell_surface: PTwl_shell_surface): Pointer; inline;
function wl_shell_surface_get_version(wl_shell_surface: PTwl_shell_surface): Tuint32_t; inline;
procedure wl_shell_surface_destroy(wl_shell_surface: PTwl_shell_surface); inline;
procedure wl_shell_surface_pong(wl_shell_surface: PTwl_shell_surface; serial: Tuint32_t); inline;
procedure wl_shell_surface_move(wl_shell_surface: PTwl_shell_surface; seat: PTwl_seat; serial: Tuint32_t); inline;
procedure wl_shell_surface_resize(wl_shell_surface: PTwl_shell_surface; seat: PTwl_seat; serial: Tuint32_t; edges: Tuint32_t); inline;
procedure wl_shell_surface_set_toplevel(wl_shell_surface: PTwl_shell_surface); inline;
procedure wl_shell_surface_set_transient(wl_shell_surface: PTwl_shell_surface; parent: PTwl_surface; x: Tint32_t; y: Tint32_t; flags: Tuint32_t); inline;
procedure wl_shell_surface_set_fullscreen(wl_shell_surface: PTwl_shell_surface; method: Tuint32_t; framerate: Tuint32_t; output: PTwl_output); inline;
procedure wl_shell_surface_set_popup(wl_shell_surface: PTwl_shell_surface; seat: PTwl_seat; serial: Tuint32_t; parent: PTwl_surface; x: Tint32_t; y: Tint32_t; flags: Tuint32_t); inline;
procedure wl_shell_surface_set_maximized(wl_shell_surface: PTwl_shell_surface; output: PTwl_output); inline;
procedure wl_shell_surface_set_title(wl_shell_surface: PTwl_shell_surface; title: PChar); inline;
procedure wl_shell_surface_set_class(wl_shell_surface: PTwl_shell_surface; class_: PChar); inline;
function wl_surface_add_listener(wl_surface: PTwl_surface; listener: PTwl_surface_listener; data: Pointer): Integer; inline;
procedure wl_surface_set_user_data(wl_surface: PTwl_surface; user_data: Pointer); inline;
function wl_surface_get_user_data(wl_surface: PTwl_surface): Pointer; inline;
function wl_surface_get_version(wl_surface: PTwl_surface): Tuint32_t; inline;
procedure wl_surface_destroy(wl_surface: PTwl_surface); inline;
procedure wl_surface_attach(wl_surface: PTwl_surface; buffer: PTwl_buffer; x, y: Tint32_t); inline;
procedure wl_surface_damage(wl_surface: PTwl_surface; x, y, width, height: Tint32_t); inline;
function wl_surface_frame(wl_surface: PTwl_surface): PTwl_callback; inline;
procedure wl_surface_set_opaque_region(wl_surface: PTwl_surface; region: PTwl_region); inline;
procedure wl_surface_set_input_region(wl_surface: PTwl_surface; region: PTwl_region); inline;
procedure wl_surface_commit(wl_surface: PTwl_surface); inline;
procedure wl_surface_set_buffer_transform(wl_surface: PTwl_surface; transform: Tint32_t); inline;
procedure wl_surface_set_buffer_scale(wl_surface: PTwl_surface; scale: Tint32_t); inline;
procedure wl_surface_damage_buffer(wl_surface: PTwl_surface; x, y, width, height: Tint32_t); inline;
procedure wl_surface_offset(wl_surface: PTwl_surface; x, y: Tint32_t); inline;
function wl_seat_add_listener(wl_seat: PTwl_seat; listener: PTwl_seat_listener; data: Pointer): Integer; inline;
procedure wl_seat_set_user_data(wl_seat: PTwl_seat; user_data: Pointer); inline;
function wl_seat_get_user_data(wl_seat: PTwl_seat): Pointer; inline;
function wl_seat_get_version(wl_seat: PTwl_seat): Tuint32_t; inline;
procedure wl_seat_destroy(wl_seat: PTwl_seat); inline;
function wl_seat_get_pointer(wl_seat: PTwl_seat): PTwl_pointer; inline;
function wl_seat_get_keyboard(wl_seat: PTwl_seat): PTwl_keyboard; inline;
function wl_seat_get_touch(wl_seat: PTwl_seat): PTwl_touch; inline;
procedure wl_seat_release(wl_seat: PTwl_seat); inline;
function wl_pointer_add_listener(wl_pointer: PTwl_pointer; listener: PTwl_pointer_listener; data: Pointer): Integer; inline;
procedure wl_pointer_set_user_data(wl_pointer: PTwl_pointer; user_data: Pointer); inline;
function wl_pointer_get_user_data(wl_pointer: PTwl_pointer): Pointer; inline;
function wl_pointer_get_version(wl_pointer: PTwl_pointer): Tuint32_t; inline;
procedure wl_pointer_destroy(wl_pointer: PTwl_pointer); inline;
procedure wl_pointer_set_cursor(wl_pointer: PTwl_pointer; serial: Tuint32_t; surface: PTwl_surface; hotspot_x, hotspot_y: Tint32_t); inline;
procedure wl_pointer_release(wl_pointer: PTwl_pointer); inline;
function wl_keyboard_add_listener(wl_keyboard: PTwl_keyboard; listener: PTwl_keyboard_listener; data: Pointer): Integer; inline;
procedure wl_keyboard_set_user_data(wl_keyboard: PTwl_keyboard; user_data: Pointer); inline;
function wl_keyboard_get_user_data(wl_keyboard: PTwl_keyboard): Pointer; inline;
function wl_keyboard_get_version(wl_keyboard: PTwl_keyboard): Tuint32_t; inline;
procedure wl_keyboard_destroy(wl_keyboard: PTwl_keyboard); inline;
procedure wl_keyboard_release(wl_keyboard: PTwl_keyboard); inline;
function wl_touch_add_listener(wl_touch: PTwl_touch; listener: PTwl_touch_listener; data: Pointer): Integer; inline;
procedure wl_touch_set_user_data(wl_touch: PTwl_touch; user_data: Pointer); inline;
function wl_touch_get_user_data(wl_touch: PTwl_touch): Pointer; inline;
function wl_touch_get_version(wl_touch: PTwl_touch): Tuint32_t; inline;
procedure wl_touch_destroy(wl_touch: PTwl_touch); inline;
procedure wl_touch_release(wl_touch: PTwl_touch); inline;
function wl_output_add_listener(wl_output: PTwl_output; listener: PTwl_output_listener; data: Pointer): Integer; inline;
procedure wl_output_set_user_data(wl_output: PTwl_output; user_data: Pointer); inline;
function wl_output_get_user_data(wl_output: PTwl_output): Pointer; inline;
function wl_output_get_version(wl_output: PTwl_output): Tuint32_t; inline;
procedure wl_output_destroy(wl_output: PTwl_output); inline;
procedure wl_output_release(wl_output: PTwl_output); inline;
procedure wl_region_set_user_data(wl_region: PTwl_region; user_data: Pointer); inline;
function wl_region_get_user_data(wl_region: PTwl_region): Pointer; inline;
function wl_region_get_version(wl_region: PTwl_region): Tuint32_t; inline;
procedure wl_region_destroy(wl_region: PTwl_region); inline;
procedure wl_region_add(wl_region: PTwl_region; x, y, width, height: Tint32_t); inline;
procedure wl_region_subtract(wl_region: PTwl_region; x, y, width, height: Tint32_t); inline;
procedure wl_subcompositor_set_user_data(wl_subcompositor: PTwl_subcompositor; user_data: Pointer); inline;
function wl_subcompositor_get_user_data(wl_subcompositor: PTwl_subcompositor): Pointer; inline;
function wl_subcompositor_get_version(wl_subcompositor: PTwl_subcompositor): Tuint32_t; inline;
procedure wl_subcompositor_destroy(wl_subcompositor: PTwl_subcompositor); inline;
function wl_subcompositor_get_subsurface(wl_subcompositor: PTwl_subcompositor; surface: PTwl_surface; parent: PTwl_surface): PTwl_subsurface; inline;
procedure wl_subsurface_set_user_data(wl_subsurface: PTwl_subsurface; user_data: Pointer); inline;
function wl_subsurface_get_user_data(wl_subsurface: PTwl_subsurface): Pointer; inline;
function wl_subsurface_get_version(wl_subsurface: PTwl_subsurface): Tuint32_t; inline;
procedure wl_subsurface_destroy(wl_subsurface: PTwl_subsurface); inline;
procedure wl_subsurface_set_position(wl_subsurface: PTwl_subsurface; x, y: Tint32_t); inline;
procedure wl_subsurface_place_above(wl_subsurface: PTwl_subsurface; sibling: PTwl_surface); inline;
procedure wl_subsurface_place_below(wl_subsurface: PTwl_subsurface; sibling: PTwl_surface); inline;
procedure wl_subsurface_set_sync(wl_subsurface: PTwl_subsurface); inline;
procedure wl_subsurface_set_desync(wl_subsurface: PTwl_subsurface); inline;

implementation

function wl_display_add_listener(wl_display: PTwl_display; listener: PTwl_display_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_display), PPointer(listener), data);
end;

procedure wl_display_set_user_data(wl_display: PTwl_display; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_display), user_data);
end;

function wl_display_get_user_data(wl_display: PTwl_display): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_display));
end;

function wl_display_get_version(wl_display: PTwl_display): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_display));
end;

function wl_display_sync(wl_display: PTwl_display): PTwl_callback; inline;
var
  callback: PTwl_proxy;
begin
  callback := wl_proxy_marshal_flags(    PTwl_proxy(wl_display),    WL_DISPLAY_SYNC,    @wl_callback_interface,    wl_proxy_get_version(PTwl_proxy(wl_display)),    0,    nil  );
  Result := PTwl_callback(callback);
end;

function wl_display_get_registry(wl_display: PTwl_display): PTwl_registry; inline;
var
  registry: PTwl_proxy;
begin
  registry := wl_proxy_marshal_flags(    PTwl_proxy(wl_display),    WL_DISPLAY_GET_REGISTRY,    @wl_registry_interface,    wl_proxy_get_version(PTwl_proxy(wl_display)),    0,    nil  );
  Result := PTwl_registry(registry);
end;

function wl_registry_add_listener(wl_registry: PTwl_registry; listener: PTwl_registry_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_registry), PPointer(listener), data);
end;

procedure wl_registry_set_user_data(wl_registry: PTwl_registry; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_registry), user_data);
end;

function wl_registry_get_user_data(wl_registry: PTwl_registry): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_registry));
end;

function wl_registry_get_version(wl_registry: PTwl_registry): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_registry));
end;

procedure wl_registry_destroy(wl_registry: PTwl_registry); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_registry));
end;

function wl_registry_bind(wl_registry: PTwl_registry; name: Tuint32_t; interface_: PTwl_interface; version: Tuint32_t): Pointer; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_registry),    WL_REGISTRY_BIND,    interface_,    version,    0,    name,    interface_^.name,    version,    nil  );
  Result := Pointer(id);
end;

function wl_callback_add_listener(wl_callback: PTwl_callback; listener: PTwl_callback_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_callback), PPointer(listener), data);
end;

procedure wl_callback_set_user_data(wl_callback: PTwl_callback; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_callback), user_data);
end;

function wl_callback_get_user_data(wl_callback: PTwl_callback): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_callback));
end;

function wl_callback_get_version(wl_callback: PTwl_callback): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_callback));
end;

procedure wl_callback_destroy(wl_callback: PTwl_callback); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_callback));
end;

procedure wl_compositor_set_user_data(wl_compositor: PTwl_compositor; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_compositor), user_data);
end;

function wl_compositor_get_user_data(wl_compositor: PTwl_compositor): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_compositor));
end;

function wl_compositor_get_version(wl_compositor: PTwl_compositor): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_compositor));
end;

procedure wl_compositor_destroy(wl_compositor: PTwl_compositor); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_compositor));
end;

function wl_compositor_create_surface(wl_compositor: PTwl_compositor): PTwl_surface; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_compositor),    WL_COMPOSITOR_CREATE_SURFACE,    @wl_surface_interface,    wl_proxy_get_version(PTwl_proxy(wl_compositor)),    0,    nil  );
  Result := PTwl_surface(id);
end;

function wl_compositor_create_region(wl_compositor: PTwl_compositor): PTwl_region; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_compositor),    WL_COMPOSITOR_CREATE_REGION,    @wl_region_interface,    wl_proxy_get_version(PTwl_proxy(wl_compositor)),    0,    nil  );
  Result := PTwl_region(id);
end;

procedure wl_shm_pool_set_user_data(wl_shm_pool: PTwl_shm_pool; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_shm_pool), user_data);
end;

function wl_shm_pool_get_user_data(wl_shm_pool: PTwl_shm_pool): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_shm_pool));
end;

function wl_shm_pool_get_version(wl_shm_pool: PTwl_shm_pool): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_shm_pool));
end;

function wl_shm_pool_create_buffer(wl_shm_pool: PTwl_shm_pool; offset, width, height, stride: Tint32_t; format: Tuint32_t): PTwl_buffer; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_shm_pool),    WL_SHM_POOL_CREATE_BUFFER,    @wl_buffer_interface,    wl_proxy_get_version(PTwl_proxy(wl_shm_pool)),    0,    nil,    offset,    width,    height,    stride,    format  );
  Result := PTwl_buffer(id);
end;

procedure wl_shm_pool_destroy(wl_shm_pool: PTwl_shm_pool); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shm_pool),    WL_SHM_POOL_DESTROY,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shm_pool)),    WL_MARSHAL_FLAG_DESTROY  );
end;

procedure wl_shm_pool_resize(wl_shm_pool: PTwl_shm_pool; size: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shm_pool),    WL_SHM_POOL_RESIZE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shm_pool)),    0,    size  );
end;

function wl_shm_add_listener(wl_shm: PTwl_shm; listener: PTwl_shm_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_shm), PPointer(listener), data);
end;

procedure wl_shm_set_user_data(wl_shm: PTwl_shm; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_shm), user_data);
end;

function wl_shm_get_user_data(wl_shm: PTwl_shm): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_shm));
end;

function wl_shm_get_version(wl_shm: PTwl_shm): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_shm));
end;

procedure wl_shm_destroy(wl_shm: PTwl_shm); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_shm));
end;

function wl_shm_create_pool(wl_shm: PTwl_shm; fd: Tint32_t; size: Tint32_t): PTwl_shm_pool; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_shm),    WL_SHM_CREATE_POOL,    @wl_shm_pool_interface,    wl_proxy_get_version(PTwl_proxy(wl_shm)),    0,    nil,    fd,    size  );
  Result := PTwl_shm_pool(id);
end;

function wl_buffer_add_listener(wl_buffer: PTwl_buffer; listener: PTwl_buffer_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_buffer), PPointer(listener), data);
end;

procedure wl_buffer_set_user_data(wl_buffer: PTwl_buffer; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_buffer), user_data);
end;

function wl_buffer_get_user_data(wl_buffer: PTwl_buffer): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_buffer));
end;

function wl_buffer_get_version(wl_buffer: PTwl_buffer): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_buffer));
end;

procedure wl_buffer_destroy(wl_buffer: PTwl_buffer); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_buffer),    WL_BUFFER_DESTROY,    nil,    wl_proxy_get_version(PTwl_proxy(wl_buffer)),    WL_MARSHAL_FLAG_DESTROY  );
end;

function wl_data_offer_add_listener(wl_data_offer: PTwl_data_offer; listener: PTwl_data_offer_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_data_offer), PPointer(listener), data);
end;

procedure wl_data_offer_set_user_data(wl_data_offer: PTwl_data_offer; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_data_offer), user_data);
end;

function wl_data_offer_get_user_data(wl_data_offer: PTwl_data_offer): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_data_offer));
end;

function wl_data_offer_get_version(wl_data_offer: PTwl_data_offer): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_data_offer));
end;

procedure wl_data_offer_accept(wl_data_offer: PTwl_data_offer; serial: Tuint32_t; mime_type: PChar); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_offer),    WL_DATA_OFFER_ACCEPT,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_offer)),    0,    serial,    mime_type  );
end;

procedure wl_data_offer_receive(wl_data_offer: PTwl_data_offer; mime_type: PChar; fd: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_offer),    WL_DATA_OFFER_RECEIVE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_offer)),    0,    mime_type,    fd  );
end;

procedure wl_data_offer_destroy(wl_data_offer: PTwl_data_offer); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_offer),    WL_DATA_OFFER_DESTROY,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_offer)),    WL_MARSHAL_FLAG_DESTROY  );
end;

procedure wl_data_offer_finish(wl_data_offer: PTwl_data_offer); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_offer),    WL_DATA_OFFER_FINISH,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_offer)),    0  );
end;

procedure wl_data_offer_set_actions(wl_data_offer: PTwl_data_offer; dnd_actions: Tuint32_t; preferred_action: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_offer),    WL_DATA_OFFER_SET_ACTIONS,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_offer)),    0,    dnd_actions,    preferred_action  );
end;

function wl_data_source_add_listener(wl_data_source: PTwl_data_source; listener: PTwl_data_source_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_data_source), PPointer(listener), data);
end;

procedure wl_data_source_set_user_data(wl_data_source: PTwl_data_source; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_data_source), user_data);
end;

function wl_data_source_get_user_data(wl_data_source: PTwl_data_source): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_data_source));
end;

function wl_data_source_get_version(wl_data_source: PTwl_data_source): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_data_source));
end;

procedure wl_data_source_offer(wl_data_source: PTwl_data_source; mime_type: PChar); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_source),    WL_DATA_SOURCE_OFFER,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_source)),    0,    mime_type  );
end;

procedure wl_data_source_destroy(wl_data_source: PTwl_data_source); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_source),    WL_DATA_SOURCE_DESTROY,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_source)),    WL_MARSHAL_FLAG_DESTROY  );
end;

procedure wl_data_source_set_actions(wl_data_source: PTwl_data_source; dnd_actions: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_source),    WL_DATA_SOURCE_SET_ACTIONS,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_source)),    0,    dnd_actions  );
end;

function wl_data_device_add_listener(wl_data_device: PTwl_data_device; listener: PTwl_data_device_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_data_device), PPointer(listener), data);
end;

procedure wl_data_device_set_user_data(wl_data_device: PTwl_data_device; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_data_device), user_data);
end;

function wl_data_device_get_user_data(wl_data_device: PTwl_data_device): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_data_device));
end;

function wl_data_device_get_version(wl_data_device: PTwl_data_device): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_data_device));
end;

procedure wl_data_device_destroy(wl_data_device: PTwl_data_device); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_data_device));
end;

procedure wl_data_device_start_drag(wl_data_device: PTwl_data_device; source: PTwl_data_source; origin: PTwl_surface; icon: PTwl_surface; serial: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_device),    WL_DATA_DEVICE_START_DRAG,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_device)),    0,    source,    origin,    icon,    serial  );
end;

procedure wl_data_device_set_selection(wl_data_device: PTwl_data_device; source: PTwl_data_source; serial: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_device),    WL_DATA_DEVICE_SET_SELECTION,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_device)),    0,    source,    serial  );
end;

procedure wl_data_device_release(wl_data_device: PTwl_data_device); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_data_device),    WL_DATA_DEVICE_RELEASE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_data_device)),    WL_MARSHAL_FLAG_DESTROY  );
end;

procedure wl_data_device_manager_set_user_data(wl_data_device_manager: PTwl_data_device_manager; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_data_device_manager), user_data);
end;

function wl_data_device_manager_get_user_data(wl_data_device_manager: PTwl_data_device_manager): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_data_device_manager));
end;

function wl_data_device_manager_get_version(wl_data_device_manager: PTwl_data_device_manager): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_data_device_manager));
end;

procedure wl_data_device_manager_destroy(wl_data_device_manager: PTwl_data_device_manager); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_data_device_manager));
end;

function wl_data_device_manager_create_data_source(wl_data_device_manager: PTwl_data_device_manager): PTwl_data_source; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_data_device_manager),    WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE,    @wl_data_source_interface,    wl_proxy_get_version(PTwl_proxy(wl_data_device_manager)),    0,    nil  );
  Result := PTwl_data_source(id);
end;

function wl_data_device_manager_get_data_device(wl_data_device_manager: PTwl_data_device_manager; seat: PTwl_seat): PTwl_data_device; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_data_device_manager),    WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE,    @wl_data_device_interface,    wl_proxy_get_version(PTwl_proxy(wl_data_device_manager)),    0,    nil,    seat  );
  Result := PTwl_data_device(id);
end;

procedure wl_shell_set_user_data(wl_shell: PTwl_shell; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_shell), user_data);
end;

function wl_shell_get_user_data(wl_shell: PTwl_shell): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_shell));
end;

function wl_shell_get_version(wl_shell: PTwl_shell): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_shell));
end;

procedure wl_shell_destroy(wl_shell: PTwl_shell); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_shell));
end;

function wl_shell_get_shell_surface(wl_shell: PTwl_shell; surface: PTwl_surface): PTwl_shell_surface; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_shell),    WL_SHELL_GET_SHELL_SURFACE,    @wl_shell_surface_interface,    wl_proxy_get_version(PTwl_proxy(wl_shell)),    0,    nil,    surface  );
  Result := PTwl_shell_surface(id);
end;

function wl_shell_surface_add_listener(wl_shell_surface: PTwl_shell_surface; listener: PTwl_shell_surface_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_shell_surface), PPointer(listener), data);
end;

procedure wl_shell_surface_set_user_data(wl_shell_surface: PTwl_shell_surface; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_shell_surface), user_data);
end;

function wl_shell_surface_get_user_data(wl_shell_surface: PTwl_shell_surface): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_shell_surface));
end;

function wl_shell_surface_get_version(wl_shell_surface: PTwl_shell_surface): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_shell_surface));
end;

procedure wl_shell_surface_destroy(wl_shell_surface: PTwl_shell_surface); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_shell_surface));
end;

procedure wl_shell_surface_pong(wl_shell_surface: PTwl_shell_surface; serial: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_PONG,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,    serial  );
end;

procedure wl_shell_surface_move(wl_shell_surface: PTwl_shell_surface; seat: PTwl_seat; serial: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_MOVE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,    seat,    serial  );
end;

procedure wl_shell_surface_resize(wl_shell_surface: PTwl_shell_surface; seat: PTwl_seat; serial: Tuint32_t; edges: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_RESIZE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,    seat,    serial,    edges  );
end;

procedure wl_shell_surface_set_toplevel(wl_shell_surface: PTwl_shell_surface); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_SET_TOPLEVEL,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0  );
end;

procedure wl_shell_surface_set_transient(wl_shell_surface: PTwl_shell_surface; parent: PTwl_surface; x: Tint32_t; y: Tint32_t; flags: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_SET_TRANSIENT,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,    parent,    x,    y,    flags  );
end;

procedure wl_shell_surface_set_fullscreen(wl_shell_surface: PTwl_shell_surface; method: Tuint32_t; framerate: Tuint32_t; output: PTwl_output); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_SET_FULLSCREEN,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,    method,    framerate,    output  );
end;

procedure wl_shell_surface_set_popup(wl_shell_surface: PTwl_shell_surface; seat: PTwl_seat; serial: Tuint32_t; parent: PTwl_surface; x: Tint32_t; y: Tint32_t; flags: Tuint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_SET_POPUP,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,    seat,    serial,    parent,    x,    y,    flags );
end;

procedure wl_shell_surface_set_maximized(wl_shell_surface: PTwl_shell_surface; output: PTwl_output); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_SET_MAXIMIZED,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,    output  );
end;

procedure wl_shell_surface_set_title(wl_shell_surface: PTwl_shell_surface; title: PChar); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_SET_TITLE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,    title  );
end;

procedure wl_shell_surface_set_class(wl_shell_surface: PTwl_shell_surface; class_: PChar); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_shell_surface),    WL_SHELL_SURFACE_SET_CLASS,    nil,    wl_proxy_get_version(PTwl_proxy(wl_shell_surface)),    0,   class_  );
end;

function wl_surface_add_listener(wl_surface: PTwl_surface; listener: PTwl_surface_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_surface), PPointer(listener), data);
end;

procedure wl_surface_set_user_data(wl_surface: PTwl_surface; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_surface), user_data);
end;

function wl_surface_get_user_data(wl_surface: PTwl_surface): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_surface));
end;

function wl_surface_get_version(wl_surface: PTwl_surface): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_surface));
end;

procedure wl_surface_destroy(wl_surface: PTwl_surface); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_DESTROY,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    WL_MARSHAL_FLAG_DESTROY  );
end;

procedure wl_surface_attach(wl_surface: PTwl_surface; buffer: PTwl_buffer; x, y: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_ATTACH,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    buffer,    x,    y  );
end;

procedure wl_surface_damage(wl_surface: PTwl_surface; x, y, width, height: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_DAMAGE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    x,    y,    width,    height  );
end;

function wl_surface_frame(wl_surface: PTwl_surface): PTwl_callback; inline;
var
  callback: PTwl_proxy;
begin
  callback := wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_FRAME,    @wl_callback_interface,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    nil  );
  Result := PTwl_callback(callback);
end;

procedure wl_surface_set_opaque_region(wl_surface: PTwl_surface; region: PTwl_region); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_SET_OPAQUE_REGION,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    region  );
end;

procedure wl_surface_set_input_region(wl_surface: PTwl_surface; region: PTwl_region); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_SET_INPUT_REGION,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    region  );
end;

procedure wl_surface_commit(wl_surface: PTwl_surface); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_COMMIT,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0  );
end;

procedure wl_surface_set_buffer_transform(wl_surface: PTwl_surface; transform: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_SET_BUFFER_TRANSFORM,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    transform  );
end;

procedure wl_surface_set_buffer_scale(wl_surface: PTwl_surface; scale: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_SET_BUFFER_SCALE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    scale  );
end;

procedure wl_surface_damage_buffer(wl_surface: PTwl_surface; x, y, width, height: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_DAMAGE_BUFFER,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    x,    y,    width,    height  );
end;

procedure wl_surface_offset(wl_surface: PTwl_surface; x, y: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_surface),    WL_SURFACE_OFFSET,    nil,    wl_proxy_get_version(PTwl_proxy(wl_surface)),    0,    x,    y  );
end;

function wl_seat_add_listener(wl_seat: PTwl_seat; listener: PTwl_seat_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_seat), PPointer(listener), data);
end;

procedure wl_seat_set_user_data(wl_seat: PTwl_seat; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_seat), user_data);
end;

function wl_seat_get_user_data(wl_seat: PTwl_seat): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_seat));
end;

function wl_seat_get_version(wl_seat: PTwl_seat): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_seat));
end;

procedure wl_seat_destroy(wl_seat: PTwl_seat); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_seat));
end;

function wl_seat_get_pointer(wl_seat: PTwl_seat): PTwl_pointer; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_seat),    WL_SEAT_GET_POINTER,    @wl_pointer_interface,    wl_proxy_get_version(PTwl_proxy(wl_seat)),    0,    nil  );
  Result := PTwl_pointer(id);
end;

function wl_seat_get_keyboard(wl_seat: PTwl_seat): PTwl_keyboard; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_seat),    WL_SEAT_GET_KEYBOARD,    @wl_keyboard_interface,    wl_proxy_get_version(PTwl_proxy(wl_seat)),    0,    nil  );
  Result := PTwl_keyboard(id);
end;

function wl_seat_get_touch(wl_seat: PTwl_seat): PTwl_touch; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_seat),    WL_SEAT_GET_TOUCH,    @wl_touch_interface,    wl_proxy_get_version(PTwl_proxy(wl_seat)),    0,    nil  );
  Result := PTwl_touch(id);
end;

procedure wl_seat_release(wl_seat: PTwl_seat); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_seat),    WL_SEAT_RELEASE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_seat)),    WL_MARSHAL_FLAG_DESTROY  );
end;

function wl_pointer_add_listener(wl_pointer: PTwl_pointer; listener: PTwl_pointer_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_pointer), PPointer(listener), data);
end;

procedure wl_pointer_set_user_data(wl_pointer: PTwl_pointer; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_pointer), user_data);
end;

function wl_pointer_get_user_data(wl_pointer: PTwl_pointer): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_pointer));
end;

function wl_pointer_get_version(wl_pointer: PTwl_pointer): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_pointer));
end;

procedure wl_pointer_destroy(wl_pointer: PTwl_pointer); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_pointer));
end;

procedure wl_pointer_set_cursor(wl_pointer: PTwl_pointer; serial: Tuint32_t; surface: PTwl_surface; hotspot_x, hotspot_y: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_pointer),    WL_POINTER_SET_CURSOR,    nil,    wl_proxy_get_version(PTwl_proxy(wl_pointer)),    0,    serial,    surface,    hotspot_x,    hotspot_y  );
end;

procedure wl_pointer_release(wl_pointer: PTwl_pointer); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_pointer),    WL_POINTER_RELEASE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_pointer)),    WL_MARSHAL_FLAG_DESTROY  );
end;

function wl_keyboard_add_listener(wl_keyboard: PTwl_keyboard; listener: PTwl_keyboard_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_keyboard), PPointer(listener), data);
end;

procedure wl_keyboard_set_user_data(wl_keyboard: PTwl_keyboard; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_keyboard), user_data);
end;

function wl_keyboard_get_user_data(wl_keyboard: PTwl_keyboard): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_keyboard));
end;

function wl_keyboard_get_version(wl_keyboard: PTwl_keyboard): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_keyboard));
end;

procedure wl_keyboard_destroy(wl_keyboard: PTwl_keyboard); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_keyboard));
end;

procedure wl_keyboard_release(wl_keyboard: PTwl_keyboard); inline;
begin
  wl_proxy_marshal_flags(   PTwl_proxy(wl_keyboard),    WL_KEYBOARD_RELEASE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_keyboard)),    WL_MARSHAL_FLAG_DESTROY  );
end;

function wl_touch_add_listener(wl_touch: PTwl_touch; listener: PTwl_touch_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_touch), PPointer(listener), data);
end;

procedure wl_touch_set_user_data(wl_touch: PTwl_touch; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_touch), user_data);
end;

function wl_touch_get_user_data(wl_touch: PTwl_touch): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_touch));
end;

function wl_touch_get_version(wl_touch: PTwl_touch): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_touch));
end;

procedure wl_touch_destroy(wl_touch: PTwl_touch); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_touch));
end;

procedure wl_touch_release(wl_touch: PTwl_touch); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_touch),    WL_TOUCH_RELEASE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_touch)),    WL_MARSHAL_FLAG_DESTROY  );
end;

function wl_output_add_listener(wl_output: PTwl_output; listener: PTwl_output_listener; data: Pointer): Integer; inline;
begin
  Result := wl_proxy_add_listener(PTwl_proxy(wl_output), PPointer(listener), data);
end;

procedure wl_output_set_user_data(wl_output: PTwl_output; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_output), user_data);
end;

function wl_output_get_user_data(wl_output: PTwl_output): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_output));
end;

function wl_output_get_version(wl_output: PTwl_output): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_output));
end;

procedure wl_output_destroy(wl_output: PTwl_output); inline;
begin
  wl_proxy_destroy(PTwl_proxy(wl_output));
end;

procedure wl_output_release(wl_output: PTwl_output); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_output),    WL_OUTPUT_RELEASE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_output)),    WL_MARSHAL_FLAG_DESTROY  );
end;

procedure wl_region_set_user_data(wl_region: PTwl_region; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_region), user_data);
end;

function wl_region_get_user_data(wl_region: PTwl_region): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_region));
end;

function wl_region_get_version(wl_region: PTwl_region): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_region));
end;

procedure wl_region_destroy(wl_region: PTwl_region); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_region),    WL_REGION_DESTROY,    nil,    wl_proxy_get_version(PTwl_proxy(wl_region)),    WL_MARSHAL_FLAG_DESTROY  );
end;

procedure wl_region_add(wl_region: PTwl_region; x, y, width, height: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_region),    WL_REGION_ADD,    nil,    wl_proxy_get_version(PTwl_proxy(wl_region)),    0,    x,    y,    width,    height  );
end;

procedure wl_region_subtract(wl_region: PTwl_region; x, y, width, height: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_region),    WL_REGION_SUBTRACT,    nil,    wl_proxy_get_version(PTwl_proxy(wl_region)),    0,    x,    y,    width,    height  );
end;

procedure wl_subcompositor_set_user_data(wl_subcompositor: PTwl_subcompositor; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_subcompositor), user_data);
end;

function wl_subcompositor_get_user_data(wl_subcompositor: PTwl_subcompositor): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_subcompositor));
end;

function wl_subcompositor_get_version(wl_subcompositor: PTwl_subcompositor): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_subcompositor));
end;

procedure wl_subcompositor_destroy(wl_subcompositor: PTwl_subcompositor); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_subcompositor),    WL_SUBCOMPOSITOR_DESTROY,    nil,    wl_proxy_get_version(PTwl_proxy(wl_subcompositor)),    WL_MARSHAL_FLAG_DESTROY  );
end;

function wl_subcompositor_get_subsurface(wl_subcompositor: PTwl_subcompositor; surface: PTwl_surface; parent: PTwl_surface): PTwl_subsurface; inline;
var
  id: PTwl_proxy;
begin
  id := wl_proxy_marshal_flags(    PTwl_proxy(wl_subcompositor),    WL_SUBCOMPOSITOR_GET_SUBSURFACE,    @wl_subsurface_interface,    wl_proxy_get_version(PTwl_proxy(wl_subcompositor)),    0,    nil,    surface,    parent  );  Result := PTwl_subsurface(id);
end;

procedure wl_subsurface_set_user_data(wl_subsurface: PTwl_subsurface; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(PTwl_proxy(wl_subsurface), user_data);
end;

function wl_subsurface_get_user_data(wl_subsurface: PTwl_subsurface): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(PTwl_proxy(wl_subsurface));
end;

function wl_subsurface_get_version(wl_subsurface: PTwl_subsurface): Tuint32_t; inline;
begin
  Result := wl_proxy_get_version(PTwl_proxy(wl_subsurface));
end;

procedure wl_subsurface_destroy(wl_subsurface: PTwl_subsurface); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_subsurface),    WL_SUBSURFACE_DESTROY,    nil,    wl_proxy_get_version(PTwl_proxy(wl_subsurface)),    WL_MARSHAL_FLAG_DESTROY  );
end;

procedure wl_subsurface_set_position(wl_subsurface: PTwl_subsurface; x, y: Tint32_t); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_subsurface),    WL_SUBSURFACE_SET_POSITION,    nil,    wl_proxy_get_version(PTwl_proxy(wl_subsurface)),    0,    x,    y  );
end;

procedure wl_subsurface_place_above(wl_subsurface: PTwl_subsurface; sibling: PTwl_surface); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_subsurface),    WL_SUBSURFACE_PLACE_ABOVE,    nil,    wl_proxy_get_version(PTwl_proxy(wl_subsurface)),    0,    sibling  );
end;

procedure wl_subsurface_place_below(wl_subsurface: PTwl_subsurface; sibling: PTwl_surface); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_subsurface),    WL_SUBSURFACE_PLACE_BELOW,    nil,    wl_proxy_get_version(PTwl_proxy(wl_subsurface)),    0,    sibling  );
end;

procedure wl_subsurface_set_sync(wl_subsurface: PTwl_subsurface); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_subsurface),    WL_SUBSURFACE_SET_SYNC,    nil,    wl_proxy_get_version(PTwl_proxy(wl_subsurface)),    0  );
end;

procedure wl_subsurface_set_desync(wl_subsurface: PTwl_subsurface); inline;
begin
  wl_proxy_marshal_flags(    PTwl_proxy(wl_subsurface),    WL_SUBSURFACE_SET_DESYNC,    nil,    wl_proxy_get_version(PTwl_proxy(wl_subsurface)),    0  );
end;


end.
