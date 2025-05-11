
unit efl_canvas_vg_gradient_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_gradient_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_gradient_eo_legacy.h
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
PEvas_Vg_Gradient  = ^Evas_Vg_Gradient;
PEvas_Vg_Gradient_Linear  = ^Evas_Vg_Gradient_Linear;
PEvas_Vg_Gradient_Radial  = ^Evas_Vg_Gradient_Radial;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_VG_GRADIENT_EO_LEGACY_H_}
{$define _EVAS_VG_GRADIENT_EO_LEGACY_H_}
type
  PEvas_Vg_Gradient = ^TEvas_Vg_Gradient;
  TEvas_Vg_Gradient = TEo;
{$endif}
{$ifndef _EVAS_VG_GRADIENT_LINEAR_EO_LEGACY_H_}
{$define _EVAS_VG_GRADIENT_LINEAR_EO_LEGACY_H_}
type
  PEvas_Vg_Gradient_Linear = ^TEvas_Vg_Gradient_Linear;
  TEvas_Vg_Gradient_Linear = TEo;
{$endif}
{$ifndef _EVAS_VG_GRADIENT_RADIAL_EO_LEGACY_H_}
{$define _EVAS_VG_GRADIENT_RADIAL_EO_LEGACY_H_}
type
  PEvas_Vg_Gradient_Radial = ^TEvas_Vg_Gradient_Radial;
  TEvas_Vg_Gradient_Radial = TEo;
{$endif}

implementation


end.
