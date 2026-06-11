unit fp_xdg;

interface

uses
  fp_wayland;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


// ==== xdg-shell-protocol.c

{ Externe Wayland-Kern-Schnittstellen }
var
  wl_output_interface: twl_interface; external libwayland_client;
  wl_seat_interface: twl_interface; external libwayland_client;
  wl_surface_interface: twl_interface; external libwayland_client;

{ XDG-Shell Schnittstellen }
var
  xdg_wm_base_interface: twl_interface; cvar; external;
  xdg_positioner_interface: twl_interface; cvar; external;
  xdg_surface_interface: twl_interface; cvar; external;
  xdg_toplevel_interface: twl_interface; cvar; external;
  xdg_popup_interface: twl_interface; cvar; external;

const
  libwayland_client = 'wayland-client';

{ Types Array - spiegelt xdg_shell_types[] wider }
var
  xdg_shell_types: array[0..25] of Pwl_interface = (
    nil, nil, nil, nil,
    @xdg_positioner_interface, @xdg_surface_interface, @wl_surface_interface, @xdg_toplevel_interface,
    @xdg_popup_interface, @xdg_surface_interface, @xdg_positioner_interface, @xdg_toplevel_interface,
    @wl_seat_interface, nil, nil, nil,
    @wl_seat_interface, nil, @wl_seat_interface, nil,
    nil, @wl_output_interface, @wl_seat_interface, nil,
    @xdg_positioner_interface, nil
  );

const
  xdg_wm_base_requests: array[0..3] of twl_message = (
    (name: 'destroy';           signature: '';    types: @xdg_shell_types[0]),
    (name: 'create_positioner'; signature: 'n';   types: @xdg_shell_types[4]),
    (name: 'get_xdg_surface';   signature: 'no';  types: @xdg_shell_types[5]),
    (name: 'pong';              signature: 'u';   types: @xdg_shell_types[0])
  );

  xdg_positioner_requests: array[0..9] of twl_message = (
    (name: 'destroy';                   signature: '';     types: @xdg_shell_types[0]),
    (name: 'set_size';                  signature: 'ii';   types: @xdg_shell_types[0]),
    (name: 'set_anchor_rect';           signature: 'iiii'; types: @xdg_shell_types[0]),
    (name: 'set_anchor';                signature: 'u';    types: @xdg_shell_types[0]),
    (name: 'set_gravity';               signature: 'u';    types: @xdg_shell_types[0]),
    (name: 'set_constraint_adjustment'; signature: 'u';    types: @xdg_shell_types[0]),
    (name: 'set_offset';                signature: 'ii';   types: @xdg_shell_types[0]),
    (name: 'set_reactive';              signature: '3';    types: @xdg_shell_types[0]),
    (name: 'set_parent_size';           signature: '3ii';  types: @xdg_shell_types[0]),
    (name: 'set_parent_configure';      signature: '3u';   types: @xdg_shell_types[0])
  );

  xdg_surface_requests: array[0..4] of twl_message = (
    (name: 'destroy';             signature: '';     types: @xdg_shell_types[0]),
    (name: 'get_toplevel';        signature: 'n';    types: @xdg_shell_types[7]),
    (name: 'get_popup';           signature: 'n?oo'; types: @xdg_shell_types[8]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @xdg_shell_types[0]),
    (name: 'ack_configure';       signature: 'u';    types: @xdg_shell_types[0])
  );

  xdg_toplevel_requests: array[0..13] of twl_message = (
    (name: 'destroy';           signature: '';     types: @xdg_shell_types[0]),
    (name: 'set_parent';        signature: '?o';   types: @xdg_shell_types[11]),
    (name: 'set_title';         signature: 's';    types: @xdg_shell_types[0]),
    (name: 'set_app_id';        signature: 's';    types: @xdg_shell_types[0]),
    (name: 'show_window_menu';  signature: 'ouii'; types: @xdg_shell_types[12]),
    (name: 'move';              signature: 'ou';   types: @xdg_shell_types[16]),
    (name: 'resize';            signature: 'ouu';  types: @xdg_shell_types[18]),
    (name: 'set_max_size';      signature: 'ii';   types: @xdg_shell_types[0]),
    (name: 'set_min_size';      signature: 'ii';   types: @xdg_shell_types[0]),
    (name: 'set_maximized';     signature: '';     types: @xdg_shell_types[0]),
    (name: 'unset_maximized';   signature: '';     types: @xdg_shell_types[0]),
    (name: 'set_fullscreen';    signature: '?o';   types: @xdg_shell_types[21]),
    (name: 'unset_fullscreen';  signature: '';     types: @xdg_shell_types[0]),
    (name: 'set_minimized';     signature: '';     types: @xdg_shell_types[0])
  );

  xdg_popup_requests: array[0..2] of twl_message = (
    (name: 'destroy';    signature: '';    types: @xdg_shell_types[0]),
    (name: 'grab';       signature: 'ou';  types: @xdg_shell_types[22]),
    (name: 'reposition'; signature: '3ou'; types: @xdg_shell_types[24])
  );

{ --- Events --- }

const
  xdg_wm_base_events: array[0..0] of twl_message = (
    (name: 'ping'; signature: 'u'; types: @xdg_shell_types[0])
  );

  xdg_surface_events: array[0..0] of twl_message = (
    (name: 'configure'; signature: 'u'; types: @xdg_shell_types[0])
  );

  xdg_toplevel_events: array[0..3] of twl_message = (
    (name: 'configure';        signature: 'iia'; types: @xdg_shell_types[0]),
    (name: 'close';            signature: '';    types: @xdg_shell_types[0]),
    (name: 'configure_bounds'; signature: '4ii'; types: @xdg_shell_types[0]),
    (name: 'wm_capabilities';  signature: '5a';  types: @xdg_shell_types[0])
  );

  xdg_popup_events: array[0..2] of twl_message = (
    (name: 'configure';    signature: 'iiii'; types: @xdg_shell_types[0]),
    (name: 'popup_done';   signature: '';     types: @xdg_shell_types[0]),
    (name: 'repositioned'; signature: '3u';   types: @xdg_shell_types[0])
  );



// ==== xdg-shell-client-protocol.h
const
  WL_MARSHAL_FLAG_DESTROY = 1;

type
  int32_t = LongInt;
  uint32_t = DWord;

  { Opaque Strukturen / Vorwärtsdeklarationen }
  wl_output = record end; Pwl_output = ^wl_output;
  wl_seat = record end; Pwl_seat = ^wl_seat;
  wl_surface = record end; Pwl_surface = ^wl_surface;
  wl_array = record end; Pwl_array = ^wl_array;
  wl_interface = record end; Pwl_interface = ^wl_interface;

  xdg_popup = record end; Pxdg_popup = ^xdg_popup;
  xdg_positioner = record end; Pxdg_positioner = ^xdg_positioner;
  xdg_surface = record end; Pxdg_surface = ^xdg_surface;
  xdg_toplevel = record end; Pxdg_toplevel = ^xdg_toplevel;
  xdg_wm_base = record end; Pxdg_wm_base = ^xdg_wm_base;



{ --- ENUMS (im h2pas LongInt Stil) --- }

type
  xdg_wm_base_error = LongInt;
const
  XDG_WM_BASE_ERROR_ROLE = 0;
  XDG_WM_BASE_ERROR_DEFUNCT_SURFACES = 1;
  XDG_WM_BASE_ERROR_NOT_THE_TOPMOST_POPUP = 2;
  XDG_WM_BASE_ERROR_INVALID_POPUP_PARENT = 3;
  XDG_WM_BASE_ERROR_INVALID_SURFACE_STATE = 4;
  XDG_WM_BASE_ERROR_INVALID_POSITIONER = 5;
  XDG_WM_BASE_ERROR_UNRESPONSIVE = 6;

type
  xdg_positioner_error = LongInt;
const
  XDG_POSITIONER_ERROR_INVALID_INPUT = 0;

type
  xdg_positioner_anchor = LongInt;
const
  XDG_POSITIONER_ANCHOR_NONE = 0;
  XDG_POSITIONER_ANCHOR_TOP = 1;
  XDG_POSITIONER_ANCHOR_BOTTOM = 2;
  XDG_POSITIONER_ANCHOR_LEFT = 3;
  XDG_POSITIONER_ANCHOR_RIGHT = 4;
  XDG_POSITIONER_ANCHOR_TOP_LEFT = 5;
  XDG_POSITIONER_ANCHOR_BOTTOM_LEFT = 6;
  XDG_POSITIONER_ANCHOR_TOP_RIGHT = 7;
  XDG_POSITIONER_ANCHOR_BOTTOM_RIGHT = 8;

type
  xdg_positioner_gravity = LongInt;
const
  XDG_POSITIONER_GRAVITY_NONE = 0;
  XDG_POSITIONER_GRAVITY_TOP = 1;
  XDG_POSITIONER_GRAVITY_BOTTOM = 2;
  XDG_POSITIONER_GRAVITY_LEFT = 3;
  XDG_POSITIONER_GRAVITY_RIGHT = 4;
  XDG_POSITIONER_GRAVITY_TOP_LEFT = 5;
  XDG_POSITIONER_GRAVITY_BOTTOM_LEFT = 6;
  XDG_POSITIONER_GRAVITY_TOP_RIGHT = 7;
  XDG_POSITIONER_GRAVITY_BOTTOM_RIGHT = 8;

type
  xdg_positioner_constraint_adjustment = LongInt;
const
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_NONE = 0;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_X = 1;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_Y = 2;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_X = 4;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_Y = 8;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_X = 16;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_Y = 32;

type
  xdg_surface_error = LongInt;
const
  XDG_SURFACE_ERROR_NOT_CONSTRUCTED = 1;
  XDG_SURFACE_ERROR_ALREADY_CONSTRUCTED = 2;
  XDG_SURFACE_ERROR_UNCONFIGURED_BUFFER = 3;
  XDG_SURFACE_ERROR_INVALID_SERIAL = 4;
  XDG_SURFACE_ERROR_INVALID_SIZE = 5;
  XDG_SURFACE_ERROR_DEFUNCT_ROLE_OBJECT = 6;

type
  xdg_toplevel_error = LongInt;
const
  XDG_TOPLEVEL_ERROR_INVALID_RESIZE_EDGE = 0;
  XDG_TOPLEVEL_ERROR_INVALID_PARENT = 1;
  XDG_TOPLEVEL_ERROR_INVALID_SIZE = 2;

type
  xdg_toplevel_resize_edge = LongInt;
const
  XDG_TOPLEVEL_RESIZE_EDGE_NONE = 0;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP = 1;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM = 2;
  XDG_TOPLEVEL_RESIZE_EDGE_LEFT = 4;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP_LEFT = 5;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_LEFT = 6;
  XDG_TOPLEVEL_RESIZE_EDGE_RIGHT = 8;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP_RIGHT = 9;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_RIGHT = 10;

type
  xdg_toplevel_state = LongInt;
const
  XDG_TOPLEVEL_STATE_MAXIMIZED = 1;
  XDG_TOPLEVEL_STATE_FULLSCREEN = 2;
  XDG_TOPLEVEL_STATE_RESIZING = 3;
  XDG_TOPLEVEL_STATE_ACTIVATED = 4;
  XDG_TOPLEVEL_STATE_TILED_LEFT = 5;
  XDG_TOPLEVEL_STATE_TILED_RIGHT = 6;
  XDG_TOPLEVEL_STATE_TILED_TOP = 7;
  XDG_TOPLEVEL_STATE_TILED_BOTTOM = 8;
  XDG_TOPLEVEL_STATE_SUSPENDED = 9;
  XDG_TOPLEVEL_STATE_CONSTRAINED_LEFT = 10;
  XDG_TOPLEVEL_STATE_CONSTRAINED_RIGHT = 11;
  XDG_TOPLEVEL_STATE_CONSTRAINED_TOP = 12;
  XDG_TOPLEVEL_STATE_CONSTRAINED_BOTTOM = 13;

type
  xdg_toplevel_wm_capabilities = LongInt;
const
  XDG_TOPLEVEL_WM_CAPABILITIES_WINDOW_MENU = 1;
  XDG_TOPLEVEL_WM_CAPABILITIES_MAXIMIZE = 2;
  XDG_TOPLEVEL_WM_CAPABILITIES_FULLSCREEN = 3;
  XDG_TOPLEVEL_WM_CAPABILITIES_MINIMIZE = 4;

type
  xdg_popup_error = LongInt;
const
  XDG_POPUP_ERROR_INVALID_GRAB = 0;

{ --- Opcodes und Versionen (Macros) --- }

const
  XDG_WM_BASE_DESTROY = 0;
  XDG_WM_BASE_CREATE_POSITIONER = 1;
  XDG_WM_BASE_GET_XDG_SURFACE = 2;
  XDG_WM_BASE_PONG = 3;

  XDG_WM_BASE_PING_SINCE_VERSION = 1;
  XDG_WM_BASE_DESTROY_SINCE_VERSION = 1;
  XDG_WM_BASE_CREATE_POSITIONER_SINCE_VERSION = 1;
  XDG_WM_BASE_GET_XDG_SURFACE_SINCE_VERSION = 1;
  XDG_WM_BASE_PONG_SINCE_VERSION = 1;

  XDG_POSITIONER_DESTROY = 0;
  XDG_POSITIONER_SET_SIZE = 1;
  XDG_POSITIONER_SET_ANCHOR_RECT = 2;
  XDG_POSITIONER_SET_ANCHOR = 3;
  XDG_POSITIONER_SET_GRAVITY = 4;
  XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT = 5;
  XDG_POSITIONER_SET_OFFSET = 6;
  XDG_POSITIONER_SET_REACTIVE = 7;
  XDG_POSITIONER_SET_PARENT_SIZE = 8;
  XDG_POSITIONER_SET_PARENT_CONFIGURE = 9;

  XDG_POSITIONER_DESTROY_SINCE_VERSION = 1;
  XDG_POSITIONER_SET_SIZE_SINCE_VERSION = 1;
  XDG_POSITIONER_SET_ANCHOR_RECT_SINCE_VERSION = 1;
  XDG_POSITIONER_SET_ANCHOR_SINCE_VERSION = 1;
  XDG_POSITIONER_SET_GRAVITY_SINCE_VERSION = 1;
  XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT_SINCE_VERSION = 1;
  XDG_POSITIONER_SET_OFFSET_SINCE_VERSION = 1;
  XDG_POSITIONER_SET_REACTIVE_SINCE_VERSION = 3;
  XDG_POSITIONER_SET_PARENT_SIZE_SINCE_VERSION = 3;
  XDG_POSITIONER_SET_PARENT_CONFIGURE_SINCE_VERSION = 3;

  XDG_SURFACE_DESTROY = 0;
  XDG_SURFACE_GET_TOPLEVEL = 1;
  XDG_SURFACE_GET_POPUP = 2;
  XDG_SURFACE_SET_WINDOW_GEOMETRY = 3;
  XDG_SURFACE_ACK_CONFIGURE = 4;

  XDG_SURFACE_CONFIGURE_SINCE_VERSION = 1;
  XDG_SURFACE_DESTROY_SINCE_VERSION = 1;
  XDG_SURFACE_GET_TOPLEVEL_SINCE_VERSION = 1;
  XDG_SURFACE_GET_POPUP_SINCE_VERSION = 1;
  XDG_SURFACE_SET_WINDOW_GEOMETRY_SINCE_VERSION = 1;
  XDG_SURFACE_ACK_CONFIGURE_SINCE_VERSION = 1;

  XDG_TOPLEVEL_STATE_TILED_LEFT_SINCE_VERSION = 2;
  XDG_TOPLEVEL_STATE_TILED_RIGHT_SINCE_VERSION = 2;
  XDG_TOPLEVEL_STATE_TILED_TOP_SINCE_VERSION = 2;
  XDG_TOPLEVEL_STATE_TILED_BOTTOM_SINCE_VERSION = 2;
  XDG_TOPLEVEL_STATE_SUSPENDED_SINCE_VERSION = 6;
  XDG_TOPLEVEL_STATE_CONSTRAINED_LEFT_SINCE_VERSION = 7;
  XDG_TOPLEVEL_STATE_CONSTRAINED_RIGHT_SINCE_VERSION = 7;
  XDG_TOPLEVEL_STATE_CONSTRAINED_TOP_SINCE_VERSION = 7;
  XDG_TOPLEVEL_STATE_CONSTRAINED_BOTTOM_SINCE_VERSION = 7;

  XDG_TOPLEVEL_DESTROY = 0;
  XDG_TOPLEVEL_SET_PARENT = 1;
  XDG_TOPLEVEL_SET_TITLE = 2;
  XDG_TOPLEVEL_SET_APP_ID = 3;
  XDG_TOPLEVEL_SHOW_WINDOW_MENU = 4;
  XDG_TOPLEVEL_MOVE = 5;
  XDG_TOPLEVEL_RESIZE = 6;
  XDG_TOPLEVEL_SET_MAX_SIZE = 7;
  XDG_TOPLEVEL_SET_MIN_SIZE = 8;
  XDG_TOPLEVEL_SET_MAXIMIZED = 9;
  XDG_TOPLEVEL_UNSET_MAXIMIZED = 10;
  XDG_TOPLEVEL_SET_FULLSCREEN = 11;
  XDG_TOPLEVEL_UNSET_FULLSCREEN = 12;
  XDG_TOPLEVEL_SET_MINIMIZED = 13;

  XDG_TOPLEVEL_CONFIGURE_SINCE_VERSION = 1;
  XDG_TOPLEVEL_CLOSE_SINCE_VERSION = 1;
  XDG_TOPLEVEL_CONFIGURE_BOUNDS_SINCE_VERSION = 4;
  XDG_TOPLEVEL_WM_CAPABILITIES_SINCE_VERSION = 5;

  XDG_TOPLEVEL_DESTROY_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SET_PARENT_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SET_TITLE_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SET_APP_ID_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SHOW_WINDOW_MENU_SINCE_VERSION = 1;
  XDG_TOPLEVEL_MOVE_SINCE_VERSION = 1;
  XDG_TOPLEVEL_RESIZE_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SET_MAX_SIZE_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SET_MIN_SIZE_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SET_MAXIMIZED_SINCE_VERSION = 1;
  XDG_TOPLEVEL_UNSET_MAXIMIZED_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SET_FULLSCREEN_SINCE_VERSION = 1;
  XDG_TOPLEVEL_UNSET_FULLSCREEN_SINCE_VERSION = 1;
  XDG_TOPLEVEL_SET_MINIMIZED_SINCE_VERSION = 1;

  XDG_POPUP_DESTROY = 0;
  XDG_POPUP_GRAB = 1;
  XDG_POPUP_REPOSITION = 2;

  XDG_POPUP_CONFIGURE_SINCE_VERSION = 1;
  XDG_POPUP_POPUP_DONE_SINCE_VERSION = 1;
  XDG_POPUP_REPOSITIONED_SINCE_VERSION = 3;

  XDG_POPUP_DESTROY_SINCE_VERSION = 1;
  XDG_POPUP_GRAB_SINCE_VERSION = 1;
  XDG_POPUP_REPOSITION_SINCE_VERSION = 3;

{ --- Listener-Strukturen (Callback-Interfaces) --- }

type
  pxdg_wm_base_listener = ^xdg_wm_base_listener;
  xdg_wm_base_listener = record
    ping: procedure(data: Pointer; xdg_wm_base: Pxdg_wm_base; serial: uint32_t); cdecl;
  end;

  pxdg_surface_listener = ^xdg_surface_listener;
  xdg_surface_listener = record
    configure: procedure(data: Pointer; xdg_surface: Pxdg_surface; serial: uint32_t); cdecl;
  end;

  pxdg_toplevel_listener = ^xdg_toplevel_listener;
  xdg_toplevel_listener = record
    configure: procedure(data: Pointer; xdg_toplevel: Pxdg_toplevel; width: int32_t; height: int32_t; states: Pwl_array); cdecl;
    close: procedure(data: Pointer; xdg_toplevel: Pxdg_toplevel); cdecl;
    configure_bounds: procedure(data: Pointer; xdg_toplevel: Pxdg_toplevel; width: int32_t; height: int32_t); cdecl;
    wm_capabilities: procedure(data: Pointer; xdg_toplevel: Pxdg_toplevel; capabilities: Pwl_array); cdecl;
  end;

  pxdg_popup_listener = ^xdg_popup_listener;
  xdg_popup_listener = record
    configure: procedure(data: Pointer; xdg_popup: Pxdg_popup; x: int32_t; y: int32_t; width: int32_t; height: int32_t); cdecl;
    popup_done: procedure(data: Pointer; xdg_popup: Pxdg_popup); cdecl;
    repositioned: procedure(data: Pointer; xdg_popup: Pxdg_popup; token: uint32_t); cdecl;
  end;

{ --- Inline-Methoden-Deklarationen --- }

function xdg_wm_base_add_listener(xdg_wm_base: Pxdg_wm_base; listener: pxdg_wm_base_listener; data: Pointer): LongInt; inline;
procedure xdg_wm_base_set_user_data(xdg_wm_base: Pxdg_wm_base; user_data: Pointer); inline;
function xdg_wm_base_get_user_data(xdg_wm_base: Pxdg_wm_base): Pointer; inline;
function xdg_wm_base_get_version(xdg_wm_base: Pxdg_wm_base): uint32_t; inline;
procedure xdg_wm_base_destroy(xdg_wm_base: Pxdg_wm_base); inline;
function xdg_wm_base_create_positioner(xdg_wm_base: Pxdg_wm_base): Pxdg_positioner; inline;
function xdg_wm_base_get_xdg_surface(xdg_wm_base: Pxdg_wm_base; surface: Pwl_surface): Pxdg_surface; inline;
procedure xdg_wm_base_pong(xdg_wm_base: Pxdg_wm_base; serial: uint32_t); inline;

procedure xdg_positioner_set_user_data(xdg_positioner: Pxdg_positioner; user_data: Pointer); inline;
function xdg_positioner_get_user_data(xdg_positioner: Pxdg_positioner): Pointer; inline;
function xdg_positioner_get_version(xdg_positioner: Pxdg_positioner): uint32_t; inline;
procedure xdg_positioner_destroy(xdg_positioner: Pxdg_positioner); inline;
procedure xdg_positioner_set_size(xdg_positioner: Pxdg_positioner; width: int32_t; height: int32_t); inline;
procedure xdg_positioner_set_anchor_rect(xdg_positioner: Pxdg_positioner; x: int32_t; y: int32_t; width: int32_t; height: int32_t); inline;
procedure xdg_positioner_set_anchor(xdg_positioner: Pxdg_positioner; anchor: uint32_t); inline;
procedure xdg_positioner_set_gravity(xdg_positioner: Pxdg_positioner; gravity: uint32_t); inline;
procedure xdg_positioner_set_constraint_adjustment(xdg_positioner: Pxdg_positioner; constraint_adjustment: uint32_t); inline;
procedure xdg_positioner_set_offset(xdg_positioner: Pxdg_positioner; x: int32_t; y: int32_t); inline;
procedure xdg_positioner_set_reactive(xdg_positioner: Pxdg_positioner); inline;
procedure xdg_positioner_set_parent_size(xdg_positioner: Pxdg_positioner; parent_width: int32_t; parent_height: int32_t); inline;
procedure xdg_positioner_set_parent_configure(xdg_positioner: Pxdg_positioner; serial: uint32_t); inline;

function xdg_surface_add_listener(xdg_surface: Pxdg_surface; listener: pxdg_surface_listener; data: Pointer): LongInt; inline;
procedure xdg_surface_set_user_data(xdg_surface: Pxdg_surface; user_data: Pointer); inline;
function xdg_surface_get_user_data(xdg_surface: Pxdg_surface): Pointer; inline;
function xdg_surface_get_version(xdg_surface: Pxdg_surface): uint32_t; inline;
procedure xdg_surface_destroy(xdg_surface: Pxdg_surface); inline;
function xdg_surface_get_toplevel(xdg_surface: Pxdg_surface): Pxdg_toplevel; inline;
function xdg_surface_get_popup(xdg_surface: Pxdg_surface; parent: Pxdg_surface; positioner: Pxdg_positioner): Pxdg_popup; inline;
procedure xdg_surface_set_window_geometry(xdg_surface: Pxdg_surface; x: int32_t; y: int32_t; width: int32_t; height: int32_t); inline;
procedure xdg_surface_ack_configure(xdg_surface: Pxdg_surface; serial: uint32_t); inline;

function xdg_toplevel_add_listener(xdg_toplevel: Pxdg_toplevel; listener: pxdg_toplevel_listener; data: Pointer): LongInt; inline;
procedure xdg_toplevel_set_user_data(xdg_toplevel: Pxdg_toplevel; user_data: Pointer); inline;
function xdg_toplevel_get_user_data(xdg_toplevel: Pxdg_toplevel): Pointer; inline;
function xdg_toplevel_get_version(xdg_toplevel: Pxdg_toplevel): uint32_t; inline;
procedure xdg_toplevel_destroy(xdg_toplevel: Pxdg_toplevel); inline;
procedure xdg_toplevel_set_parent(xdg_toplevel: Pxdg_toplevel; parent: Pxdg_toplevel); inline;
procedure xdg_toplevel_set_title(xdg_toplevel: Pxdg_toplevel; const title: PChar); inline;
procedure xdg_toplevel_set_app_id(xdg_toplevel: Pxdg_toplevel; const app_id: PChar); inline;
procedure xdg_toplevel_show_window_menu(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: uint32_t; x: int32_t; y: int32_t); inline;
procedure xdg_toplevel_move(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: uint32_t); inline;
procedure xdg_toplevel_resize(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: uint32_t; edges: uint32_t); inline;
procedure xdg_toplevel_set_max_size(xdg_toplevel: Pxdg_toplevel; width: int32_t; height: int32_t); inline;
procedure xdg_toplevel_set_min_size(xdg_toplevel: Pxdg_toplevel; width: int32_t; height: int32_t); inline;
procedure xdg_toplevel_set_maximized(xdg_toplevel: Pxdg_toplevel); inline;
procedure xdg_toplevel_unset_maximized(xdg_toplevel: Pxdg_toplevel); inline;
procedure xdg_toplevel_set_fullscreen(xdg_toplevel: Pxdg_toplevel; output: Pwl_output); inline;
procedure xdg_toplevel_unset_fullscreen(xdg_toplevel: Pxdg_toplevel); inline;
procedure xdg_toplevel_set_minimized(xdg_toplevel: Pxdg_toplevel); inline;

function xdg_popup_add_listener(xdg_popup: Pxdg_popup; listener: pxdg_popup_listener; data: Pointer): LongInt; inline;
procedure xdg_popup_set_user_data(xdg_popup: Pxdg_popup; user_data: Pointer); inline;
function xdg_popup_get_user_data(xdg_popup: Pxdg_popup): Pointer; inline;
function xdg_popup_get_version(xdg_popup: Pxdg_popup): uint32_t; inline;
procedure xdg_popup_destroy(xdg_popup: Pxdg_popup); inline;
procedure xdg_popup_grab(xdg_popup: Pxdg_popup; seat: Pwl_seat; serial: uint32_t); inline;
procedure xdg_popup_reposition(xdg_popup: Pxdg_popup; positioner: Pxdg_positioner; token: uint32_t); inline;

implementation

{ Kerndeklarationen der libwayland-client API }
const
  wayland_lib = 'libwayland-client.so';

function wl_proxy_add_listener(proxy: Pointer; implementation: Pointer; data: Pointer): LongInt; cdecl; external wayland_lib;
procedure wl_proxy_set_user_data(proxy: Pointer; user_data: Pointer); cdecl; external wayland_lib;
function wl_proxy_get_user_data(proxy: Pointer): Pointer; cdecl; external wayland_lib;
function wl_proxy_get_version(proxy: Pointer): uint32_t; cdecl; external wayland_lib;
function wl_proxy_marshal_flags(proxy: Pointer; opcode: uint32_t; interface_: Pwl_interface; version: uint32_t; flags: uint32_t): Pointer; cdecl; varargs; external wayland_lib;

{ --- Implementierung der Inline-Helper --- }

function xdg_wm_base_add_listener(xdg_wm_base: Pxdg_wm_base; listener: pxdg_wm_base_listener; data: Pointer): LongInt; inline;
begin
  Result := wl_proxy_add_listener(Pointer(xdg_wm_base), Pointer(listener), data);
end;

procedure xdg_wm_base_set_user_data(xdg_wm_base: Pxdg_wm_base; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(Pointer(xdg_wm_base), user_data);
end;

function xdg_wm_base_get_user_data(xdg_wm_base: Pxdg_wm_base): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(Pointer(xdg_wm_base));
end;

function xdg_wm_base_get_version(xdg_wm_base: Pxdg_wm_base): uint32_t; inline;
begin
  Result := wl_proxy_get_version(Pointer(xdg_wm_base));
end;

procedure xdg_wm_base_destroy(xdg_wm_base: Pxdg_wm_base); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_wm_base), XDG_WM_BASE_DESTROY, nil, wl_proxy_get_version(Pointer(xdg_wm_base)), WL_MARSHAL_FLAG_DESTROY);
end;

function xdg_wm_base_create_positioner(xdg_wm_base: Pxdg_wm_base): Pxdg_positioner; inline;
begin
  Result := Pxdg_positioner(wl_proxy_marshal_flags(Pointer(xdg_wm_base), XDG_WM_BASE_CREATE_POSITIONER, @xdg_positioner_interface, wl_proxy_get_version(Pointer(xdg_wm_base)), 0));
end;

function xdg_wm_base_get_xdg_surface(xdg_wm_base: Pxdg_wm_base; surface: Pwl_surface): Pxdg_surface; inline;
begin
  Result := Pxdg_surface(wl_proxy_marshal_flags(Pointer(xdg_wm_base), XDG_WM_BASE_GET_XDG_SURFACE, @xdg_surface_interface, wl_proxy_get_version(Pointer(xdg_wm_base)), 0, surface));
end;

procedure xdg_wm_base_pong(xdg_wm_base: Pxdg_wm_base; serial: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_wm_base), XDG_WM_BASE_PONG, nil, wl_proxy_get_version(Pointer(xdg_wm_base)), 0, serial);
end;

procedure xdg_positioner_set_user_data(xdg_positioner: Pxdg_positioner; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(Pointer(xdg_positioner), user_data);
end;

function xdg_positioner_get_user_data(xdg_positioner: Pxdg_positioner): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(Pointer(xdg_positioner));
end;

function xdg_positioner_get_version(xdg_positioner: Pxdg_positioner): uint32_t; inline;
begin
  Result := wl_proxy_get_version(Pointer(xdg_positioner));
end;

procedure xdg_positioner_destroy(xdg_positioner: Pxdg_positioner); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_DESTROY, nil, wl_proxy_get_version(Pointer(xdg_positioner)), WL_MARSHAL_FLAG_DESTROY);
end;

procedure xdg_positioner_set_size(xdg_positioner: Pxdg_positioner; width: int32_t; height: int32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_SIZE, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0, width, height);
end;

procedure xdg_positioner_set_anchor_rect(xdg_positioner: Pxdg_positioner; x: int32_t; y: int32_t; width: int32_t; height: int32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_ANCHOR_RECT, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0, x, y, width, height);
end;

procedure xdg_positioner_set_anchor(xdg_positioner: Pxdg_positioner; anchor: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_ANCHOR, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0, anchor);
end;

procedure xdg_positioner_set_gravity(xdg_positioner: Pxdg_positioner; gravity: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_GRAVITY, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0, gravity);
end;

procedure xdg_positioner_set_constraint_adjustment(xdg_positioner: Pxdg_positioner; constraint_adjustment: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0, constraint_adjustment);
end;

procedure xdg_positioner_set_offset(xdg_positioner: Pxdg_positioner; x: int32_t; y: int32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_OFFSET, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0, x, y);
end;

procedure xdg_positioner_set_reactive(xdg_positioner: Pxdg_positioner); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_REACTIVE, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0);
end;

procedure xdg_positioner_set_parent_size(xdg_positioner: Pxdg_positioner; parent_width: int32_t; parent_height: int32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_PARENT_SIZE, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0, parent_width, parent_height);
end;

procedure xdg_positioner_set_parent_configure(xdg_positioner: Pxdg_positioner; serial: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_positioner), XDG_POSITIONER_SET_PARENT_CONFIGURE, nil, wl_proxy_get_version(Pointer(xdg_positioner)), 0, serial);
end;

function xdg_surface_add_listener(xdg_surface: Pxdg_surface; listener: pxdg_surface_listener; data: Pointer): LongInt; inline;
begin
  Result := wl_proxy_add_listener(Pointer(xdg_surface), Pointer(listener), data);
end;

procedure xdg_surface_set_user_data(xdg_surface: Pxdg_surface; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(Pointer(xdg_surface), user_data);
end;

function xdg_surface_get_user_data(xdg_surface: Pxdg_surface): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(Pointer(xdg_surface));
end;

function xdg_surface_get_version(xdg_surface: Pxdg_surface): uint32_t; inline;
begin
  Result := wl_proxy_get_version(Pointer(xdg_surface));
end;

procedure xdg_surface_destroy(xdg_surface: Pxdg_surface); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_surface), XDG_SURFACE_DESTROY, nil, wl_proxy_get_version(Pointer(xdg_surface)), WL_MARSHAL_FLAG_DESTROY);
end;

function xdg_surface_get_toplevel(xdg_surface: Pxdg_surface): Pxdg_toplevel; inline;
begin
  Result := Pxdg_toplevel(wl_proxy_marshal_flags(Pointer(xdg_surface), XDG_SURFACE_GET_TOPLEVEL, @xdg_toplevel_interface, wl_proxy_get_version(Pointer(xdg_surface)), 0));
end;

function xdg_surface_get_popup(xdg_surface: Pxdg_surface; parent: Pxdg_surface; positioner: Pxdg_positioner): Pxdg_popup; inline;
begin
  Result := Pxdg_popup(wl_proxy_marshal_flags(Pointer(xdg_surface), XDG_SURFACE_GET_POPUP, @xdg_popup_interface, wl_proxy_get_version(Pointer(xdg_surface)), 0, parent, positioner));
end;

procedure xdg_surface_set_window_geometry(xdg_surface: Pxdg_surface; x: int32_t; y: int32_t; width: int32_t; height: int32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_surface), XDG_SURFACE_SET_WINDOW_GEOMETRY, nil, wl_proxy_get_version(Pointer(xdg_surface)), 0, x, y, width, height);
end;

procedure xdg_surface_ack_configure(xdg_surface: Pxdg_surface; serial: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_surface), XDG_SURFACE_ACK_CONFIGURE, nil, wl_proxy_get_version(Pointer(xdg_surface)), 0, serial);
end;

function xdg_toplevel_add_listener(xdg_toplevel: Pxdg_toplevel; listener: pxdg_toplevel_listener; data: Pointer): LongInt; inline;
begin
  Result := wl_proxy_add_listener(Pointer(xdg_toplevel), Pointer(listener), data);
end;

procedure xdg_toplevel_set_user_data(xdg_toplevel: Pxdg_toplevel; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(Pointer(xdg_toplevel), user_data);
end;

function xdg_toplevel_get_user_data(xdg_toplevel: Pxdg_toplevel): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(Pointer(xdg_toplevel));
end;

function xdg_toplevel_get_version(xdg_toplevel: Pxdg_toplevel): uint32_t; inline;
begin
  Result := wl_proxy_get_version(Pointer(xdg_toplevel));
end;

procedure xdg_toplevel_destroy(xdg_toplevel: Pxdg_toplevel); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_DESTROY, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), WL_MARSHAL_FLAG_DESTROY);
end;

procedure xdg_toplevel_set_parent(xdg_toplevel: Pxdg_toplevel; parent: Pxdg_toplevel); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SET_PARENT, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, parent);
end;

procedure xdg_toplevel_set_title(xdg_toplevel: Pxdg_toplevel; const title: PChar); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SET_TITLE, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, title);
end;

procedure xdg_toplevel_set_app_id(xdg_toplevel: Pxdg_toplevel; const app_id: PChar); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SET_APP_ID, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, app_id);
end;

procedure xdg_toplevel_show_window_menu(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: uint32_t; x: int32_t; y: int32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SHOW_WINDOW_MENU, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, seat, serial, x, y);
end;

procedure xdg_toplevel_move(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_MOVE, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, seat, serial);
end;

procedure xdg_toplevel_resize(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: uint32_t; edges: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_RESIZE, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, seat, serial, edges);
end;

procedure xdg_toplevel_set_max_size(xdg_toplevel: Pxdg_toplevel; width: int32_t; height: int32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SET_MAX_SIZE, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, width, height);
end;

procedure xdg_toplevel_set_min_size(xdg_toplevel: Pxdg_toplevel; width: int32_t; height: int32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SET_MIN_SIZE, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, width, height);
end;

procedure xdg_toplevel_set_maximized(xdg_toplevel: Pxdg_toplevel); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SET_MAXIMIZED, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0);
end;

procedure xdg_toplevel_unset_maximized(xdg_toplevel: Pxdg_toplevel); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_UNSET_MAXIMIZED, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0);
end;

procedure xdg_toplevel_set_fullscreen(xdg_toplevel: Pxdg_toplevel; output: Pwl_output); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SET_FULLSCREEN, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0, output);
end;

procedure xdg_toplevel_unset_fullscreen(xdg_toplevel: Pxdg_toplevel); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_UNSET_FULLSCREEN, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0);
end;

procedure xdg_toplevel_set_minimized(xdg_toplevel: Pxdg_toplevel); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_toplevel), XDG_TOPLEVEL_SET_MINIMIZED, nil, wl_proxy_get_version(Pointer(xdg_toplevel)), 0);
end;

function xdg_popup_add_listener(xdg_popup: Pxdg_popup; listener: pxdg_popup_listener; data: Pointer): LongInt; inline;
begin
  Result := wl_proxy_add_listener(Pointer(xdg_popup), Pointer(listener), data);
end;

procedure xdg_popup_set_user_data(xdg_popup: Pxdg_popup; user_data: Pointer); inline;
begin
  wl_proxy_set_user_data(Pointer(xdg_popup), user_data);
end;

function xdg_popup_get_user_data(xdg_popup: Pxdg_popup): Pointer; inline;
begin
  Result := wl_proxy_get_user_data(Pointer(xdg_popup));
end;

function xdg_popup_get_version(xdg_popup: Pxdg_popup): uint32_t; inline;
begin
  Result := wl_proxy_get_version(Pointer(xdg_popup));
end;

procedure xdg_popup_destroy(xdg_popup: Pxdg_popup); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_popup), XDG_POPUP_DESTROY, nil, wl_proxy_get_version(Pointer(xdg_popup)), WL_MARSHAL_FLAG_DESTROY);
end;

procedure xdg_popup_grab(xdg_popup: Pxdg_popup; seat: Pwl_seat; serial: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_popup), XDG_POPUP_GRAB, nil, wl_proxy_get_version(Pointer(xdg_popup)), 0, seat, serial);
end;

procedure xdg_popup_reposition(xdg_popup: Pxdg_popup; positioner: Pxdg_positioner; token: uint32_t); inline;
begin
  wl_proxy_marshal_flags(Pointer(xdg_popup), XDG_POPUP_REPOSITION, nil, wl_proxy_get_version(Pointer(xdg_popup)), 0, positioner, token);
end;

end.



