
unit elm_widget_inwin;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_inwin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_inwin.h
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
PElm_Inwin_Smart_Data  = ^Elm_Inwin_Smart_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_INWIN_H}
{$define ELM_WIDGET_INWIN_H}
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
 * @section elm-inwin-class The Elementary Inwin Class
 *
 * Elementary, besides having the @ref Inwin widget, exposes its
 * foundation -- the Elementary Inwin Class -- in order to create other
 * widgets which are a inwin with some more logic on top.
  }
{*
 * Base layout smart data extended with inwin instance data.
  }
type
  PElm_Inwin_Smart_Data = ^TElm_Inwin_Smart_Data;
  TElm_Inwin_Smart_Data = record
      xxxxxxxx : Txxxxx;
    end;

{*
 * @
  }

implementation


end.
