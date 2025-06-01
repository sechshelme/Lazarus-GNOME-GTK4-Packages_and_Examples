
unit elm_widget_menu;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_menu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_menu.h
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
PElm_DBus_Menu  = ^Elm_DBus_Menu;
PElm_Menu_Data  = ^Elm_Menu_Data;
PElm_Menu_Item_Data  = ^Elm_Menu_Item_Data;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_MENU_H}
{$define ELM_WIDGET_MENU_H}
{$include "Elementary.h"}
{$include "elm_menu_eo.h"}
{$include "elm_menu_item_eo.h"}
{$include "elm_hover_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-menu-class The Elementary Menu Class
 *
 * Elementary, besides having the @ref Menu widget, exposes its
 * foundation -- the Elementary Menu Class -- in order to create
 * other widgets which are a menu with some more logic on top.
  }
{*
 * Base widget smart data extended with menu instance data.
  }
type
  PElm_Menu_Data = ^TElm_Menu_Data;
  TElm_Menu_Data = record
      hv : PEvas_Object;
      bx : PEvas_Object;
      location : PEvas_Object;
      parent : PEvas_Object;
      obj : PEvas_Object;
      items : PEina_List;
      xloc : TEvas_Coord;
      yloc : TEvas_Coord;
      dbus_menu : PElm_DBus_Menu;
      flag0 : word;
    end;


const
  bm_TElm_Menu_Data_menu_bar = $1;
  bp_TElm_Menu_Data_menu_bar = 0;

function menu_bar(var a : TElm_Menu_Data) : TEina_Bool;
procedure set_menu_bar(var a : TElm_Menu_Data; __menu_bar : TEina_Bool);
type
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Menu_Item_Data = ^TElm_Menu_Item_Data;
  TElm_Menu_Item_Data = record
      base : PElm_Widget_Item_Data;
      parent : PElm_Menu_Item_Data;
      content : PEvas_Object;
      icon_str : Pchar;
      _label : Pchar;
      func : TEvas_Smart_Cb;
      idx : dword;
      dbus_menu : PElm_DBus_Menu;
      dbus_idx : longint;
      submenu : record
          hv : PEvas_Object;
          bx : PEvas_Object;
          location : PEvas_Object;
          items : PEina_List;
          flag0 : word;
        end;
      flag0 : word;
    end;


const
  bm_TElm_Menu_Item_Data_open = $1;
  bp_TElm_Menu_Item_Data_open = 0;
  bm_TElm_Menu_Item_Data_separator = $1;
  bp_TElm_Menu_Item_Data_separator = 0;
  bm_TElm_Menu_Item_Data_selected = $2;
  bp_TElm_Menu_Item_Data_selected = 1;
  bm_TElm_Menu_Item_Data_object_item = $4;
  bp_TElm_Menu_Item_Data_object_item = 2;
  bm_TElm_Menu_Item_Data_was_enabled = $8;
  bp_TElm_Menu_Item_Data_was_enabled = 3;
  bm_TElm_Menu_Item_Data_blocked = $10;
  bp_TElm_Menu_Item_Data_blocked = 4;

function separator(var a : TElm_Menu_Item_Data) : TEina_Bool;
procedure set_separator(var a : TElm_Menu_Item_Data; __separator : TEina_Bool);
function selected(var a : TElm_Menu_Item_Data) : TEina_Bool;
procedure set_selected(var a : TElm_Menu_Item_Data; __selected : TEina_Bool);
function object_item(var a : TElm_Menu_Item_Data) : TEina_Bool;
procedure set_object_item(var a : TElm_Menu_Item_Data; __object_item : TEina_Bool);
function was_enabled(var a : TElm_Menu_Item_Data) : TEina_Bool;
procedure set_was_enabled(var a : TElm_Menu_Item_Data; __was_enabled : TEina_Bool);
function blocked(var a : TElm_Menu_Item_Data) : TEina_Bool;
procedure set_blocked(var a : TElm_Menu_Item_Data; __blocked : TEina_Bool);

implementation

function menu_bar(var a : TElm_Menu_Data) : TEina_Bool;
begin
  menu_bar:=(a.flag0 and bm_TElm_Menu_Data_menu_bar) shr bp_TElm_Menu_Data_menu_bar;
end;

procedure set_menu_bar(var a : TElm_Menu_Data; __menu_bar : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__menu_bar shl bp_TElm_Menu_Data_menu_bar) and bm_TElm_Menu_Data_menu_bar);
end;

function separator(var a : TElm_Menu_Item_Data) : TEina_Bool;
begin
  separator:=(a.flag0 and bm_TElm_Menu_Item_Data_separator) shr bp_TElm_Menu_Item_Data_separator;
end;

procedure set_separator(var a : TElm_Menu_Item_Data; __separator : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__separator shl bp_TElm_Menu_Item_Data_separator) and bm_TElm_Menu_Item_Data_separator);
end;

function selected(var a : TElm_Menu_Item_Data) : TEina_Bool;
begin
  selected:=(a.flag0 and bm_TElm_Menu_Item_Data_selected) shr bp_TElm_Menu_Item_Data_selected;
end;

procedure set_selected(var a : TElm_Menu_Item_Data; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp_TElm_Menu_Item_Data_selected) and bm_TElm_Menu_Item_Data_selected);
end;

function object_item(var a : TElm_Menu_Item_Data) : TEina_Bool;
begin
  object_item:=(a.flag0 and bm_TElm_Menu_Item_Data_object_item) shr bp_TElm_Menu_Item_Data_object_item;
end;

procedure set_object_item(var a : TElm_Menu_Item_Data; __object_item : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__object_item shl bp_TElm_Menu_Item_Data_object_item) and bm_TElm_Menu_Item_Data_object_item);
end;

function was_enabled(var a : TElm_Menu_Item_Data) : TEina_Bool;
begin
  was_enabled:=(a.flag0 and bm_TElm_Menu_Item_Data_was_enabled) shr bp_TElm_Menu_Item_Data_was_enabled;
end;

procedure set_was_enabled(var a : TElm_Menu_Item_Data; __was_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__was_enabled shl bp_TElm_Menu_Item_Data_was_enabled) and bm_TElm_Menu_Item_Data_was_enabled);
end;

function blocked(var a : TElm_Menu_Item_Data) : TEina_Bool;
begin
  blocked:=(a.flag0 and bm_TElm_Menu_Item_Data_blocked) shr bp_TElm_Menu_Item_Data_blocked;
end;

procedure set_blocked(var a : TElm_Menu_Item_Data; __blocked : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__blocked shl bp_TElm_Menu_Item_Data_blocked) and bm_TElm_Menu_Item_Data_blocked);
end;


end.
