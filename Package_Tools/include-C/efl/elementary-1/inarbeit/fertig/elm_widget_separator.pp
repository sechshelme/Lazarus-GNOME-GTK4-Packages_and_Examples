
unit elm_widget_separator;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_separator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_separator.h
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
PElm_Separator_Data  = ^Elm_Separator_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_SEPARATOR_H}
{$define ELM_WIDGET_SEPARATOR_H}
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
 * @section elm-separator-class The Elementary Separator Class
 *
 * Elementary, besides having the @ref Separator widget, exposes its
 * foundation -- the Elementary Separator Class -- in order to create other
 * widgets which are a separator with some more logic on top.
  }
{*
 * Base layout smart data extended with separator instance data.
  }
type
  PElm_Separator_Data = ^TElm_Separator_Data;
  TElm_Separator_Data = record
      flag0 : word;
    end;


const
  bm_TElm_Separator_Data_horizontal = $1;
  bp_TElm_Separator_Data_horizontal = 0;

function horizontal(var a : TElm_Separator_Data) : TEina_Bool;
procedure set_horizontal(var a : TElm_Separator_Data; __horizontal : TEina_Bool);
{*
 * @
  }

implementation

function horizontal(var a : TElm_Separator_Data) : TEina_Bool;
begin
  horizontal:=(a.flag0 and bm_TElm_Separator_Data_horizontal) shr bp_TElm_Separator_Data_horizontal;
end;

procedure set_horizontal(var a : TElm_Separator_Data; __horizontal : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__horizontal shl bp_TElm_Separator_Data_horizontal) and bm_TElm_Separator_Data_horizontal);
end;


end.
