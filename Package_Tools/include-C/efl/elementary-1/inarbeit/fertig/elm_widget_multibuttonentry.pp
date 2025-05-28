
unit elm_widget_multibuttonentry;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_multibuttonentry.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_multibuttonentry.h
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
PEcore_Timer  = ^Ecore_Timer;
PEina_List  = ^Eina_List;
PEina_Strbuf  = ^Eina_Strbuf;
PElm_Multibuttonentry_Data  = ^Elm_Multibuttonentry_Data;
PElm_Multibuttonentry_Item_Data  = ^Elm_Multibuttonentry_Item_Data;
PElm_Multibuttonentry_Item_Filter  = ^Elm_Multibuttonentry_Item_Filter;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
PMultibuttonentry_Button_State  = ^Multibuttonentry_Button_State;
PMultiButtonEntry_Closed_Button_Type  = ^MultiButtonEntry_Closed_Button_Type;
PMultibuttonentry_Item  = ^Multibuttonentry_Item;
PMultibuttonentry_Pos  = ^Multibuttonentry_Pos;
PMultibuttonentry_View_State  = ^Multibuttonentry_View_State;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_MULTIBUTTONENTRY_H}
{$define ELM_WIDGET_MULTIBUTTONENTRY_H}
{$include "elm_widget_layout.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-multibuttonentry-class The Elementary Multi Button Entry Class
 *
 * Elementary, besides having the @ref Multibuttonentry widget,
 * exposes its foundation -- the Elementary Multi Button Entry Class --
 * in order to create other widgets which are a multi button entry with
 * some more logic on top.
  }
{*
 * Base widget smart data extended with multibuttonentry instance data.
  }
type
  PMultibuttonentry_Pos = ^TMultibuttonentry_Pos;
  TMultibuttonentry_Pos =  Longint;
  Const
    MULTIBUTTONENTRY_POS_START = 0;
    MULTIBUTTONENTRY_POS_END = 1;
    MULTIBUTTONENTRY_POS_BEFORE = 2;
    MULTIBUTTONENTRY_POS_AFTER = 3;
;
type
  PMultibuttonentry_Button_State = ^TMultibuttonentry_Button_State;
  TMultibuttonentry_Button_State =  Longint;
  Const
    MULTIBUTTONENTRY_BUTTON_STATE_DEFAULT = 0;
    MULTIBUTTONENTRY_BUTTON_STATE_SELECTED = 1;
;
type
  PMultiButtonEntry_Closed_Button_Type = ^TMultiButtonEntry_Closed_Button_Type;
  TMultiButtonEntry_Closed_Button_Type =  Longint;
  Const
    MULTIBUTTONENTRY_CLOSED_IMAGE = 0;
    MULTIBUTTONENTRY_CLOSED_LABEL = 1;
;
type
  PMultibuttonentry_View_State = ^TMultibuttonentry_View_State;
  TMultibuttonentry_View_State =  Longint;
  Const
    MULTIBUTTONENTRY_VIEW_NONE = 0;
    MULTIBUTTONENTRY_VIEW_GUIDETEXT = 1;
    MULTIBUTTONENTRY_VIEW_ENTRY = 2;
    MULTIBUTTONENTRY_VIEW_SHRINK = 3;
;
type
  TMultibuttonentry_Item = TElm_Multibuttonentry_Item_Data;
{ vw: visual width, real width }
  PMultibuttonentry_Item = ^TMultibuttonentry_Item;
  TMultibuttonentry_Item = record
      base : PElm_Widget_Item_Data;
      vw : TEvas_Coord;
      rw : TEvas_Coord;
      flag0 : word;
      func : TEvas_Smart_Cb;
    end;


const
  bm_TMultibuttonentry_Item_visible = $1;
  bp_TMultibuttonentry_Item_visible = 0;

function visible(var a : TMultibuttonentry_Item) : TEina_Bool;
procedure set_visible(var a : TMultibuttonentry_Item; __visible : TEina_Bool);
type
  PElm_Multibuttonentry_Item_Filter = ^TElm_Multibuttonentry_Item_Filter;
  TElm_Multibuttonentry_Item_Filter = record
      callback_func : TElm_Multibuttonentry_Item_Filter_Cb;
      data : pointer;
    end;
{ used to represent the
                                             * total number of
                                             * invisible buttons  }
{ selected item  }
(* Const before type ignored *)
(* Const before type ignored *)
{ avoids infinite loop on focus in/out }
  PElm_Multibuttonentry_Data = ^TElm_Multibuttonentry_Data;
  TElm_Multibuttonentry_Data = record
      parent : PEvas_Object;
      box : PEvas_Object;
      entry : PEvas_Object;
      _label : PEvas_Object;
      guide_text : PEvas_Object;
      end : PEvas_Object;
      items : PEina_List;
      filter_list : PEina_List;
      selected_it : PElm_Multibuttonentry_Item_Data;
      focused_it : PElm_Multibuttonentry_Item_Data;
      format_func : TElm_Multibuttonentry_Format_Cb;
      format_func_data : pointer;
      label_str : Pchar;
      guide_text_str : Pchar;
      n_str : longint;
      view_state : TMultibuttonentry_View_State;
      w_box : TEvas_Coord;
      h_box : TEvas_Coord;
      shrink : longint;
      add_callback : TElm_Multibuttonentry_Item_Filter_Cb;
      add_callback_data : pointer;
      longpress_timer : PEcore_Timer;
      format_cb : TEfl_Ui_Format_Func;
      format_free_cb : TEina_Free_Cb;
      format_cb_data : pointer;
      format_strbuf : PEina_Strbuf;
      flag0 : word;
    end;


const
  bm_TElm_Multibuttonentry_Data_last_it_select = $1;
  bp_TElm_Multibuttonentry_Data_last_it_select = 0;
  bm_TElm_Multibuttonentry_Data_editable = $2;
  bp_TElm_Multibuttonentry_Data_editable = 1;
  bm_TElm_Multibuttonentry_Data_focused = $4;
  bp_TElm_Multibuttonentry_Data_focused = 2;
  bm_TElm_Multibuttonentry_Data_label_packed = $8;
  bp_TElm_Multibuttonentry_Data_label_packed = 3;

function last_it_select(var a : TElm_Multibuttonentry_Data) : TEina_Bool;
procedure set_last_it_select(var a : TElm_Multibuttonentry_Data; __last_it_select : TEina_Bool);
function editable(var a : TElm_Multibuttonentry_Data) : TEina_Bool;
procedure set_editable(var a : TElm_Multibuttonentry_Data; __editable : TEina_Bool);
function focused(var a : TElm_Multibuttonentry_Data) : TEina_Bool;
procedure set_focused(var a : TElm_Multibuttonentry_Data; __focused : TEina_Bool);
function label_packed(var a : TElm_Multibuttonentry_Data) : TEina_Bool;
procedure set_label_packed(var a : TElm_Multibuttonentry_Data; __label_packed : TEina_Bool);
{*
 * @
  }

implementation

function visible(var a : TMultibuttonentry_Item) : TEina_Bool;
begin
  visible:=(a.flag0 and bm_TMultibuttonentry_Item_visible) shr bp_TMultibuttonentry_Item_visible;
end;

procedure set_visible(var a : TMultibuttonentry_Item; __visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__visible shl bp_TMultibuttonentry_Item_visible) and bm_TMultibuttonentry_Item_visible);
end;

function last_it_select(var a : TElm_Multibuttonentry_Data) : TEina_Bool;
begin
  last_it_select:=(a.flag0 and bm_TElm_Multibuttonentry_Data_last_it_select) shr bp_TElm_Multibuttonentry_Data_last_it_select;
end;

procedure set_last_it_select(var a : TElm_Multibuttonentry_Data; __last_it_select : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__last_it_select shl bp_TElm_Multibuttonentry_Data_last_it_select) and bm_TElm_Multibuttonentry_Data_last_it_select);
end;

function editable(var a : TElm_Multibuttonentry_Data) : TEina_Bool;
begin
  editable:=(a.flag0 and bm_TElm_Multibuttonentry_Data_editable) shr bp_TElm_Multibuttonentry_Data_editable;
end;

procedure set_editable(var a : TElm_Multibuttonentry_Data; __editable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__editable shl bp_TElm_Multibuttonentry_Data_editable) and bm_TElm_Multibuttonentry_Data_editable);
end;

function focused(var a : TElm_Multibuttonentry_Data) : TEina_Bool;
begin
  focused:=(a.flag0 and bm_TElm_Multibuttonentry_Data_focused) shr bp_TElm_Multibuttonentry_Data_focused;
end;

procedure set_focused(var a : TElm_Multibuttonentry_Data; __focused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__focused shl bp_TElm_Multibuttonentry_Data_focused) and bm_TElm_Multibuttonentry_Data_focused);
end;

function label_packed(var a : TElm_Multibuttonentry_Data) : TEina_Bool;
begin
  label_packed:=(a.flag0 and bm_TElm_Multibuttonentry_Data_label_packed) shr bp_TElm_Multibuttonentry_Data_label_packed;
end;

procedure set_label_packed(var a : TElm_Multibuttonentry_Data; __label_packed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__label_packed shl bp_TElm_Multibuttonentry_Data_label_packed) and bm_TElm_Multibuttonentry_Data_label_packed);
end;


end.
