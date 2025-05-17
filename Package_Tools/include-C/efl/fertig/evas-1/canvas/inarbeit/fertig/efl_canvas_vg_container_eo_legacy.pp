
unit efl_canvas_vg_container_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_container_eo.legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_container_eo.legacy.h
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
Pchar  = ^char;
PEina_Iterator  = ^Eina_Iterator;
PEvas_Vg_Container  = ^Evas_Vg_Container;
PEvas_Vg_Node  = ^Evas_Vg_Node;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_VG_CONTAINER_EO_LEGACY_H_}
{$define _EVAS_VG_CONTAINER_EO_LEGACY_H_}
{$ifndef _EVAS_VG_CONTAINER_EO_CLASS_TYPE}
{$define _EVAS_VG_CONTAINER_EO_CLASS_TYPE}
type
  PEvas_Vg_Container = ^TEvas_Vg_Container;
  TEvas_Vg_Container = TEo;
{$endif}
{$ifndef _EVAS_VG_CONTAINER_EO_TYPES}
{$define _EVAS_VG_CONTAINER_EO_TYPES}
{$endif}
{*
 * @brief Get child of container.
 *
 * @param[in] obj The object.
 * @param[in] name The Child node name.
 *
 * @return The child object.
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Container_Group
  }
(* Const before type ignored *)

function evas_vg_container_child_get(obj:PEvas_Vg_Container; name:Pchar):PEvas_Vg_Node;cdecl;external;
{*
 * @brief Get all children of container.
 *
 * @param[in] obj The object.
 *
 * @return The iterator to children.
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Container_Group
  }
function evas_vg_container_children_get(obj:PEvas_Vg_Container):PEina_Iterator;cdecl;external;
{$endif}

implementation


end.
