unit efl_canvas_vg_node_eo_legacy;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEvas_Vg_Node = ^TEvas_Vg_Node;
  TEvas_Vg_Node = TEo;

procedure evas_vg_node_transformation_set(obj: PEvas_Vg_Node; m: PEina_Matrix3); cdecl; external libevas;
function evas_vg_node_transformation_get(obj: PEvas_Vg_Node): PEina_Matrix3; cdecl; external libevas;
procedure evas_vg_node_origin_set(obj: PEvas_Vg_Node; x: double; y: double); cdecl; external libevas;
procedure evas_vg_node_origin_get(obj: PEvas_Vg_Node; x: Pdouble; y: Pdouble); cdecl; external libevas;
procedure evas_vg_node_mask_set(obj: PEvas_Vg_Node; mask: PEvas_Vg_Node; op: longint); cdecl; external libevas;

// === Konventiert am: 11-5-25 15:22:15 ===


implementation



end.
