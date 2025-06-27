
unit base_cf;
interface

{
  Automatically converted by H2Pas 1.0.0 from base_cf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    base_cf.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)

function mgl_check_version(ver:Pchar):longint;cdecl;external;
procedure mgl_suppress_warn(on:longint);cdecl;external;
function mgl_get_warn(gr:THMGL):longint;cdecl;external;
(* Const before type ignored *)
procedure mgl_set_warn(gr:THMGL; code:longint; text:Pchar);cdecl;external;
(* Const before type ignored *)
function mgl_get_mess(gr:THMGL):Pchar;cdecl;external;
(* Const before type ignored *)
procedure mgl_set_plotid(gr:THMGL; id:Pchar);cdecl;external;
(* Const before type ignored *)
function mgl_get_plotid(gr:THMGL):Pchar;cdecl;external;
procedure mgl_ask_stop(gr:THMGL; stop:longint);cdecl;external;
function mgl_need_stop(gr:THMGL):longint;cdecl;external;
procedure mgl_set_event_func(gr:THMGL; func:procedure (para1:pointer); par:pointer);cdecl;external;
function mgl_get_quality(gr:THMGL):longint;cdecl;external;
procedure mgl_set_quality(gr:THMGL; qual:longint);cdecl;external;
procedure mgl_set_draw_reg(gr:THMGL; nx:longint; ny:longint; m:longint);cdecl;external;
function mgl_is_frames(gr:THMGL):longint;cdecl;external;
function mgl_get_flag(gr:THMGL; flag:Tuint32_t):longint;cdecl;external;
procedure mgl_set_flag(gr:THMGL; val:longint; flag:Tuint32_t);cdecl;external;
function mgl_use_graph(gr:THMGL; inc:longint):longint;cdecl;external;
procedure mgl_set_rdc_acc(gr:THMGL; reduce:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_start_group(gr:THMGL; name:Pchar);cdecl;external;
procedure mgl_end_group(gr:THMGL);cdecl;external;
procedure mgl_highlight(gr:THMGL; id:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_palette(gr:THMGL; colors:Pchar);cdecl;external;
procedure mgl_set_color(id:char; r:Tdouble; g:Tdouble; b:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_def_sch(gr:THMGL; sch:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_mask(id:char; mask:Pchar);cdecl;external;
procedure mgl_set_mask_val(id:char; mask:Tuint64_t);cdecl;external;
procedure mgl_set_mask_angle(gr:THMGL; angle:longint);cdecl;external;
procedure mgl_set_alpha_default(gr:THMGL; alpha:Tdouble);cdecl;external;
procedure mgl_set_bar_width(gr:THMGL; width:Tdouble);cdecl;external;
procedure mgl_set_meshnum(gr:THMGL; num:longint);cdecl;external;
procedure mgl_set_facenum(gr:THMGL; num:longint);cdecl;external;
procedure mgl_clear_unused(gr:THMGL);cdecl;external;
procedure mgl_set_tex_parse(gr:THMGL; val:longint);cdecl;external;
procedure mgl_set_ambbr(gr:THMGL; i:Tdouble);cdecl;external;
procedure mgl_set_difbr(gr:THMGL; i:Tdouble);cdecl;external;
procedure mgl_set_light_dif(gr:THMGL; enable:longint);cdecl;external;
procedure mgl_set_cut(gr:THMGL; cut:longint);cdecl;external;
procedure mgl_set_cut_box(gr:THMGL; x1:Tdouble; y1:Tdouble; z1:Tdouble; x2:Tdouble; 
            y2:Tdouble; z2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_cutoff(gr:THMGL; EqC:Pchar);cdecl;external;
procedure mgl_set_ranges(gr:THMGL; x1:Tdouble; x2:Tdouble; y1:Tdouble; y2:Tdouble; 
            z1:Tdouble; z2:Tdouble);cdecl;external;
procedure mgl_set_range_val(gr:THMGL; dir:char; v1:Tdouble; v2:Tdouble);cdecl;external;
procedure mgl_add_range_val(gr:THMGL; dir:char; v1:Tdouble; v2:Tdouble);cdecl;external;
procedure mgl_set_range_dat(gr:THMGL; dir:char; a:THCDT; add:longint);cdecl;external;
procedure mgl_set_auto_ranges(gr:THMGL; x1:Tdouble; x2:Tdouble; y1:Tdouble; y2:Tdouble; 
            z1:Tdouble; z2:Tdouble; c1:Tdouble; c2:Tdouble);cdecl;external;
procedure mgl_zoom_axis(gr:THMGL; x1:Tdouble; y1:Tdouble; z1:Tdouble; c1:Tdouble; 
            x2:Tdouble; y2:Tdouble; z2:Tdouble; c2:Tdouble);cdecl;external;
procedure mgl_set_origin(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_set_func(gr:THMGL; EqX:Pchar; EqY:Pchar; EqZ:Pchar; EqA:Pchar);cdecl;external;
procedure mgl_set_coor(gr:THMGL; how:longint);cdecl;external;
procedure mgl_set_ternary(gr:THMGL; kind:longint);cdecl;external;
procedure mgl_set_tick_rotate(gr:THMGL; enable:longint);cdecl;external;
procedure mgl_set_tick_skip(gr:THMGL; enable:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_def_font(name:Pchar; path:Pchar);cdecl;external;
procedure mgl_set_mark_size(gr:THMGL; size:Tdouble);cdecl;external;
procedure mgl_set_arrow_size(gr:THMGL; size:Tdouble);cdecl;external;
procedure mgl_set_font_size(gr:THMGL; size:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_font_def(gr:THMGL; fnt:Pchar);cdecl;external;
procedure mgl_set_rotated_text(gr:THMGL; enable:longint);cdecl;external;
procedure mgl_set_scale_text(gr:THMGL; enable:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_load_font(gr:THMGL; name:Pchar; path:Pchar);cdecl;external;
procedure mgl_copy_font(gr:THMGL; gr_from:THMGL);cdecl;external;
procedure mgl_restore_font(gr:THMGL);cdecl;external;
procedure mgl_define_symbol(gr:THMGL; id:char; x:THCDT; y:THCDT);cdecl;external;

implementation


end.
