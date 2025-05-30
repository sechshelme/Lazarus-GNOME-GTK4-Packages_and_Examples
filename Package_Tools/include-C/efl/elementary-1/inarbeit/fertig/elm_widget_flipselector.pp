
unit elm_widget_flipselector;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_flipselector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_flipselector.h
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
PEina_List  = ^Eina_List;
PElm_Flipselector_Data  = ^Elm_Flipselector_Data;
PElm_Flipselector_Item_Data  = ^Elm_Flipselector_Item_Data;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_FLIPSELECTOR_H}
{$define ELM_WIDGET_FLIPSELECTOR_H}
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
 * @section elm-flipselector-class The Elementary Flipselector Class
 *
 * Elementary, besides having the @ref Flipselector widget, exposes its
 * foundation -- the Elementary Flipselector Class -- in order to create other
 * widgets which are a flipselector with some more logic on top.
  }
{*
 * Base layout smart data extended with flipselector instance data.
  }
type
{ item containing the largest
                                    * label string  }
{*< step for the value change. 1 by default.  }
  PElm_Flipselector_Data = ^TElm_Flipselector_Data;
  TElm_Flipselector_Data = record
      obj : PEvas_Object;
      items : PEina_List;
      current : PEina_List;
      sentinel : PEina_List;
      spin : PEcore_Timer;
      view_update : PEcore_Job;
      max_len : dword;
      interval : Tdouble;
      first_interval : Tdouble;
      val_min : Tdouble;
      val_max : Tdouble;
      step : Tdouble;
      walking : longint;
      flag0 : word;
    end;


const
  bm_TElm_Flipselector_Data_evaluating = $1;
  bp_TElm_Flipselector_Data_evaluating = 0;
  bm_TElm_Flipselector_Data_deleting = $2;
  bp_TElm_Flipselector_Data_deleting = 1;
  bm_TElm_Flipselector_Data_need_update = $4;
  bp_TElm_Flipselector_Data_need_update = 2;

function evaluating(var a : TElm_Flipselector_Data) : TEina_Bool;
procedure set_evaluating(var a : TElm_Flipselector_Data; __evaluating : TEina_Bool);
function deleting(var a : TElm_Flipselector_Data) : TEina_Bool;
procedure set_deleting(var a : TElm_Flipselector_Data; __deleting : TEina_Bool);
function need_update(var a : TElm_Flipselector_Data) : TEina_Bool;
procedure set_need_update(var a : TElm_Flipselector_Data; __need_update : TEina_Bool);
type
(* Const before type ignored *)
  PElm_Flipselector_Item_Data = ^TElm_Flipselector_Item_Data;
  TElm_Flipselector_Item_Data = record
      base : PElm_Widget_Item_Data;
      _label : Pchar;
      func : TEvas_Smart_Cb;
    end;


implementation

function evaluating(var a : TElm_Flipselector_Data) : TEina_Bool;
begin
  evaluating:=(a.flag0 and bm_TElm_Flipselector_Data_evaluating) shr bp_TElm_Flipselector_Data_evaluating;
end;

procedure set_evaluating(var a : TElm_Flipselector_Data; __evaluating : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__evaluating shl bp_TElm_Flipselector_Data_evaluating) and bm_TElm_Flipselector_Data_evaluating);
end;

function deleting(var a : TElm_Flipselector_Data) : TEina_Bool;
begin
  deleting:=(a.flag0 and bm_TElm_Flipselector_Data_deleting) shr bp_TElm_Flipselector_Data_deleting;
end;

procedure set_deleting(var a : TElm_Flipselector_Data; __deleting : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__deleting shl bp_TElm_Flipselector_Data_deleting) and bm_TElm_Flipselector_Data_deleting);
end;

function need_update(var a : TElm_Flipselector_Data) : TEina_Bool;
begin
  need_update:=(a.flag0 and bm_TElm_Flipselector_Data_need_update) shr bp_TElm_Flipselector_Data_need_update;
end;

procedure set_need_update(var a : TElm_Flipselector_Data; __need_update : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__need_update shl bp_TElm_Flipselector_Data_need_update) and bm_TElm_Flipselector_Data_need_update);
end;


end.
