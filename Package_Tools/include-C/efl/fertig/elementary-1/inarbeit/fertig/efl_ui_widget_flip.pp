
unit efl_ui_widget_flip;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_flip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_flip.h
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
PEcore_Animator  = ^Ecore_Animator;
PEcore_Job  = ^Ecore_Job;
PEfl_Ui_Flip_Data  = ^Efl_Ui_Flip_Data;
PEina_List  = ^Eina_List;
PEvas_Object  = ^Evas_Object;
PSlice  = ^Slice;
PVertex2  = ^Vertex2;
PVertex3  = ^Vertex3;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_FLIP_H}
{$define EFL_UI_WIDGET_FLIP_H}
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
 * @section elm-flip-class The Elementary Flip Class
 *
 * Elementary, besides having the @ref Flip widget, exposes its
 * foundation -- the Elementary Flip Class -- in order to create other
 * widgets which are a flip with some more logic on top.
  }
type
{*
 * Base widget smart data extended with flip instance data.
  }
  PEfl_Ui_Flip_Data = ^TEfl_Ui_Flip_Data;
  TEfl_Ui_Flip_Data = record
      obj : PEvas_Object;
      clip : PEvas_Object;
      event : array[0..3] of PEvas_Object;
      front : record
          content : PEvas_Object;
          clip : PEvas_Object;
        end;
      back : record
          content : PEvas_Object;
          clip : PEvas_Object;
        end;
      content_list : PEina_List;
      animator : PEcore_Animator;
      start : Tdouble;
      len : Tdouble;
      job : PEcore_Job;
      down_x : TEvas_Coord;
      down_y : TEvas_Coord;
      x : TEvas_Coord;
      y : TEvas_Coord;
      ox : TEvas_Coord;
      oy : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
      intmode : TEfl_Ui_Flip_Interaction;
      mode : TElm_Flip_Mode;
      dir : longint;
      dir_hitsize : array[0..3] of Tdouble;
      dir_enabled : array[0..3] of TEina_Bool;
      slices_w : longint;
      slices_h : longint;
      slices : ^PSlice;
      slices2 : ^PSlice;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Flip_Data_state = $1;
  bp_TEfl_Ui_Flip_Data_state = 0;
  bm_TEfl_Ui_Flip_Data_next_state = $2;
  bp_TEfl_Ui_Flip_Data_next_state = 1;
  bm_TEfl_Ui_Flip_Data_mouse_down = $4;
  bp_TEfl_Ui_Flip_Data_mouse_down = 2;
  bm_TEfl_Ui_Flip_Data_finish = $8;
  bp_TEfl_Ui_Flip_Data_finish = 3;
  bm_TEfl_Ui_Flip_Data_started = $10;
  bp_TEfl_Ui_Flip_Data_started = 4;
  bm_TEfl_Ui_Flip_Data_backflip = $20;
  bp_TEfl_Ui_Flip_Data_backflip = 5;
  bm_TEfl_Ui_Flip_Data_pageflip = $40;
  bp_TEfl_Ui_Flip_Data_pageflip = 6;
  bm_TEfl_Ui_Flip_Data_manual = $80;
  bp_TEfl_Ui_Flip_Data_manual = 7;

function state(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
procedure set_state(var a : TEfl_Ui_Flip_Data; __state : TEina_Bool);
function next_state(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
procedure set_next_state(var a : TEfl_Ui_Flip_Data; __next_state : TEina_Bool);
function mouse_down(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
procedure set_mouse_down(var a : TEfl_Ui_Flip_Data; __mouse_down : TEina_Bool);
function finish(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
procedure set_finish(var a : TEfl_Ui_Flip_Data; __finish : TEina_Bool);
function started(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
procedure set_started(var a : TEfl_Ui_Flip_Data; __started : TEina_Bool);
function backflip(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
procedure set_backflip(var a : TEfl_Ui_Flip_Data; __backflip : TEina_Bool);
function pageflip(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
procedure set_pageflip(var a : TEfl_Ui_Flip_Data; __pageflip : TEina_Bool);
function manual(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
procedure set_manual(var a : TEfl_Ui_Flip_Data; __manual : TEina_Bool);
type
  PSlice = ^TSlice;
  TSlice = record
      obj : PEvas_Object;
      u : array[0..3] of Tdouble;
      v : array[0..3] of Tdouble;
      x : array[0..3] of Tdouble;
      y : array[0..3] of Tdouble;
      z : array[0..3] of Tdouble;
    end;

  PVertex2 = ^TVertex2;
  TVertex2 = record
      x : Tdouble;
      y : Tdouble;
    end;

  PVertex3 = ^TVertex3;
  TVertex3 = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;

{*
 * @
  }
{$endif}

implementation

function state(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
begin
  state:=(a.flag0 and bm_TEfl_Ui_Flip_Data_state) shr bp_TEfl_Ui_Flip_Data_state;
end;

procedure set_state(var a : TEfl_Ui_Flip_Data; __state : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__state shl bp_TEfl_Ui_Flip_Data_state) and bm_TEfl_Ui_Flip_Data_state);
end;

function next_state(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
begin
  next_state:=(a.flag0 and bm_TEfl_Ui_Flip_Data_next_state) shr bp_TEfl_Ui_Flip_Data_next_state;
end;

procedure set_next_state(var a : TEfl_Ui_Flip_Data; __next_state : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__next_state shl bp_TEfl_Ui_Flip_Data_next_state) and bm_TEfl_Ui_Flip_Data_next_state);
end;

function mouse_down(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
begin
  mouse_down:=(a.flag0 and bm_TEfl_Ui_Flip_Data_mouse_down) shr bp_TEfl_Ui_Flip_Data_mouse_down;
end;

procedure set_mouse_down(var a : TEfl_Ui_Flip_Data; __mouse_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__mouse_down shl bp_TEfl_Ui_Flip_Data_mouse_down) and bm_TEfl_Ui_Flip_Data_mouse_down);
end;

function finish(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
begin
  finish:=(a.flag0 and bm_TEfl_Ui_Flip_Data_finish) shr bp_TEfl_Ui_Flip_Data_finish;
end;

procedure set_finish(var a : TEfl_Ui_Flip_Data; __finish : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__finish shl bp_TEfl_Ui_Flip_Data_finish) and bm_TEfl_Ui_Flip_Data_finish);
end;

function started(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
begin
  started:=(a.flag0 and bm_TEfl_Ui_Flip_Data_started) shr bp_TEfl_Ui_Flip_Data_started;
end;

procedure set_started(var a : TEfl_Ui_Flip_Data; __started : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__started shl bp_TEfl_Ui_Flip_Data_started) and bm_TEfl_Ui_Flip_Data_started);
end;

function backflip(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
begin
  backflip:=(a.flag0 and bm_TEfl_Ui_Flip_Data_backflip) shr bp_TEfl_Ui_Flip_Data_backflip;
end;

procedure set_backflip(var a : TEfl_Ui_Flip_Data; __backflip : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__backflip shl bp_TEfl_Ui_Flip_Data_backflip) and bm_TEfl_Ui_Flip_Data_backflip);
end;

function pageflip(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
begin
  pageflip:=(a.flag0 and bm_TEfl_Ui_Flip_Data_pageflip) shr bp_TEfl_Ui_Flip_Data_pageflip;
end;

procedure set_pageflip(var a : TEfl_Ui_Flip_Data; __pageflip : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__pageflip shl bp_TEfl_Ui_Flip_Data_pageflip) and bm_TEfl_Ui_Flip_Data_pageflip);
end;

function manual(var a : TEfl_Ui_Flip_Data) : TEina_Bool;
begin
  manual:=(a.flag0 and bm_TEfl_Ui_Flip_Data_manual) shr bp_TEfl_Ui_Flip_Data_manual;
end;

procedure set_manual(var a : TEfl_Ui_Flip_Data; __manual : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__manual shl bp_TEfl_Ui_Flip_Data_manual) and bm_TEfl_Ui_Flip_Data_manual);
end;


end.
