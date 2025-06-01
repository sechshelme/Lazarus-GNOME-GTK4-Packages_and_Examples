
unit elm_widget_toolbar;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_toolbar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_toolbar.h
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
PEcore_Job  = ^Ecore_Job;
PEcore_Timer  = ^Ecore_Timer;
PEina_Inlist  = ^Eina_Inlist;
PEina_List  = ^Eina_List;
PElm_Object_Item  = ^Elm_Object_Item;
PElm_Toolbar_Data  = ^Elm_Toolbar_Data;
PElm_Toolbar_Item_Data  = ^Elm_Toolbar_Item_Data;
PElm_Transit  = ^Elm_Transit;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_TOOLBAR_H}
{$define ELM_WIDGET_TOOLBAR_H}
{$include "elm_interface_scrollable.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-toolbar-class The Elementary Toolbar Class
 *
 * Elementary, besides having the @ref Toolbar widget, exposes its
 * foundation -- the Elementary Toolbar Class -- in order to create other
 * widgets which are a toolbar with some more logic on top.
  }
type
{*
 * Base widget smart data extended with toolbar instance data.
  }
{*< a selected item by mouse click, return key, api, and etc.  }
{*< a focused item by keypad arrow or mouse. This is set to NULL if widget looses focus.  }
{*< This records the last focused item when widget looses focus. This is required to set the focus on last focused item when widgets gets focus.  }
{*< a flag that mouse is down on the toolbar at the moment. This flag is set to true on mouse and reset to false on mouse up.  }
  PElm_Toolbar_Data = ^TElm_Toolbar_Data;
  TElm_Toolbar_Data = record
      hit_rect : PEvas_Object;
      bx : PEvas_Object;
      more : PEvas_Object;
      bx_more : PEvas_Object;
      bx_more2 : PEvas_Object;
      menu_parent : PEvas_Object;
      items : PEina_Inlist;
      more_item : PElm_Toolbar_Item_Data;
      selected_item : PElm_Object_Item;
      focused_item : PElm_Object_Item;
      last_focused_item : PElm_Object_Item;
      reorder_empty : PElm_Toolbar_Item_Data;
      reorder_item : PElm_Toolbar_Item_Data;
      shrink_mode : TElm_Toolbar_Shrink_Mode;
      theme_icon_size : longint;
      priv_icon_size : longint;
      icon_size : longint;
      standard_priority : longint;
      minw_bx : longint;
      minh_bx : longint;
      item_count : dword;
      separator_count : dword;
      align : Tdouble;
      select_mode : TElm_Object_Select_Mode;
      long_timer : PEcore_Timer;
      resize_job : PEcore_Job;
      dir : TEfl_Ui_Layout_Orientation;
      flag0 : word;
    end;


const
  bm_TElm_Toolbar_Data_long_press = $1;
  bp_TElm_Toolbar_Data_long_press = 0;
  bm_TElm_Toolbar_Data_homogeneous = $2;
  bp_TElm_Toolbar_Data_homogeneous = 1;
  bm_TElm_Toolbar_Data_delete_me = $4;
  bp_TElm_Toolbar_Data_delete_me = 2;
  bm_TElm_Toolbar_Data_reorder_mode = $8;
  bp_TElm_Toolbar_Data_reorder_mode = 3;
  bm_TElm_Toolbar_Data_transverse_expanded = $10;
  bp_TElm_Toolbar_Data_transverse_expanded = 4;
  bm_TElm_Toolbar_Data_mouse_down = $20;
  bp_TElm_Toolbar_Data_mouse_down = 5;

function long_press(var a : TElm_Toolbar_Data) : TEina_Bool;
procedure set_long_press(var a : TElm_Toolbar_Data; __long_press : TEina_Bool);
function homogeneous(var a : TElm_Toolbar_Data) : TEina_Bool;
procedure set_homogeneous(var a : TElm_Toolbar_Data; __homogeneous : TEina_Bool);
function delete_me(var a : TElm_Toolbar_Data) : TEina_Bool;
procedure set_delete_me(var a : TElm_Toolbar_Data; __delete_me : TEina_Bool);
function reorder_mode(var a : TElm_Toolbar_Data) : TEina_Bool;
procedure set_reorder_mode(var a : TElm_Toolbar_Data; __reorder_mode : TEina_Bool);
function transverse_expanded(var a : TElm_Toolbar_Data) : TEina_Bool;
procedure set_transverse_expanded(var a : TElm_Toolbar_Data; __transverse_expanded : TEina_Bool);
function mouse_down(var a : TElm_Toolbar_Data) : TEina_Bool;
procedure set_mouse_down(var a : TElm_Toolbar_Data; __mouse_down : TEina_Bool);
(* Const before type ignored *)
(* Const before type ignored *)
type
  PElm_Toolbar_Item_Data = ^TElm_Toolbar_Item_Data;
  TElm_Toolbar_Item_Data = record
      base : PElm_Widget_Item_Data;
      __in_list : TEina_Inlist;
      _label : Pchar;
      icon_str : Pchar;
      icon : PEvas_Object;
      object : PEvas_Object;
      o_menu : PEvas_Object;
      in_box : PEvas_Object;
      proxy : PEvas_Object;
      func : TEvas_Smart_Cb;
      trans : PElm_Transit;
      reorder_to : PElm_Toolbar_Item_Data;
      prio : record
          priority : longint;
          flag0 : word;
        end;
      states : PEina_List;
      current_state : PEina_List;
      flag0 : word;
    end;


const
  bm_TElm_Toolbar_Item_Data_visible = $1;
  bp_TElm_Toolbar_Item_Data_visible = 0;
  bm_TElm_Toolbar_Item_Data_separator = $1;
  bp_TElm_Toolbar_Item_Data_separator = 0;
  bm_TElm_Toolbar_Item_Data_selected = $2;
  bp_TElm_Toolbar_Item_Data_selected = 1;
  bm_TElm_Toolbar_Item_Data_menu = $4;
  bp_TElm_Toolbar_Item_Data_menu = 2;
  bm_TElm_Toolbar_Item_Data_on_move = $8;
  bp_TElm_Toolbar_Item_Data_on_move = 3;

function separator(var a : TElm_Toolbar_Item_Data) : TEina_Bool;
procedure set_separator(var a : TElm_Toolbar_Item_Data; __separator : TEina_Bool);
function selected(var a : TElm_Toolbar_Item_Data) : TEina_Bool;
procedure set_selected(var a : TElm_Toolbar_Item_Data; __selected : TEina_Bool);
function menu(var a : TElm_Toolbar_Item_Data) : TEina_Bool;
procedure set_menu(var a : TElm_Toolbar_Item_Data; __menu : TEina_Bool);
function on_move(var a : TElm_Toolbar_Item_Data) : TEina_Bool;
procedure set_on_move(var a : TElm_Toolbar_Item_Data; __on_move : TEina_Bool);
{*
 * @
  }

implementation

function long_press(var a : TElm_Toolbar_Data) : TEina_Bool;
begin
  long_press:=(a.flag0 and bm_TElm_Toolbar_Data_long_press) shr bp_TElm_Toolbar_Data_long_press;
end;

procedure set_long_press(var a : TElm_Toolbar_Data; __long_press : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__long_press shl bp_TElm_Toolbar_Data_long_press) and bm_TElm_Toolbar_Data_long_press);
end;

function homogeneous(var a : TElm_Toolbar_Data) : TEina_Bool;
begin
  homogeneous:=(a.flag0 and bm_TElm_Toolbar_Data_homogeneous) shr bp_TElm_Toolbar_Data_homogeneous;
end;

procedure set_homogeneous(var a : TElm_Toolbar_Data; __homogeneous : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__homogeneous shl bp_TElm_Toolbar_Data_homogeneous) and bm_TElm_Toolbar_Data_homogeneous);
end;

function delete_me(var a : TElm_Toolbar_Data) : TEina_Bool;
begin
  delete_me:=(a.flag0 and bm_TElm_Toolbar_Data_delete_me) shr bp_TElm_Toolbar_Data_delete_me;
end;

procedure set_delete_me(var a : TElm_Toolbar_Data; __delete_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__delete_me shl bp_TElm_Toolbar_Data_delete_me) and bm_TElm_Toolbar_Data_delete_me);
end;

function reorder_mode(var a : TElm_Toolbar_Data) : TEina_Bool;
begin
  reorder_mode:=(a.flag0 and bm_TElm_Toolbar_Data_reorder_mode) shr bp_TElm_Toolbar_Data_reorder_mode;
end;

procedure set_reorder_mode(var a : TElm_Toolbar_Data; __reorder_mode : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__reorder_mode shl bp_TElm_Toolbar_Data_reorder_mode) and bm_TElm_Toolbar_Data_reorder_mode);
end;

function transverse_expanded(var a : TElm_Toolbar_Data) : TEina_Bool;
begin
  transverse_expanded:=(a.flag0 and bm_TElm_Toolbar_Data_transverse_expanded) shr bp_TElm_Toolbar_Data_transverse_expanded;
end;

procedure set_transverse_expanded(var a : TElm_Toolbar_Data; __transverse_expanded : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__transverse_expanded shl bp_TElm_Toolbar_Data_transverse_expanded) and bm_TElm_Toolbar_Data_transverse_expanded);
end;

function mouse_down(var a : TElm_Toolbar_Data) : TEina_Bool;
begin
  mouse_down:=(a.flag0 and bm_TElm_Toolbar_Data_mouse_down) shr bp_TElm_Toolbar_Data_mouse_down;
end;

procedure set_mouse_down(var a : TElm_Toolbar_Data; __mouse_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__mouse_down shl bp_TElm_Toolbar_Data_mouse_down) and bm_TElm_Toolbar_Data_mouse_down);
end;

function separator(var a : TElm_Toolbar_Item_Data) : TEina_Bool;
begin
  separator:=(a.flag0 and bm_TElm_Toolbar_Item_Data_separator) shr bp_TElm_Toolbar_Item_Data_separator;
end;

procedure set_separator(var a : TElm_Toolbar_Item_Data; __separator : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__separator shl bp_TElm_Toolbar_Item_Data_separator) and bm_TElm_Toolbar_Item_Data_separator);
end;

function selected(var a : TElm_Toolbar_Item_Data) : TEina_Bool;
begin
  selected:=(a.flag0 and bm_TElm_Toolbar_Item_Data_selected) shr bp_TElm_Toolbar_Item_Data_selected;
end;

procedure set_selected(var a : TElm_Toolbar_Item_Data; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp_TElm_Toolbar_Item_Data_selected) and bm_TElm_Toolbar_Item_Data_selected);
end;

function menu(var a : TElm_Toolbar_Item_Data) : TEina_Bool;
begin
  menu:=(a.flag0 and bm_TElm_Toolbar_Item_Data_menu) shr bp_TElm_Toolbar_Item_Data_menu;
end;

procedure set_menu(var a : TElm_Toolbar_Item_Data; __menu : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__menu shl bp_TElm_Toolbar_Item_Data_menu) and bm_TElm_Toolbar_Item_Data_menu);
end;

function on_move(var a : TElm_Toolbar_Item_Data) : TEina_Bool;
begin
  on_move:=(a.flag0 and bm_TElm_Toolbar_Item_Data_on_move) shr bp_TElm_Toolbar_Item_Data_on_move;
end;

procedure set_on_move(var a : TElm_Toolbar_Item_Data; __on_move : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_move shl bp_TElm_Toolbar_Item_Data_on_move) and bm_TElm_Toolbar_Item_Data_on_move);
end;


end.
