
unit elm_widget_hoversel;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_hoversel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_hoversel.h
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
PEina_List  = ^Eina_List;
PElm_Hoversel_Data  = ^Elm_Hoversel_Data;
PElm_Hoversel_Item_Data  = ^Elm_Hoversel_Item_Data;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_HOVERSEL_H}
{$define ELM_WIDGET_HOVERSEL_H}
{$include "Elementary.h"}
{$include <Eio.h>}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-hoversel-class The Elementary Hoversel Class
 *
 * Elementary, besides having the @ref Hoversel widget, exposes its
 * foundation -- the Elementary Hoversel Class -- in order to create other
 * widgets which are a hoversel with some more logic on top.
  }
{*
 * Base button smart data extended with hoversel instance data.
  }
type
{ aggregates a hover  }
(* Const before type ignored *)
  PElm_Hoversel_Data = ^TElm_Hoversel_Data;
  TElm_Hoversel_Data = record
      hover : PEvas_Object;
      hover_parent : PEvas_Object;
      spacer : PEvas_Object;
      tbl : PEvas_Object;
      scr : PEvas_Object;
      bx : PEvas_Object;
      last_location : Pchar;
      items : PEina_List;
      resize_job : PEcore_Job;
      flag0 : word;
    end;


const
  bm_TElm_Hoversel_Data_horizontal = $1;
  bp_TElm_Hoversel_Data_horizontal = 0;
  bm_TElm_Hoversel_Data_expanded = $2;
  bp_TElm_Hoversel_Data_expanded = 1;
  bm_TElm_Hoversel_Data_scrollable = $4;
  bp_TElm_Hoversel_Data_scrollable = 2;
  bm_TElm_Hoversel_Data_auto_update = $8;
  bp_TElm_Hoversel_Data_auto_update = 3;

function horizontal(var a : TElm_Hoversel_Data) : TEina_Bool;
procedure set_horizontal(var a : TElm_Hoversel_Data; __horizontal : TEina_Bool);
function expanded(var a : TElm_Hoversel_Data) : TEina_Bool;
procedure set_expanded(var a : TElm_Hoversel_Data; __expanded : TEina_Bool);
function scrollable(var a : TElm_Hoversel_Data) : TEina_Bool;
procedure set_scrollable(var a : TElm_Hoversel_Data; __scrollable : TEina_Bool);
function auto_update(var a : TElm_Hoversel_Data) : TEina_Bool;
procedure set_auto_update(var a : TElm_Hoversel_Data; __auto_update : TEina_Bool);
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Hoversel_Item_Data = ^TElm_Hoversel_Item_Data;
  TElm_Hoversel_Item_Data = record
      base : PElm_Widget_Item_Data;
      _label : Pchar;
      icon_file : Pchar;
      icon_group : Pchar;
      icon_type : TElm_Icon_Type;
      func : TEvas_Smart_Cb;
    end;

{*
 * @
  }

implementation

function horizontal(var a : TElm_Hoversel_Data) : TEina_Bool;
begin
  horizontal:=(a.flag0 and bm_TElm_Hoversel_Data_horizontal) shr bp_TElm_Hoversel_Data_horizontal;
end;

procedure set_horizontal(var a : TElm_Hoversel_Data; __horizontal : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__horizontal shl bp_TElm_Hoversel_Data_horizontal) and bm_TElm_Hoversel_Data_horizontal);
end;

function expanded(var a : TElm_Hoversel_Data) : TEina_Bool;
begin
  expanded:=(a.flag0 and bm_TElm_Hoversel_Data_expanded) shr bp_TElm_Hoversel_Data_expanded;
end;

procedure set_expanded(var a : TElm_Hoversel_Data; __expanded : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__expanded shl bp_TElm_Hoversel_Data_expanded) and bm_TElm_Hoversel_Data_expanded);
end;

function scrollable(var a : TElm_Hoversel_Data) : TEina_Bool;
begin
  scrollable:=(a.flag0 and bm_TElm_Hoversel_Data_scrollable) shr bp_TElm_Hoversel_Data_scrollable;
end;

procedure set_scrollable(var a : TElm_Hoversel_Data; __scrollable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scrollable shl bp_TElm_Hoversel_Data_scrollable) and bm_TElm_Hoversel_Data_scrollable);
end;

function auto_update(var a : TElm_Hoversel_Data) : TEina_Bool;
begin
  auto_update:=(a.flag0 and bm_TElm_Hoversel_Data_auto_update) shr bp_TElm_Hoversel_Data_auto_update;
end;

procedure set_auto_update(var a : TElm_Hoversel_Data; __auto_update : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__auto_update shl bp_TElm_Hoversel_Data_auto_update) and bm_TElm_Hoversel_Data_auto_update);
end;


end.
