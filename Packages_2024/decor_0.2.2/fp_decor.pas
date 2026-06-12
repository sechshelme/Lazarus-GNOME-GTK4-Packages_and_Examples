unit fp_decor;

interface

uses
  fp_wayland;

const
  {$IFDEF Linux}
  libdecor = 'decor-0';
  {$ENDIF}

  {$IFDEF Windows}
  libdecor = 'decor-0'; // ????
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pxdg_surface = type Pointer;
  Pxdg_toplevel = type Pointer;
  Plibdecor = type Pointer;
  Plibdecor_frame = type Pointer;
  Plibdecor_configuration = type Pointer;
  Plibdecor_state = type Pointer;

type
  Tlibdecor_error = longint;

const
  LIBDECOR_ERROR_COMPOSITOR_INCOMPATIBLE = 0;
  LIBDECOR_ERROR_INVALID_FRAME_CONFIGURATION = 1;

type
  Tlibdecor_window_state = longint;
  Plibdecor_window_state = ^Tlibdecor_window_state;

const
  LIBDECOR_WINDOW_STATE_NONE = 0;
  LIBDECOR_WINDOW_STATE_ACTIVE = 1 shl 0;
  LIBDECOR_WINDOW_STATE_MAXIMIZED = 1 shl 1;
  LIBDECOR_WINDOW_STATE_FULLSCREEN = 1 shl 2;
  LIBDECOR_WINDOW_STATE_TILED_LEFT = 1 shl 3;
  LIBDECOR_WINDOW_STATE_TILED_RIGHT = 1 shl 4;
  LIBDECOR_WINDOW_STATE_TILED_TOP = 1 shl 5;
  LIBDECOR_WINDOW_STATE_TILED_BOTTOM = 1 shl 6;
  LIBDECOR_WINDOW_STATE_SUSPENDED = 1 shl 7;

type
  Tlibdecor_resize_edge = longint;

const
  LIBDECOR_RESIZE_EDGE_NONE = 0;
  LIBDECOR_RESIZE_EDGE_TOP = 1;
  LIBDECOR_RESIZE_EDGE_BOTTOM = 2;
  LIBDECOR_RESIZE_EDGE_LEFT = 3;
  LIBDECOR_RESIZE_EDGE_TOP_LEFT = 4;
  LIBDECOR_RESIZE_EDGE_BOTTOM_LEFT = 5;
  LIBDECOR_RESIZE_EDGE_RIGHT = 6;
  LIBDECOR_RESIZE_EDGE_TOP_RIGHT = 7;
  LIBDECOR_RESIZE_EDGE_BOTTOM_RIGHT = 8;

type
  Tlibdecor_capabilities = longint;

const
  LIBDECOR_ACTION_MOVE = 1 shl 0;
  LIBDECOR_ACTION_RESIZE = 1 shl 1;
  LIBDECOR_ACTION_MINIMIZE = 1 shl 2;
  LIBDECOR_ACTION_FULLSCREEN = 1 shl 3;
  LIBDECOR_ACTION_CLOSE = 1 shl 4;

type
  Tlibdecor_interface = record
    error: procedure(context: Plibdecor; error: Tlibdecor_error; message: pchar); cdecl;
    reserved0: procedure; cdecl;
    reserved1: procedure; cdecl;
    reserved2: procedure; cdecl;
    reserved3: procedure; cdecl;
    reserved4: procedure; cdecl;
    reserved5: procedure; cdecl;
    reserved6: procedure; cdecl;
    reserved7: procedure; cdecl;
    reserved8: procedure; cdecl;
    reserved9: procedure; cdecl;
  end;
  Plibdecor_interface = ^Tlibdecor_interface;

  Tlibdecor_frame_interface = record
    configure: procedure(frame: Plibdecor_frame; configuration: Plibdecor_configuration; user_data: pointer); cdecl;
    close: procedure(frame: Plibdecor_frame; user_data: pointer); cdecl;
    commit: procedure(frame: Plibdecor_frame; user_data: pointer); cdecl;
    dismiss_popup: procedure(frame: Plibdecor_frame; seat_name: pchar; user_data: pointer); cdecl;
    reserved0: procedure; cdecl;
    reserved1: procedure; cdecl;
    reserved2: procedure; cdecl;
    reserved3: procedure; cdecl;
    reserved4: procedure; cdecl;
    reserved5: procedure; cdecl;
    reserved6: procedure; cdecl;
    reserved7: procedure; cdecl;
    reserved8: procedure; cdecl;
    reserved9: procedure; cdecl;
  end;
  Plibdecor_frame_interface = ^Tlibdecor_frame_interface;

procedure libdecor_unref(context: Plibdecor); cdecl; external libdecor;
function libdecor_new(display: Pwl_display; iface: Plibdecor_interface): Plibdecor; cdecl; external libdecor;
function libdecor_get_fd(context: Plibdecor): longint; cdecl; external libdecor;
function libdecor_dispatch(context: Plibdecor; timeout: longint): longint; cdecl; external libdecor;
function libdecor_decorate(context: Plibdecor; surface: Pwl_surface; iface: Plibdecor_frame_interface; user_data: pointer): Plibdecor_frame; cdecl; external libdecor;
procedure libdecor_frame_ref(frame: Plibdecor_frame); cdecl; external libdecor;
procedure libdecor_frame_unref(frame: Plibdecor_frame); cdecl; external libdecor;
procedure libdecor_frame_set_visibility(frame: Plibdecor_frame; visible: boolean); cdecl; external libdecor;
function libdecor_frame_is_visible(frame: Plibdecor_frame): boolean; cdecl; external libdecor;
procedure libdecor_frame_set_parent(frame: Plibdecor_frame; parent: Plibdecor_frame); cdecl; external libdecor;
procedure libdecor_frame_set_title(frame: Plibdecor_frame; title: pchar); cdecl; external libdecor;
function libdecor_frame_get_title(frame: Plibdecor_frame): pchar; cdecl; external libdecor;
procedure libdecor_frame_set_app_id(frame: Plibdecor_frame; app_id: pchar); cdecl; external libdecor;
procedure libdecor_frame_set_capabilities(frame: Plibdecor_frame; capabilities: Tlibdecor_capabilities); cdecl; external libdecor;
procedure libdecor_frame_unset_capabilities(frame: Plibdecor_frame; capabilities: Tlibdecor_capabilities); cdecl; external libdecor;
function libdecor_frame_has_capability(frame: Plibdecor_frame; capability: Tlibdecor_capabilities): boolean; cdecl; external libdecor;
procedure libdecor_frame_show_window_menu(frame: Plibdecor_frame; wl_seat: Pwl_seat; serial: Tuint32_t; x: longint; y: longint); cdecl; external libdecor;
procedure libdecor_frame_popup_grab(frame: Plibdecor_frame; seat_name: pchar); cdecl; external libdecor;
procedure libdecor_frame_popup_ungrab(frame: Plibdecor_frame; seat_name: pchar); cdecl; external libdecor;
procedure libdecor_frame_translate_coordinate(frame: Plibdecor_frame; surface_x: longint; surface_y: longint; frame_x: Plongint; frame_y: Plongint); cdecl; external libdecor;
procedure libdecor_frame_set_min_content_size(frame: Plibdecor_frame; content_width: longint; content_height: longint); cdecl; external libdecor;
procedure libdecor_frame_set_max_content_size(frame: Plibdecor_frame; content_width: longint; content_height: longint); cdecl; external libdecor;
procedure libdecor_frame_get_min_content_size(frame: Plibdecor_frame; content_width: Plongint; content_height: Plongint); cdecl; external libdecor;
procedure libdecor_frame_get_max_content_size(frame: Plibdecor_frame; content_width: Plongint; content_height: Plongint); cdecl; external libdecor;
procedure libdecor_frame_resize(frame: Plibdecor_frame; wl_seat: Pwl_seat; serial: Tuint32_t; edge: Tlibdecor_resize_edge); cdecl; external libdecor;
procedure libdecor_frame_move(frame: Plibdecor_frame; wl_seat: Pwl_seat; serial: Tuint32_t); cdecl; external libdecor;
procedure libdecor_frame_commit(frame: Plibdecor_frame; state: Plibdecor_state; configuration: Plibdecor_configuration); cdecl; external libdecor;
procedure libdecor_frame_set_minimized(frame: Plibdecor_frame); cdecl; external libdecor;
procedure libdecor_frame_set_maximized(frame: Plibdecor_frame); cdecl; external libdecor;
procedure libdecor_frame_unset_maximized(frame: Plibdecor_frame); cdecl; external libdecor;
procedure libdecor_frame_set_fullscreen(frame: Plibdecor_frame; output: Pwl_output); cdecl; external libdecor;
procedure libdecor_frame_unset_fullscreen(frame: Plibdecor_frame); cdecl; external libdecor;
function libdecor_frame_is_floating(frame: Plibdecor_frame): boolean; cdecl; external libdecor;
procedure libdecor_frame_close(frame: Plibdecor_frame); cdecl; external libdecor;
procedure libdecor_frame_map(frame: Plibdecor_frame); cdecl; external libdecor;
function libdecor_frame_get_xdg_surface(frame: Plibdecor_frame): Pxdg_surface; cdecl; external libdecor;
function libdecor_frame_get_xdg_toplevel(frame: Plibdecor_frame): Pxdg_toplevel; cdecl; external libdecor;
function libdecor_state_new(width: longint; height: longint): Plibdecor_state; cdecl; external libdecor;
procedure libdecor_state_free(state: Plibdecor_state); cdecl; external libdecor;
function libdecor_configuration_get_content_size(configuration: Plibdecor_configuration; frame: Plibdecor_frame; width: Plongint; height: Plongint): boolean; cdecl; external libdecor;
function libdecor_configuration_get_window_state(configuration: Plibdecor_configuration; window_state: Plibdecor_window_state): boolean; cdecl; external libdecor;

// === Konventiert am: 12-6-26 17:07:39 ===


implementation

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
