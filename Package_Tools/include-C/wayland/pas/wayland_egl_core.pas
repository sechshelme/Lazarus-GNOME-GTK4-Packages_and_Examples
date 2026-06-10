unit wayland_egl_core;

interface

uses
  fp_wayland;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pwl_egl_window = type Pointer;
  Pwl_surface = type Pointer;

function wl_egl_window_create(surface: Pwl_surface; width: longint; height: longint): Pwl_egl_window; cdecl; external libwayland_client;
procedure wl_egl_window_destroy(egl_window: Pwl_egl_window); cdecl; external libwayland_client;
procedure wl_egl_window_resize(egl_window: Pwl_egl_window; width: longint; height: longint; dx: longint; dy: longint); cdecl; external libwayland_client;
procedure wl_egl_window_get_attached_size(egl_window: Pwl_egl_window; width: Plongint; height: Plongint); cdecl; external libwayland_client;

// === Konventiert am: 10-6-26 17:05:51 ===


implementation



end.
