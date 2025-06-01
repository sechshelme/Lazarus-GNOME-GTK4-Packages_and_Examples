
unit elm_widget_scroller;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_scroller.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_scroller.h
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
PElm_Scroller_Data  = ^Elm_Scroller_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_SCROLLER_H}
{$define ELM_WIDGET_SCROLLER_H}
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
 * @section elm-scroller-class The Elementary Scroller Class
 *
 * Elementary, besides having the @ref Scroller widget, exposes its
 * foundation -- the Elementary Scroller Class -- in order to create
 * other widgets which are a scroller with some more logic on top.
  }
{*
 * Base widget smart data extended with scroller instance data.
  }
type
  PElm_Scroller_Data = ^TElm_Scroller_Data;
  TElm_Scroller_Data = record
      hit_rect : PEvas_Object;
      g_layer : PEvas_Object;
      content : PEvas_Object;
      contents : PEvas_Object;
      proxy_content : array[0..2] of PEvas_Object;
      flag0 : word;
    end;


const
  bm_TElm_Scroller_Data_min_w = $1;
  bp_TElm_Scroller_Data_min_w = 0;
  bm_TElm_Scroller_Data_min_h = $2;
  bp_TElm_Scroller_Data_min_h = 1;
  bm_TElm_Scroller_Data_loop_h = $4;
  bp_TElm_Scroller_Data_loop_h = 2;
  bm_TElm_Scroller_Data_loop_v = $8;
  bp_TElm_Scroller_Data_loop_v = 3;

function min_w(var a : TElm_Scroller_Data) : TEina_Bool;
procedure set_min_w(var a : TElm_Scroller_Data; __min_w : TEina_Bool);
function min_h(var a : TElm_Scroller_Data) : TEina_Bool;
procedure set_min_h(var a : TElm_Scroller_Data; __min_h : TEina_Bool);
function loop_h(var a : TElm_Scroller_Data) : TEina_Bool;
procedure set_loop_h(var a : TElm_Scroller_Data; __loop_h : TEina_Bool);
function loop_v(var a : TElm_Scroller_Data) : TEina_Bool;
procedure set_loop_v(var a : TElm_Scroller_Data; __loop_v : TEina_Bool);
{*
 * @
  }

implementation

function min_w(var a : TElm_Scroller_Data) : TEina_Bool;
begin
  min_w:=(a.flag0 and bm_TElm_Scroller_Data_min_w) shr bp_TElm_Scroller_Data_min_w;
end;

procedure set_min_w(var a : TElm_Scroller_Data; __min_w : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__min_w shl bp_TElm_Scroller_Data_min_w) and bm_TElm_Scroller_Data_min_w);
end;

function min_h(var a : TElm_Scroller_Data) : TEina_Bool;
begin
  min_h:=(a.flag0 and bm_TElm_Scroller_Data_min_h) shr bp_TElm_Scroller_Data_min_h;
end;

procedure set_min_h(var a : TElm_Scroller_Data; __min_h : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__min_h shl bp_TElm_Scroller_Data_min_h) and bm_TElm_Scroller_Data_min_h);
end;

function loop_h(var a : TElm_Scroller_Data) : TEina_Bool;
begin
  loop_h:=(a.flag0 and bm_TElm_Scroller_Data_loop_h) shr bp_TElm_Scroller_Data_loop_h;
end;

procedure set_loop_h(var a : TElm_Scroller_Data; __loop_h : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loop_h shl bp_TElm_Scroller_Data_loop_h) and bm_TElm_Scroller_Data_loop_h);
end;

function loop_v(var a : TElm_Scroller_Data) : TEina_Bool;
begin
  loop_v:=(a.flag0 and bm_TElm_Scroller_Data_loop_v) shr bp_TElm_Scroller_Data_loop_v;
end;

procedure set_loop_v(var a : TElm_Scroller_Data; __loop_v : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loop_v shl bp_TElm_Scroller_Data_loop_v) and bm_TElm_Scroller_Data_loop_v);
end;


end.
