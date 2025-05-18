unit efl_canvas_vg_shape_eo;

interface

uses
  ctypes, efl,fp_eo, efl_canvas_vg_node_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Vg_Shape = ^TEfl_Canvas_Vg_Shape;
  TEfl_Canvas_Vg_Shape = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_SHAPE_CLASS: PEfl_Class;

function efl_canvas_vg_shape_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_canvas_vg_shape_fill_set(obj: PEo; f: PEfl_Canvas_Vg_Node); cdecl; external libevas;
function efl_canvas_vg_shape_fill_get(obj: PEo): PEfl_Canvas_Vg_Node; cdecl; external libevas;
procedure efl_canvas_vg_shape_stroke_fill_set(obj: PEo; f: PEfl_Canvas_Vg_Node); cdecl; external libevas;
function efl_canvas_vg_shape_stroke_fill_get(obj: PEo): PEfl_Canvas_Vg_Node; cdecl; external libevas;
procedure efl_canvas_vg_shape_stroke_marker_set(obj: PEo; m: PEfl_Canvas_Vg_Node); cdecl; external libevas;
function efl_canvas_vg_shape_stroke_marker_get(obj: PEo): PEfl_Canvas_Vg_Node; cdecl; external libevas;
{$endif}


// === Konventiert am: 11-5-25 19:50:54 ===


implementation

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_SHAPE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VG_SHAPE_CLASS := efl_canvas_vg_shape_class_get;
end;
{$endif}


end.
