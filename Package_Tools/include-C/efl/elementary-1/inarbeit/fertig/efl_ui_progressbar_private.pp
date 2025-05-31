
unit efl_ui_progressbar_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_progressbar_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_progressbar_private.h
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
PEfl_Ui_Progress_Status  = ^Efl_Ui_Progress_Status;
PEfl_Ui_Progressbar_Data  = ^Efl_Ui_Progressbar_Data;
PEina_List  = ^Eina_List;
PEina_Strbuf  = ^Eina_Strbuf;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_PROGRESSBAR_PRIVATE_H}
{$define EFL_UI_PROGRESSBAR_PRIVATE_H}
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
 * @section elm-progressbar-class The Elementary Progressbar Class
 *
 * Elementary, besides having the @ref Progressbar widget, exposes its
 * foundation -- the Elementary Progressbar Class -- in order to create other
 * widgets which are a progressbar with some more logic on top.
  }
{*
 * Base layout smart data extended with progressbar instance data.
  }
type
{*< The rect actual progressbar area, gets the progressbar size and gets the events  }
{*< Width or height of progressbar  }
{*< Value of progressbar  }
{*< The list of _Elm_Progress_Status. To save the progress value(in percentage) each part of given progress bar  }
{*< Orientation of the progressbar   }
{*< Whether object is put in the pulsing mode  }
{*< To start the pulsing animation, otherwise to stop it  }
{*< Show a progress text label besides the progressbar  }
  PEfl_Ui_Progressbar_Data = ^TEfl_Ui_Progressbar_Data;
  TEfl_Ui_Progressbar_Data = record
      spacer : PEvas_Object;
      size : TEvas_Coord;
      val : Tdouble;
      val_min : Tdouble;
      val_max : Tdouble;
      progress_status : PEina_List;
      format_strbuf : PEina_Strbuf;
      dir : TEfl_Ui_Layout_Orientation;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Progressbar_Data_pulse = $1;
  bp_TEfl_Ui_Progressbar_Data_pulse = 0;
  bm_TEfl_Ui_Progressbar_Data_pulse_state = $2;
  bp_TEfl_Ui_Progressbar_Data_pulse_state = 1;
  bm_TEfl_Ui_Progressbar_Data_is_legacy_format_string = $4;
  bp_TEfl_Ui_Progressbar_Data_is_legacy_format_string = 2;
  bm_TEfl_Ui_Progressbar_Data_is_legacy_format_cb = $8;
  bp_TEfl_Ui_Progressbar_Data_is_legacy_format_cb = 3;
  bm_TEfl_Ui_Progressbar_Data_has_status_text_part = $10;
  bp_TEfl_Ui_Progressbar_Data_has_status_text_part = 4;
  bm_TEfl_Ui_Progressbar_Data_has_cur_progressbar_part = $20;
  bp_TEfl_Ui_Progressbar_Data_has_cur_progressbar_part = 5;
  bm_TEfl_Ui_Progressbar_Data_show_progress_label = $40;
  bp_TEfl_Ui_Progressbar_Data_show_progress_label = 6;

function pulse(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
procedure set_pulse(var a : TEfl_Ui_Progressbar_Data; __pulse : TEina_Bool);
function pulse_state(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
procedure set_pulse_state(var a : TEfl_Ui_Progressbar_Data; __pulse_state : TEina_Bool);
function is_legacy_format_string(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
procedure set_is_legacy_format_string(var a : TEfl_Ui_Progressbar_Data; __is_legacy_format_string : TEina_Bool);
function is_legacy_format_cb(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
procedure set_is_legacy_format_cb(var a : TEfl_Ui_Progressbar_Data; __is_legacy_format_cb : TEina_Bool);
function has_status_text_part(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
procedure set_has_status_text_part(var a : TEfl_Ui_Progressbar_Data; __has_status_text_part : TEina_Bool);
function has_cur_progressbar_part(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
procedure set_has_cur_progressbar_part(var a : TEfl_Ui_Progressbar_Data; __has_cur_progressbar_part : TEina_Bool);
function show_progress_label(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
procedure set_show_progress_label(var a : TEfl_Ui_Progressbar_Data; __show_progress_label : TEina_Bool);
(* Const before type ignored *)
type
  PEfl_Ui_Progress_Status = ^TEfl_Ui_Progress_Status;
  TEfl_Ui_Progress_Status = record
      part_name : Pchar;
      val : Tdouble;
      val_min : Tdouble;
      val_max : Tdouble;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Progress_Status_part_exists = $1;
  bp_TEfl_Ui_Progress_Status_part_exists = 0;

function part_exists(var a : TEfl_Ui_Progress_Status) : TEina_Bool;
procedure set_part_exists(var a : TEfl_Ui_Progress_Status; __part_exists : TEina_Bool);
{*
 * @
  }

implementation

function pulse(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
begin
  pulse:=(a.flag0 and bm_TEfl_Ui_Progressbar_Data_pulse) shr bp_TEfl_Ui_Progressbar_Data_pulse;
end;

procedure set_pulse(var a : TEfl_Ui_Progressbar_Data; __pulse : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__pulse shl bp_TEfl_Ui_Progressbar_Data_pulse) and bm_TEfl_Ui_Progressbar_Data_pulse);
end;

function pulse_state(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
begin
  pulse_state:=(a.flag0 and bm_TEfl_Ui_Progressbar_Data_pulse_state) shr bp_TEfl_Ui_Progressbar_Data_pulse_state;
end;

procedure set_pulse_state(var a : TEfl_Ui_Progressbar_Data; __pulse_state : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__pulse_state shl bp_TEfl_Ui_Progressbar_Data_pulse_state) and bm_TEfl_Ui_Progressbar_Data_pulse_state);
end;

function is_legacy_format_string(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
begin
  is_legacy_format_string:=(a.flag0 and bm_TEfl_Ui_Progressbar_Data_is_legacy_format_string) shr bp_TEfl_Ui_Progressbar_Data_is_legacy_format_string;
end;

procedure set_is_legacy_format_string(var a : TEfl_Ui_Progressbar_Data; __is_legacy_format_string : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_legacy_format_string shl bp_TEfl_Ui_Progressbar_Data_is_legacy_format_string) and bm_TEfl_Ui_Progressbar_Data_is_legacy_format_string);
end;

function is_legacy_format_cb(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
begin
  is_legacy_format_cb:=(a.flag0 and bm_TEfl_Ui_Progressbar_Data_is_legacy_format_cb) shr bp_TEfl_Ui_Progressbar_Data_is_legacy_format_cb;
end;

procedure set_is_legacy_format_cb(var a : TEfl_Ui_Progressbar_Data; __is_legacy_format_cb : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_legacy_format_cb shl bp_TEfl_Ui_Progressbar_Data_is_legacy_format_cb) and bm_TEfl_Ui_Progressbar_Data_is_legacy_format_cb);
end;

function has_status_text_part(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
begin
  has_status_text_part:=(a.flag0 and bm_TEfl_Ui_Progressbar_Data_has_status_text_part) shr bp_TEfl_Ui_Progressbar_Data_has_status_text_part;
end;

procedure set_has_status_text_part(var a : TEfl_Ui_Progressbar_Data; __has_status_text_part : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__has_status_text_part shl bp_TEfl_Ui_Progressbar_Data_has_status_text_part) and bm_TEfl_Ui_Progressbar_Data_has_status_text_part);
end;

function has_cur_progressbar_part(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
begin
  has_cur_progressbar_part:=(a.flag0 and bm_TEfl_Ui_Progressbar_Data_has_cur_progressbar_part) shr bp_TEfl_Ui_Progressbar_Data_has_cur_progressbar_part;
end;

procedure set_has_cur_progressbar_part(var a : TEfl_Ui_Progressbar_Data; __has_cur_progressbar_part : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__has_cur_progressbar_part shl bp_TEfl_Ui_Progressbar_Data_has_cur_progressbar_part) and bm_TEfl_Ui_Progressbar_Data_has_cur_progressbar_part);
end;

function show_progress_label(var a : TEfl_Ui_Progressbar_Data) : TEina_Bool;
begin
  show_progress_label:=(a.flag0 and bm_TEfl_Ui_Progressbar_Data_show_progress_label) shr bp_TEfl_Ui_Progressbar_Data_show_progress_label;
end;

procedure set_show_progress_label(var a : TEfl_Ui_Progressbar_Data; __show_progress_label : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__show_progress_label shl bp_TEfl_Ui_Progressbar_Data_show_progress_label) and bm_TEfl_Ui_Progressbar_Data_show_progress_label);
end;

function part_exists(var a : TEfl_Ui_Progress_Status) : TEina_Bool;
begin
  part_exists:=(a.flag0 and bm_TEfl_Ui_Progress_Status_part_exists) shr bp_TEfl_Ui_Progress_Status_part_exists;
end;

procedure set_part_exists(var a : TEfl_Ui_Progress_Status; __part_exists : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__part_exists shl bp_TEfl_Ui_Progress_Status_part_exists) and bm_TEfl_Ui_Progress_Status_part_exists);
end;


end.
