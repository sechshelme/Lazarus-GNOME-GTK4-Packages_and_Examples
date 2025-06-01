
unit elm_widget_panel;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_panel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_panel.h
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
PEcore_Timer  = ^Ecore_Timer;
PElm_Panel_Data  = ^Elm_Panel_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_PANEL_H}
{$define ELM_WIDGET_PANEL_H}
{$include "elm_interface_scrollable.h"}
{$include "elm_widget_layout.h"}
{$include "elm_panel_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-panel-class The Elementary Panel Class
 *
 * Elementary, besides having the @ref Panel widget, exposes its
 * foundation -- the Elementary Panel Class -- in order to create other
 * widgets which are a panel with some more logic on top.
  }
{*
 * Base layout smart data extended with panel instance data.
  }
type
  PElm_Panel_Data = ^TElm_Panel_Data;
  TElm_Panel_Data = record
      bx : PEvas_Object;
      content : PEvas_Object;
      event : PEvas_Object;
      scr_ly : PEvas_Object;
      hit_rect : PEvas_Object;
      panel_edje : PEvas_Object;
      scr_edje : PEvas_Object;
      scr_panel : PEvas_Object;
      scr_event : PEvas_Object;
      orient : TElm_Panel_Orient;
      content_size_ratio : Tdouble;
      down_x : TEvas_Coord;
      down_y : TEvas_Coord;
      handler_size : TEvas_Coord;
      timer : PEcore_Timer;
      flag0 : word;
    end;


const
  bm_TElm_Panel_Data_hidden = $1;
  bp_TElm_Panel_Data_hidden = 0;
  bm_TElm_Panel_Data_delete_me = $2;
  bp_TElm_Panel_Data_delete_me = 1;
  bm_TElm_Panel_Data_scrollable = $4;
  bp_TElm_Panel_Data_scrollable = 2;
  bm_TElm_Panel_Data_freeze = $8;
  bp_TElm_Panel_Data_freeze = 3;
  bm_TElm_Panel_Data_callback_added = $10;
  bp_TElm_Panel_Data_callback_added = 4;

function hidden(var a : TElm_Panel_Data) : TEina_Bool;
procedure set_hidden(var a : TElm_Panel_Data; __hidden : TEina_Bool);
function delete_me(var a : TElm_Panel_Data) : TEina_Bool;
procedure set_delete_me(var a : TElm_Panel_Data; __delete_me : TEina_Bool);
function scrollable(var a : TElm_Panel_Data) : TEina_Bool;
procedure set_scrollable(var a : TElm_Panel_Data; __scrollable : TEina_Bool);
function freeze(var a : TElm_Panel_Data) : TEina_Bool;
procedure set_freeze(var a : TElm_Panel_Data; __freeze : TEina_Bool);
function callback_added(var a : TElm_Panel_Data) : TEina_Bool;
procedure set_callback_added(var a : TElm_Panel_Data; __callback_added : TEina_Bool);
{*
 * @
  }

implementation

function hidden(var a : TElm_Panel_Data) : TEina_Bool;
begin
  hidden:=(a.flag0 and bm_TElm_Panel_Data_hidden) shr bp_TElm_Panel_Data_hidden;
end;

procedure set_hidden(var a : TElm_Panel_Data; __hidden : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hidden shl bp_TElm_Panel_Data_hidden) and bm_TElm_Panel_Data_hidden);
end;

function delete_me(var a : TElm_Panel_Data) : TEina_Bool;
begin
  delete_me:=(a.flag0 and bm_TElm_Panel_Data_delete_me) shr bp_TElm_Panel_Data_delete_me;
end;

procedure set_delete_me(var a : TElm_Panel_Data; __delete_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__delete_me shl bp_TElm_Panel_Data_delete_me) and bm_TElm_Panel_Data_delete_me);
end;

function scrollable(var a : TElm_Panel_Data) : TEina_Bool;
begin
  scrollable:=(a.flag0 and bm_TElm_Panel_Data_scrollable) shr bp_TElm_Panel_Data_scrollable;
end;

procedure set_scrollable(var a : TElm_Panel_Data; __scrollable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scrollable shl bp_TElm_Panel_Data_scrollable) and bm_TElm_Panel_Data_scrollable);
end;

function freeze(var a : TElm_Panel_Data) : TEina_Bool;
begin
  freeze:=(a.flag0 and bm_TElm_Panel_Data_freeze) shr bp_TElm_Panel_Data_freeze;
end;

procedure set_freeze(var a : TElm_Panel_Data; __freeze : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze shl bp_TElm_Panel_Data_freeze) and bm_TElm_Panel_Data_freeze);
end;

function callback_added(var a : TElm_Panel_Data) : TEina_Bool;
begin
  callback_added:=(a.flag0 and bm_TElm_Panel_Data_callback_added) shr bp_TElm_Panel_Data_callback_added;
end;

procedure set_callback_added(var a : TElm_Panel_Data; __callback_added : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__callback_added shl bp_TElm_Panel_Data_callback_added) and bm_TElm_Panel_Data_callback_added);
end;


end.
