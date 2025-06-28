{$IFDEF read_interface}



procedure mgl_mark(gr: THMGL; x: double; y: double; z: double; mark: pchar); cdecl; external libmgl;
procedure mgl_ball(gr: THMGL; x: double; y: double; z: double); cdecl; external libmgl;
procedure mgl_line(gr: THMGL; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; pen: pchar; n: longint); cdecl; external libmgl;
procedure mgl_curve(gr: THMGL; x1: double; y1: double; z1: double; dx1: double; dy1: double; dz1: double; x2: double; y2: double; z2: double; dx2: double; dy2: double; dz2: double; pen: pchar; n: longint); cdecl; external libmgl;
procedure mgl_error_box(gr: THMGL; x: double; y: double; z: double; ex: double; ey: double; ez: double; pen: pchar); cdecl; external libmgl;
procedure mgl_face(gr: THMGL; x0: double; y0: double; z0: double; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; x3: double; y3: double; z3: double; stl: pchar); cdecl; external libmgl;
procedure mgl_facex(gr: THMGL; x0: double; y0: double; z0: double; wy: double; wz: double; stl: pchar; dx: double; dy: double); cdecl; external libmgl;
procedure mgl_facey(gr: THMGL; x0: double; y0: double; z0: double; wx: double; wz: double; stl: pchar; dx: double; dy: double); cdecl; external libmgl;
procedure mgl_facez(gr: THMGL; x0: double; y0: double; z0: double; wx: double; wy: double; stl: pchar; dx: double; dy: double); cdecl; external libmgl;
procedure mgl_sphere(gr: THMGL; x: double; y: double; z: double; r: double; stl: pchar); cdecl; external libmgl;
procedure mgl_drop(gr: THMGL; x: double; y: double; z: double; dx: double; dy: double; dz: double; r: double; stl: pchar; shift: double; ap: double); cdecl; external libmgl;
procedure mgl_cone(gr: THMGL; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; r1: double; r2: double; stl: pchar); cdecl; external libmgl;
procedure mgl_ellipse(gr: THMGL; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; r: double; stl: pchar); cdecl; external libmgl;
procedure mgl_rhomb(gr: THMGL; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; r: double; stl: pchar); cdecl; external libmgl;
procedure mgl_polygon(gr: THMGL; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; n: longint; stl: pchar); cdecl; external libmgl;
procedure mgl_arc_ext(gr: THMGL; x0: double; y0: double; z0: double; xr: double; yr: double; zr: double; x1: double; y1: double; z1: double; a: double; stl: pchar); cdecl; external libmgl;
procedure mgl_arc(gr: THMGL; x0: double; y0: double; x1: double; y1: double; a: double; stl: pchar); cdecl; external libmgl;
procedure mgl_cones_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cones_xz(graph: THMGL; x: THCDT; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_cones(graph: THMGL; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dew_xy(gr: THMGL; x: THCDT; y: THCDT; ax: THCDT; ay: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_dew_2d(gr: THMGL; ax: THCDT; ay: THCDT; sch: pchar; optl: pchar); cdecl; external libmgl;
procedure mgl_puts(graph: THMGL; x: double; y: double; z: double; text: pchar; font: pchar; size: double); cdecl; external libmgl;
procedure mgl_putsw(graph: THMGL; x: double; y: double; z: double; text: Pwchar_t; font: pchar; size: double); cdecl; external libmgl;
procedure mgl_puts_dir(graph: THMGL; x: double; y: double; z: double; dx: double; dy: double; dz: double; text: pchar; font: pchar; size: double); cdecl; external libmgl;
procedure mgl_putsw_dir(graph: THMGL; x: double; y: double; z: double; dx: double; dy: double; dz: double; text: Pwchar_t; font: pchar; size: double); cdecl; external libmgl;
procedure mgl_symbol(gr: THMGL; x: double; y: double; z: double; id: char; how: pchar; size: double); cdecl; external libmgl;
procedure mgl_symbol_dir(gr: THMGL; x: double; y: double; z: double; dx: double; dy: double; dz: double; id: char; how: pchar; size: double); cdecl; external libmgl;
procedure mgl_textmark_xyzr(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; r: THCDT; text: pchar; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textmarkw_xyzr(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; r: THCDT; text: Pwchar_t; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textmark_xyr(graph: THMGL; x: THCDT; y: THCDT; r: THCDT; text: pchar; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textmarkw_xyr(graph: THMGL; x: THCDT; y: THCDT; r: THCDT; text: Pwchar_t; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textmark_yr(graph: THMGL; y: THCDT; r: THCDT; text: pchar; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textmarkw_yr(graph: THMGL; y: THCDT; r: THCDT; text: Pwchar_t; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textmark(graph: THMGL; y: THCDT; text: pchar; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_textmarkw(graph: THMGL; y: THCDT; text: Pwchar_t; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_label_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; text: pchar; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_labelw_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; text: Pwchar_t; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_label_xy(graph: THMGL; x: THCDT; y: THCDT; text: pchar; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_labelw_xy(graph: THMGL; x: THCDT; y: THCDT; text: Pwchar_t; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_label_y(graph: THMGL; y: THCDT; text: pchar; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_labelw_y(graph: THMGL; y: THCDT; text: Pwchar_t; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_table(gr: THMGL; x: double; y: double; val: THCDT; text: pchar; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tablew(gr: THMGL; x: double; y: double; val: THCDT; text: Pwchar_t; fnt: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_logo(gr: THMGL; w: longint; h: longint; rgba: pbyte; smooth: longint; opt: pchar); cdecl; external libmgl;
procedure mgl_logo_file(gr: THMGL; fname: pchar; smooth: longint; opt: pchar); cdecl; external libmgl;

type
  Tlamerey_func = function(para1: double; para2: pointer): double;
  Tbifurcation_finc = function(para1: double; para2: double; para3: pointer): double;

procedure mgl_lamerey(gr: THMGL; x0: double; f: Tlamerey_func; par: pointer; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_lamerey_dat(gr: THMGL; x0: double; f: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_lamerey_str(gr: THMGL; x0: double; f: pchar; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_bifurcation(gr: THMGL; dx: double; f: Tbifurcation_finc; par: pointer; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_bifurcation_dat(gr: THMGL; dx: double; f: THCDT; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_bifurcation_str(gr: THMGL; dx: double; f: pchar; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_iris(gr: THMGL; dats: THCDT; ranges: THCDT; ids: pchar; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_iris_1(gr: THMGL; dats: THCDT; ids: pchar; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_irisw(gr: THMGL; dats: THCDT; ranges: THCDT; ids: Pwchar_t; stl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_irisw_1(gr: THMGL; dats: THCDT; ids: Pwchar_t; stl: pchar; opt: pchar); cdecl; external libmgl;

// === Konventiert am: 26-6-25 19:46:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
