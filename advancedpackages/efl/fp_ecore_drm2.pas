unit fp_ecore_drm2;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEcore_Drm2_Rotation = ^TEcore_Drm2_Rotation;
  TEcore_Drm2_Rotation = longint;

const
  ECORE_DRM2_ROTATION_NORMAL = 1;
  ECORE_DRM2_ROTATION_90 = 2;
  ECORE_DRM2_ROTATION_180 = 4;
  ECORE_DRM2_ROTATION_270 = 8;
  ECORE_DRM2_ROTATION_REFLECT_X = 16;
  ECORE_DRM2_ROTATION_REFLECT_Y = 32;

type
  PEcore_Drm2_Fb_Status = ^TEcore_Drm2_Fb_Status;
  TEcore_Drm2_Fb_Status = longint;

const
  ECORE_DRM2_FB_STATUS_SCANOUT_ON = 1;
  ECORE_DRM2_FB_STATUS_SCANOUT_OFF = 2;
  ECORE_DRM2_FB_STATUS_RELEASE = 4;
  ECORE_DRM2_FB_STATUS_DELETED = 8;
  ECORE_DRM2_FB_STATUS_PLANE_ASSIGN = 16;
  ECORE_DRM2_FB_STATUS_PLANE_RELEASE = 32;

type
  PEcore_Drm2_Relative_Mode = ^TEcore_Drm2_Relative_Mode;
  TEcore_Drm2_Relative_Mode = longint;

const
  ECORE_DRM2_RELATIVE_MODE_UNKNOWN = 0;
  ECORE_DRM2_RELATIVE_MODE_NONE = 1;
  ECORE_DRM2_RELATIVE_MODE_CLONE = 2;
  ECORE_DRM2_RELATIVE_MODE_TO_LEFT = 3;
  ECORE_DRM2_RELATIVE_MODE_TO_RIGHT = 4;
  ECORE_DRM2_RELATIVE_MODE_TO_ABOVE = 5;
  ECORE_DRM2_RELATIVE_MODE_TO_BELOW = 6;

type
  TEcore_Drm2_Device = record
  end;
  PEcore_Drm2_Device = ^TEcore_Drm2_Device;

  TEcore_Drm2_Fb = record
  end;
  PEcore_Drm2_Fb = ^TEcore_Drm2_Fb;

  TEcore_Drm2_Output = record
  end;
  PEcore_Drm2_Output = ^TEcore_Drm2_Output;

  TEcore_Drm2_Output_Mode = record
  end;
  PEcore_Drm2_Output_Mode = ^TEcore_Drm2_Output_Mode;

  TEcore_Drm2_Plane = record
  end;
  PEcore_Drm2_Plane = ^TEcore_Drm2_Plane;

  PEcore_Drm2_Event_Output_Changed = ^TEcore_Drm2_Event_Output_Changed;
  TEcore_Drm2_Event_Output_Changed = record
  end;

type
  PEcore_Drm2_Event_Activate = ^TEcore_Drm2_Event_Activate;
  TEcore_Drm2_Event_Activate = record
  end;

type
  TEcore_Drm2_Context = record
    version: longint;
    vblank_handler: procedure(fd: longint; sequence: dword; tv_sec: dword; tv_usec: dword; user_data: pointer); cdecl;
    page_flip_handler: procedure(fd: longint; sequence: dword; tv_sec: dword; tv_usec: dword; user_data: pointer); cdecl;
    page_flip_handler2: procedure(fd: longint; sequence: dword; tv_sec: dword; tv_usec: dword; crtc_id: dword;
      user_data: pointer); cdecl;
  end;
  PEcore_Drm2_Context = ^TEcore_Drm2_Context;

var
  ECORE_DRM2_EVENT_OUTPUT_CHANGED: longint; cvar;external libecore_drm2;
  ECORE_DRM2_EVENT_ACTIVATE: longint; cvar;external libecore_drm2;

type
  TEcore_Drm2_Release_Handler = procedure(data: pointer; b: PEcore_Drm2_Fb); cdecl;
  TEcore_Drm2_Fb_Status_Handler = procedure(b: PEcore_Drm2_Fb; status: TEcore_Drm2_Fb_Status; data: pointer); cdecl;

function ecore_drm2_init: longint; cdecl; external libecore_drm2;
function ecore_drm2_shutdown: longint; cdecl; external libecore_drm2;
function ecore_drm2_event_handle(dev: PEcore_Drm2_Device; drmctx: PEcore_Drm2_Context): longint; cdecl; external libecore_drm2;
function ecore_drm2_device_open(seat: pchar; tty: dword): PEcore_Drm2_Device; cdecl; external libecore_drm2;
procedure ecore_drm2_device_close(device: PEcore_Drm2_Device); cdecl; external libecore_drm2;
function ecore_drm2_device_clock_id_get(device: PEcore_Drm2_Device): longint; cdecl; external libecore_drm2;
procedure ecore_drm2_device_cursor_size_get(device: PEcore_Drm2_Device; width: Plongint; height: Plongint); cdecl; external libecore_drm2;
procedure ecore_drm2_device_pointer_xy_get(device: PEcore_Drm2_Device; x: Plongint; y: Plongint); cdecl; external libecore_drm2;
procedure ecore_drm2_device_pointer_warp(device: PEcore_Drm2_Device; x: longint; y: longint); cdecl; external libecore_drm2;
function ecore_drm2_device_pointer_left_handed_set(device: PEcore_Drm2_Device; left: TEina_Bool): TEina_Bool; cdecl; external libecore_drm2;
procedure ecore_drm2_device_window_set(device: PEcore_Drm2_Device; window: dword); cdecl; external libecore_drm2;
procedure ecore_drm2_device_pointer_max_set(device: PEcore_Drm2_Device; w: longint; h: longint); cdecl; external libecore_drm2;
procedure ecore_drm2_device_pointer_accel_speed_set(device: PEcore_Drm2_Device; speed: double); cdecl; external libecore_drm2;
procedure ecore_drm2_device_pointer_accel_profile_set(device: PEcore_Drm2_Device; profile: uint32); cdecl; external libecore_drm2;
function ecore_drm2_device_pointer_rotation_set(device: PEcore_Drm2_Device; rotation: longint): TEina_Bool; cdecl; external libecore_drm2;
procedure ecore_drm2_device_touch_tap_to_click_enabled_set(device: PEcore_Drm2_Device; enabled: TEina_Bool); cdecl; external libecore_drm2;
procedure ecore_drm2_device_keyboard_info_set(device: PEcore_Drm2_Device; context: pointer; keymap: pointer; group: longint); cdecl; external libecore_drm2;
procedure ecore_drm2_device_keyboard_group_set(device: PEcore_Drm2_Device; group: longint); cdecl; external libecore_drm2;
function ecore_drm2_device_crtcs_get(device: PEcore_Drm2_Device; num: Plongint): Pdword; cdecl; external libecore_drm2;
procedure ecore_drm2_device_screen_size_range_get(device: PEcore_Drm2_Device; minw: Plongint; minh: Plongint; maxw: Plongint; maxh: Plongint); cdecl; external libecore_drm2;
procedure ecore_drm2_device_calibrate(device: PEcore_Drm2_Device; w: longint; h: longint); cdecl; external libecore_drm2;
function ecore_drm2_device_vt_set(device: PEcore_Drm2_Device; vt: longint): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_device_prefer_shadow(device: PEcore_Drm2_Device): TEina_Bool; cdecl; external libecore_drm2;
procedure ecore_drm2_device_preferred_depth_get(device: PEcore_Drm2_Device; depth: Plongint; bpp: Plongint); cdecl; external libecore_drm2;
function ecore_drm2_outputs_create(device: PEcore_Drm2_Device): TEina_Bool; cdecl; external libecore_drm2;
procedure ecore_drm2_outputs_destroy(device: PEcore_Drm2_Device); cdecl; external libecore_drm2;
function ecore_drm2_outputs_get(device: PEcore_Drm2_Device): PEina_List; cdecl; external libecore_drm2;
function ecore_drm2_output_dpms_get(output: PEcore_Drm2_Output): longint; cdecl; external libecore_drm2;
procedure ecore_drm2_output_dpms_set(output: PEcore_Drm2_Output; level: longint); cdecl; external libecore_drm2;
function ecore_drm2_output_edid_get(output: PEcore_Drm2_Output): pchar; cdecl; external libecore_drm2;
function ecore_drm2_output_backlight_get(output: PEcore_Drm2_Output): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_output_find(device: PEcore_Drm2_Device; x: longint; y: longint): PEcore_Drm2_Output; cdecl; external libecore_drm2;
procedure ecore_drm2_output_dpi_get(output: PEcore_Drm2_Output; xdpi: Plongint; ydpi: Plongint); cdecl; external libecore_drm2;
function ecore_drm2_output_crtc_get(output: PEcore_Drm2_Output): dword; cdecl; external libecore_drm2;
function ecore_drm2_output_latest_fb_get(output: PEcore_Drm2_Output): PEcore_Drm2_Fb; cdecl; external libecore_drm2;
function ecore_drm2_output_primary_get(output: PEcore_Drm2_Output): TEina_Bool; cdecl; external libecore_drm2;
procedure ecore_drm2_output_primary_set(output: PEcore_Drm2_Output; primary: TEina_Bool); cdecl; external libecore_drm2;
function ecore_drm2_output_enabled_get(output: PEcore_Drm2_Output): TEina_Bool; cdecl; external libecore_drm2;
procedure ecore_drm2_output_enabled_set(output: PEcore_Drm2_Output; enabled: TEina_Bool); cdecl; external libecore_drm2;
procedure ecore_drm2_output_physical_size_get(output: PEcore_Drm2_Output; w: Plongint; h: Plongint); cdecl; external libecore_drm2;
function ecore_drm2_output_modes_get(output: PEcore_Drm2_Output): PEina_List; cdecl; external libecore_drm2;
procedure ecore_drm2_output_mode_info_get(mode: PEcore_Drm2_Output_Mode; w: Plongint; h: Plongint; refresh: Pdword; flags: Pdword); cdecl; external libecore_drm2;
function ecore_drm2_output_mode_set(output: PEcore_Drm2_Output; mode: PEcore_Drm2_Output_Mode; x: longint; y: longint): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_output_name_get(output: PEcore_Drm2_Output): pchar; cdecl; external libecore_drm2;
function ecore_drm2_output_model_get(output: PEcore_Drm2_Output): pchar; cdecl; external libecore_drm2;
function ecore_drm2_output_connected_get(output: PEcore_Drm2_Output): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_output_cloned_get(output: PEcore_Drm2_Output): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_output_connector_type_get(output: PEcore_Drm2_Output): dword; cdecl; external libecore_drm2;
procedure ecore_drm2_output_info_get(output: PEcore_Drm2_Output; x: Plongint; y: Plongint; w: Plongint; h: Plongint; refresh: Pdword); cdecl; external libecore_drm2;
function ecore_drm2_output_possible_crtc_get(output: PEcore_Drm2_Output; crtc: dword): TEina_Bool; cdecl; external libecore_drm2;
procedure ecore_drm2_output_gamma_set(output: PEcore_Drm2_Output; size: uint16; red: Puint16; green: Puint16; blue: Puint16); cdecl; external libecore_drm2;
function ecore_drm2_output_supported_rotations_get(output: PEcore_Drm2_Output): longint; cdecl; external libecore_drm2;
function ecore_drm2_output_rotation_set(output: PEcore_Drm2_Output; rotation: longint): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_output_rotation_get(output: PEcore_Drm2_Output): longint; cdecl; external libecore_drm2;
procedure ecore_drm2_output_user_data_set(o: PEcore_Drm2_Output; data: pointer); cdecl; external libecore_drm2;
function ecore_drm2_output_user_data_get(output: PEcore_Drm2_Output): pointer; cdecl; external libecore_drm2;
function ecore_drm2_output_subpixel_get(output: PEcore_Drm2_Output): dword; cdecl; external libecore_drm2;
procedure ecore_drm2_output_relative_mode_set(output: PEcore_Drm2_Output; mode: TEcore_Drm2_Relative_Mode); cdecl; external libecore_drm2;
function ecore_drm2_output_relative_mode_get(output: PEcore_Drm2_Output): TEcore_Drm2_Relative_Mode; cdecl; external libecore_drm2;
procedure ecore_drm2_output_relative_to_set(output: PEcore_Drm2_Output; relative: pchar); cdecl; external libecore_drm2;
function ecore_drm2_output_relative_to_get(output: PEcore_Drm2_Output): pchar; cdecl; external libecore_drm2;
function ecore_drm2_fb_create(dev: PEcore_Drm2_Device; width: longint; height: longint; depth: longint; bpp: longint; format: dword): PEcore_Drm2_Fb; cdecl; external libecore_drm2;
function ecore_drm2_fb_gbm_create(dev: PEcore_Drm2_Device; width: longint; height: longint; depth: longint; bpp: longint; format: dword; handle: dword; stride: dword; bo: pointer): PEcore_Drm2_Fb; cdecl; external libecore_drm2;
function ecore_drm2_fb_data_get(fb: PEcore_Drm2_Fb): pointer; cdecl; external libecore_drm2;
function ecore_drm2_fb_size_get(fb: PEcore_Drm2_Fb): dword; cdecl; external libecore_drm2;
function ecore_drm2_fb_stride_get(fb: PEcore_Drm2_Fb): dword; cdecl; external libecore_drm2;
procedure ecore_drm2_fb_dirty(fb: PEcore_Drm2_Fb; rects: PEina_Rectangle; count: dword); cdecl; external libecore_drm2;
function ecore_drm2_fb_flip(fb: PEcore_Drm2_Fb; output: PEcore_Drm2_Output): longint; cdecl; external libecore_drm2;
function ecore_drm2_fb_flip_complete(output: PEcore_Drm2_Output): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_fb_busy_get(fb: PEcore_Drm2_Fb): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_fb_release(o: PEcore_Drm2_Output; panic: TEina_Bool): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_fb_bo_get(fb: PEcore_Drm2_Fb): pointer; cdecl; external libecore_drm2;
function ecore_drm2_fb_dmabuf_import(dev: PEcore_Drm2_Device; width: longint; height: longint; depth: longint; bpp: longint;
  format: dword; strides: PDWord; dmabuf_fd: PLongint; dmabuf_fd_count: longint): PEcore_Drm2_Fb; cdecl; external libecore_drm2;
procedure ecore_drm2_fb_discard(fb: PEcore_Drm2_Fb); cdecl; external libecore_drm2;
function ecore_drm2_plane_assign(output: PEcore_Drm2_Output; fb: PEcore_Drm2_Fb; x: longint; y: longint): PEcore_Drm2_Plane; cdecl; external libecore_drm2;
procedure ecore_drm2_plane_release(plane: PEcore_Drm2_Plane); cdecl; external libecore_drm2;
procedure ecore_drm2_plane_destination_set(plane: PEcore_Drm2_Plane; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_drm2;
function ecore_drm2_plane_fb_set(plane: PEcore_Drm2_Plane; fb: PEcore_Drm2_Fb): TEina_Bool; cdecl; external libecore_drm2;
procedure ecore_drm2_fb_status_handler_set(fb: PEcore_Drm2_Fb; handler: TEcore_Drm2_Fb_Status_Handler; data: pointer); cdecl; external libecore_drm2;
function ecore_drm2_output_blanktime_get(output: PEcore_Drm2_Output; sequence: longint; sec: Plongint; usec: Plongint): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_device_fd_get(device: PEcore_Drm2_Device): longint; cdecl; external libecore_drm2;
function ecore_drm2_output_pending_get(output: PEcore_Drm2_Output): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_output_background_color_set(output: PEcore_Drm2_Output; r: uint64; g: uint64; b: uint64; a: uint64): TEina_Bool; cdecl; external libecore_drm2;
function ecore_drm2_vblank_supported(dev: PEcore_Drm2_Device): TEina_Bool; cdecl; external libecore_drm2;
{$endif}

// === Konventiert am: 14-6-25 16:51:25 ===


implementation


end.
