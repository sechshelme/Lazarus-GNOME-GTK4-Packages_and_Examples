
unit elm_widget_notify;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_notify.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_notify.h
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
PElm_Notify_Data  = ^Elm_Notify_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_NOTIFY_H}
{$define ELM_WIDGET_NOTIFY_H}
{$include "Elementary.h"}
{$include <elm_notify_eo.h>}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-notify-class The Elementary Notify Class
 *
 * Elementary, besides having the @ref Notify widget, exposes its
 * foundation -- the Elementary Notify Class -- in order to create other
 * widgets which are a notify with some more logic on top.
  }
{*
 * Base widget smart data extended with notify instance data.
  }
type
  PElm_Notify_Data = ^TElm_Notify_Data;
  TElm_Notify_Data = record
      notify : PEvas_Object;
      content : PEvas_Object;
      parent : PEvas_Object;
      block_events : PEvas_Object;
      timeout : Tdouble;
      horizontal_align : Tdouble;
      vertical_align : Tdouble;
      timer : PEcore_Timer;
      flag0 : word;
    end;


const
  bm_TElm_Notify_Data_allow_events = $1;
  bp_TElm_Notify_Data_allow_events = 0;
  bm_TElm_Notify_Data_had_hidden = $2;
  bp_TElm_Notify_Data_had_hidden = 1;
  bm_TElm_Notify_Data_in_timeout = $4;
  bp_TElm_Notify_Data_in_timeout = 2;

function allow_events(var a : TElm_Notify_Data) : TEina_Bool;
procedure set_allow_events(var a : TElm_Notify_Data; __allow_events : TEina_Bool);
function had_hidden(var a : TElm_Notify_Data) : TEina_Bool;
procedure set_had_hidden(var a : TElm_Notify_Data; __had_hidden : TEina_Bool);
function in_timeout(var a : TElm_Notify_Data) : TEina_Bool;
procedure set_in_timeout(var a : TElm_Notify_Data; __in_timeout : TEina_Bool);
{*
 * @
  }

implementation

function allow_events(var a : TElm_Notify_Data) : TEina_Bool;
begin
  allow_events:=(a.flag0 and bm_TElm_Notify_Data_allow_events) shr bp_TElm_Notify_Data_allow_events;
end;

procedure set_allow_events(var a : TElm_Notify_Data; __allow_events : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__allow_events shl bp_TElm_Notify_Data_allow_events) and bm_TElm_Notify_Data_allow_events);
end;

function had_hidden(var a : TElm_Notify_Data) : TEina_Bool;
begin
  had_hidden:=(a.flag0 and bm_TElm_Notify_Data_had_hidden) shr bp_TElm_Notify_Data_had_hidden;
end;

procedure set_had_hidden(var a : TElm_Notify_Data; __had_hidden : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__had_hidden shl bp_TElm_Notify_Data_had_hidden) and bm_TElm_Notify_Data_had_hidden);
end;

function in_timeout(var a : TElm_Notify_Data) : TEina_Bool;
begin
  in_timeout:=(a.flag0 and bm_TElm_Notify_Data_in_timeout) shr bp_TElm_Notify_Data_in_timeout;
end;

procedure set_in_timeout(var a : TElm_Notify_Data; __in_timeout : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__in_timeout shl bp_TElm_Notify_Data_in_timeout) and bm_TElm_Notify_Data_in_timeout);
end;


end.
