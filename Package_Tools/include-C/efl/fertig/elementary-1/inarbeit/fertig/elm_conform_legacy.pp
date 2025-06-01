
unit elm_conform_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_conform_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_conform_legacy.h
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
 * Add a new conformant widget to the given parent Elementary
 * (container) object.
 *
 * @param parent The parent object.
 * @return A new conformant widget handle or @c NULL, on errors.
 *
 * This function inserts a new conformant widget on the canvas.
 *
 * @ingroup Elm_Conformant
  }

function elm_conformant_add(parent:PEvas_Object):PEvas_Object;cdecl;external;

implementation


end.
