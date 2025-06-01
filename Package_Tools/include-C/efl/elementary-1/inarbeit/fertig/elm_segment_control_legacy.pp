
unit elm_segment_control_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_segment_control_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_segment_control_legacy.h
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
 * Add a new segment control widget to the given parent Elementary
 * (container) object.
 *
 * @param parent The parent object.
 * @return a new segment control widget handle or @c NULL, on errors.
 *
 * This function inserts a new segment control widget on the canvas.
 *
 * @ingroup Elm_Segment_Control
  }

function elm_segment_control_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_segment_control_item_eo.legacy.h"}
{$include "elm_segment_control_eo.legacy.h"}

implementation


end.
