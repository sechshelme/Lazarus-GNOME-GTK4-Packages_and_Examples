
unit elm_widget_hover;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_hover.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_hover.h
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
PContent_Info  = ^Content_Info;
PElm_Hover_Data  = ^Elm_Hover_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_HOVER_H}
{$define ELM_WIDGET_HOVER_H}
{$include "Elementary.h"}
{$include "elm_widget_layout.h"}
{$include "elm_hover_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-hover-class The Elementary Hover Class
 *
 * Elementary, besides having the @ref Hover widget, exposes its
 * foundation -- the Elementary Hover Class -- in order to create other
 * widgets which are a hover with some more logic on top.
  }
{*
 * Base widget smart data extended with hover instance data.
  }
type
(* Const before type ignored *)
  PContent_Info = ^TContent_Info;
  TContent_Info = record
      swallow : Pchar;
      obj : PEvas_Object;
    end;

{ WARNING: sync size with actual declaration, always  }
(* Const before type ignored *)
  var
    _content_aliases : array[0..9] of TElm_Layout_Part_Alias_Description;cvar;external;
{ 'smart placement' sub object  }
type
  PElm_Hover_Data = ^TElm_Hover_Data;
  TElm_Hover_Data = record
      offset : PEvas_Object;
      size : PEvas_Object;
      parent : PEvas_Object;
      target : PEvas_Object;
      smt_sub : PContent_Info;
      subs : array[0..(((sizeof(_content_aliases))/(sizeof(_content_aliases[0])))-1)-1] of TContent_Info;
      flag0 : word;
    end;


const
  bm_TElm_Hover_Data_on_del = $1;
  bp_TElm_Hover_Data_on_del = 0;

function on_del(var a : TElm_Hover_Data) : TEina_Bool;
procedure set_on_del(var a : TElm_Hover_Data; __on_del : TEina_Bool);
{*
 * @
  }

implementation

function on_del(var a : TElm_Hover_Data) : TEina_Bool;
begin
  on_del:=(a.flag0 and bm_TElm_Hover_Data_on_del) shr bp_TElm_Hover_Data_on_del;
end;

procedure set_on_del(var a : TElm_Hover_Data; __on_del : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_del shl bp_TElm_Hover_Data_on_del) and bm_TElm_Hover_Data_on_del);
end;


end.
