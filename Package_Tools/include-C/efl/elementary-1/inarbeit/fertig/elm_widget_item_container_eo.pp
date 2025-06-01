
unit elm_widget_item_container_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_item_container_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_item_container_eo.h
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
PEfl_Class  = ^Efl_Class;
PElm_Widget_Item  = ^Elm_Widget_Item;
PElm_Widget_Item_Container  = ^Elm_Widget_Item_Container;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_WIDGET_ITEM_CONTAINER_EO_H_}
{$define _ELM_WIDGET_ITEM_CONTAINER_EO_H_}
{$ifndef _ELM_WIDGET_ITEM_CONTAINER_EO_CLASS_TYPE}
{$define _ELM_WIDGET_ITEM_CONTAINER_EO_CLASS_TYPE}
type
  PElm_Widget_Item_Container = ^TElm_Widget_Item_Container;
  TElm_Widget_Item_Container = TEo;
{$endif}
{$ifndef _ELM_WIDGET_ITEM_CONTAINER_EO_TYPES}
{$define _ELM_WIDGET_ITEM_CONTAINER_EO_TYPES}
{$endif}

{ was #define dname def_expr }
function ELM_WIDGET_ITEM_CONTAINER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function elm_widget_item_container_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Get the focused widget item.
 *
 * @param[in] obj The object.
 *
 * @return Focused item
 *
 * @ingroup Elm_Widget_Item_Container
  }
(* Const before type ignored *)
function elm_widget_item_container_focused_item_get(obj:PEo):PElm_Widget_Item;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function ELM_WIDGET_ITEM_CONTAINER_INTERFACE : longint; { return type might be wrong }
  begin
    ELM_WIDGET_ITEM_CONTAINER_INTERFACE:=elm_widget_item_container_interface_get;
  end;


end.
