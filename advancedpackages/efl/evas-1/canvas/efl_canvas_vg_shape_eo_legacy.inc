{$IFDEF read_interface}

type
  PEvas_Vg_Shape = ^TEvas_Vg_Shape;
  TEvas_Vg_Shape = TEo;

// Doppelt im C-Header
//procedure evas_vg_shape_fill_set(obj: PEvas_Vg_Shape; f: PEvas_Vg_Node); cdecl; external libevas;
//function evas_vg_shape_fill_get(obj: PEvas_Vg_Shape): PEvas_Vg_Node; cdecl; external libevas;
//procedure evas_vg_shape_stroke_fill_set(obj: PEvas_Vg_Shape; f: PEvas_Vg_Node); cdecl; external libevas;
//function evas_vg_shape_stroke_fill_get(obj: PEvas_Vg_Shape): PEvas_Vg_Node; cdecl; external libevas;
procedure evas_vg_shape_stroke_marker_set(obj: PEvas_Vg_Shape; m: PEvas_Vg_Node); cdecl; external libevas;
function evas_vg_shape_stroke_marker_get(obj: PEvas_Vg_Shape): PEvas_Vg_Node; cdecl; external libevas;

// === Konventiert am: 11-5-25 15:30:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
