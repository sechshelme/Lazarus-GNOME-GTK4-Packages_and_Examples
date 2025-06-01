
unit elm_widget_icon;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_icon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_icon.h
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
PEina_List  = ^Eina_List;
PElm_Icon_Data  = ^Elm_Icon_Data;
PEthumb_Client_Async  = ^Ethumb_Client_Async;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_ICON_H}
{$define ELM_WIDGET_ICON_H}
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
 * @section elm-icon-class The Elementary Icon Class
 *
 * This class defines a common interface for @b icon objects having
 * an icon as their basic graphics.
  }
type
{ the object itself }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ WARNING: to be deprecated  }
  PElm_Icon_Data = ^TElm_Icon_Data;
  TElm_Icon_Data = record
      obj : PEvas_Object;
      stdicon : Pchar;
      thumb : record
          file : record
              path : Pchar;
              key : Pchar;
            end;
          thumb : record
              path : Pchar;
              key : Pchar;
            end;
          eeh : PEcore_Event_Handler;
          format : TEthumb_Thumb_Format;
          request : PEthumb_Client_Async;
          flag0 : word;
        end;
      freedesktop : record
          requested_size : longint;
          flag0 : word;
        end;
      in_eval : longint;
      edje_signals : PEina_List;
      flag0 : word;
    end;


const
  bm_TElm_Icon_Data_retry = $1;
  bp_TElm_Icon_Data_retry = 0;
  bm_TElm_Icon_Data_use = $1;
  bp_TElm_Icon_Data_use = 0;
  bm_TElm_Icon_Data_is_video = $1;
  bp_TElm_Icon_Data_is_video = 0;

function is_video(var a : TElm_Icon_Data) : TEina_Bool;
procedure set_is_video(var a : TElm_Icon_Data; __is_video : TEina_Bool);
{*
 * @
  }

implementation

function is_video(var a : TElm_Icon_Data) : TEina_Bool;
begin
  is_video:=(a.flag0 and bm_TElm_Icon_Data_is_video) shr bp_TElm_Icon_Data_is_video;
end;

procedure set_is_video(var a : TElm_Icon_Data; __is_video : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_video shl bp_TElm_Icon_Data_is_video) and bm_TElm_Icon_Data_is_video);
end;


end.
