
unit elm_widget_thumb;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_thumb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_thumb.h
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
PEcore_Event_Handler  = ^Ecore_Event_Handler;
PElm_Thumb_Data  = ^Elm_Thumb_Data;
PEthumb_Client_Async  = ^Ethumb_Client_Async;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_THUMB_H}
{$define ELM_WIDGET_THUMB_H}
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
 * @section elm-thumb-class The Elementary Thumb Class
 *
 * Elementary, besides having the @ref Thumb widget, exposes its
 * foundation -- the Elementary Thumb Class -- in order to create
 * other widgets which are a thumb with some more logic on top.
  }
{*
 * Base widget smart data extended with thumb instance data.
  }
type
{ the object itself }
{ actual thumbnail, to be swallowed
                                 * at the thumb frame  }
{ original object's file/key pair  }
(* Const before type ignored *)
(* Const before type ignored *)
{ object's thumbnail file/key pair  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Thumb_Data = ^TElm_Thumb_Data;
  TElm_Thumb_Data = record
      obj : PEvas_Object;
      view : PEvas_Object;
      file : Pchar;
      key : Pchar;
      thumb : record
          file : Pchar;
          key : Pchar;
          thumb_path : Pchar;
          thumb_key : Pchar;
          request : PEthumb_Client_Async;
          cropx : Tdouble;
          cropy : Tdouble;
          compress : longint;
          quality : longint;
          tw : longint;
          th : longint;
          aspect : TEthumb_Thumb_Aspect;
          size : TEthumb_Thumb_FDO_Size;
          format : TEthumb_Thumb_Format;
          orient : TEthumb_Thumb_Orientation;
          flag0 : word;
        end;
      eeh : PEcore_Event_Handler;
      anim_setting : TElm_Thumb_Animation_Setting;
      flag0 : word;
    end;


const
  bm_TElm_Thumb_Data_retry = $1;
  bp_TElm_Thumb_Data_retry = 0;
  bm_TElm_Thumb_Data_edit = $1;
  bp_TElm_Thumb_Data_edit = 0;
  bm_TElm_Thumb_Data_on_hold = $2;
  bp_TElm_Thumb_Data_on_hold = 1;
  bm_TElm_Thumb_Data_is_video = $4;
  bp_TElm_Thumb_Data_is_video = 2;
  bm_TElm_Thumb_Data_was_video = $8;
  bp_TElm_Thumb_Data_was_video = 3;
  bm_TElm_Thumb_Data_loaded = $10;
  bp_TElm_Thumb_Data_loaded = 4;

function edit(var a : TElm_Thumb_Data) : TEina_Bool;
procedure set_edit(var a : TElm_Thumb_Data; __edit : TEina_Bool);
function on_hold(var a : TElm_Thumb_Data) : TEina_Bool;
procedure set_on_hold(var a : TElm_Thumb_Data; __on_hold : TEina_Bool);
function is_video(var a : TElm_Thumb_Data) : TEina_Bool;
procedure set_is_video(var a : TElm_Thumb_Data; __is_video : TEina_Bool);
function was_video(var a : TElm_Thumb_Data) : TEina_Bool;
procedure set_was_video(var a : TElm_Thumb_Data; __was_video : TEina_Bool);
function loaded(var a : TElm_Thumb_Data) : TEina_Bool;
procedure set_loaded(var a : TElm_Thumb_Data; __loaded : TEina_Bool);

implementation

function edit(var a : TElm_Thumb_Data) : TEina_Bool;
begin
  edit:=(a.flag0 and bm_TElm_Thumb_Data_edit) shr bp_TElm_Thumb_Data_edit;
end;

procedure set_edit(var a : TElm_Thumb_Data; __edit : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__edit shl bp_TElm_Thumb_Data_edit) and bm_TElm_Thumb_Data_edit);
end;

function on_hold(var a : TElm_Thumb_Data) : TEina_Bool;
begin
  on_hold:=(a.flag0 and bm_TElm_Thumb_Data_on_hold) shr bp_TElm_Thumb_Data_on_hold;
end;

procedure set_on_hold(var a : TElm_Thumb_Data; __on_hold : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_hold shl bp_TElm_Thumb_Data_on_hold) and bm_TElm_Thumb_Data_on_hold);
end;

function is_video(var a : TElm_Thumb_Data) : TEina_Bool;
begin
  is_video:=(a.flag0 and bm_TElm_Thumb_Data_is_video) shr bp_TElm_Thumb_Data_is_video;
end;

procedure set_is_video(var a : TElm_Thumb_Data; __is_video : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_video shl bp_TElm_Thumb_Data_is_video) and bm_TElm_Thumb_Data_is_video);
end;

function was_video(var a : TElm_Thumb_Data) : TEina_Bool;
begin
  was_video:=(a.flag0 and bm_TElm_Thumb_Data_was_video) shr bp_TElm_Thumb_Data_was_video;
end;

procedure set_was_video(var a : TElm_Thumb_Data; __was_video : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__was_video shl bp_TElm_Thumb_Data_was_video) and bm_TElm_Thumb_Data_was_video);
end;

function loaded(var a : TElm_Thumb_Data) : TEina_Bool;
begin
  loaded:=(a.flag0 and bm_TElm_Thumb_Data_loaded) shr bp_TElm_Thumb_Data_loaded;
end;

procedure set_loaded(var a : TElm_Thumb_Data; __loaded : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loaded shl bp_TElm_Thumb_Data_loaded) and bm_TElm_Thumb_Data_loaded);
end;


end.
