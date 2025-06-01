
unit elm_widget_actionslider;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_actionslider.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_actionslider.h
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
PElm_Actionslider_Data  = ^Elm_Actionslider_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_ACTIONSLIDER_H}
{$define ELM_WIDGET_ACTIONSLIDER_H}
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
 * @section elm-actionslider-class The Elementary Actionslider Class
 *
 * Elementary, besides having the @ref Actionslider widget, exposes its
 * foundation -- the Elementary Actionslider Class -- in order to create other
 * widgets which are a actionslider with some more logic on top.
  }
{*
 * Base layout smart data extended with actionslider instance data.
  }
type
  PElm_Actionslider_Data = ^TElm_Actionslider_Data;
  TElm_Actionslider_Data = record
      drag_button_base : PEvas_Object;
      magnet_position : TElm_Actionslider_Pos;
      enabled_position : TElm_Actionslider_Pos;
      button_animator : PEcore_Animator;
      final_position : Tdouble;
      flag0 : word;
    end;


const
  bm_TElm_Actionslider_Data_mouse_down = $1;
  bp_TElm_Actionslider_Data_mouse_down = 0;

function mouse_down(var a : TElm_Actionslider_Data) : TEina_Bool;
procedure set_mouse_down(var a : TElm_Actionslider_Data; __mouse_down : TEina_Bool);

implementation

function mouse_down(var a : TElm_Actionslider_Data) : TEina_Bool;
begin
  mouse_down:=(a.flag0 and bm_TElm_Actionslider_Data_mouse_down) shr bp_TElm_Actionslider_Data_mouse_down;
end;

procedure set_mouse_down(var a : TElm_Actionslider_Data; __mouse_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__mouse_down shl bp_TElm_Actionslider_Data_mouse_down) and bm_TElm_Actionslider_Data_mouse_down);
end;


end.
