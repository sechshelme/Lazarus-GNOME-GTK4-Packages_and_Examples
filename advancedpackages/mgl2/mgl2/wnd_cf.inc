{$IFDEF read_interface}


type
  TwndClickFunc = procedure(p: pointer);
  TwndDrawFunc = function(gr: THMGL; p: pointer): longint;
  TwndReloadFunc = procedure(p: pointer);
  TwndPropFunc = procedure(id: char; val: pchar; p: pointer);

procedure mgl_set_click_func(gr: THMGL; func: TwndClickFunc); cdecl; external libmglwnd;
procedure mgl_wnd_set_mutex(gr: THMGL; mutex: Ppthread_mutex_t); cdecl; external libmglwnd;
procedure mgl_wnd_make_dialog(gr: THMGL; ids: pchar; args: PPchar; title: pchar); cdecl; external libmglwnd;
procedure mgl_wnd_set_func(gr: THMGL; draw: TwndDrawFunc; par: pointer; reload: TwndReloadFunc); cdecl; external libmglwnd;
procedure mgl_wnd_set_prop(gr: THMGL; prop: TwndPropFunc; par: pointer); cdecl; external libmglwnd;
procedure mgl_wnd_set_delay(gr: THMGL; dt: double); cdecl; external libmglwnd;
function mgl_wnd_get_delay(gr: THMGL): double; cdecl; external libmglwnd;
procedure mgl_setup_window(gr: THMGL; clf_upd: longint; showpos: longint); cdecl; external libmglwnd;
procedure mgl_wnd_toggle_alpha(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_toggle_light(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_toggle_zoom(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_toggle_rotate(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_toggle_no(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_update(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_reload(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_adjust(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_next_frame(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_prev_frame(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_wnd_animation(gr: THMGL); cdecl; external libmglwnd;
procedure mgl_get_last_mouse_pos(gr: THMGL; x: Pmreal; y: Pmreal; z: Pmreal); cdecl; external libmglwnd;
function mgl_wnd_window(gr: THMGL): pointer; cdecl; external libmglwnd;
function mgl_wnd_widget(gr: THMGL): pointer; cdecl; external libmglwnd;
procedure mgl_wnd_move(gr: THMGL; x: longint; y: longint); cdecl; external libmglwnd;
procedure mgl_wnd_size(gr: THMGL; w: longint; h: longint); cdecl; external libmglwnd;

// === Konventiert am: 27-6-25 17:58:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
