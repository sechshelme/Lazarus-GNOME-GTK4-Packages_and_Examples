
unit elm_code_widget_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_widget_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_widget_legacy.h
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
PElm_Code  = ^Elm_Code;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @brief Add a new elm_code widget to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @see elm_code_widget_code_set
 *
 * @ingroup Data
  }

function elm_code_widget_add(parent:PEvas_Object; code:PElm_Code):PEvas_Object;cdecl;external;
{$include "elm_code_widget_eo.legacy.h"}

implementation


end.
