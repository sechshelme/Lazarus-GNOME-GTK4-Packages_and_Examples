
unit efl_canvas_vg_node_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_node_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_node_eo_legacy.h
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
PEina_Matrix3  = ^Eina_Matrix3;
PEvas_Vg_Node  = ^Evas_Vg_Node;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_VG_NODE_EO_LEGACY_H_}
{$define _EVAS_VG_NODE_EO_LEGACY_H_}
{$ifndef _EVAS_VG_NODE_EO_CLASS_TYPE}
{$define _EVAS_VG_NODE_EO_CLASS_TYPE}
type
  PEvas_Vg_Node = ^TEvas_Vg_Node;
  TEvas_Vg_Node = TEo;
{$endif}
{$ifndef _EVAS_VG_NODE_EO_TYPES}
{$define _EVAS_VG_NODE_EO_TYPES}
{$endif}
{*
 * @defgroup Evas_Vg_Node_Group Vector Graphics Node Functions
 * @ingroup Evas_Object_Vg_Group
  }
{*
 * @brief Sets the transformation matrix to be used for this node object.
 *
 * @note Pass @c null to cancel the applied transformation.
 *
 * @param[in] obj The object.
 * @param[in] m The transformation matrix.
 *
 * @since 1.14
 *
 * @ingroup Evas_Vg_Node_Group
  }
(* Const before type ignored *)

procedure evas_vg_node_transformation_set(obj:PEvas_Vg_Node; m:PEina_Matrix3);cdecl;external;
{*
 * @brief Gets the transformation matrix used for this node object.
 *
 * @param[in] obj The object.
 * @return The transformation matrix.
 *
 * @since 1.14
 *
 * @ingroup Evas_Vg_Node_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_vg_node_transformation_get(obj:PEvas_Vg_Node):PEina_Matrix3;cdecl;external;
{*
 * @brief Sets the origin position of the node object.
 *
 * This origin position affects node transformation.
 *
 * @param[in] obj The object.
 * @param[in] x @c origin x position.
 * @param[in] y @c origin y position.
 *
 * @since 1.14
 *
 * @ingroup Evas_Vg_Node_Group
  }
procedure evas_vg_node_origin_set(obj:PEvas_Vg_Node; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief Gets the origin position of the node object.
 *
 * @param[in] obj The object.
 * @param[out] x @c origin x position.
 * @param[out] y @c origin y position.
 *
 * @since 1.14
 *
 * @ingroup Evas_Vg_Node_Group
  }
(* Const before type ignored *)
procedure evas_vg_node_origin_get(obj:PEvas_Vg_Node; x:Pdouble; y:Pdouble);cdecl;external;
{*
 * @brief Set Mask Node to this renderer
 *
 * @param[in] obj The object.
 * @param[in] mask Mask object
 * @param[in] op Masking Option. Reserved
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Node_Group
  }
procedure evas_vg_node_mask_set(obj:PEvas_Vg_Node; mask:PEvas_Vg_Node; op:longint);cdecl;external;
{$endif}

implementation


end.
