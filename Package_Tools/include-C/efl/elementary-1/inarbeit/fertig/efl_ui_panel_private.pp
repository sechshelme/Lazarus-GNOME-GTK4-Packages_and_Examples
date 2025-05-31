
unit efl_ui_panel_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_panel_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_panel_private.h
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
PEfl_Ui_Panel_Data  = ^Efl_Ui_Panel_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_PANEL_H}
{$define EFL_UI_PANEL_H}
{$include "elm_interface_scrollable.h"}
{$include "elm_widget_layout.h"}
{$include "efl_ui_panel.eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(EFL_UI_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * Base layout smart data extended with panel instance data.
  }
type
  PEfl_Ui_Panel_Data = ^TEfl_Ui_Panel_Data;
  TEfl_Ui_Panel_Data = record
      bx : PEvas_Object;
      content : PEvas_Object;
      event : PEvas_Object;
      scr_ly : PEvas_Object;
      panel_edje : PEvas_Object;
      scr_edje : PEvas_Object;
      scr_panel : PEvas_Object;
      scr_event : PEvas_Object;
      smanager : PEvas_Object;
      pan_obj : PEvas_Object;
      orient : TEfl_Ui_Panel_Orient;
      content_size_ratio : Tdouble;
      down_x : TEvas_Coord;
      down_y : TEvas_Coord;
      handler_size : TEvas_Coord;
      timer : PEcore_Timer;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Panel_Data_hidden = $1;
  bp_TEfl_Ui_Panel_Data_hidden = 0;
  bm_TEfl_Ui_Panel_Data_delete_me = $2;
  bp_TEfl_Ui_Panel_Data_delete_me = 1;
  bm_TEfl_Ui_Panel_Data_scrollable = $4;
  bp_TEfl_Ui_Panel_Data_scrollable = 2;
  bm_TEfl_Ui_Panel_Data_freeze = $8;
  bp_TEfl_Ui_Panel_Data_freeze = 3;
  bm_TEfl_Ui_Panel_Data_callback_added = $10;
  bp_TEfl_Ui_Panel_Data_callback_added = 4;

function hidden(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
procedure set_hidden(var a : TEfl_Ui_Panel_Data; __hidden : TEina_Bool);
function delete_me(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
procedure set_delete_me(var a : TEfl_Ui_Panel_Data; __delete_me : TEina_Bool);
function scrollable(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
procedure set_scrollable(var a : TEfl_Ui_Panel_Data; __scrollable : TEina_Bool);
function freeze(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
procedure set_freeze(var a : TEfl_Ui_Panel_Data; __freeze : TEina_Bool);
function callback_added(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
procedure set_callback_added(var a : TEfl_Ui_Panel_Data; __callback_added : TEina_Bool);

implementation

function hidden(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
begin
  hidden:=(a.flag0 and bm_TEfl_Ui_Panel_Data_hidden) shr bp_TEfl_Ui_Panel_Data_hidden;
end;

procedure set_hidden(var a : TEfl_Ui_Panel_Data; __hidden : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hidden shl bp_TEfl_Ui_Panel_Data_hidden) and bm_TEfl_Ui_Panel_Data_hidden);
end;

function delete_me(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
begin
  delete_me:=(a.flag0 and bm_TEfl_Ui_Panel_Data_delete_me) shr bp_TEfl_Ui_Panel_Data_delete_me;
end;

procedure set_delete_me(var a : TEfl_Ui_Panel_Data; __delete_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__delete_me shl bp_TEfl_Ui_Panel_Data_delete_me) and bm_TEfl_Ui_Panel_Data_delete_me);
end;

function scrollable(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
begin
  scrollable:=(a.flag0 and bm_TEfl_Ui_Panel_Data_scrollable) shr bp_TEfl_Ui_Panel_Data_scrollable;
end;

procedure set_scrollable(var a : TEfl_Ui_Panel_Data; __scrollable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scrollable shl bp_TEfl_Ui_Panel_Data_scrollable) and bm_TEfl_Ui_Panel_Data_scrollable);
end;

function freeze(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
begin
  freeze:=(a.flag0 and bm_TEfl_Ui_Panel_Data_freeze) shr bp_TEfl_Ui_Panel_Data_freeze;
end;

procedure set_freeze(var a : TEfl_Ui_Panel_Data; __freeze : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze shl bp_TEfl_Ui_Panel_Data_freeze) and bm_TEfl_Ui_Panel_Data_freeze);
end;

function callback_added(var a : TEfl_Ui_Panel_Data) : TEina_Bool;
begin
  callback_added:=(a.flag0 and bm_TEfl_Ui_Panel_Data_callback_added) shr bp_TEfl_Ui_Panel_Data_callback_added;
end;

procedure set_callback_added(var a : TEfl_Ui_Panel_Data; __callback_added : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__callback_added shl bp_TEfl_Ui_Panel_Data_callback_added) and bm_TEfl_Ui_Panel_Data_callback_added);
end;


end.
