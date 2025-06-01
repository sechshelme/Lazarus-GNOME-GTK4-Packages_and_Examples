
unit elm_thumb_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_thumb_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_thumb_eo_legacy.h
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
PElm_Thumb  = ^Elm_Thumb;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_THUMB_EO_LEGACY_H_}
{$define _ELM_THUMB_EO_LEGACY_H_}
{$ifndef _ELM_THUMB_EO_CLASS_TYPE}
{$define _ELM_THUMB_EO_CLASS_TYPE}
type
  PElm_Thumb = ^TElm_Thumb;
  TElm_Thumb = TEo;
{$endif}
{$ifndef _ELM_THUMB_EO_TYPES}
{$define _ELM_THUMB_EO_TYPES}
{$endif}
{$endif}

implementation


end.
