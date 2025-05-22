
unit edje_edit_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from edje_edit_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    edje_edit_eo_legacy.h
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
PEdje_Edit  = ^Edje_Edit;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EDJE_EDIT_EO_LEGACY_H_}
{$define _EDJE_EDIT_EO_LEGACY_H_}
{$ifndef _EDJE_EDIT_EO_CLASS_TYPE}
{$define _EDJE_EDIT_EO_CLASS_TYPE}
type
  PEdje_Edit = ^TEdje_Edit;
  TEdje_Edit = TEo;
{$endif}
{$ifndef _EDJE_EDIT_EO_TYPES}
{$define _EDJE_EDIT_EO_TYPES}
{$endif}
{$endif}

implementation


end.
