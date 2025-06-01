
unit elm_dayselector_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_dayselector_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_dayselector_legacy.h
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
 * Add the dayselector.
 *
 * @param parent Parent object
 * @return New dayselector object or @c NULL, if it cannot be created
 *
 * @ingroup Elm_Dayselector
  }

function elm_dayselector_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_dayselector_eo.legacy.h"}

implementation


end.
