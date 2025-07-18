{$IFDEF read_interface}


type
  TfltkDrawFunc = function(gr: THMGL; p: pointer): longint; cdecl;
  TfltkLoadFunc = procedure(p: pointer); cdecl;

function mgl_create_graph_fltk(draw: TfltkDrawFunc; title: pchar; par: pointer; load: TfltkLoadFunc): THMGL; cdecl; external libmglfltk;
function mgl_fltk_run: longint; cdecl; external libmglfltk;
function mgl_fltk_thr: longint; cdecl; external libmglfltk;
procedure mgl_ask_fltk(quest: Pwchar_t; res: Pwchar_t); cdecl; external libmglfltk;
procedure mgl_progress_fltk(value: longint; maximal: longint; gr: THMGL); cdecl; external libmglfltk;
function mgl_fltk_widget(gr: THMGL): pointer; cdecl; external libmglfltk;

// === Konventiert am: 27-6-25 17:58:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
