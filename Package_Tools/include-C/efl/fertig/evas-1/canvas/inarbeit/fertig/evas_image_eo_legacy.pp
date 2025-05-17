
unit evas_image_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from evas_image_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    evas_image_eo_legacy.h
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
PEvas_Image  = ^Evas_Image;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_IMAGE_EO_LEGACY_H_}
{$define _EVAS_IMAGE_EO_LEGACY_H_}
{$ifndef _EVAS_IMAGE_EO_CLASS_TYPE}
{$define _EVAS_IMAGE_EO_CLASS_TYPE}
type
  PEvas_Image = ^TEvas_Image;
  TEvas_Image = TEo;
{$endif}
{$ifndef _EVAS_IMAGE_EO_TYPES}
{$define _EVAS_IMAGE_EO_TYPES}
{$endif}
{$endif}

implementation


end.
