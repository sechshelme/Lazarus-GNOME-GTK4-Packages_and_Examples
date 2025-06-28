unit base_cf;

interface

uses
  mgl_command, define, abstract;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function mgl_check_version(ver: pchar): longint; cdecl; external libmgl;
procedure mgl_suppress_warn(on: longint); cdecl; external libmgl;
function mgl_get_warn(gr: THMGL): longint; cdecl; external libmgl;
procedure mgl_set_warn(gr: THMGL; code: longint; text: pchar); cdecl; external libmgl;
function mgl_get_mess(gr: THMGL): pchar; cdecl; external libmgl;
procedure mgl_set_plotid(gr: THMGL; id: pchar); cdecl; external libmgl;
function mgl_get_plotid(gr: THMGL): pchar; cdecl; external libmgl;
procedure mgl_ask_stop(gr: THMGL; stop: longint); cdecl; external libmgl;
function mgl_need_stop(gr: THMGL): longint; cdecl; external libmgl;

type
  TEventFunc = procedure(para1: pointer);

procedure mgl_set_event_func(gr: THMGL; func: TEventFunc; par: pointer); cdecl; external libmgl;
function mgl_get_quality(gr: THMGL): longint; cdecl; external libmgl;
procedure mgl_set_quality(gr: THMGL; qual: longint); cdecl; external libmgl;
procedure mgl_set_draw_reg(gr: THMGL; nx: longint; ny: longint; m: longint); cdecl; external libmgl;
function mgl_is_frames(gr: THMGL): longint; cdecl; external libmgl;
function mgl_get_flag(gr: THMGL; flag: uint32): longint; cdecl; external libmgl;
procedure mgl_set_flag(gr: THMGL; val: longint; flag: uint32); cdecl; external libmgl;
function mgl_use_graph(gr: THMGL; inc: longint): longint; cdecl; external libmgl;
procedure mgl_set_rdc_acc(gr: THMGL; reduce: longint); cdecl; external libmgl;
procedure mgl_start_group(gr: THMGL; name: pchar); cdecl; external libmgl;
procedure mgl_end_group(gr: THMGL); cdecl; external libmgl;
procedure mgl_highlight(gr: THMGL; id: longint); cdecl; external libmgl;
procedure mgl_set_palette(gr: THMGL; colors: pchar); cdecl; external libmgl;
procedure mgl_set_color(id: char; r: double; g: double; b: double); cdecl; external libmgl;
procedure mgl_set_def_sch(gr: THMGL; sch: pchar); cdecl; external libmgl;
procedure mgl_set_mask(id: char; mask: pchar); cdecl; external libmgl;
procedure mgl_set_mask_val(id: char; mask: uint64); cdecl; external libmgl;
procedure mgl_set_mask_angle(gr: THMGL; angle: longint); cdecl; external libmgl;
procedure mgl_set_alpha_default(gr: THMGL; alpha: double); cdecl; external libmgl;
procedure mgl_set_bar_width(gr: THMGL; width: double); cdecl; external libmgl;
procedure mgl_set_meshnum(gr: THMGL; num: longint); cdecl; external libmgl;
procedure mgl_set_facenum(gr: THMGL; num: longint); cdecl; external libmgl;
procedure mgl_clear_unused(gr: THMGL); cdecl; external libmgl;
procedure mgl_set_tex_parse(gr: THMGL; val: longint); cdecl; external libmgl;
procedure mgl_set_ambbr(gr: THMGL; i: double); cdecl; external libmgl;
procedure mgl_set_difbr(gr: THMGL; i: double); cdecl; external libmgl;
procedure mgl_set_light_dif(gr: THMGL; enable: longint); cdecl; external libmgl;
procedure mgl_set_cut(gr: THMGL; cut: longint); cdecl; external libmgl;
procedure mgl_set_cut_box(gr: THMGL; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double); cdecl; external libmgl;
procedure mgl_set_cutoff(gr: THMGL; EqC: pchar); cdecl; external libmgl;
procedure mgl_set_ranges(gr: THMGL; x1: double; x2: double; y1: double; y2: double; z1: double; z2: double); cdecl; external libmgl;
procedure mgl_set_range_val(gr: THMGL; dir: char; v1: double; v2: double); cdecl; external libmgl;
procedure mgl_add_range_val(gr: THMGL; dir: char; v1: double; v2: double); cdecl; external libmgl;
procedure mgl_set_range_dat(gr: THMGL; dir: char; a: THCDT; add: longint); cdecl; external libmgl;
procedure mgl_set_auto_ranges(gr: THMGL; x1: double; x2: double; y1: double; y2: double; z1: double; z2: double; c1: double; c2: double); cdecl; external libmgl;
procedure mgl_zoom_axis(gr: THMGL; x1: double; y1: double; z1: double; c1: double; x2: double; y2: double; z2: double; c2: double); cdecl; external libmgl;
procedure mgl_set_origin(gr: THMGL; x0: double; y0: double; z0: double); cdecl; external libmgl;
procedure mgl_set_func(gr: THMGL; EqX: pchar; EqY: pchar; EqZ: pchar; EqA: pchar); cdecl; external libmgl;
procedure mgl_set_coor(gr: THMGL; how: longint); cdecl; external libmgl;
procedure mgl_set_ternary(gr: THMGL; kind: longint); cdecl; external libmgl;
procedure mgl_set_tick_rotate(gr: THMGL; enable: longint); cdecl; external libmgl;
procedure mgl_set_tick_skip(gr: THMGL; enable: longint); cdecl; external libmgl;
procedure mgl_def_font(name: pchar; path: pchar); cdecl; external libmgl;
procedure mgl_set_mark_size(gr: THMGL; size: double); cdecl; external libmgl;
procedure mgl_set_arrow_size(gr: THMGL; size: double); cdecl; external libmgl;
procedure mgl_set_font_size(gr: THMGL; size: double); cdecl; external libmgl;
procedure mgl_set_font_def(gr: THMGL; fnt: pchar); cdecl; external libmgl;
procedure mgl_set_rotated_text(gr: THMGL; enable: longint); cdecl; external libmgl;
procedure mgl_set_scale_text(gr: THMGL; enable: longint); cdecl; external libmgl;
procedure mgl_load_font(gr: THMGL; name: pchar; path: pchar); cdecl; external libmgl;
procedure mgl_copy_font(gr: THMGL; gr_from: THMGL); cdecl; external libmgl;
procedure mgl_restore_font(gr: THMGL); cdecl; external libmgl;
procedure mgl_define_symbol(gr: THMGL; id: char; x: THCDT; y: THCDT); cdecl; external libmgl;

// === Konventiert am: 27-6-25 17:58:09 ===


implementation



end.
