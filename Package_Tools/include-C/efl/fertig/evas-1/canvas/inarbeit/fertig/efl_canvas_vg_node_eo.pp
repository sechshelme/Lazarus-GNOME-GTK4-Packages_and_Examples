
unit efl_canvas_vg_node_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_node_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_node_eo.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pdouble  = ^double;
PEfl_Canvas_Vg_Node  = ^Efl_Canvas_Vg_Node;
PEfl_Class  = ^Efl_Class;
PEina_Matrix3  = ^Eina_Matrix3;
PEo  = ^Eo;
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

(* Const before type ignored *)
function efl_canvas_vg_node_class_get:PEfl_Class;cdecl;external;
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
(* Const before type ignored *)
procedure efl_canvas_vg_node_transformation_set(obj:PEo; m:PEina_Matrix3);cdecl;external;
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
(* Const before type ignored *)
(* Const before type ignored *)
function efl_canvas_vg_node_transformation_get(obj:PEo):PEina_Matrix3;cdecl;external;
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
procedure efl_canvas_vg_node_origin_set(obj:PEo; x:Tdouble; y:Tdouble);cdecl;external;
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
(* Const before type ignored *)
procedure efl_canvas_vg_node_origin_get(obj:PEo; x:Pdouble; y:Pdouble);cdecl;external;
{*
 * @brief Set a composite target node to this node object.
 *
 * @param[in] obj The object.
 * @param[in] target Composite target node
 * @param[in] method Composite Method.
 *
 * @ingroup Efl_Canvas_Vg_Node
  }
procedure efl_canvas_vg_node_comp_method_set(obj:PEo; target:PEfl_Canvas_Vg_Node; method:TEfl_Gfx_Vg_Composite_Method);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_VG_NODE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VG_NODE_CLASS:=efl_canvas_vg_node_class_get;
  end;


end.
