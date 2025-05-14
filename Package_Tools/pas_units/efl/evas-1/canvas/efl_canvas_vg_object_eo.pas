unit efl_canvas_vg_object_eo;

interface

uses
  ctypes, efl, eina_rectangle, efl_canvas_vg_node_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Vg_Object = ^TEfl_Canvas_Vg_Object;
  TEfl_Canvas_Vg_Object = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Canvas_Vg_Fill_Mode = ^TEfl_Canvas_Vg_Fill_Mode;
  TEfl_Canvas_Vg_Fill_Mode = longint;

const
  EFL_CANVAS_VG_FILL_MODE_NONE = 0;
  EFL_CANVAS_VG_FILL_MODE_STRETCH = 1;
  EFL_CANVAS_VG_FILL_MODE_MEET = 2;
  EFL_CANVAS_VG_FILL_MODE_SLICE = 3;

  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_OBJECT_CLASS: PEfl_Class;

function efl_canvas_vg_object_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_canvas_vg_object_fill_mode_set(obj: PEo; fill_mode: TEfl_Canvas_Vg_Fill_Mode); cdecl; external libevas;
function efl_canvas_vg_object_fill_mode_get(obj: PEo): TEfl_Canvas_Vg_Fill_Mode; cdecl; external libevas;
procedure efl_canvas_vg_object_viewbox_set(obj: PEo; viewbox: TEina_Rect); cdecl; external libevas;
function efl_canvas_vg_object_viewbox_get(obj: PEo): TEina_Rect; cdecl; external libevas;
procedure efl_canvas_vg_object_viewbox_align_set(obj: PEo; align_x: double; align_y: double); cdecl; external libevas;
procedure efl_canvas_vg_object_viewbox_align_get(obj: PEo; align_x: Pdouble; align_y: Pdouble); cdecl; external libevas;
procedure efl_canvas_vg_object_root_node_set(obj: PEo; root: PEfl_Canvas_Vg_Node); cdecl; external libevas;
function efl_canvas_vg_object_root_node_get(obj: PEo): PEfl_Canvas_Vg_Node; cdecl; external libevas;
function efl_canvas_vg_object_default_size_get(obj: PEo): TEina_Size2D; cdecl; external libevas;
{$endif}


// === Konventiert am: 11-5-25 19:50:48 ===


implementation

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_OBJECT_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VG_OBJECT_CLASS := efl_canvas_vg_object_class_get;
end;
{$endif}



end.
