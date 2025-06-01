
unit elm_widget_fileselector_entry;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_fileselector_entry.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_fileselector_entry.h
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
PElm_Fileselector_Entry_Data  = ^Elm_Fileselector_Entry_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_FILESELECTOR_ENTRY_H}
{$define ELM_WIDGET_FILESELECTOR_ENTRY_H}
{$include "elm_widget_layout.h"}
{$include <Eio.h>}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-fileselector-entry-class The Elementary Fileselector Entry Class
 *
 * Elementary, besides having the @ref Fileselector_Entry widget,
 * exposes its foundation -- the Elementary Fileselector Entry Class
 * -- in order to create other widgets which are a fileselector_entry
 * with some more logic on top.
  }
{*
 * Base entry smart data extended with fileselector_entry instance data.
  }
type
  PElm_Fileselector_Entry_Data = ^TElm_Fileselector_Entry_Data;
  TElm_Fileselector_Entry_Data = record
      button : PEvas_Object;
      entry : PEvas_Object;
      path : Pchar;
    end;


implementation


end.
