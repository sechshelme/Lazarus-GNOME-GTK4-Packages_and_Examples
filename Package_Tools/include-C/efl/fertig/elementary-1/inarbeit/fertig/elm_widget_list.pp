
unit elm_widget_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_list.h
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
PElm_List_Data  = ^Elm_List_Data;
PElm_List_Item_Data  = ^Elm_List_Item_Data;
PElm_Object_Item  = ^Elm_Object_Item;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_LIST_H}
{$define ELM_WIDGET_LIST_H}
{$include "elm_interface_scrollable.h"}
{$include "elm_widget_layout.h"}
{$include "elm_list_eo.h"}
{$include "elm_list_item_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-list-class The Elementary List Class
 *
 * Elementary, besides having the @ref List widget, exposes its
 * foundation -- the Elementary List Class -- in order to create
 * other widgets which are a list with some more logic on top.
  }

const
  ELM_LIST_SWIPE_MOVES = 12;  
type
{*
 * Base widget smart data extended with list instance data.
  }
{*< a focused item by keypad arrow or mouse. This is set to NULL if widget looses focus.  }
{*< This records the last focused item when widget looses focus. This is required to set the focus on last focused item when widgets gets focus.  }
{*< select mode for multiple selection  }
{*< a flag that mouse is down on the list at the moment. this flag is set to true on mouse and reset to false on mouse up  }
{*< value whether item loop feature is enabled or not.  }
  PElm_List_Data = ^TElm_List_Data;
  TElm_List_Data = record
      box : PEvas_Object;
      hit_rect : PEvas_Object;
      items : PEina_List;
      selected : PEina_List;
      last_selected_item : PElm_Object_Item;
      focused_item : PElm_Object_Item;
      last_focused_item : PElm_Object_Item;
      minw : array[0..1] of TEvas_Coord;
      minh : array[0..1] of TEvas_Coord;
      dx : TEvas_Coord;
      dy : TEvas_Coord;
      select_mode : TElm_Object_Select_Mode;
      multi_select_mode : TElm_Object_Multi_Select_Mode;
      movements : longint;
      walking : longint;
      h_mode : TElm_List_Mode;
      mode : TElm_List_Mode;
      history : array[0..(ELM_LIST_SWIPE_MOVES)-1] of record
          x : TEvas_Coord;
          y : TEvas_Coord;
        end;
      flag0 : word;
    end;


const
  bm_TElm_List_Data_focus_on_selection_enabled = $1;
  bp_TElm_List_Data_focus_on_selection_enabled = 0;
  bm_TElm_List_Data_was_selected = $2;
  bp_TElm_List_Data_was_selected = 1;
  bm_TElm_List_Data_fix_pending = $4;
  bp_TElm_List_Data_fix_pending = 2;
  bm_TElm_List_Data_longpressed = $8;
  bp_TElm_List_Data_longpressed = 3;
  bm_TElm_List_Data_scr_minw = $10;
  bp_TElm_List_Data_scr_minw = 4;
  bm_TElm_List_Data_scr_minh = $20;
  bp_TElm_List_Data_scr_minh = 5;
  bm_TElm_List_Data_on_hold = $40;
  bp_TElm_List_Data_on_hold = 6;
  bm_TElm_List_Data_multi = $80;
  bp_TElm_List_Data_multi = 7;
  bm_TElm_List_Data_swipe = $100;
  bp_TElm_List_Data_swipe = 8;
  bm_TElm_List_Data_delete_me = $200;
  bp_TElm_List_Data_delete_me = 9;
  bm_TElm_List_Data_mouse_down = $400;
  bp_TElm_List_Data_mouse_down = 10;
  bm_TElm_List_Data_item_loop_enable = $800;
  bp_TElm_List_Data_item_loop_enable = 11;
  bm_TElm_List_Data_item_looping_on = $1000;
  bp_TElm_List_Data_item_looping_on = 12;
  bm_TElm_List_Data_fixing_now = $2000;
  bp_TElm_List_Data_fixing_now = 13;

function focus_on_selection_enabled(var a : TElm_List_Data) : TEina_Bool;
procedure set_focus_on_selection_enabled(var a : TElm_List_Data; __focus_on_selection_enabled : TEina_Bool);
function was_selected(var a : TElm_List_Data) : TEina_Bool;
procedure set_was_selected(var a : TElm_List_Data; __was_selected : TEina_Bool);
function fix_pending(var a : TElm_List_Data) : TEina_Bool;
procedure set_fix_pending(var a : TElm_List_Data; __fix_pending : TEina_Bool);
function longpressed(var a : TElm_List_Data) : TEina_Bool;
procedure set_longpressed(var a : TElm_List_Data; __longpressed : TEina_Bool);
function scr_minw(var a : TElm_List_Data) : TEina_Bool;
procedure set_scr_minw(var a : TElm_List_Data; __scr_minw : TEina_Bool);
function scr_minh(var a : TElm_List_Data) : TEina_Bool;
procedure set_scr_minh(var a : TElm_List_Data; __scr_minh : TEina_Bool);
function on_hold(var a : TElm_List_Data) : TEina_Bool;
procedure set_on_hold(var a : TElm_List_Data; __on_hold : TEina_Bool);
function multi(var a : TElm_List_Data) : TEina_Bool;
procedure set_multi(var a : TElm_List_Data; __multi : TEina_Bool);
function swipe(var a : TElm_List_Data) : TEina_Bool;
procedure set_swipe(var a : TElm_List_Data; __swipe : TEina_Bool);
function delete_me(var a : TElm_List_Data) : TEina_Bool;
procedure set_delete_me(var a : TElm_List_Data; __delete_me : TEina_Bool);
function mouse_down(var a : TElm_List_Data) : TEina_Bool;
procedure set_mouse_down(var a : TElm_List_Data; __mouse_down : TEina_Bool);
function item_loop_enable(var a : TElm_List_Data) : TEina_Bool;
procedure set_item_loop_enable(var a : TElm_List_Data; __item_loop_enable : TEina_Bool);
function item_looping_on(var a : TElm_List_Data) : TEina_Bool;
procedure set_item_looping_on(var a : TElm_List_Data; __item_looping_on : TEina_Bool);
function fixing_now(var a : TElm_List_Data) : TEina_Bool;
procedure set_fixing_now(var a : TElm_List_Data; __fixing_now : TEina_Bool);
(* Const before type ignored *)
type
  PElm_List_Item_Data = ^TElm_List_Item_Data;
  TElm_List_Item_Data = record
      base : PElm_Widget_Item_Data;
      swipe_timer : PEcore_Timer;
      long_timer : PEcore_Timer;
      icon : PEvas_Object;
      end : PEvas_Object;
      func : TEvas_Smart_Cb;
      _label : Pchar;
      node : PEina_List;
      flag0 : word;
    end;


const
  bm_TElm_List_Item_Data_is_separator = $1;
  bp_TElm_List_Item_Data_is_separator = 0;
  bm_TElm_List_Item_Data_highlighted = $2;
  bp_TElm_List_Item_Data_highlighted = 1;
  bm_TElm_List_Item_Data_dummy_icon = $4;
  bp_TElm_List_Item_Data_dummy_icon = 2;
  bm_TElm_List_Item_Data_dummy_end = $8;
  bp_TElm_List_Item_Data_dummy_end = 3;
  bm_TElm_List_Item_Data_selected = $10;
  bp_TElm_List_Item_Data_selected = 4;
  bm_TElm_List_Item_Data_deleted = $20;
  bp_TElm_List_Item_Data_deleted = 5;
  bm_TElm_List_Item_Data_is_even = $40;
  bp_TElm_List_Item_Data_is_even = 6;
  bm_TElm_List_Item_Data_fixed = $80;
  bp_TElm_List_Item_Data_fixed = 7;
  bm_TElm_List_Item_Data_even = $100;
  bp_TElm_List_Item_Data_even = 8;

function is_separator(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_is_separator(var a : TElm_List_Item_Data; __is_separator : TEina_Bool);
function highlighted(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_highlighted(var a : TElm_List_Item_Data; __highlighted : TEina_Bool);
function dummy_icon(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_dummy_icon(var a : TElm_List_Item_Data; __dummy_icon : TEina_Bool);
function dummy_end(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_dummy_end(var a : TElm_List_Item_Data; __dummy_end : TEina_Bool);
function selected(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_selected(var a : TElm_List_Item_Data; __selected : TEina_Bool);
function deleted(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_deleted(var a : TElm_List_Item_Data; __deleted : TEina_Bool);
function is_even(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_is_even(var a : TElm_List_Item_Data; __is_even : TEina_Bool);
function fixed(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_fixed(var a : TElm_List_Item_Data; __fixed : TEina_Bool);
function even(var a : TElm_List_Item_Data) : TEina_Bool;
procedure set_even(var a : TElm_List_Item_Data; __even : TEina_Bool);
{*
 * @
  }

implementation

function focus_on_selection_enabled(var a : TElm_List_Data) : TEina_Bool;
begin
  focus_on_selection_enabled:=(a.flag0 and bm_TElm_List_Data_focus_on_selection_enabled) shr bp_TElm_List_Data_focus_on_selection_enabled;
end;

procedure set_focus_on_selection_enabled(var a : TElm_List_Data; __focus_on_selection_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__focus_on_selection_enabled shl bp_TElm_List_Data_focus_on_selection_enabled) and bm_TElm_List_Data_focus_on_selection_enabled);
end;

function was_selected(var a : TElm_List_Data) : TEina_Bool;
begin
  was_selected:=(a.flag0 and bm_TElm_List_Data_was_selected) shr bp_TElm_List_Data_was_selected;
end;

procedure set_was_selected(var a : TElm_List_Data; __was_selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__was_selected shl bp_TElm_List_Data_was_selected) and bm_TElm_List_Data_was_selected);
end;

function fix_pending(var a : TElm_List_Data) : TEina_Bool;
begin
  fix_pending:=(a.flag0 and bm_TElm_List_Data_fix_pending) shr bp_TElm_List_Data_fix_pending;
end;

procedure set_fix_pending(var a : TElm_List_Data; __fix_pending : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__fix_pending shl bp_TElm_List_Data_fix_pending) and bm_TElm_List_Data_fix_pending);
end;

function longpressed(var a : TElm_List_Data) : TEina_Bool;
begin
  longpressed:=(a.flag0 and bm_TElm_List_Data_longpressed) shr bp_TElm_List_Data_longpressed;
end;

procedure set_longpressed(var a : TElm_List_Data; __longpressed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__longpressed shl bp_TElm_List_Data_longpressed) and bm_TElm_List_Data_longpressed);
end;

function scr_minw(var a : TElm_List_Data) : TEina_Bool;
begin
  scr_minw:=(a.flag0 and bm_TElm_List_Data_scr_minw) shr bp_TElm_List_Data_scr_minw;
end;

procedure set_scr_minw(var a : TElm_List_Data; __scr_minw : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scr_minw shl bp_TElm_List_Data_scr_minw) and bm_TElm_List_Data_scr_minw);
end;

function scr_minh(var a : TElm_List_Data) : TEina_Bool;
begin
  scr_minh:=(a.flag0 and bm_TElm_List_Data_scr_minh) shr bp_TElm_List_Data_scr_minh;
end;

procedure set_scr_minh(var a : TElm_List_Data; __scr_minh : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scr_minh shl bp_TElm_List_Data_scr_minh) and bm_TElm_List_Data_scr_minh);
end;

function on_hold(var a : TElm_List_Data) : TEina_Bool;
begin
  on_hold:=(a.flag0 and bm_TElm_List_Data_on_hold) shr bp_TElm_List_Data_on_hold;
end;

procedure set_on_hold(var a : TElm_List_Data; __on_hold : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_hold shl bp_TElm_List_Data_on_hold) and bm_TElm_List_Data_on_hold);
end;

function multi(var a : TElm_List_Data) : TEina_Bool;
begin
  multi:=(a.flag0 and bm_TElm_List_Data_multi) shr bp_TElm_List_Data_multi;
end;

procedure set_multi(var a : TElm_List_Data; __multi : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__multi shl bp_TElm_List_Data_multi) and bm_TElm_List_Data_multi);
end;

function swipe(var a : TElm_List_Data) : TEina_Bool;
begin
  swipe:=(a.flag0 and bm_TElm_List_Data_swipe) shr bp_TElm_List_Data_swipe;
end;

procedure set_swipe(var a : TElm_List_Data; __swipe : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__swipe shl bp_TElm_List_Data_swipe) and bm_TElm_List_Data_swipe);
end;

function delete_me(var a : TElm_List_Data) : TEina_Bool;
begin
  delete_me:=(a.flag0 and bm_TElm_List_Data_delete_me) shr bp_TElm_List_Data_delete_me;
end;

procedure set_delete_me(var a : TElm_List_Data; __delete_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__delete_me shl bp_TElm_List_Data_delete_me) and bm_TElm_List_Data_delete_me);
end;

function mouse_down(var a : TElm_List_Data) : TEina_Bool;
begin
  mouse_down:=(a.flag0 and bm_TElm_List_Data_mouse_down) shr bp_TElm_List_Data_mouse_down;
end;

procedure set_mouse_down(var a : TElm_List_Data; __mouse_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__mouse_down shl bp_TElm_List_Data_mouse_down) and bm_TElm_List_Data_mouse_down);
end;

function item_loop_enable(var a : TElm_List_Data) : TEina_Bool;
begin
  item_loop_enable:=(a.flag0 and bm_TElm_List_Data_item_loop_enable) shr bp_TElm_List_Data_item_loop_enable;
end;

procedure set_item_loop_enable(var a : TElm_List_Data; __item_loop_enable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__item_loop_enable shl bp_TElm_List_Data_item_loop_enable) and bm_TElm_List_Data_item_loop_enable);
end;

function item_looping_on(var a : TElm_List_Data) : TEina_Bool;
begin
  item_looping_on:=(a.flag0 and bm_TElm_List_Data_item_looping_on) shr bp_TElm_List_Data_item_looping_on;
end;

procedure set_item_looping_on(var a : TElm_List_Data; __item_looping_on : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__item_looping_on shl bp_TElm_List_Data_item_looping_on) and bm_TElm_List_Data_item_looping_on);
end;

function fixing_now(var a : TElm_List_Data) : TEina_Bool;
begin
  fixing_now:=(a.flag0 and bm_TElm_List_Data_fixing_now) shr bp_TElm_List_Data_fixing_now;
end;

procedure set_fixing_now(var a : TElm_List_Data; __fixing_now : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__fixing_now shl bp_TElm_List_Data_fixing_now) and bm_TElm_List_Data_fixing_now);
end;

function is_separator(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  is_separator:=(a.flag0 and bm_TElm_List_Item_Data_is_separator) shr bp_TElm_List_Item_Data_is_separator;
end;

procedure set_is_separator(var a : TElm_List_Item_Data; __is_separator : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_separator shl bp_TElm_List_Item_Data_is_separator) and bm_TElm_List_Item_Data_is_separator);
end;

function highlighted(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  highlighted:=(a.flag0 and bm_TElm_List_Item_Data_highlighted) shr bp_TElm_List_Item_Data_highlighted;
end;

procedure set_highlighted(var a : TElm_List_Item_Data; __highlighted : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__highlighted shl bp_TElm_List_Item_Data_highlighted) and bm_TElm_List_Item_Data_highlighted);
end;

function dummy_icon(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  dummy_icon:=(a.flag0 and bm_TElm_List_Item_Data_dummy_icon) shr bp_TElm_List_Item_Data_dummy_icon;
end;

procedure set_dummy_icon(var a : TElm_List_Item_Data; __dummy_icon : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dummy_icon shl bp_TElm_List_Item_Data_dummy_icon) and bm_TElm_List_Item_Data_dummy_icon);
end;

function dummy_end(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  dummy_end:=(a.flag0 and bm_TElm_List_Item_Data_dummy_end) shr bp_TElm_List_Item_Data_dummy_end;
end;

procedure set_dummy_end(var a : TElm_List_Item_Data; __dummy_end : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dummy_end shl bp_TElm_List_Item_Data_dummy_end) and bm_TElm_List_Item_Data_dummy_end);
end;

function selected(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  selected:=(a.flag0 and bm_TElm_List_Item_Data_selected) shr bp_TElm_List_Item_Data_selected;
end;

procedure set_selected(var a : TElm_List_Item_Data; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp_TElm_List_Item_Data_selected) and bm_TElm_List_Item_Data_selected);
end;

function deleted(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  deleted:=(a.flag0 and bm_TElm_List_Item_Data_deleted) shr bp_TElm_List_Item_Data_deleted;
end;

procedure set_deleted(var a : TElm_List_Item_Data; __deleted : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__deleted shl bp_TElm_List_Item_Data_deleted) and bm_TElm_List_Item_Data_deleted);
end;

function is_even(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  is_even:=(a.flag0 and bm_TElm_List_Item_Data_is_even) shr bp_TElm_List_Item_Data_is_even;
end;

procedure set_is_even(var a : TElm_List_Item_Data; __is_even : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_even shl bp_TElm_List_Item_Data_is_even) and bm_TElm_List_Item_Data_is_even);
end;

function fixed(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  fixed:=(a.flag0 and bm_TElm_List_Item_Data_fixed) shr bp_TElm_List_Item_Data_fixed;
end;

procedure set_fixed(var a : TElm_List_Item_Data; __fixed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__fixed shl bp_TElm_List_Item_Data_fixed) and bm_TElm_List_Item_Data_fixed);
end;

function even(var a : TElm_List_Item_Data) : TEina_Bool;
begin
  even:=(a.flag0 and bm_TElm_List_Item_Data_even) shr bp_TElm_List_Item_Data_even;
end;

procedure set_even(var a : TElm_List_Item_Data; __even : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__even shl bp_TElm_List_Item_Data_even) and bm_TElm_List_Item_Data_even);
end;


end.
