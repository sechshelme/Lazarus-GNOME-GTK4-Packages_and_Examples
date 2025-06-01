
unit elm_widget_photo;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_photo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_photo.h
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
PElm_Photo_Data  = ^Elm_Photo_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_PHOTO_H}
{$define ELM_WIDGET_PHOTO_H}
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
 * @section elm-photo-class The Elementary Photo Class
 *
 * Elementary, besides having the @ref Photo widget, exposes its
 * foundation -- the Elementary Photo Class -- in order to create
 * other widgets which are a photo with some more logic on top.
  }
{*
 * Base widget smart data extended with photo instance data.
  }
type
(* Const before type ignored *)
(* Const before type ignored *)
{*< set true when drag started  }
  PElm_Photo_Data = ^TElm_Photo_Data;
  TElm_Photo_Data = record
      icon : PEvas_Object;
      size : longint;
      long_press_timer : PEcore_Timer;
      thumb : record
          file : record
              path : Pchar;
              key : Pchar;
            end;
          thumb : record
              path : Pchar;
              key : Pchar;
            end;
        end;
      flag0 : word;
    end;


const
  bm_TElm_Photo_Data_fill_inside = $1;
  bp_TElm_Photo_Data_fill_inside = 0;
  bm_TElm_Photo_Data_drag_started = $2;
  bp_TElm_Photo_Data_drag_started = 1;

function fill_inside(var a : TElm_Photo_Data) : TEina_Bool;
procedure set_fill_inside(var a : TElm_Photo_Data; __fill_inside : TEina_Bool);
function drag_started(var a : TElm_Photo_Data) : TEina_Bool;
procedure set_drag_started(var a : TElm_Photo_Data; __drag_started : TEina_Bool);
{*
 * @
  }

implementation

function fill_inside(var a : TElm_Photo_Data) : TEina_Bool;
begin
  fill_inside:=(a.flag0 and bm_TElm_Photo_Data_fill_inside) shr bp_TElm_Photo_Data_fill_inside;
end;

procedure set_fill_inside(var a : TElm_Photo_Data; __fill_inside : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__fill_inside shl bp_TElm_Photo_Data_fill_inside) and bm_TElm_Photo_Data_fill_inside);
end;

function drag_started(var a : TElm_Photo_Data) : TEina_Bool;
begin
  drag_started:=(a.flag0 and bm_TElm_Photo_Data_drag_started) shr bp_TElm_Photo_Data_drag_started;
end;

procedure set_drag_started(var a : TElm_Photo_Data; __drag_started : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__drag_started shl bp_TElm_Photo_Data_drag_started) and bm_TElm_Photo_Data_drag_started);
end;


end.
