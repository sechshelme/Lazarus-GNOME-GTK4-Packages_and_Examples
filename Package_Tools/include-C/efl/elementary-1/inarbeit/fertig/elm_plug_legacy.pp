
unit elm_plug_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_plug_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_plug_legacy.h
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
 * Add a new plug image to the parent.
 *
 * @param parent The parent object
 * @return The new plug image object or NULL if it cannot be created
 *
 * @ingroup Elm_Plug_Group
  }

function elm_plug_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_plug_eo.legacy.h"}

implementation


end.
