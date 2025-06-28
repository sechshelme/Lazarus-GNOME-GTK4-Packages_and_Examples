{$IFDEF read_interface}



procedure mgl_fsurf(graph: THMGL; fz: pchar; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_fsurf_xyz(graph: THMGL; fx: pchar; fy: pchar; fz: pchar; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_grid_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_grid(graph: THMGL; a: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_mesh_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_mesh(graph: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_fall_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_fall(graph: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_belt_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_belt(graph: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_beltc_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_beltc(graph: THMGL; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surf(graph: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dens_xy(graph: THMGL; x: THCDT; y: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dens(graph: THMGL; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_boxs_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_boxs(graph: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tile_xyc(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tile_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tile(graph: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tiles_xyc(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; r: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tiles_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; r: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tiles(graph: THMGL; z: THCDT; r: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surfc_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surfc(graph: THMGL; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surfa_xy(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surfa(graph: THMGL; z: THCDT; c: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surfca_xy(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; c: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_surfca(gr: THMGL; z: THCDT; c: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_stfa_xy(graph: THMGL; x: THCDT; y: THCDT; re: THCDT; im: THCDT; dn: longint; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_stfa(graph: THMGL; re: THCDT; im: THCDT; dn: longint; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_map_xy(graph: THMGL; x: THCDT; y: THCDT; a: THCDT; b: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_map(graph: THMGL; a: THCDT; b: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;

// === Konventiert am: 27-6-25 17:58:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
