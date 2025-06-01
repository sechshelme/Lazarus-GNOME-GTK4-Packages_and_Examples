
unit elm_panel_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_panel_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_panel_legacy.h
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
 * @brief Adds a panel object
 *
 * @param parent The parent object
 *
 * @return The panel object, or NULL on failure
 *
 * @ingroup Elm_Panel_Group
  }

function elm_panel_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_panel_eo.legacy.h"}

implementation


end.
