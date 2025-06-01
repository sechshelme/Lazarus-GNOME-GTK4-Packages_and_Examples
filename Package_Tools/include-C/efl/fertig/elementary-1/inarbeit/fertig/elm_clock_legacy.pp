
unit elm_clock_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_clock_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_clock_legacy.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new clock widget to the given parent Elementary
 * (container) object
 *
 * @param parent The parent object
 * @return a new clock widget handle or @c NULL, on errors
 *
 * This function inserts a new clock widget on the canvas.
 *
 * @ingroup Elm_Clock
  }

function elm_clock_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_clock_eo.legacy.h"}

implementation


end.
