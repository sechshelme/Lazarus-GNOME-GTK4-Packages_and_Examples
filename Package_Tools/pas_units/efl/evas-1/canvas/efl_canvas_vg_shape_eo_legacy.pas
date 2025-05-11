unit efl_canvas_vg_shape_eo_legacy;

interface

uses
  ctypes, elf, efl_canvas_vg_node_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEvas_Vg_Shape = ^TEvas_Vg_Shape;
  TEvas_Vg_Shape = TEo;

procedure evas_vg_shape_fill_set(obj: PEvas_Vg_Shape; f: PEvas_Vg_Node); cdecl; external libevas;
function evas_vg_shape_fill_get(obj: PEvas_Vg_Shape): PEvas_Vg_Node; cdecl; external libevas;
procedure evas_vg_shape_stroke_fill_set(obj: PEvas_Vg_Shape; f: PEvas_Vg_Node); cdecl; external libevas;
function evas_vg_shape_stroke_fill_get(obj: PEvas_Vg_Shape): PEvas_Vg_Node; cdecl; external libevas;
procedure evas_vg_shape_stroke_marker_set(obj: PEvas_Vg_Shape; m: PEvas_Vg_Node); cdecl; external libevas;
function evas_vg_shape_stroke_marker_get(obj: PEvas_Vg_Shape): PEvas_Vg_Node; cdecl; external libevas;

// === Konventiert am: 11-5-25 15:30:09 ===


implementation



end.
