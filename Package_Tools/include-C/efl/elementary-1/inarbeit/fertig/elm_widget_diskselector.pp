
unit elm_widget_diskselector;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_diskselector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_diskselector.h
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
PEcore_Idle_Enterer  = ^Ecore_Idle_Enterer;
PEina_List  = ^Eina_List;
PElm_Diskselector_Data  = ^Elm_Diskselector_Data;
PElm_Diskselector_Item_Data  = ^Elm_Diskselector_Item_Data;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_DISKSELECTOR_H}
{$define ELM_WIDGET_DISKSELECTOR_H}
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
 * @section elm-diskselector-class The Elementary Diskselector Class
 *
 * Elementary, besides having the @ref Diskselector widget, exposes its
 * foundation -- the Elementary Diskselector Class -- in order to create other
 * widgets which are a diskselector with some more logic on top.
  }
{*
 * Base widget smart data extended with diskselector instance data.
  }
type
{ idle enterer for scroller move }
{ idle enterer for string check }
  PElm_Diskselector_Data = ^TElm_Diskselector_Data;
  TElm_Diskselector_Data = record
      hit_rect : PEvas_Object;
      main_box : PEvas_Object;
      selected_item : PElm_Diskselector_Item_Data;
      first : PElm_Diskselector_Item_Data;
      second : PElm_Diskselector_Item_Data;
      s_last : PElm_Diskselector_Item_Data;
      last : PElm_Diskselector_Item_Data;
      items : PEina_List;
      r_items : PEina_List;
      over_items : PEina_List;
      under_items : PEina_List;
      left_blanks : PEina_List;
      right_blanks : PEina_List;
      scroller_move_idle_enterer : PEcore_Idle_Enterer;
      string_check_idle_enterer : PEcore_Idle_Enterer;
      item_count : longint;
      len_threshold : longint;
      len_side : longint;
      display_item_num : longint;
      minw : TEvas_Coord;
      minh : TEvas_Coord;
      flag0 : word;
    end;


const
  bm_TElm_Diskselector_Data_init = $1;
  bp_TElm_Diskselector_Data_init = 0;
  bm_TElm_Diskselector_Data_round = $2;
  bp_TElm_Diskselector_Data_round = 1;
  bm_TElm_Diskselector_Data_display_item_num_by_api = $4;
  bp_TElm_Diskselector_Data_display_item_num_by_api = 2;
  bm_TElm_Diskselector_Data_left_boundary_reached = $8;
  bp_TElm_Diskselector_Data_left_boundary_reached = 3;
  bm_TElm_Diskselector_Data_right_boundary_reached = $10;
  bp_TElm_Diskselector_Data_right_boundary_reached = 4;

function init(var a : TElm_Diskselector_Data) : TEina_Bool;
procedure set_init(var a : TElm_Diskselector_Data; __init : TEina_Bool);
function round(var a : TElm_Diskselector_Data) : TEina_Bool;
procedure set_round(var a : TElm_Diskselector_Data; __round : TEina_Bool);
function display_item_num_by_api(var a : TElm_Diskselector_Data) : TEina_Bool;
procedure set_display_item_num_by_api(var a : TElm_Diskselector_Data; __display_item_num_by_api : TEina_Bool);
function left_boundary_reached(var a : TElm_Diskselector_Data) : TEina_Bool;
procedure set_left_boundary_reached(var a : TElm_Diskselector_Data; __left_boundary_reached : TEina_Bool);
function right_boundary_reached(var a : TElm_Diskselector_Data) : TEina_Bool;
procedure set_right_boundary_reached(var a : TElm_Diskselector_Data; __right_boundary_reached : TEina_Bool);
(* Const before type ignored *)
type
  PElm_Diskselector_Item_Data = ^TElm_Diskselector_Item_Data;
  TElm_Diskselector_Item_Data = record
      base : PElm_Widget_Item_Data;
      node : PEina_List;
      icon : PEvas_Object;
      _label : Pchar;
      func : TEvas_Smart_Cb;
    end;

{*
 * @
  }

implementation

function init(var a : TElm_Diskselector_Data) : TEina_Bool;
begin
  init:=(a.flag0 and bm_TElm_Diskselector_Data_init) shr bp_TElm_Diskselector_Data_init;
end;

procedure set_init(var a : TElm_Diskselector_Data; __init : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__init shl bp_TElm_Diskselector_Data_init) and bm_TElm_Diskselector_Data_init);
end;

function round(var a : TElm_Diskselector_Data) : TEina_Bool;
begin
  round:=(a.flag0 and bm_TElm_Diskselector_Data_round) shr bp_TElm_Diskselector_Data_round;
end;

procedure set_round(var a : TElm_Diskselector_Data; __round : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__round shl bp_TElm_Diskselector_Data_round) and bm_TElm_Diskselector_Data_round);
end;

function display_item_num_by_api(var a : TElm_Diskselector_Data) : TEina_Bool;
begin
  display_item_num_by_api:=(a.flag0 and bm_TElm_Diskselector_Data_display_item_num_by_api) shr bp_TElm_Diskselector_Data_display_item_num_by_api;
end;

procedure set_display_item_num_by_api(var a : TElm_Diskselector_Data; __display_item_num_by_api : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__display_item_num_by_api shl bp_TElm_Diskselector_Data_display_item_num_by_api) and bm_TElm_Diskselector_Data_display_item_num_by_api);
end;

function left_boundary_reached(var a : TElm_Diskselector_Data) : TEina_Bool;
begin
  left_boundary_reached:=(a.flag0 and bm_TElm_Diskselector_Data_left_boundary_reached) shr bp_TElm_Diskselector_Data_left_boundary_reached;
end;

procedure set_left_boundary_reached(var a : TElm_Diskselector_Data; __left_boundary_reached : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__left_boundary_reached shl bp_TElm_Diskselector_Data_left_boundary_reached) and bm_TElm_Diskselector_Data_left_boundary_reached);
end;

function right_boundary_reached(var a : TElm_Diskselector_Data) : TEina_Bool;
begin
  right_boundary_reached:=(a.flag0 and bm_TElm_Diskselector_Data_right_boundary_reached) shr bp_TElm_Diskselector_Data_right_boundary_reached;
end;

procedure set_right_boundary_reached(var a : TElm_Diskselector_Data; __right_boundary_reached : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__right_boundary_reached shl bp_TElm_Diskselector_Data_right_boundary_reached) and bm_TElm_Diskselector_Data_right_boundary_reached);
end;


end.
