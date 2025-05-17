
unit efl_canvas_vg_container_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_container_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_container_eo.h
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
PEfl_Canvas_Vg_Container  = ^Efl_Canvas_Vg_Container;
PEfl_Canvas_Vg_Node  = ^Efl_Canvas_Vg_Node;
PEfl_Class  = ^Efl_Class;
PEina_Iterator  = ^Eina_Iterator;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_VG_CONTAINER_EO_H_}
{$define _EFL_CANVAS_VG_CONTAINER_EO_H_}
{$ifndef _EFL_CANVAS_VG_CONTAINER_EO_CLASS_TYPE}
{$define _EFL_CANVAS_VG_CONTAINER_EO_CLASS_TYPE}
type
  PEfl_Canvas_Vg_Container = ^TEfl_Canvas_Vg_Container;
  TEfl_Canvas_Vg_Container = TEo;
{$endif}
{$ifndef _EFL_CANVAS_VG_CONTAINER_EO_TYPES}
{$define _EFL_CANVAS_VG_CONTAINER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl vector graphics container class
 *
 * @ingroup Efl_Canvas_Vg_Container
  }

{ was #define dname def_expr }
function EFL_CANVAS_VG_CONTAINER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_vg_container_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Get child of container
 *
 * @param[in] obj The object.
 * @param[in] name Child node name
 *
 * @return Child object
 *
 * @ingroup Efl_Canvas_Vg_Container
  }
(* Const before type ignored *)
function efl_canvas_vg_container_child_get(obj:PEo; name:Pchar):PEfl_Canvas_Vg_Node;cdecl;external;
{*
 * @brief Get all children of container
 *
 * @param[in] obj The object.
 *
 * @return Iterator to children
 *
 * @ingroup Efl_Canvas_Vg_Container
  }
function efl_canvas_vg_container_children_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Get all children of container
 *
 * @param[in] obj The object.
 *
 * @return List to children
 *
 * @ingroup Efl_Canvas_Vg_Container
  }
(* Const before type ignored *)
function efl_canvas_vg_container_children_direct_get(obj:PEo):PEina_List;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_VG_CONTAINER_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VG_CONTAINER_CLASS:=efl_canvas_vg_container_class_get;
  end;


end.
