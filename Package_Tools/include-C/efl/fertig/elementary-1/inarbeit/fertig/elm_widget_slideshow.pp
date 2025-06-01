
unit elm_widget_slideshow;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_slideshow.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_slideshow.h
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
PElm_Slideshow_Data  = ^Elm_Slideshow_Data;
PElm_Slideshow_Item_Class  = ^Elm_Slideshow_Item_Class;
PElm_Slideshow_Item_Data  = ^Elm_Slideshow_Item_Data;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_SLIDESHOW_H}
{$define ELM_WIDGET_SLIDESHOW_H}
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
 * @section elm-slideshow-class The Elementary Slideshow Class
 *
 * Elementary, besides having the @ref Slideshow widget, exposes its
 * foundation -- the Elementary Slideshow Class -- in order to create other
 * widgets which are a slideshow with some more logic on top.
  }
{*
 * Base layout smart data extended with slideshow instance data.
  }
type
(* Const before type ignored *)
  PElm_Slideshow_Item_Data = ^TElm_Slideshow_Item_Data;
  TElm_Slideshow_Item_Data = record
      base : PElm_Widget_Item_Data;
      l : PEina_List;
      l_built : PEina_List;
      itc : PElm_Slideshow_Item_Class;
    end;

{ list of Elm_Slideshow_Item* }
(* Const before type ignored *)
(* Const before type ignored *)
{list of const char * }
  PElm_Slideshow_Data = ^TElm_Slideshow_Data;
  TElm_Slideshow_Data = record
      items : PEina_List;
      items_built : PEina_List;
      current : PElm_Slideshow_Item_Data;
      previous : PElm_Slideshow_Item_Data;
      transitions : PEina_List;
      transition : Pchar;
      count_item_pre_before : longint;
      count_item_pre_after : longint;
      timer : PEcore_Timer;
      timeout : Tdouble;
      flag0 : word;
      layout : record
          current : Pchar;
          list : PEina_List;
        end;
    end;


const
  bm_TElm_Slideshow_Data_loop = $1;
  bp_TElm_Slideshow_Data_loop = 0;

function loop(var a : TElm_Slideshow_Data) : TEina_Bool;
procedure set_loop(var a : TElm_Slideshow_Data; __loop : TEina_Bool);

implementation

function loop(var a : TElm_Slideshow_Data) : TEina_Bool;
begin
  loop:=(a.flag0 and bm_TElm_Slideshow_Data_loop) shr bp_TElm_Slideshow_Data_loop;
end;

procedure set_loop(var a : TElm_Slideshow_Data; __loop : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loop shl bp_TElm_Slideshow_Data_loop) and bm_TElm_Slideshow_Data_loop);
end;


end.
