
unit elm_widget_segment_control;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_segment_control.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_segment_control.h
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
PEina_List  = ^Eina_List;
PElm_Segment_Control_Data  = ^Elm_Segment_Control_Data;
PElm_Segment_Control_Item_Data  = ^Elm_Segment_Control_Item_Data;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_SEGMENT_CONTROL_H}
{$define ELM_WIDGET_SEGMENT_CONTROL_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-segment-control-class The Elementary Segment control Class
 *
 * Elementary, besides having the @ref Elm_Segment_Control widget, exposes
 * its foundation -- the Elementary Segment control Class -- in order
 * to create other widgets which are a segment control with some more
 * logic on top.
  }
{*
 * Base layout smart data extended with segment control instance data.
  }
type
  PElm_Segment_Control_Data = ^TElm_Segment_Control_Data;
  TElm_Segment_Control_Data = record
      obj : PEvas_Object;
      items : PEina_List;
      selected_item : PElm_Segment_Control_Item_Data;
      item_width : longint;
    end;

(* Const before type ignored *)
  PElm_Segment_Control_Item_Data = ^TElm_Segment_Control_Item_Data;
  TElm_Segment_Control_Item_Data = record
      base : PElm_Widget_Item_Data;
      icon : PEvas_Object;
      _label : Pchar;
      seg_index : longint;
    end;


implementation


end.
