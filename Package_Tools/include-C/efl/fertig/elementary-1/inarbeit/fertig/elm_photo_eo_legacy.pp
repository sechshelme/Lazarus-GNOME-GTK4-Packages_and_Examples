
unit elm_photo_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_photo_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_photo_eo_legacy.h
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
PElm_Photo  = ^Elm_Photo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_PHOTO_EO_LEGACY_H_}
{$define _ELM_PHOTO_EO_LEGACY_H_}
{$ifndef _ELM_PHOTO_EO_CLASS_TYPE}
{$define _ELM_PHOTO_EO_CLASS_TYPE}
type
  PElm_Photo = ^TElm_Photo;
  TElm_Photo = TEo;
{$endif}
{$ifndef _ELM_PHOTO_EO_TYPES}
{$define _ELM_PHOTO_EO_TYPES}
{$endif}
{$endif}

implementation


end.
