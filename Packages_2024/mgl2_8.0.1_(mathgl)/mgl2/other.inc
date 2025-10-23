{$IFDEF read_interface}



procedure mgl_triplot_xyzc(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_triplot_xyz(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_triplot_xy(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_quadplot_xyzc(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_quadplot_xyz(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_quadplot_xy(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tricont_xyzcv(gr: THMGL; v: THCDT; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tricont_xycv(gr: THMGL; v: THCDT; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tricont_xyzc(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tricont_xyc(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tricontv_xyzcv(gr: THMGL; v: THCDT; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tricontv_xycv(gr: THMGL; v: THCDT; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tricontv_xyzc(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tricontv_xyc(gr: THMGL; nums: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dots(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dots_a(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dots_ca(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; c: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_crust(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dens_x(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_dens_y(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_dens_z(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_x(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_y(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_z(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_x_val(graph: THMGL; v: THCDT; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_y_val(graph: THMGL; v: THCDT; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_z_val(graph: THMGL; v: THCDT; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_x(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_y(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_z(graph: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_x_val(graph: THMGL; v: THCDT; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_y_val(graph: THMGL; v: THCDT; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_z_val(graph: THMGL; v: THCDT; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;

// === Konventiert am: 27-6-25 17:58:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
