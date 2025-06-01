
unit elm_label_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_label_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_label_legacy.h
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
 * @brief Add a new label to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Label_Group
  }

function elm_label_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_label_eo.legacy.h"}

implementation


end.
