unit efl_canvas_vg_node_eo;

interface

uses
  ctypes, elf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_VG_NODE_EO_H_}
{$define _EFL_CANVAS_VG_NODE_EO_H_}
{$ifndef _EFL_CANVAS_VG_NODE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_VG_NODE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Vg_Node = ^TEfl_Canvas_Vg_Node;
  TEfl_Canvas_Vg_Node = TEo;
{$endif}
{$ifndef _EFL_CANVAS_VG_NODE_EO_TYPES}
{$define _EFL_CANVAS_VG_NODE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl vector graphics abstract class
 *
 * @ingroup Efl_Canvas_Vg_Node
  }

{ was #define dname def_expr }
function EFL_CANVAS_VG_NODE_CLASS : longint; { return type might be wrong }

function efl_canvas_vg_node_class_get:PEfl_Class;cdecl;external libevas;
{*
 * @brief The transformation matrix to be used for this node object.
 *
 * @note Pass @c null to cancel the applied transformation.
 *
 * @param[in] obj The object.
 * @param[in] m Transformation matrix.
 *
 * @ingroup Efl_Canvas_Vg_Node
  }
procedure efl_canvas_vg_node_transformation_set(obj:PEo; m:PEina_Matrix3);cdecl;external libevas;
{*
 * @brief The transformation matrix to be used for this node object.
 *
 * @note Pass @c null to cancel the applied transformation.
 *
 * @param[in] obj The object.
 *
 * @return Transformation matrix.
 *
 * @ingroup Efl_Canvas_Vg_Node
  }
function efl_canvas_vg_node_transformation_get(obj:PEo):PEina_Matrix3;cdecl;external libevas;
{*
 * @brief The origin position of the node object.
 *
 * This origin position affects node transformation.
 *
 * @param[in] obj The object.
 * @param[in] x @c origin x position.
 * @param[in] y @c origin y position.
 *
 * @ingroup Efl_Canvas_Vg_Node
  }
procedure efl_canvas_vg_node_origin_set(obj:PEo; x:Tdouble; y:Tdouble);cdecl;external libevas;
{*
 * @brief The origin position of the node object.
 *
 * This origin position affects node transformation.
 *
 * @param[in] obj The object.
 * @param[out] x @c origin x position.
 * @param[out] y @c origin y position.
 *
 * @ingroup Efl_Canvas_Vg_Node
  }
procedure efl_canvas_vg_node_origin_get(obj:PEo; x:Pdouble; y:Pdouble);cdecl;external libevas;
{*
 * @brief Set a composite target node to this node object.
 *
 * @param[in] obj The object.
 * @param[in] target Composite target node
 * @param[in] method Composite Method.
 *
 * @ingroup Efl_Canvas_Vg_Node
  }
procedure efl_canvas_vg_node_comp_method_set(obj:PEo; target:PEfl_Canvas_Vg_Node; method:TEfl_Gfx_Vg_Composite_Method);cdecl;external libevas;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

// === Konventiert am: 12-5-25 17:23:16 ===


implementation


{ was #define dname def_expr }
function EFL_CANVAS_VG_NODE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VG_NODE_CLASS:=efl_canvas_vg_node_class_get;
  end;


end.
