
unit elm_widget_spinner;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_spinner.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_spinner.h
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
PEcore_Timer  = ^Ecore_Timer;
PEina_List  = ^Eina_List;
PElm_Spinner_Data  = ^Elm_Spinner_Data;
PElm_Spinner_Format_Type  = ^Elm_Spinner_Format_Type;
PElm_Spinner_Special_Value  = ^Elm_Spinner_Special_Value;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_SPINNER_H}
{$define ELM_WIDGET_SPINNER_H}
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
 * @section elm-spinner-class The Elementary Spinner Class
 *
 * Elementary, besides having the @ref Spinner widget, exposes its
 * foundation -- the Elementary Spinner Class -- in order to create other
 * widgets which are a spinner with some more logic on top.
  }
{*
 * Base layout smart data extended with spinner instance data.
  }
type
  PElm_Spinner_Format_Type = ^TElm_Spinner_Format_Type;
  TElm_Spinner_Format_Type =  Longint;
  Const
    SPINNER_FORMAT_FLOAT = 0;
    SPINNER_FORMAT_INT = 1;
    SPINNER_FORMAT_INVALID = 2;
;
type
(* Const before type ignored *)
{*< step for the value change. 1 by default.  }
{*< a timer for a delay,changed smart callback  }
{*< a timer for a repeated spinner value change on mouse down  }
{*< a timer to detect long press. After longpress timeout,
                                          start continuous change of values until mouse up  }
  PElm_Spinner_Data = ^TElm_Spinner_Data;
  TElm_Spinner_Data = record
      ent : PEvas_Object;
      inc_button : PEvas_Object;
      dec_button : PEvas_Object;
      text_button : PEvas_Object;
      _label : Pchar;
      val : Tdouble;
      val_min : Tdouble;
      val_max : Tdouble;
      val_base : Tdouble;
      step : Tdouble;
      drag_prev_pos : Tdouble;
      drag_val_step : Tdouble;
      spin_speed : Tdouble;
      interval : Tdouble;
      first_interval : Tdouble;
      round : longint;
      decimal_points : longint;
      delay_change_timer : PEcore_Timer;
      spin_timer : PEcore_Timer;
      longpress_timer : PEcore_Timer;
      special_values : PEina_List;
      format_type : TElm_Spinner_Format_Type;
      flag0 : word;
    end;


const
  bm_TElm_Spinner_Data_entry_visible = $1;
  bp_TElm_Spinner_Data_entry_visible = 0;
  bm_TElm_Spinner_Data_entry_reactivate = $2;
  bp_TElm_Spinner_Data_entry_reactivate = 1;
  bm_TElm_Spinner_Data_dragging = $4;
  bp_TElm_Spinner_Data_dragging = 2;
  bm_TElm_Spinner_Data_editable = $8;
  bp_TElm_Spinner_Data_editable = 3;
  bm_TElm_Spinner_Data_wrap = $10;
  bp_TElm_Spinner_Data_wrap = 4;
  bm_TElm_Spinner_Data_val_updated = $20;
  bp_TElm_Spinner_Data_val_updated = 5;
  bm_TElm_Spinner_Data_button_layout = $40;
  bp_TElm_Spinner_Data_button_layout = 6;
  bm_TElm_Spinner_Data_inc_btn_activated = $80;
  bp_TElm_Spinner_Data_inc_btn_activated = 7;

function entry_visible(var a : TElm_Spinner_Data) : TEina_Bool;
procedure set_entry_visible(var a : TElm_Spinner_Data; __entry_visible : TEina_Bool);
function entry_reactivate(var a : TElm_Spinner_Data) : TEina_Bool;
procedure set_entry_reactivate(var a : TElm_Spinner_Data; __entry_reactivate : TEina_Bool);
function dragging(var a : TElm_Spinner_Data) : TEina_Bool;
procedure set_dragging(var a : TElm_Spinner_Data; __dragging : TEina_Bool);
function editable(var a : TElm_Spinner_Data) : TEina_Bool;
procedure set_editable(var a : TElm_Spinner_Data; __editable : TEina_Bool);
function wrap(var a : TElm_Spinner_Data) : TEina_Bool;
procedure set_wrap(var a : TElm_Spinner_Data; __wrap : TEina_Bool);
function val_updated(var a : TElm_Spinner_Data) : TEina_Bool;
procedure set_val_updated(var a : TElm_Spinner_Data; __val_updated : TEina_Bool);
function button_layout(var a : TElm_Spinner_Data) : TEina_Bool;
procedure set_button_layout(var a : TElm_Spinner_Data; __button_layout : TEina_Bool);
function inc_btn_activated(var a : TElm_Spinner_Data) : TEina_Bool;
procedure set_inc_btn_activated(var a : TElm_Spinner_Data; __inc_btn_activated : TEina_Bool);
type
(* Const before type ignored *)
  PElm_Spinner_Special_Value = ^TElm_Spinner_Special_Value;
  TElm_Spinner_Special_Value = record
      value : Tdouble;
      _label : Pchar;
    end;

{*
 * @
  }

implementation

function entry_visible(var a : TElm_Spinner_Data) : TEina_Bool;
begin
  entry_visible:=(a.flag0 and bm_TElm_Spinner_Data_entry_visible) shr bp_TElm_Spinner_Data_entry_visible;
end;

procedure set_entry_visible(var a : TElm_Spinner_Data; __entry_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__entry_visible shl bp_TElm_Spinner_Data_entry_visible) and bm_TElm_Spinner_Data_entry_visible);
end;

function entry_reactivate(var a : TElm_Spinner_Data) : TEina_Bool;
begin
  entry_reactivate:=(a.flag0 and bm_TElm_Spinner_Data_entry_reactivate) shr bp_TElm_Spinner_Data_entry_reactivate;
end;

procedure set_entry_reactivate(var a : TElm_Spinner_Data; __entry_reactivate : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__entry_reactivate shl bp_TElm_Spinner_Data_entry_reactivate) and bm_TElm_Spinner_Data_entry_reactivate);
end;

function dragging(var a : TElm_Spinner_Data) : TEina_Bool;
begin
  dragging:=(a.flag0 and bm_TElm_Spinner_Data_dragging) shr bp_TElm_Spinner_Data_dragging;
end;

procedure set_dragging(var a : TElm_Spinner_Data; __dragging : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dragging shl bp_TElm_Spinner_Data_dragging) and bm_TElm_Spinner_Data_dragging);
end;

function editable(var a : TElm_Spinner_Data) : TEina_Bool;
begin
  editable:=(a.flag0 and bm_TElm_Spinner_Data_editable) shr bp_TElm_Spinner_Data_editable;
end;

procedure set_editable(var a : TElm_Spinner_Data; __editable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__editable shl bp_TElm_Spinner_Data_editable) and bm_TElm_Spinner_Data_editable);
end;

function wrap(var a : TElm_Spinner_Data) : TEina_Bool;
begin
  wrap:=(a.flag0 and bm_TElm_Spinner_Data_wrap) shr bp_TElm_Spinner_Data_wrap;
end;

procedure set_wrap(var a : TElm_Spinner_Data; __wrap : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__wrap shl bp_TElm_Spinner_Data_wrap) and bm_TElm_Spinner_Data_wrap);
end;

function val_updated(var a : TElm_Spinner_Data) : TEina_Bool;
begin
  val_updated:=(a.flag0 and bm_TElm_Spinner_Data_val_updated) shr bp_TElm_Spinner_Data_val_updated;
end;

procedure set_val_updated(var a : TElm_Spinner_Data; __val_updated : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__val_updated shl bp_TElm_Spinner_Data_val_updated) and bm_TElm_Spinner_Data_val_updated);
end;

function button_layout(var a : TElm_Spinner_Data) : TEina_Bool;
begin
  button_layout:=(a.flag0 and bm_TElm_Spinner_Data_button_layout) shr bp_TElm_Spinner_Data_button_layout;
end;

procedure set_button_layout(var a : TElm_Spinner_Data; __button_layout : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__button_layout shl bp_TElm_Spinner_Data_button_layout) and bm_TElm_Spinner_Data_button_layout);
end;

function inc_btn_activated(var a : TElm_Spinner_Data) : TEina_Bool;
begin
  inc_btn_activated:=(a.flag0 and bm_TElm_Spinner_Data_inc_btn_activated) shr bp_TElm_Spinner_Data_inc_btn_activated;
end;

procedure set_inc_btn_activated(var a : TElm_Spinner_Data; __inc_btn_activated : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__inc_btn_activated shl bp_TElm_Spinner_Data_inc_btn_activated) and bm_TElm_Spinner_Data_inc_btn_activated);
end;


end.
