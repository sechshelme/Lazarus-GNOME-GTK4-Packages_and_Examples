{$IFDEF read_interface}


procedure mgl_fplot(gr: THMGL; eqY: pchar; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_fplot_xyz(gr: THMGL; eqX: pchar; eqY: pchar; eqZ: pchar; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_radar(graph: THMGL; a: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_plot_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_plot_xy(graph: THMGL; x: THCDT; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_plot(graph: THMGL; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tens_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; c: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tens_xy(graph: THMGL; x: THCDT; y: THCDT; c: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tens(graph: THMGL; y: THCDT; c: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tape_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tape_xy(graph: THMGL; x: THCDT; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tape(graph: THMGL; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_boxplot_xy(graph: THMGL; x: THCDT; a: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_boxplot(graph: THMGL; a: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_area_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_area_xy(graph: THMGL; x: THCDT; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_area(graph: THMGL; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_region_3d(graph: THMGL; x1: THCDT; y1: THCDT; z1: THCDT; x2: THCDT; y2: THCDT; z2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_region_xy(graph: THMGL; x: THCDT; y1: THCDT; y2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_region(graph: THMGL; y1: THCDT; y2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_stem_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_stem_xy(graph: THMGL; x: THCDT; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_stem(graph: THMGL; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_step_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_step_xy(graph: THMGL; x: THCDT; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_step(graph: THMGL; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_bars_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_bars_xy(graph: THMGL; x: THCDT; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_bars(graph: THMGL; y: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_barh_yx(graph: THMGL; y: THCDT; v: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_barh(graph: THMGL; v: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_ohlc_x(graph: THMGL; x: THCDT; open: THCDT; high: THCDT; low: THCDT; close: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_ohlc(graph: THMGL; open: THCDT; high: THCDT; low: THCDT; close: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_chart(graph: THMGL; a: THCDT; col: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_error_exy(graph: THMGL; x: THCDT; y: THCDT; ex: THCDT; ey: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_error_xy(graph: THMGL; x: THCDT; y: THCDT; ey: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_error(graph: THMGL; y: THCDT; ey: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_mark_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; r: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_mark_xy(graph: THMGL; x: THCDT; y: THCDT; r: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_mark_y(graph: THMGL; y: THCDT; r: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_pmap_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; s: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_pmap_xy(graph: THMGL; x: THCDT; y: THCDT; s: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_pmap(graph: THMGL; y: THCDT; s: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tube_xyzr(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; r: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tube_xyr(graph: THMGL; x: THCDT; y: THCDT; r: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tube_r(graph: THMGL; y: THCDT; r: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tube_xyz(graph: THMGL; x: THCDT; y: THCDT; z: THCDT; r: double; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tube_xy(graph: THMGL; x: THCDT; y: THCDT; r: double; penl: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_tube(graph: THMGL; y: THCDT; r: double; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_candle_xyv(gr: THMGL; x: THCDT; v1: THCDT; v2: THCDT; y1: THCDT; y2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_candle_yv(gr: THMGL; v1: THCDT; v2: THCDT; y1: THCDT; y2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_candle(gr: THMGL; v: THCDT; y1: THCDT; y2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_lines_xyz(gr: THMGL; x1: THCDT; y1: THCDT; z1: THCDT; x2: THCDT; y2: THCDT; z2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_lines_xy(gr: THMGL; x1: THCDT; y1: THCDT; x2: THCDT; y2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_lines_x(gr: THMGL; x1: THCDT; x2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_lines(gr: THMGL; y1: THCDT; y2: THCDT; pen: pchar; opt: pchar); cdecl; external libmgl;

// === Konventiert am: 25-6-25 19:41:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
