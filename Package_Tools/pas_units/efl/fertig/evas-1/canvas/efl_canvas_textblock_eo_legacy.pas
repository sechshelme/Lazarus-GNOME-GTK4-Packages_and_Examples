unit efl_canvas_textblock_eo_legacy;

interface

uses
  ctypes, efl, fp_eina,fp_eo,fp_efl, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Textblock = ^TEfl_Canvas_Textblock;
  TEfl_Canvas_Textblock = TEo;

  PEfl_Canvas_Text = ^TEfl_Canvas_Text;
  TEfl_Canvas_Text = TEfl_Canvas_Textblock;

function evas_object_textblock_visible_range_get(obj: PEfl_Canvas_Textblock; start: PEfl_Text_Cursor_Handle; end_: PEfl_Text_Cursor_Handle): TEina_Bool; cdecl; external libevas;
procedure evas_object_textblock_style_insets_get(obj: PEfl_Canvas_Textblock; left: Plongint; right: Plongint; top: Plongint; bottom: Plongint); cdecl; external libevas;
procedure evas_object_textblock_bidi_delimiters_set(obj: PEfl_Canvas_Textblock; delim: pchar); cdecl; external libevas;
function evas_object_textblock_bidi_delimiters_get(obj: PEfl_Canvas_Textblock): pchar; cdecl; external libevas;
procedure evas_object_textblock_legacy_newline_set(obj: PEfl_Canvas_Textblock; mode: TEina_Bool); cdecl; external libevas;
function evas_object_textblock_legacy_newline_get(obj: PEfl_Canvas_Textblock): TEina_Bool; cdecl; external libevas;
procedure evas_object_textblock_size_formatted_get(obj: PEfl_Canvas_Textblock; width: Plongint; height: Plongint); cdecl; external libevas;
procedure evas_object_textblock_size_native_get(obj: PEfl_Canvas_Textblock; width: Plongint; height: Plongint); cdecl; external libevas;
function evas_object_textblock_obstacle_add(obj: PEfl_Canvas_Textblock; eo_obs: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_textblock_obstacle_del(obj: PEfl_Canvas_Textblock; eo_obs: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_textblock_obstacles_update(obj: PEfl_Canvas_Textblock); cdecl; external libevas;

// === Konventiert am: 13-5-25 19:18:13 ===


implementation



end.
