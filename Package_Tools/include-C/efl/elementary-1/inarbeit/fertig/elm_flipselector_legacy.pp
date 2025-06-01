
unit elm_flipselector_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_flipselector_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_flipselector_legacy.h
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
 * Add a new flip selector widget to the given parent Elementary
 * (container) widget
 *
 * @param parent The parent object
 * @return a new flip selector widget handle or @c NULL, on errors
 *
 * This function inserts a new flip selector widget on the canvas.
 *
 * @ingroup Elm_Flipselector
  }

function elm_flipselector_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_flipselector_item_eo.legacy.h"}
{$include "elm_flipselector_eo.legacy.h"}

implementation


end.
