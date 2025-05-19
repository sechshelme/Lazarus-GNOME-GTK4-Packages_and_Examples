unit efl_canvas_vg_node_eo;

interface

uses
  ctypes, efl, fp_eina,fp_eo,efl_gfx_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Vg_Node = ^TEfl_Canvas_Vg_Node;
  TEfl_Canvas_Vg_Node = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_NODE_CLASS: PEfl_Class;

function efl_canvas_vg_node_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_canvas_vg_node_transformation_set(obj: PEo; m: PEina_Matrix3); cdecl; external libevas;
function efl_canvas_vg_node_transformation_get(obj: PEo): PEina_Matrix3; cdecl; external libevas;
procedure efl_canvas_vg_node_origin_set(obj: PEo; x: double; y: double); cdecl; external libevas;
procedure efl_canvas_vg_node_origin_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libevas;
procedure efl_canvas_vg_node_comp_method_set(obj: PEo; target: PEfl_Canvas_Vg_Node; method: TEfl_Gfx_Vg_Composite_Method); cdecl; external libevas;
{$endif}


// === Konventiert am: 11-5-25 19:50:45 ===


implementation

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_NODE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VG_NODE_CLASS := efl_canvas_vg_node_class_get;
end;
{$endif}



end.
