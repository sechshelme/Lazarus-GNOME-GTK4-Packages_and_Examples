{$IFDEF read_interface}



procedure mgl_surf3_xyz_val(graph: THMGL; Val: double; x: THCDT; y: THCDT; z: THCDT; a: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3_val(graph: THMGL; Val: double; a: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3(graph: THMGL; a: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3a_xyz_val(graph: THMGL; Val: double; x: THCDT; y: THCDT; z: THCDT; a: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3a_val(graph: THMGL; Val: double; a: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3a_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3a(graph: THMGL; a: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3c_xyz_val(graph: THMGL; Val: double; x: THCDT; y: THCDT; z: THCDT; a: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3c_val(graph: THMGL; Val: double; a: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3c_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3c(graph: THMGL; a: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3ca_xyz_val(graph: THMGL; Val: double; x: THCDT; y: THCDT; z: THCDT; a: THCDT; c: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3ca_val(graph: THMGL; Val: double; a: THCDT; c: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3ca_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; c: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf3ca(graph: THMGL; a: THCDT; c: THCDT; b: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cloud_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cloud(graph: THMGL; a: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_beam_val(graph: THMGL; Val: double; tr: THCDT; g1: THCDT; g2: THCDT; a: THCDT; r: double; stl: pchar; norm: longint); cdecl; external libmgl;
procedure mgl_beam(graph: THMGL; tr: THCDT; g1: THCDT; g2: THCDT; a: THCDT; r: double; stl: pchar; norm: longint; num: longint); cdecl; external libmgl;

// === Konventiert am: 27-6-25 17:58:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
