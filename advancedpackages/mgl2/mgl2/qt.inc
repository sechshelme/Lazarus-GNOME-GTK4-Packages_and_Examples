{$IFDEF read_interface}

type
  Tdraw_func = function(gr: THMGL; p: pointer): longint; cdecl;
  Tload_Func = procedure(p: pointer); cdecl;

function mgl_create_graph_qt(draw: Tdraw_func; title: pchar; par: pointer; load: Tload_Func): THMGL; cdecl; external libmglqt;
function mgl_qt_run: longint; cdecl; external libmglqt;
function mgl_qt_run_: longint; cdecl; external libmglqt;
function mgl_qt_widget(gr: THMGL): pointer; cdecl; external libmglqt;

// === Konventiert am: 26-6-25 18:10:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
