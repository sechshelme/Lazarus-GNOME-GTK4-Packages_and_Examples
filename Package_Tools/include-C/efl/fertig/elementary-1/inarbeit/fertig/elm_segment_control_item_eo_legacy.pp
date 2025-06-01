
unit elm_segment_control_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_segment_control_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_segment_control_item_eo_legacy.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PElm_Segment_Control_Item  = ^Elm_Segment_Control_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SEGMENT_CONTROL_ITEM_EO_LEGACY_H_}
{$define _ELM_SEGMENT_CONTROL_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_SEGMENT_CONTROL_ITEM_EO_CLASS_TYPE}
{$define _ELM_SEGMENT_CONTROL_ITEM_EO_CLASS_TYPE}
type
  PElm_Segment_Control_Item = ^TElm_Segment_Control_Item;
  TElm_Segment_Control_Item = TEo;
{$endif}
{$ifndef _ELM_SEGMENT_CONTROL_ITEM_EO_TYPES}
{$define _ELM_SEGMENT_CONTROL_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Get the index of an item.
 *
 * Index is the position of an item in segment control widget. Its range is
 * from 0 to (count - 1). Count is the number of items, that can be get with
 * elm_segment_control_item_count_get()
 *
 * @param[in] obj The object.
 *
 * @return The position of item in segment control widget.
 *
 * @ingroup Elm_Segment_Control_Item_Group
  }
(* Const before type ignored *)

function elm_segment_control_item_index_get(obj:PElm_Segment_Control_Item):longint;cdecl;external;
{*
 * @brief Get the real Evas(Edje) object created to implement the view of a
 * given segment_control item.
 *
 * Base object is the @ref Efl_Canvas_Object that represents that item.
 *
 * @param[in] obj The object.
 *
 * @return The base Edje object associated with @c it
 *
 * @ingroup Elm_Segment_Control_Item_Group
  }
(* Const before type ignored *)
function elm_segment_control_item_object_get(obj:PElm_Segment_Control_Item):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Set the selected state of an item.
 *
 * This sets the selected state of the given item @c it. @c true for selected,
 * @c false for not selected.
 *
 * If a new item is selected the previously selected will be unselected.
 * Selected item can be got with function
 * elm_segment_control_item_selected_get().
 *
 * The selected item always will be highlighted on segment control.
 *
 * @param[in] obj The object.
 * @param[in] selected The selected state.
 *
 * @ingroup Elm_Segment_Control_Item_Group
  }
procedure elm_segment_control_item_selected_set(obj:PElm_Segment_Control_Item; selected:TEina_Bool);cdecl;external;
{$endif}

implementation


end.
