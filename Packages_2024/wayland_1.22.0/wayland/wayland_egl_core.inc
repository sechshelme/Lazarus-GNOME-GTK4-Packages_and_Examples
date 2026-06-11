

  {$IFDEF read_struct}
type
  Pwl_egl_window = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function wl_egl_window_create(surface: Pwl_surface; width: longint; height: longint): Pwl_egl_window; cdecl; external libwayland_egl_core;
procedure wl_egl_window_destroy(egl_window: Pwl_egl_window); cdecl; external libwayland_egl_core;
procedure wl_egl_window_resize(egl_window: Pwl_egl_window; width: longint; height: longint; dx: longint; dy: longint); cdecl; external libwayland_egl_core;
procedure wl_egl_window_get_attached_size(egl_window: Pwl_egl_window; width: Plongint; height: Plongint); cdecl; external libwayland_egl_core;
{$ENDIF read_function}

// === Konventiert am: 10-6-26 17:05:51 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
