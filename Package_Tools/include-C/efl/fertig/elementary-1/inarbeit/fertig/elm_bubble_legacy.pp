
unit elm_bubble_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_bubble_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_bubble_legacy.h
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
 * Add a new bubble to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * This function adds a text bubble to the given parent evas object.
 *
 * @ingroup Elm_Bubble
  }

function elm_bubble_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_bubble_eo.legacy.h"}

implementation


end.
