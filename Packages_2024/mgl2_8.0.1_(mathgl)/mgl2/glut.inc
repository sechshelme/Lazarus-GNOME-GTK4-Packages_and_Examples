{$IFDEF read_interface}



procedure _mgl_key_up(ch: byte; para2: longint; para3: longint); cdecl; external libmglqlut;

type
  TglutDrawFunc = function(gr: THMGL; p: pointer): longint; cdecl;
  TglutLoadFunc = procedure(p: pointer); cdecl;

function mgl_create_graph_glut(draw: TglutDrawFunc; title: pchar; par: pointer; load: TglutLoadFunc): THMGL; cdecl; external libmglqlut;
procedure mgl_glut_toggle_alpha(gr: THMGL); cdecl; external libmglqlut;
procedure mgl_glut_toggle_light(gr: THMGL); cdecl; external libmglqlut;
procedure mgl_glut_toggle_no(gr: THMGL); cdecl; external libmglqlut;
procedure mgl_glut_update(gr: THMGL); cdecl; external libmglqlut;
procedure mgl_glut_reload(gr: THMGL); cdecl; external libmglqlut;
procedure mgl_glut_next_frame(gr: THMGL); cdecl; external libmglqlut;
procedure mgl_glut_prev_frame(gr: THMGL); cdecl; external libmglqlut;
procedure mgl_glut_animation(gr: THMGL); cdecl; external libmglqlut;

// === Konventiert am: 27-6-25 17:58:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
