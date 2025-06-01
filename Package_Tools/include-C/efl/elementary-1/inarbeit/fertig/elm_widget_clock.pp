
unit elm_widget_clock;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_clock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_clock.h
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
PElm_Clock_Data  = ^Elm_Clock_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_CLOCK_H}
{$define ELM_WIDGET_CLOCK_H}
{$include "Elementary.h"}
{$include <Eio.h>}
{$include "elm_clock_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-clock-class The Elementary Clock Class
 *
 * Elementary, besides having the @ref Clock widget, exposes its
 * foundation -- the Elementary Clock Class -- in order to create other
 * widgets which are a clock with some more logic on top.
  }
{*
 * Base layout smart data extended with clock instance data.
  }
type
{*< a flag whether clock is paused or not  }
  PElm_Clock_Data = ^TElm_Clock_Data;
  TElm_Clock_Data = record
      interval : Tdouble;
      first_interval : Tdouble;
      digedit : TElm_Clock_Edit_Mode;
      hrs : longint;
      min : longint;
      sec : longint;
      timediff : longint;
      digit : array[0..5] of PEvas_Object;
      am_pm_obj : PEvas_Object;
      sel_obj : PEvas_Object;
      ticker : PEcore_Timer;
      spin : PEcore_Timer;
      cur : record
          hrs : longint;
          min : longint;
          sec : longint;
          ampm : char;
          digedit : TElm_Clock_Edit_Mode;
          flag0 : word;
        end;
      flag0 : word;
    end;


const
  bm_TElm_Clock_Data_seconds = $1;
  bp_TElm_Clock_Data_seconds = 0;
  bm_TElm_Clock_Data_am_pm = $2;
  bp_TElm_Clock_Data_am_pm = 1;
  bm_TElm_Clock_Data_edit = $4;
  bp_TElm_Clock_Data_edit = 2;
  bm_TElm_Clock_Data_paused = $1;
  bp_TElm_Clock_Data_paused = 0;
  bm_TElm_Clock_Data_seconds = $2;
  bp_TElm_Clock_Data_seconds = 1;
  bm_TElm_Clock_Data_am_pm = $4;
  bp_TElm_Clock_Data_am_pm = 2;
  bm_TElm_Clock_Data_edit = $8;
  bp_TElm_Clock_Data_edit = 3;

function paused(var a : TElm_Clock_Data) : TEina_Bool;
procedure set_paused(var a : TElm_Clock_Data; __paused : TEina_Bool);
function seconds(var a : TElm_Clock_Data) : TEina_Bool;
procedure set_seconds(var a : TElm_Clock_Data; __seconds : TEina_Bool);
function am_pm(var a : TElm_Clock_Data) : TEina_Bool;
procedure set_am_pm(var a : TElm_Clock_Data; __am_pm : TEina_Bool);
function edit(var a : TElm_Clock_Data) : TEina_Bool;
procedure set_edit(var a : TElm_Clock_Data; __edit : TEina_Bool);
{*
 * @
  }

implementation

function paused(var a : TElm_Clock_Data) : TEina_Bool;
begin
  paused:=(a.flag0 and bm_TElm_Clock_Data_paused) shr bp_TElm_Clock_Data_paused;
end;

procedure set_paused(var a : TElm_Clock_Data; __paused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__paused shl bp_TElm_Clock_Data_paused) and bm_TElm_Clock_Data_paused);
end;

function seconds(var a : TElm_Clock_Data) : TEina_Bool;
begin
  seconds:=(a.flag0 and bm_TElm_Clock_Data_seconds) shr bp_TElm_Clock_Data_seconds;
end;

procedure set_seconds(var a : TElm_Clock_Data; __seconds : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__seconds shl bp_TElm_Clock_Data_seconds) and bm_TElm_Clock_Data_seconds);
end;

function am_pm(var a : TElm_Clock_Data) : TEina_Bool;
begin
  am_pm:=(a.flag0 and bm_TElm_Clock_Data_am_pm) shr bp_TElm_Clock_Data_am_pm;
end;

procedure set_am_pm(var a : TElm_Clock_Data; __am_pm : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__am_pm shl bp_TElm_Clock_Data_am_pm) and bm_TElm_Clock_Data_am_pm);
end;

function edit(var a : TElm_Clock_Data) : TEina_Bool;
begin
  edit:=(a.flag0 and bm_TElm_Clock_Data_edit) shr bp_TElm_Clock_Data_edit;
end;

procedure set_edit(var a : TElm_Clock_Data; __edit : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__edit shl bp_TElm_Clock_Data_edit) and bm_TElm_Clock_Data_edit);
end;


end.
