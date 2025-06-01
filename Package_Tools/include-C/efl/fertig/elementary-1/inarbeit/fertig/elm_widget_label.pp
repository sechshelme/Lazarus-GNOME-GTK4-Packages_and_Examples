
unit elm_widget_label;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_label.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_label.h
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
PElm_Label_Data  = ^Elm_Label_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_LABEL_H}
{$define ELM_WIDGET_LABEL_H}
{$include "Elementary.h"}
{$include <Eio.h>}
{$include "elm_label_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * Base layout smart data extended with label instance data.
  }
type
(* Const before type ignored *)
{<< lastly calculated resize object width.This is used to force the calculation on width changes.  }
{<< wrap width by pixel for the line wrap support * }
{*< This will be marked as EINA_TRUE after elm_label_slide_go() is called.  }
  PElm_Label_Data = ^TElm_Label_Data;
  TElm_Label_Data = record
      format : Pchar;
      slide_duration : Tdouble;
      slide_speed : Tdouble;
      lastw : TEvas_Coord;
      wrap_w : TEvas_Coord;
      linewrap : TElm_Wrap_Type;
      slide_mode : TElm_Label_Slide_Mode;
      flag0 : word;
    end;


const
  bm_TElm_Label_Data_ellipsis = $1;
  bp_TElm_Label_Data_ellipsis = 0;
  bm_TElm_Label_Data_slide_ellipsis = $2;
  bp_TElm_Label_Data_slide_ellipsis = 1;
  bm_TElm_Label_Data_use_slide_speed = $4;
  bp_TElm_Label_Data_use_slide_speed = 2;
  bm_TElm_Label_Data_slide_state = $8;
  bp_TElm_Label_Data_slide_state = 3;

function ellipsis(var a : TElm_Label_Data) : TEina_Bool;
procedure set_ellipsis(var a : TElm_Label_Data; __ellipsis : TEina_Bool);
function slide_ellipsis(var a : TElm_Label_Data) : TEina_Bool;
procedure set_slide_ellipsis(var a : TElm_Label_Data; __slide_ellipsis : TEina_Bool);
function use_slide_speed(var a : TElm_Label_Data) : TEina_Bool;
procedure set_use_slide_speed(var a : TElm_Label_Data; __use_slide_speed : TEina_Bool);
function slide_state(var a : TElm_Label_Data) : TEina_Bool;
procedure set_slide_state(var a : TElm_Label_Data; __slide_state : TEina_Bool);

implementation

function ellipsis(var a : TElm_Label_Data) : TEina_Bool;
begin
  ellipsis:=(a.flag0 and bm_TElm_Label_Data_ellipsis) shr bp_TElm_Label_Data_ellipsis;
end;

procedure set_ellipsis(var a : TElm_Label_Data; __ellipsis : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__ellipsis shl bp_TElm_Label_Data_ellipsis) and bm_TElm_Label_Data_ellipsis);
end;

function slide_ellipsis(var a : TElm_Label_Data) : TEina_Bool;
begin
  slide_ellipsis:=(a.flag0 and bm_TElm_Label_Data_slide_ellipsis) shr bp_TElm_Label_Data_slide_ellipsis;
end;

procedure set_slide_ellipsis(var a : TElm_Label_Data; __slide_ellipsis : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__slide_ellipsis shl bp_TElm_Label_Data_slide_ellipsis) and bm_TElm_Label_Data_slide_ellipsis);
end;

function use_slide_speed(var a : TElm_Label_Data) : TEina_Bool;
begin
  use_slide_speed:=(a.flag0 and bm_TElm_Label_Data_use_slide_speed) shr bp_TElm_Label_Data_use_slide_speed;
end;

procedure set_use_slide_speed(var a : TElm_Label_Data; __use_slide_speed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__use_slide_speed shl bp_TElm_Label_Data_use_slide_speed) and bm_TElm_Label_Data_use_slide_speed);
end;

function slide_state(var a : TElm_Label_Data) : TEina_Bool;
begin
  slide_state:=(a.flag0 and bm_TElm_Label_Data_slide_state) shr bp_TElm_Label_Data_slide_state;
end;

procedure set_slide_state(var a : TElm_Label_Data; __slide_state : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__slide_state shl bp_TElm_Label_Data_slide_state) and bm_TElm_Label_Data_slide_state);
end;


end.
