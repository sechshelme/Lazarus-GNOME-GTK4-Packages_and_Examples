unit efl_canvas_vg_container_eo;

interface

uses
  ctypes, efl, eina_list, efl_canvas_vg_node_eo, eina_iterator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Vg_Container = ^TEfl_Canvas_Vg_Container;
  TEfl_Canvas_Vg_Container = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_CONTAINER_CLASS: PEfl_Class;

function efl_canvas_vg_container_class_get: PEfl_Class; cdecl; external libevas;
function efl_canvas_vg_container_child_get(obj: PEo; name: pchar): PEfl_Canvas_Vg_Node; cdecl; external libevas;
function efl_canvas_vg_container_children_get(obj: PEo): PEina_Iterator; cdecl; external libevas;
function efl_canvas_vg_container_children_direct_get(obj: PEo): PEina_List; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:08:54 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_CONTAINER_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VG_CONTAINER_CLASS := efl_canvas_vg_container_class_get;
end;
{$endif}


end.
