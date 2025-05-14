unit evas_text_eo_legacy;

interface

uses
  ctypes, efl, eina_types, Evas_Legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEvas_Text = ^TEvas_Text;
  TEvas_Text = TEo;

procedure evas_object_text_shadow_color_set(obj: PEvas_Text; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_object_text_shadow_color_get(obj: PEvas_Text; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure evas_object_text_ellipsis_set(obj: PEvas_Text; ellipsis: double); cdecl; external libevas;
function evas_object_text_ellipsis_get(obj: PEvas_Text): double; cdecl; external libevas;
procedure evas_object_text_bidi_delimiters_set(obj: PEvas_Text; delim: pchar); cdecl; external libevas;
function evas_object_text_bidi_delimiters_get(obj: PEvas_Text): pchar; cdecl; external libevas;
procedure evas_object_text_outline_color_set(obj: PEvas_Text; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_object_text_outline_color_get(obj: PEvas_Text; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure evas_object_text_glow2_color_set(obj: PEvas_Text; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_object_text_glow2_color_get(obj: PEvas_Text; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure evas_object_text_style_set(obj: PEvas_Text; style: TEvas_Text_Style_Type); cdecl; external libevas;
function evas_object_text_style_get(obj: PEvas_Text): TEvas_Text_Style_Type; cdecl; external libevas;
procedure evas_object_text_glow_color_set(obj: PEvas_Text; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_object_text_glow_color_get(obj: PEvas_Text; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
function evas_object_text_max_descent_get(obj: PEvas_Text): longint; cdecl; external libevas;
procedure evas_object_text_style_pad_get(obj: PEvas_Text; l: Plongint; r: Plongint; t: Plongint; b: Plongint); cdecl; external libevas;
function evas_object_text_direction_get(obj: PEvas_Text): TEfl_Text_Bidirectional_Type; cdecl; external libevas;
function evas_object_text_ascent_get(obj: PEvas_Text): longint; cdecl; external libevas;
function evas_object_text_horiz_advance_get(obj: PEvas_Text): longint; cdecl; external libevas;
function evas_object_text_inset_get(obj: PEvas_Text): longint; cdecl; external libevas;
function evas_object_text_max_ascent_get(obj: PEvas_Text): longint; cdecl; external libevas;
function evas_object_text_vert_advance_get(obj: PEvas_Text): longint; cdecl; external libevas;
function evas_object_text_descent_get(obj: PEvas_Text): longint; cdecl; external libevas;
function evas_object_text_last_up_to_pos(obj: PEvas_Text; x: longint; y: longint): longint; cdecl; external libevas;
function evas_object_text_char_coords_get(obj: PEvas_Text; x: longint; y: longint; cx: Plongint; cy: Plongint; cw: Plongint; ch: Plongint): longint; cdecl; external libevas;
function evas_object_text_char_pos_get(obj: PEvas_Text; pos: longint; cx: Plongint; cy: Plongint; cw: Plongint; ch: Plongint): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 13-5-25 15:13:55 ===


implementation



end.
