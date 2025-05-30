
unit elm_widget_popup;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_popup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_popup.h
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
PAction_Area_Data  = ^Action_Area_Data;
Pchar  = ^char;
PEina_List  = ^Eina_List;
PElm_Popup_Data  = ^Elm_Popup_Data;
PElm_Popup_Item_Data  = ^Elm_Popup_Item_Data;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_POPUP_H}
{$define ELM_WIDGET_POPUP_H}
{$include "Elementary.h"}
{$include "elm_widget_layout.h"}
{$include "elm_notify_eo.h"}
{$include "elm_popup_item_eo.h"}
{$include "elm_popup_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-popup-class The Elementary Popup Class
 *
 * Elementary, besides having the @ref Popup widget, exposes its
 * foundation -- the Elementary Popup Class -- in order to create other
 * widgets which are a popup with some more logic on top.
  }

const
  ELM_POPUP_ACTION_BUTTON_MAX = 3;  
type
{*
 * Base layout smart data extended with popup instance data.
  }
{*< Pointer to remove _parent_resize_cb when popup is deleted.  }
(* Const before type ignored *)
  PElm_Popup_Data = ^TElm_Popup_Data;
  TElm_Popup_Data = record
      notify : PEvas_Object;
      main_layout : PEvas_Object;
      title_icon : PEvas_Object;
      content_area : PEvas_Object;
      text_content_obj : PEvas_Object;
      action_area : PEvas_Object;
      box : PEvas_Object;
      tbl : PEvas_Object;
      spacer : PEvas_Object;
      scr : PEvas_Object;
      content : PEvas_Object;
      parent : PEvas_Object;
      items : PEina_List;
      title_text : Pchar;
      buttons : array[0..(ELM_POPUP_ACTION_BUTTON_MAX)-1] of PAction_Area_Data;
      content_text_wrap_type : TElm_Wrap_Type;
      last_button_number : dword;
      max_sc_h : TEvas_Coord;
      flag0 : word;
    end;


const
  bm_TElm_Popup_Data_visible = $1;
  bp_TElm_Popup_Data_visible = 0;
  bm_TElm_Popup_Data_scr_size_recalc = $2;
  bp_TElm_Popup_Data_scr_size_recalc = 1;
  bm_TElm_Popup_Data_scroll = $4;
  bp_TElm_Popup_Data_scroll = 2;
  bm_TElm_Popup_Data_theme_scroll = $8;
  bp_TElm_Popup_Data_theme_scroll = 3;

function visible(var a : TElm_Popup_Data) : TEina_Bool;
procedure set_visible(var a : TElm_Popup_Data; __visible : TEina_Bool);
function scr_size_recalc(var a : TElm_Popup_Data) : TEina_Bool;
procedure set_scr_size_recalc(var a : TElm_Popup_Data; __scr_size_recalc : TEina_Bool);
function scroll(var a : TElm_Popup_Data) : TEina_Bool;
procedure set_scroll(var a : TElm_Popup_Data; __scroll : TEina_Bool);
function theme_scroll(var a : TElm_Popup_Data) : TEina_Bool;
procedure set_theme_scroll(var a : TElm_Popup_Data; __theme_scroll : TEina_Bool);
type
(* Const before type ignored *)
  PElm_Popup_Item_Data = ^TElm_Popup_Item_Data;
  TElm_Popup_Item_Data = record
      base : PElm_Widget_Item_Data;
      _label : Pchar;
      icon : PEvas_Object;
      func : TEvas_Smart_Cb;
      flag0 : word;
    end;


const
  bm_TElm_Popup_Item_Data_disabled = $1;
  bp_TElm_Popup_Item_Data_disabled = 0;

function disabled(var a : TElm_Popup_Item_Data) : TEina_Bool;
procedure set_disabled(var a : TElm_Popup_Item_Data; __disabled : TEina_Bool);
type
  PAction_Area_Data = ^TAction_Area_Data;
  TAction_Area_Data = record
      obj : PEvas_Object;
      btn : PEvas_Object;
      delete_me : TEina_Bool;
    end;

{*
 * @
  }

implementation

function visible(var a : TElm_Popup_Data) : TEina_Bool;
begin
  visible:=(a.flag0 and bm_TElm_Popup_Data_visible) shr bp_TElm_Popup_Data_visible;
end;

procedure set_visible(var a : TElm_Popup_Data; __visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__visible shl bp_TElm_Popup_Data_visible) and bm_TElm_Popup_Data_visible);
end;

function scr_size_recalc(var a : TElm_Popup_Data) : TEina_Bool;
begin
  scr_size_recalc:=(a.flag0 and bm_TElm_Popup_Data_scr_size_recalc) shr bp_TElm_Popup_Data_scr_size_recalc;
end;

procedure set_scr_size_recalc(var a : TElm_Popup_Data; __scr_size_recalc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scr_size_recalc shl bp_TElm_Popup_Data_scr_size_recalc) and bm_TElm_Popup_Data_scr_size_recalc);
end;

function scroll(var a : TElm_Popup_Data) : TEina_Bool;
begin
  scroll:=(a.flag0 and bm_TElm_Popup_Data_scroll) shr bp_TElm_Popup_Data_scroll;
end;

procedure set_scroll(var a : TElm_Popup_Data; __scroll : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scroll shl bp_TElm_Popup_Data_scroll) and bm_TElm_Popup_Data_scroll);
end;

function theme_scroll(var a : TElm_Popup_Data) : TEina_Bool;
begin
  theme_scroll:=(a.flag0 and bm_TElm_Popup_Data_theme_scroll) shr bp_TElm_Popup_Data_theme_scroll;
end;

procedure set_theme_scroll(var a : TElm_Popup_Data; __theme_scroll : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__theme_scroll shl bp_TElm_Popup_Data_theme_scroll) and bm_TElm_Popup_Data_theme_scroll);
end;

function disabled(var a : TElm_Popup_Item_Data) : TEina_Bool;
begin
  disabled:=(a.flag0 and bm_TElm_Popup_Item_Data_disabled) shr bp_TElm_Popup_Item_Data_disabled;
end;

procedure set_disabled(var a : TElm_Popup_Item_Data; __disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__disabled shl bp_TElm_Popup_Item_Data_disabled) and bm_TElm_Popup_Item_Data_disabled);
end;


end.
