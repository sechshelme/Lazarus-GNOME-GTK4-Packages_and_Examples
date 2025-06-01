
unit efl_ui_video_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_video_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_video_private.h
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
PEfl_Ui_Video_Data  = ^Efl_Ui_Video_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_VIDEO_PRIV_H}
{$define EFL_UI_VIDEO_PRIV_H}
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
 * @section elm-video-class The Elementary Video Class
 *
 * Elementary, besides having the @ref Video widget, exposes its
 * foundation -- the Elementary Video Class -- in order to create other
 * widgets which are a video with some more logic on top.
  }
{*
 * Base layout smart data extended with video instance data.
  }
type
  PEfl_Ui_Video_Data = ^TEfl_Ui_Video_Data;
  TEfl_Ui_Video_Data = record
      emotion : PEvas_Object;
      timer : PEcore_Timer;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Video_Data_stop = $1;
  bp_TEfl_Ui_Video_Data_stop = 0;
  bm_TEfl_Ui_Video_Data_remember = $2;
  bp_TEfl_Ui_Video_Data_remember = 1;

function stop(var a : TEfl_Ui_Video_Data) : TEina_Bool;
procedure set_stop(var a : TEfl_Ui_Video_Data; __stop : TEina_Bool);
function remember(var a : TEfl_Ui_Video_Data) : TEina_Bool;
procedure set_remember(var a : TEfl_Ui_Video_Data; __remember : TEina_Bool);

implementation

function stop(var a : TEfl_Ui_Video_Data) : TEina_Bool;
begin
  stop:=(a.flag0 and bm_TEfl_Ui_Video_Data_stop) shr bp_TEfl_Ui_Video_Data_stop;
end;

procedure set_stop(var a : TEfl_Ui_Video_Data; __stop : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__stop shl bp_TEfl_Ui_Video_Data_stop) and bm_TEfl_Ui_Video_Data_stop);
end;

function remember(var a : TEfl_Ui_Video_Data) : TEina_Bool;
begin
  remember:=(a.flag0 and bm_TEfl_Ui_Video_Data_remember) shr bp_TEfl_Ui_Video_Data_remember;
end;

procedure set_remember(var a : TEfl_Ui_Video_Data; __remember : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__remember shl bp_TEfl_Ui_Video_Data_remember) and bm_TEfl_Ui_Video_Data_remember);
end;


end.
