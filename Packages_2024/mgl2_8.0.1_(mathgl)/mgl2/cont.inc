{$IFDEF read_interface}



procedure mgl_text_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; text: pchar; font: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textw_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; text: Pwchar_t; font: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_text_xy(gr: THMGL; x: THCDT; y: THCDT; text: pchar; font: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textw_xy(gr: THMGL; x: THCDT; y: THCDT; text: Pwchar_t; font: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_text_y(gr: THMGL; y: THCDT; text: pchar; font: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textw_y(gr: THMGL; y: THCDT; text: Pwchar_t; font: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dcont_gen(gr: THMGL; val: double; x: THCDT; y: THCDT; z: THCDT; a: THCDT; b: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_gen(gr: THMGL; val: double; a: THCDT; x: THCDT; y: THCDT; z: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_gen(gr: THMGL; v1: double; v2: double; a: THCDT; x: THCDT; y: THCDT; z: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dcont_xyz(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; z: THCDT; a: THCDT; b: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dcont(gr: THMGL; v: THCDT; a: THCDT; b: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_xy_val(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_val(gr: THMGL; v: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cont_xy(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cont(gr: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_xy_val(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_val(gr: THMGL; v: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contf_xy(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contf(gr: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contd_xy_val(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contd_val(gr: THMGL; v: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contd_xy(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contd(gr: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contv_xy_val(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contv_val(gr: THMGL; v: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contv_xy(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contv(gr: THMGL; z: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contp_val(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; z: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_contp(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_axial_xy_val(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_axial_val(gr: THMGL; v: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_axial_xy(gr: THMGL; x: THCDT; y: THCDT; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_axial(gr: THMGL; a: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_torus(gr: THMGL; r: THCDT; z: THCDT; col: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_grid3_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_grid3(gr: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_dens3_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_dens3(gr: THMGL; a: THCDT; stl: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont3_xyz_val(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; z: THCDT; a: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont3_val(gr: THMGL; v: THCDT; a: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont3_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_cont3(gr: THMGL; a: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf3_xyz_val(gr: THMGL; v: THCDT; x: THCDT; y: THCDT; z: THCDT; a: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf3_val(gr: THMGL; v: THCDT; a: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf3_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT;
  sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_contf3(gr: THMGL; a: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;

// === Konventiert am: 26-6-25 19:45:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
