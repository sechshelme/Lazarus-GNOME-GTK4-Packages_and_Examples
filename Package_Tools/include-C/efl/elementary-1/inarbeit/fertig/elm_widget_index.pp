
unit elm_widget_index;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_index.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_index.h
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
PElm_Index_Data  = ^Elm_Index_Data;
PElm_Index_Item_Data  = ^Elm_Index_Item_Data;
PElm_Index_Omit  = ^Elm_Index_Omit;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_INDEX_H}
{$define ELM_WIDGET_INDEX_H}
{$include "Elementary.h"}
{$include "elm_index_item_eo.h"}
{$include "elm_index_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-index-class The Elementary Index Class
 *
 * Elementary, besides having the @ref Index widget, exposes its
 * foundation -- the Elementary Index Class -- in order to create other
 * widgets which are a index with some more logic on top.
  }
{*
 * Base layout smart data extended with index instance data.
  }
type
{*< rectangle objects for event handling  }
{ 2 - for now all that's supported }
{ 1 list. N levels, but only 2
                                  * for now and # of items will be
                                  * small  }
{*< a flag for the activeness of a
                                            level. activeness means the box is
                                            filled with contents.  }
  PElm_Index_Data = ^TElm_Index_Data;
  TElm_Index_Data = record
      event_rect : array[0..1] of PEvas_Object;
      bx : array[0..1] of PEvas_Object;
      items : PEina_List;
      omit : PEina_List;
      dir : TEfl_Ui_Layout_Orientation;
      level : longint;
      dx : TEvas_Coord;
      dy : TEvas_Coord;
      delay : PEcore_Timer;
      delay_change_time : Tdouble;
      level_active : array[0..1] of TEina_Bool;
      group_num : longint;
      default_num : longint;
      show_group : longint;
      next_group : longint;
      flag0 : word;
    end;


const
  bm_TElm_Index_Data_mouse_down = $1;
  bp_TElm_Index_Data_mouse_down = 0;
  bm_TElm_Index_Data_autohide_disabled = $2;
  bp_TElm_Index_Data_autohide_disabled = 1;
  bm_TElm_Index_Data_indicator_disabled = $4;
  bp_TElm_Index_Data_indicator_disabled = 2;
  bm_TElm_Index_Data_omit_enabled = $8;
  bp_TElm_Index_Data_omit_enabled = 3;

function mouse_down(var a : TElm_Index_Data) : TEina_Bool;
procedure set_mouse_down(var a : TElm_Index_Data; __mouse_down : TEina_Bool);
function autohide_disabled(var a : TElm_Index_Data) : TEina_Bool;
procedure set_autohide_disabled(var a : TElm_Index_Data; __autohide_disabled : TEina_Bool);
function indicator_disabled(var a : TElm_Index_Data) : TEina_Bool;
procedure set_indicator_disabled(var a : TElm_Index_Data; __indicator_disabled : TEina_Bool);
function omit_enabled(var a : TElm_Index_Data) : TEina_Bool;
procedure set_omit_enabled(var a : TElm_Index_Data; __omit_enabled : TEina_Bool);
type
(* Const before type ignored *)
{*< a flag that remembers an item is selected. this is set true when mouse down/move occur above an item and when elm_index_item_selected_set() API is called.  }
  PElm_Index_Item_Data = ^TElm_Index_Item_Data;
  TElm_Index_Item_Data = record
      base : PElm_Widget_Item_Data;
      letter : Pchar;
      level : longint;
      func : TEvas_Smart_Cb;
      omitted : PEina_List;
      head : PElm_Index_Item_Data;
      priority : longint;
      flag0 : word;
    end;


const
  bm_TElm_Index_Item_Data_selected = $1;
  bp_TElm_Index_Item_Data_selected = 0;

function selected(var a : TElm_Index_Item_Data) : TEina_Bool;
procedure set_selected(var a : TElm_Index_Item_Data; __selected : TEina_Bool);
type
  PElm_Index_Omit = ^TElm_Index_Omit;
  TElm_Index_Omit = record
      offset : longint;
      count : longint;
    end;

{*
 * @
  }

implementation

function mouse_down(var a : TElm_Index_Data) : TEina_Bool;
begin
  mouse_down:=(a.flag0 and bm_TElm_Index_Data_mouse_down) shr bp_TElm_Index_Data_mouse_down;
end;

procedure set_mouse_down(var a : TElm_Index_Data; __mouse_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__mouse_down shl bp_TElm_Index_Data_mouse_down) and bm_TElm_Index_Data_mouse_down);
end;

function autohide_disabled(var a : TElm_Index_Data) : TEina_Bool;
begin
  autohide_disabled:=(a.flag0 and bm_TElm_Index_Data_autohide_disabled) shr bp_TElm_Index_Data_autohide_disabled;
end;

procedure set_autohide_disabled(var a : TElm_Index_Data; __autohide_disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__autohide_disabled shl bp_TElm_Index_Data_autohide_disabled) and bm_TElm_Index_Data_autohide_disabled);
end;

function indicator_disabled(var a : TElm_Index_Data) : TEina_Bool;
begin
  indicator_disabled:=(a.flag0 and bm_TElm_Index_Data_indicator_disabled) shr bp_TElm_Index_Data_indicator_disabled;
end;

procedure set_indicator_disabled(var a : TElm_Index_Data; __indicator_disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__indicator_disabled shl bp_TElm_Index_Data_indicator_disabled) and bm_TElm_Index_Data_indicator_disabled);
end;

function omit_enabled(var a : TElm_Index_Data) : TEina_Bool;
begin
  omit_enabled:=(a.flag0 and bm_TElm_Index_Data_omit_enabled) shr bp_TElm_Index_Data_omit_enabled;
end;

procedure set_omit_enabled(var a : TElm_Index_Data; __omit_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__omit_enabled shl bp_TElm_Index_Data_omit_enabled) and bm_TElm_Index_Data_omit_enabled);
end;

function selected(var a : TElm_Index_Item_Data) : TEina_Bool;
begin
  selected:=(a.flag0 and bm_TElm_Index_Item_Data_selected) shr bp_TElm_Index_Item_Data_selected;
end;

procedure set_selected(var a : TElm_Index_Item_Data; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp_TElm_Index_Item_Data_selected) and bm_TElm_Index_Item_Data_selected);
end;


end.
