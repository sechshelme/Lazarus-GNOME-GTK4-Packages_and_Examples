unit Ecore_Evas;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, Ecore_Evas_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  HAVE_ECORE_EVAS_X = 1;
  HAVE_ECORE_EVAS_FB = 1;
  HAVE_ECORE_EVAS_X11_GL = 1;
  HAVE_ECORE_EVAS_WIN32 = 1;
  HAVE_ECORE_EVAS_COCOA = 1;
  HAVE_ECORE_EVAS_SDL = 1;
  HAVE_ECORE_EVAS_PSL1GHT = 1;
  HAVE_ECORE_EVAS_WAYLAND_SHM = 1;
  HAVE_ECORE_EVAS_WAYLAND_EGL = 1;
  HAVE_ECORE_EVAS_DRM = 1;
  HAVE_ECORE_EVAS_DRM_GL = 1;

type
  PEcore_Evas_Engine_Type = ^TEcore_Evas_Engine_Type;
  TEcore_Evas_Engine_Type = longint;

const
  ECORE_EVAS_ENGINE_SOFTWARE_BUFFER = 0;
  ECORE_EVAS_ENGINE_SOFTWARE_XLIB = 1;
  ECORE_EVAS_ENGINE_XRENDER_X11 = 2;
  ECORE_EVAS_ENGINE_OPENGL_X11 = 3;
  ECORE_EVAS_ENGINE_SOFTWARE_XCB = 4;
  ECORE_EVAS_ENGINE_XRENDER_XCB = 5;
  ECORE_EVAS_ENGINE_SOFTWARE_GDI = 6;
  ECORE_EVAS_ENGINE_SOFTWARE_DDRAW = 7;
  ECORE_EVAS_ENGINE_DIRECT3D = 8;
  ECORE_EVAS_ENGINE_OPENGL_GLEW = 9;
  ECORE_EVAS_ENGINE_OPENGL_COCOA = 10;
  ECORE_EVAS_ENGINE_SOFTWARE_SDL = 11;
  ECORE_EVAS_ENGINE_DIRECTFB = 12;
  ECORE_EVAS_ENGINE_SOFTWARE_FB = 13;
  ECORE_EVAS_ENGINE_SOFTWARE_8_X11 = 14;
  ECORE_EVAS_ENGINE_SOFTWARE_16_X11 = 15;
  ECORE_EVAS_ENGINE_SOFTWARE_16_DDRAW = 16;
  ECORE_EVAS_ENGINE_SOFTWARE_16_WINCE = 17;
  ECORE_EVAS_ENGINE_OPENGL_SDL = 18;
  ECORE_EVAS_ENGINE_EWS = 19;
  ECORE_EVAS_ENGINE_PSL1GHT = 20;
  ECORE_EVAS_ENGINE_WAYLAND_SHM = 21;
  ECORE_EVAS_ENGINE_WAYLAND_EGL = 22;
  ECORE_EVAS_ENGINE_DRM = 23;
  ECORE_EVAS_ENGINE_OPENGL_DRM = 24;

const
  ECORE_EVAS_OPT_NONE = 0;
  ECORE_EVAS_OPT_INDIRECT = 1;
  ECORE_EVAS_OPT_VSYNC = 2;
  ECORE_EVAS_OPT_SWAP_MODE = 3;
  ECORE_EVAS_OPT_GL_DEPTH = 4;
  ECORE_EVAS_OPT_GL_STENCIL = 5;
  ECORE_EVAS_OPT_GL_MSAA = 6;
  ECORE_EVAS_OPT_LAST = 7;
  ECORE_EVAS_SWAP_MODE_AUTO = 0;
  ECORE_EVAS_SWAP_MODE_FULL = 1;
  ECORE_EVAS_SWAP_MODE_COPY = 2;
  ECORE_EVAS_SWAP_MODE_DOUBLE = 3;
  ECORE_EVAS_SWAP_MODE_TRIPLE = 4;

type
  PEcore_Evas_Avoid_Damage_Type = ^TEcore_Evas_Avoid_Damage_Type;
  TEcore_Evas_Avoid_Damage_Type = longint;

const
  ECORE_EVAS_AVOID_DAMAGE_NONE = 0;
  ECORE_EVAS_AVOID_DAMAGE_EXPOSE = 1;
  ECORE_EVAS_AVOID_DAMAGE_BUILT_IN = 2;

type
  PEcore_Evas_Object_Associate_Flags = ^TEcore_Evas_Object_Associate_Flags;
  TEcore_Evas_Object_Associate_Flags = longint;

const
  ECORE_EVAS_OBJECT_ASSOCIATE_BASE = 0;
  ECORE_EVAS_OBJECT_ASSOCIATE_STACK = 1 shl 0;
  ECORE_EVAS_OBJECT_ASSOCIATE_LAYER = 1 shl 1;
  ECORE_EVAS_OBJECT_ASSOCIATE_DEL = 1 shl 2;

function ecore_evas_engine_type_supported_get(engine: TEcore_Evas_Engine_Type): longint; cdecl; external libecore_eva;
function ecore_evas_init: longint; cdecl; external libecore_eva;
function ecore_evas_shutdown: longint; cdecl; external libecore_eva;
procedure ecore_evas_app_comp_sync_set(do_sync: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_app_comp_sync_get: TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_engines_get: PEina_List; cdecl; external libecore_eva;
procedure ecore_evas_engines_free(engines: PEina_List); cdecl; external libecore_eva;
function ecore_evas_new(engine_name: pchar; x: longint; y: longint; w: longint; h: longint; extra_options: pchar): PEcore_Evas; cdecl; external libecore_eva;
procedure ecore_evas_alpha_set(ee: PEcore_Evas; alpha: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_alpha_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_transparent_set(ee: PEcore_Evas; transparent: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_transparent_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_geometry_get(ee: PEcore_Evas; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_request_geometry_get(ee: PEcore_Evas; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_focus_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_focus_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_focus_device_set(ee: PEcore_Evas; seat: PEo; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_focus_device_get(ee: PEcore_Evas; seat: PEo): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_iconified_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_iconified_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_borderless_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_borderless_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_fullscreen_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_fullscreen_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_window_group_set(ee: PEcore_Evas; ee_group: PEcore_Evas); cdecl; external libecore_eva;
function ecore_evas_window_group_get(ee: PEcore_Evas): PEcore_Evas; cdecl; external libecore_eva;
procedure ecore_evas_aspect_set(ee: PEcore_Evas; aspect: double); cdecl; external libecore_eva;
function ecore_evas_aspect_get(ee: PEcore_Evas): double; cdecl; external libecore_eva;
procedure ecore_evas_urgent_set(ee: PEcore_Evas; urgent: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_urgent_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_modal_set(ee: PEcore_Evas; modal: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_modal_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_demand_attention_set(ee: PEcore_Evas; demand: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_demand_attention_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_focus_skip_set(ee: PEcore_Evas; skip: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_focus_skip_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_ignore_events_set(ee: PEcore_Evas; ignore: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_ignore_events_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_visibility_get(ee: PEcore_Evas): longint; cdecl; external libecore_eva;
procedure ecore_evas_layer_set(ee: PEcore_Evas; layer: longint); cdecl; external libecore_eva;
function ecore_evas_layer_get(ee: PEcore_Evas): longint; cdecl; external libecore_eva;
procedure ecore_evas_maximized_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_maximized_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_window_profile_supported_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_window_profile_set(ee: PEcore_Evas; profile: pchar); cdecl; external libecore_eva;
function ecore_evas_window_profile_get(ee: PEcore_Evas): pchar; cdecl; external libecore_eva;
procedure ecore_evas_window_available_profiles_set(ee: PEcore_Evas; profiles: PPchar; count: dword); cdecl; external libecore_eva;
function ecore_evas_window_available_profiles_get(ee: PEcore_Evas; profiles: PPPchar; count: Pdword): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_wm_rotation_supported_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_wm_rotation_preferred_rotation_set(ee: PEcore_Evas; rotation: longint); cdecl; external libecore_eva;
function ecore_evas_wm_rotation_preferred_rotation_get(ee: PEcore_Evas): longint; cdecl; external libecore_eva;
procedure ecore_evas_wm_rotation_available_rotations_set(ee: PEcore_Evas; rotations: Plongint; count: dword); cdecl; external libecore_eva;
function ecore_evas_wm_rotation_available_rotations_get(ee: PEcore_Evas; rotations: PPlongint; count: Pdword): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_wm_rotation_manual_rotation_done_set(ee: PEcore_Evas; set_: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_wm_rotation_manual_rotation_done_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_wm_rotation_manual_rotation_done(ee: PEcore_Evas); cdecl; external libecore_eva;
function ecore_evas_aux_hints_supported_get(ee: PEcore_Evas): PEina_List; cdecl; external libecore_eva;
function ecore_evas_aux_hints_allowed_get(ee: PEcore_Evas): PEina_List; cdecl; external libecore_eva;
function ecore_evas_aux_hint_add(ee: PEcore_Evas; hint: pchar; val: pchar): longint; cdecl; external libecore_eva;
function ecore_evas_aux_hint_del(ee: PEcore_Evas; id: longint): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_aux_hint_val_set(ee: PEcore_Evas; id: longint; val: pchar): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_aux_hint_val_get(ee: PEcore_Evas; id: longint): pchar; cdecl; external libecore_eva;
function ecore_evas_aux_hint_id_get(ee: PEcore_Evas; hint: pchar): longint; cdecl; external libecore_eva;
procedure ecore_evas_msg_parent_send(ee: PEcore_Evas; msg_domain: longint; msg_id: longint; data: pointer; size: longint); cdecl; external libecore_eva;
procedure ecore_evas_msg_send(ee: PEcore_Evas; msg_domain: longint; msg_id: longint; data: pointer; size: longint); cdecl; external libecore_eva;

type
  Tfunc_parent_handle = procedure(ee: PEcore_Evas; msg_domain: longint; msg_id: longint; data: pointer; size: longint);

procedure ecore_evas_callback_msg_parent_handle_set(ee: PEcore_Evas; func_parent_handle: Tfunc_parent_handle); cdecl; external libecore_eva;

procedure ecore_evas_callback_msg_handle_set(ee: PEcore_Evas; func_handle: Tfunc_parent_handle); cdecl; external libecore_eva;
procedure ecore_evas_move(ee: PEcore_Evas; x: longint; y: longint); cdecl; external libecore_eva;
procedure ecore_evas_resize(ee: PEcore_Evas; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_move_resize(ee: PEcore_Evas; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_rotation_set(ee: PEcore_Evas; rot: longint); cdecl; external libecore_eva;
procedure ecore_evas_rotation_with_resize_set(ee: PEcore_Evas; rot: longint); cdecl; external libecore_eva;
function ecore_evas_rotation_get(ee: PEcore_Evas): longint; cdecl; external libecore_eva;
procedure ecore_evas_raise(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_lower(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_title_set(ee: PEcore_Evas; t: pchar); cdecl; external libecore_eva;
function ecore_evas_title_get(ee: PEcore_Evas): pchar; cdecl; external libecore_eva;
procedure ecore_evas_name_class_set(ee: PEcore_Evas; n: pchar; c: pchar); cdecl; external libecore_eva;
procedure ecore_evas_name_class_get(ee: PEcore_Evas; n: PPchar; c: PPchar); cdecl; external libecore_eva;
function ecore_evas_window_get(ee: PEcore_Evas): TEcore_Window; cdecl; external libecore_eva;
function ecore_evas_software_x11_new(disp_name: pchar; parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_software_x11_window_get(ee: PEcore_Evas): TEcore_X_Window; cdecl; external libecore_eva;
procedure ecore_evas_software_x11_direct_resize_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_software_x11_direct_resize_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_software_x11_extra_event_window_add(ee: PEcore_Evas; win: TEcore_X_Window); cdecl; external libecore_eva;
function ecore_evas_software_x11_pixmap_new(disp_name: pchar; parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_software_x11_pixmap_get(ee: PEcore_Evas): TEcore_X_Pixmap; cdecl; external libecore_eva;

const
  ECORE_EVAS_GL_X11_OPT_NONE = ECORE_EVAS_OPT_NONE;
  ECORE_EVAS_GL_X11_OPT_INDIRECT = ECORE_EVAS_OPT_INDIRECT;
  ECORE_EVAS_GL_X11_OPT_VSYNC = ECORE_EVAS_OPT_VSYNC;
  ECORE_EVAS_GL_X11_OPT_SWAP_MODE = ECORE_EVAS_OPT_SWAP_MODE;
  ECORE_EVAS_GL_X11_OPT_GL_DEPTH = ECORE_EVAS_OPT_GL_DEPTH;
  ECORE_EVAS_GL_X11_OPT_GL_STENCIL = ECORE_EVAS_OPT_GL_STENCIL;
  ECORE_EVAS_GL_X11_OPT_GL_MSAA = ECORE_EVAS_OPT_GL_MSAA;
  ECORE_EVAS_GL_X11_OPT_LAST = ECORE_EVAS_OPT_LAST;
  ECORE_EVAS_GL_X11_SWAP_MODE_AUTO = ECORE_EVAS_SWAP_MODE_AUTO;
  ECORE_EVAS_GL_X11_SWAP_MODE_FULL = ECORE_EVAS_SWAP_MODE_FULL;
  ECORE_EVAS_GL_X11_SWAP_MODE_COPY = ECORE_EVAS_SWAP_MODE_COPY;
  ECORE_EVAS_GL_X11_SWAP_MODE_DOUBLE = ECORE_EVAS_SWAP_MODE_DOUBLE;
  ECORE_EVAS_GL_X11_SWAP_MODE_TRIPLE = ECORE_EVAS_SWAP_MODE_TRIPLE;

function ecore_evas_gl_x11_new(disp_name: pchar; parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_gl_x11_options_new(disp_name: pchar; parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint; opt: Plongint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_gl_x11_window_get(ee: PEcore_Evas): TEcore_X_Window; cdecl; external libecore_eva;
procedure ecore_evas_gl_x11_direct_resize_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_gl_x11_direct_resize_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_gl_x11_extra_event_window_add(ee: PEcore_Evas; win: TEcore_X_Window); cdecl; external libecore_eva;

type
  Tpre_cb = procedure(data: pointer; e: PEvas);

procedure ecore_evas_gl_x11_pre_post_swap_callback_set(ee: PEcore_Evas; data: pointer; pre_cb: Tpre_cb; post_cb: Tpre_cb); cdecl; external libecore_eva;
function ecore_evas_gl_x11_pixmap_new(disp_name: pchar; parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_gl_x11_pixmap_get(ee: PEcore_Evas): TEcore_X_Pixmap; cdecl; external libecore_eva;
function ecore_evas_xrender_x11_new(disp_name: pchar; parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_xrender_x11_window_get(ee: PEcore_Evas): TEcore_X_Window; cdecl; external libecore_eva; deprecated;
procedure ecore_evas_xrender_x11_direct_resize_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva; deprecated;
function ecore_evas_xrender_x11_direct_resize_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva; deprecated;
procedure ecore_evas_xrender_x11_extra_event_window_add(ee: PEcore_Evas; win: TEcore_X_Window); cdecl; external libecore_eva; deprecated;
function ecore_evas_software_x11_8_new(disp_name: pchar; parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_software_x11_8_window_get(ee: PEcore_Evas): TEcore_X_Window; cdecl; external libecore_eva; deprecated;
function ecore_evas_software_x11_8_subwindow_get(ee: PEcore_Evas): TEcore_X_Window; cdecl; external libecore_eva; deprecated;
procedure ecore_evas_software_x11_8_direct_resize_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva; deprecated;
function ecore_evas_software_x11_8_direct_resize_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva; deprecated;
procedure ecore_evas_software_x11_8_extra_event_window_add(ee: PEcore_Evas; win: TEcore_X_Window); cdecl; external libecore_eva; deprecated;
function ecore_evas_software_x11_16_new(disp_name: pchar; parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_software_x11_16_window_get(ee: PEcore_Evas): TEcore_X_Window; cdecl; external libecore_eva; deprecated;
procedure ecore_evas_software_x11_16_direct_resize_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva; deprecated;
function ecore_evas_software_x11_16_direct_resize_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva; deprecated;
procedure ecore_evas_software_x11_16_extra_event_window_add(ee: PEcore_Evas; win: TEcore_X_Window); cdecl; external libecore_eva; deprecated;
function ecore_evas_fb_new(disp_name: pchar; rotation: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_directfb_new(disp_name: pchar; windowed: longint; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_directfb_window_get(ee: PEcore_Evas): PEcore_DirectFB_Window; cdecl; external libecore_eva; deprecated;
function ecore_evas_wayland_shm_new(disp_name: pchar; parent: dword; x: longint; y: longint; w: longint; h: longint; frame: TEina_Bool): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_wayland_egl_new(disp_name: pchar; parent: dword; x: longint; y: longint; w: longint; h: longint; frame: TEina_Bool): PEcore_Evas; cdecl; external libecore_eva;
procedure ecore_evas_wayland_resize(ee: PEcore_Evas; location: longint); cdecl; external libecore_eva;
procedure ecore_evas_wayland_move(ee: PEcore_Evas; x: longint; y: longint); cdecl; external libecore_eva;
procedure ecore_evas_wayland_pointer_set(ee: PEcore_Evas; hot_x: longint; hot_y: longint); cdecl; external libecore_eva;
procedure ecore_evas_wayland_type_set(ee: PEcore_Evas; _type: longint); cdecl; external libecore_eva;
function ecore_evas_wayland_window_get(ee: PEcore_Evas): PEcore_Wl_Window; cdecl; external libecore_eva;
function ecore_evas_wayland2_window_get(ee: PEcore_Evas): PEcore_Wl2_Window; cdecl; external libecore_eva;
function ecore_evas_cocoa_window_get(ee: PEcore_Evas): PEcore_Cocoa_Window; cdecl; external libecore_eva;
function ecore_evas_drm_new(device: pchar; parent: dword; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_gl_drm_new(device: pchar; parent: dword; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_buffer_new(w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;

type
  Talloc_func = function(data: pointer; size: longint): pointer;
  Tfree_func = procedure(data: pointer; pix: pointer);

function ecore_evas_buffer_allocfunc_new(w: longint; h: longint; alloc_func: Talloc_func; free_func: Tfree_func; data: pointer): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_buffer_pixels_get(ee: PEcore_Evas): pointer; cdecl; external libecore_eva;
function ecore_evas_buffer_ecore_evas_parent_get(ee: PEcore_Evas): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_ews_new(x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_ews_backing_store_get(ee: PEcore_Evas): PEvas_Object; cdecl; external libecore_eva;
procedure ecore_evas_ews_delete_request(ee: PEcore_Evas); cdecl; external libecore_eva;
function ecore_evas_object_image_new(ee_target: PEcore_Evas): PEvas_Object; cdecl; external libecore_eva;
function ecore_evas_object_ecore_evas_get(obj: PEvas_Object): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_object_evas_get(obj: PEvas_Object): PEvas; cdecl; external libecore_eva;
function ecore_evas_software_gdi_new(parent: PEcore_Win32_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_software_ddraw_new(parent: PEcore_Win32_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_software_16_ddraw_new(parent: PEcore_Win32_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_direct3d_new(parent: PEcore_Win32_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_gl_glew_new(parent: PEcore_Win32_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_win32_window_get(ee: PEcore_Evas): PEcore_Win32_Window; cdecl; external libecore_eva;
function ecore_evas_sdl_new(name: pchar; w: longint; h: longint; fullscreen: longint; hwsurface: longint; noframe: longint; alpha: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_sdl16_new(name: pchar; w: longint; h: longint; fullscreen: longint; hwsurface: longint; noframe: longint; alpha: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_gl_sdl_new(name: pchar; w: longint; h: longint; fullscreen: longint; noframe: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_software_wince_new(parent: PEcore_WinCE_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_software_wince_fb_new(parent: PEcore_WinCE_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_software_wince_gapi_new(parent: PEcore_WinCE_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_software_wince_ddraw_new(parent: PEcore_WinCE_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_software_wince_gdi_new(parent: PEcore_WinCE_Window; x: longint; y: longint; width: longint; height: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_software_wince_window_get(ee: PEcore_Evas): PEcore_WinCE_Window; cdecl; external libecore_eva; deprecated;
function ecore_evas_cocoa_new(parent: PEcore_Cocoa_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_psl1ght_new(name: pchar; w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva; deprecated;
function ecore_evas_engine_name_get(ee: PEcore_Evas): pchar; cdecl; external libecore_eva;
function ecore_evas_ecore_evas_get(e: PEvas): PEcore_Evas; cdecl; external libecore_eva;
procedure ecore_evas_free(ee: PEcore_Evas); cdecl; external libecore_eva;
function ecore_evas_data_get(ee: PEcore_Evas; key: pchar): pointer; cdecl; external libecore_eva;
procedure ecore_evas_data_set(ee: PEcore_Evas; key: pchar; data: pointer); cdecl; external libecore_eva;
procedure ecore_evas_callback_resize_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_move_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_show_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_hide_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_delete_request_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_destroy_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_focus_in_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_focus_out_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_focus_device_in_set(ee: PEcore_Evas; func: TEcore_Evas_Focus_Device_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_focus_device_out_set(ee: PEcore_Evas; func: TEcore_Evas_Focus_Device_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_sticky_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_unsticky_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_device_mouse_in_set(ee: PEcore_Evas; func: TEcore_Evas_Mouse_IO_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_device_mouse_out_set(ee: PEcore_Evas; func: TEcore_Evas_Mouse_IO_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_mouse_in_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_mouse_out_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_pre_render_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_post_render_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_pre_free_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
procedure ecore_evas_callback_state_change_set(ee: PEcore_Evas; func: TEcore_Evas_Event_Cb); cdecl; external libecore_eva;
function ecore_evas_get(ee: PEcore_Evas): PEvas; cdecl; external libecore_eva;
procedure ecore_evas_managed_move(ee: PEcore_Evas; x: longint; y: longint); cdecl; external libecore_eva;
procedure ecore_evas_shaped_set(ee: PEcore_Evas; shaped: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_shaped_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_show(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_hide(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_activate(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_size_min_set(ee: PEcore_Evas; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_size_min_get(ee: PEcore_Evas; w: Plongint; h: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_size_max_set(ee: PEcore_Evas; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_size_max_get(ee: PEcore_Evas; w: Plongint; h: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_size_base_set(ee: PEcore_Evas; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_size_base_get(ee: PEcore_Evas; w: Plongint; h: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_size_step_set(ee: PEcore_Evas; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_size_step_get(ee: PEcore_Evas; w: Plongint; h: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_cursor_set(ee: PEcore_Evas; file_: pchar; layer: longint; hot_x: longint; hot_y: longint); cdecl; external libecore_eva;
procedure ecore_evas_cursor_get(ee: PEcore_Evas; obj: PPEvas_Object; layer: Plongint; hot_x: Plongint; hot_y: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_object_cursor_set(ee: PEcore_Evas; obj: PEvas_Object; layer: longint; hot_x: longint; hot_y: longint); cdecl; external libecore_eva;
function ecore_evas_cursor_unset(ee: PEcore_Evas): PEvas_Object; cdecl; external libecore_eva;
function ecore_evas_cursor_device_unset(ee: PEcore_Evas; pointer: PEfl_Input_Device): PEvas_Object; cdecl; external libecore_eva;
procedure ecore_evas_object_cursor_device_set(ee: PEcore_Evas; pointer: PEfl_Input_Device; obj: PEvas_Object; layer: longint; hot_x: longint; hot_y: longint); cdecl; external libecore_eva;
function ecore_evas_cursor_device_get(ee: PEcore_Evas; pointer: PEfl_Input_Device; obj: PPEvas_Object; layer: Plongint; hot_x: Plongint; hot_y: Plongint): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_override_set(ee: PEcore_Evas; on: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_override_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_avoid_damage_set(ee: PEcore_Evas; on: TEcore_Evas_Avoid_Damage_Type); cdecl; external libecore_eva;
function ecore_evas_avoid_damage_get(ee: PEcore_Evas): TEcore_Evas_Avoid_Damage_Type; cdecl; external libecore_eva;
procedure ecore_evas_withdrawn_set(ee: PEcore_Evas; withdrawn: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_withdrawn_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_sticky_set(ee: PEcore_Evas; sticky: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_sticky_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_manual_render_set(ee: PEcore_Evas; manual_render: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_manual_render_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_input_event_register(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_input_event_unregister(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_manual_render(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_comp_sync_set(ee: PEcore_Evas; do_sync: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_comp_sync_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_screen_geometry_get(ee: PEcore_Evas; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_screen_dpi_get(ee: PEcore_Evas; xdpi: Plongint; ydpi: Plongint); cdecl; external libecore_eva;
procedure ecore_evas_draw_frame_set(ee: PEcore_Evas; draw_frame: TEina_Bool); cdecl; external libecore_eva; deprecated;
function ecore_evas_draw_frame_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva; deprecated;
procedure ecore_evas_shadow_geometry_set(ee: PEcore_Evas; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_shadow_geometry_get(ee: PEcore_Evas; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_eva;
function ecore_evas_object_associate(ee: PEcore_Evas; obj: PEvas_Object; flags: TEcore_Evas_Object_Associate_Flags): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_object_dissociate(ee: PEcore_Evas; obj: PEvas_Object): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_object_associate_get(ee: PEcore_Evas): PEvas_Object; cdecl; external libecore_eva;
function ecore_getopt_callback_ecore_evas_list_engines(parser: PEcore_Getopt; desc: PEcore_Getopt_Desc; str: pchar; data: pointer; storage: PEcore_Getopt_Value): byte; cdecl; external libecore_eva;
function ecore_evas_ecore_evas_list_get: PEina_List; cdecl; external libecore_eva;
function ecore_evas_sub_ecore_evas_list_get(ee: PEcore_Evas): PEina_List; cdecl; external libecore_eva;
procedure ecore_evas_x11_leader_set(ee: PEcore_Evas; win: TEcore_X_Window); cdecl; external libecore_eva;
function ecore_evas_x11_leader_get(ee: PEcore_Evas): TEcore_X_Window; cdecl; external libecore_eva;
procedure ecore_evas_x11_leader_default_set(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_x11_shape_input_rectangle_set(ee: PEcore_Evas; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_x11_shape_input_rectangle_add(ee: PEcore_Evas; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_x11_shape_input_rectangle_subtract(ee: PEcore_Evas; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_eva;
procedure ecore_evas_x11_shape_input_empty(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_x11_shape_input_reset(ee: PEcore_Evas); cdecl; external libecore_eva;
procedure ecore_evas_x11_shape_input_apply(ee: PEcore_Evas); cdecl; external libecore_eva;

{$ifdef EFL_BETA_API_SUPPORT}
type
  TEcore_Evas_Vnc_Client_Accept_Cb = function(data: pointer; ee: PEcore_Evas; client_host: pchar): TEina_Bool; cdecl;
  TEcore_Evas_Vnc_Client_Disconnected_Cb = procedure(data: pointer; ee: PEcore_Evas; client_host: pchar); cdecl;

function ecore_evas_vnc_start(ee: PEcore_Evas; addr: pchar; port: longint; accept_cb: TEcore_Evas_Vnc_Client_Accept_Cb; disc_cb: TEcore_Evas_Vnc_Client_Disconnected_Cb; data: pointer): PEvas_Object; cdecl; external libecore_eva;
{$endif}

type
  Tfunc = function(w: longint; h: longint): PEvas;

procedure ecore_evas_callback_new_set(func: Tfunc); cdecl; external libecore_eva;
function ecore_evas_ews_engine_set(engine: pchar; options: pchar): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_ews_setup(x: longint; y: longint; w: longint; h: longint): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_ews_ecore_evas_get: PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_ews_evas_get: PEvas; cdecl; external libecore_eva;
function ecore_evas_ews_background_get: PEvas_Object; cdecl; external libecore_eva;
procedure ecore_evas_ews_background_set(o: PEvas_Object); cdecl; external libecore_eva;
function ecore_evas_ews_children_get: PEina_List; cdecl; external libecore_eva;
procedure ecore_evas_ews_manager_set(manager: pointer); cdecl; external libecore_eva;
function ecore_evas_ews_manager_get: pointer; cdecl; external libecore_eva;

var
  ECORE_EVAS_EWS_EVENT_MANAGER_CHANGE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_ADD: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_DEL: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_RESIZE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_MOVE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_SHOW: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_HIDE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_FOCUS: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_UNFOCUS: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_RAISE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_LOWER: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_ACTIVATE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_ICONIFIED_CHANGE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_MAXIMIZED_CHANGE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_LAYER_CHANGE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_FULLSCREEN_CHANGE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EWS_EVENT_CONFIG_CHANGE: longint; cvar;external libecore_eva;
  ECORE_EVAS_EXTN_CLIENT_ADD: longint; cvar;external libecore_eva;
  ECORE_EVAS_EXTN_CLIENT_DEL: longint; cvar;external libecore_eva;

function ecore_evas_extn_socket_new(w: longint; h: longint): PEcore_Evas; cdecl; external libecore_eva;
function ecore_evas_extn_socket_listen(ee: PEcore_Evas; svcname: pchar; svcnum: longint; svcsys: TEina_Bool): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_extn_socket_events_block_set(ee: PEcore_Evas; events_block: TEina_Bool); cdecl; external libecore_eva;
function ecore_evas_extn_socket_events_block_get(ee: PEcore_Evas): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_extn_plug_object_data_lock(obj: PEvas_Object); cdecl; external libecore_eva;
procedure ecore_evas_extn_plug_object_data_unlock(obj: PEvas_Object); cdecl; external libecore_eva;
function ecore_evas_extn_plug_new(ee_target: PEcore_Evas): PEvas_Object; cdecl; external libecore_eva;
function ecore_evas_extn_plug_connect(obj: PEvas_Object; svcname: pchar; svcnum: longint; svcsys: TEina_Bool): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_pointer_xy_get(ee: PEcore_Evas; x: PEvas_Coord; y: PEvas_Coord); cdecl; external libecore_eva;
function ecore_evas_pointer_warp(ee: PEcore_Evas; x: TEvas_Coord; y: TEvas_Coord): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_pointer_device_xy_get(ee: PEcore_Evas; pointer: PEfl_Input_Device; x: PEvas_Coord; y: PEvas_Coord); cdecl; external libecore_eva;
function ecore_evas_pixmap_visual_get(ee: PEcore_Evas): pointer; cdecl; external libecore_eva;
function ecore_evas_pixmap_colormap_get(ee: PEcore_Evas): dword; cdecl; external libecore_eva;
function ecore_evas_pixmap_depth_get(ee: PEcore_Evas): longint; cdecl; external libecore_eva;

type
  PEcore_Evas_Selection_Buffer = ^TEcore_Evas_Selection_Buffer;
  TEcore_Evas_Selection_Buffer = longint;

const
  ECORE_EVAS_SELECTION_BUFFER_SELECTION_BUFFER = 0;
  ECORE_EVAS_SELECTION_BUFFER_COPY_AND_PASTE_BUFFER = 1;
  ECORE_EVAS_SELECTION_BUFFER_DRAG_AND_DROP_BUFFER = 2;
  ECORE_EVAS_SELECTION_BUFFER_LAST = 3;

type
  TEcore_Evas_Selection_Changed_Cb = procedure(ee: PEcore_Evas; seat: dword; selection: TEcore_Evas_Selection_Buffer); cdecl;

procedure ecore_evas_callback_selection_changed_set(ee: PEcore_Evas; cb: TEcore_Evas_Selection_Changed_Cb); cdecl; external libecore_eva;
function ecore_evas_selection_set(ee: PEcore_Evas; seat: dword; buffer: TEcore_Evas_Selection_Buffer; content: PEina_Content): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_selection_exists(ee: PEcore_Evas; seat: dword; buffer: TEcore_Evas_Selection_Buffer): TEina_Bool; cdecl; external libecore_eva;
function ecore_evas_selection_get(ee: PEcore_Evas; seat: dword; buffer: TEcore_Evas_Selection_Buffer; acceptable_types: PEina_Iterator): PEina_Future; cdecl; external libecore_eva;

type
  TEcore_Evas_Drag_Finished_Cb = procedure(ee: PEcore_Evas; seat: dword; data: pointer; accepted: TEina_Bool); cdecl;

function ecore_evas_drag_start(ee: PEcore_Evas; seat: dword; content: PEina_Content; drag_rep: PEcore_Evas; action: pchar; terminate_cb: TEcore_Evas_Drag_Finished_Cb; data: pointer): TEina_Bool; cdecl; external libecore_eva;
procedure ecore_evas_drag_offset_set(ee: PEcore_Evas; seat: dword; offset: TEina_Size2D); cdecl; external libecore_eva;
function ecore_evas_drag_cancel(ee: PEcore_Evas; seat: dword): TEina_Bool; cdecl; external libecore_eva;

type
  TEcore_Evas_Drag_State_Changed_Cb = procedure(ee: PEcore_Evas; seat: dword; p: TEina_Position2D; inside: TEina_Bool); cdecl;

procedure ecore_evas_callback_drop_state_changed_set(ee: PEcore_Evas; cb: TEcore_Evas_Drag_State_Changed_Cb); cdecl; external libecore_eva;

type
  TEcore_Evas_Drag_Motion_Cb = procedure(ee: PEcore_Evas; seat: dword; p: TEina_Position2D); cdecl;

procedure ecore_evas_callback_drop_motion_set(ee: PEcore_Evas; cb: TEcore_Evas_Drag_Motion_Cb); cdecl; external libecore_eva;

type
  TEcore_Evas_Drop_Cb = procedure(ee: PEcore_Evas; seat: dword; p: TEina_Position2D; action: pchar); cdecl;

procedure ecore_evas_callback_drop_drop_set(ee: PEcore_Evas; cb: TEcore_Evas_Drop_Cb); cdecl; external libecore_eva;
function ecore_evas_drop_available_types_get(ee: PEcore_Evas; seat: dword): PEina_Accessor; cdecl; external libecore_eva;

// === Konventiert am: 21-5-25 19:11:52 ===


implementation



end.
