
unit lsmsvgattributes;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgattributes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgattributes.h
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
Pchar  = ^char;
PLsmSvgAngleAttribute  = ^LsmSvgAngleAttribute;
PLsmSvgBlendingModeAttribute  = ^LsmSvgBlendingModeAttribute;
PLsmSvgBooleanAttribute  = ^LsmSvgBooleanAttribute;
PLsmSvgChannelSelectorAttribute  = ^LsmSvgChannelSelectorAttribute;
PLsmSvgColorAttribute  = ^LsmSvgColorAttribute;
PLsmSvgColorFilterTypeAttribute  = ^LsmSvgColorFilterTypeAttribute;
PLsmSvgDashArray  = ^LsmSvgDashArray;
PLsmSvgDashArrayAttribute  = ^LsmSvgDashArrayAttribute;
PLsmSvgDoubleAttribute  = ^LsmSvgDoubleAttribute;
PLsmSvgEdgeModeAttribute  = ^LsmSvgEdgeModeAttribute;
PLsmSvgIntegerAttribute  = ^LsmSvgIntegerAttribute;
PLsmSvgLengthAttribute  = ^LsmSvgLengthAttribute;
PLsmSvgLengthListAttribute  = ^LsmSvgLengthListAttribute;
PLsmSvgMarkerUnitsAttribute  = ^LsmSvgMarkerUnitsAttribute;
PLsmSvgMorphologyOperatorAttribute  = ^LsmSvgMorphologyOperatorAttribute;
PLsmSvgOneOrTwoDoubleAttribute  = ^LsmSvgOneOrTwoDoubleAttribute;
PLsmSvgOneOrTwoIntegerAttribute  = ^LsmSvgOneOrTwoIntegerAttribute;
PLsmSvgPaintAttribute  = ^LsmSvgPaintAttribute;
PLsmSvgPatternUnitsAttribute  = ^LsmSvgPatternUnitsAttribute;
PLsmSvgPreserveAspectRatioAttribute  = ^LsmSvgPreserveAspectRatioAttribute;
PLsmSvgSpreadMethodAtttribute  = ^LsmSvgSpreadMethodAtttribute;
PLsmSvgStitchTilesAttribute  = ^LsmSvgStitchTilesAttribute;
PLsmSvgStringAttribute  = ^LsmSvgStringAttribute;
PLsmSvgTransformAttribute  = ^LsmSvgTransformAttribute;
PLsmSvgTurbulenceTypeAttribute  = ^LsmSvgTurbulenceTypeAttribute;
PLsmSvgVectorAttribute  = ^LsmSvgVectorAttribute;
PLsmSvgViewboxAttribute  = ^LsmSvgViewboxAttribute;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem - SVG and Mathml library
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_SVG_ATTRIBUTES_H}
{$define LSM_SVG_ATTRIBUTES_H}
{$include <lsmdom.h>}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgenums.h>}
{$include <lsmsvgtraits.h>}
{$include <lsmsvglength.h>}
{$include <lsmsvgmatrix.h>}
type
  PLsmSvgBlendingModeAttribute = ^TLsmSvgBlendingModeAttribute;
  TLsmSvgBlendingModeAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgBlendingMode;
    end;

  PLsmSvgBooleanAttribute = ^TLsmSvgBooleanAttribute;
  TLsmSvgBooleanAttribute = record
      base : TLsmAttribute;
      value : Tgboolean;
    end;

  PLsmSvgIntegerAttribute = ^TLsmSvgIntegerAttribute;
  TLsmSvgIntegerAttribute = record
      base : TLsmAttribute;
      value : longint;
    end;

  PLsmSvgDoubleAttribute = ^TLsmSvgDoubleAttribute;
  TLsmSvgDoubleAttribute = record
      base : TLsmAttribute;
      value : Tdouble;
    end;

  PLsmSvgOneOrTwoDoubleAttribute = ^TLsmSvgOneOrTwoDoubleAttribute;
  TLsmSvgOneOrTwoDoubleAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgOneOrTwoDouble;
    end;

  PLsmSvgVectorAttribute = ^TLsmSvgVectorAttribute;
  TLsmSvgVectorAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgVector;
    end;

  PLsmSvgDashArrayAttribute = ^TLsmSvgDashArrayAttribute;
  TLsmSvgDashArrayAttribute = record
      base : TLsmAttribute;
      value : PLsmSvgDashArray;
    end;

  PLsmSvgLengthAttribute = ^TLsmSvgLengthAttribute;
  TLsmSvgLengthAttribute = record
      base : TLsmAttribute;
      length : TLsmSvgLength;
    end;

  PLsmSvgLengthListAttribute = ^TLsmSvgLengthListAttribute;
  TLsmSvgLengthListAttribute = record
      base : TLsmAttribute;
      list : TLsmSvgLengthList;
    end;

  PLsmSvgPaintAttribute = ^TLsmSvgPaintAttribute;
  TLsmSvgPaintAttribute = record
      base : TLsmAttribute;
      paint : TLsmSvgPaint;
    end;

  PLsmSvgStringAttribute = ^TLsmSvgStringAttribute;
  TLsmSvgStringAttribute = record
      base : TLsmAttribute;
      value : Pchar;
    end;

  PLsmSvgColorAttribute = ^TLsmSvgColorAttribute;
  TLsmSvgColorAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgColor;
    end;

  PLsmSvgViewboxAttribute = ^TLsmSvgViewboxAttribute;
  TLsmSvgViewboxAttribute = record
      base : TLsmAttribute;
      value : TLsmBox;
    end;

  PLsmSvgTransformAttribute = ^TLsmSvgTransformAttribute;
  TLsmSvgTransformAttribute = record
      base : TLsmAttribute;
      matrix : TLsmSvgMatrix;
    end;

  PLsmSvgPreserveAspectRatioAttribute = ^TLsmSvgPreserveAspectRatioAttribute;
  TLsmSvgPreserveAspectRatioAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgPreserveAspectRatio;
    end;

  PLsmSvgSpreadMethodAtttribute = ^TLsmSvgSpreadMethodAtttribute;
  TLsmSvgSpreadMethodAtttribute = record
      base : TLsmAttribute;
      value : TLsmSvgSpreadMethod;
    end;

  PLsmSvgPatternUnitsAttribute = ^TLsmSvgPatternUnitsAttribute;
  TLsmSvgPatternUnitsAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgPatternUnits;
    end;

  PLsmSvgMarkerUnitsAttribute = ^TLsmSvgMarkerUnitsAttribute;
  TLsmSvgMarkerUnitsAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgMarkerUnits;
    end;

  PLsmSvgColorFilterTypeAttribute = ^TLsmSvgColorFilterTypeAttribute;
  TLsmSvgColorFilterTypeAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgColorFilterType;
    end;

  PLsmSvgAngleAttribute = ^TLsmSvgAngleAttribute;
  TLsmSvgAngleAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgAngle;
    end;

  PLsmSvgMorphologyOperatorAttribute = ^TLsmSvgMorphologyOperatorAttribute;
  TLsmSvgMorphologyOperatorAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgMorphologyOperator;
    end;

  PLsmSvgEdgeModeAttribute = ^TLsmSvgEdgeModeAttribute;
  TLsmSvgEdgeModeAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgEdgeMode;
    end;

  PLsmSvgOneOrTwoIntegerAttribute = ^TLsmSvgOneOrTwoIntegerAttribute;
  TLsmSvgOneOrTwoIntegerAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgOneOrTwoInteger;
    end;

  PLsmSvgStitchTilesAttribute = ^TLsmSvgStitchTilesAttribute;
  TLsmSvgStitchTilesAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgStitchTiles;
    end;

  PLsmSvgTurbulenceTypeAttribute = ^TLsmSvgTurbulenceTypeAttribute;
  TLsmSvgTurbulenceTypeAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgTurbulenceType;
    end;

  PLsmSvgChannelSelectorAttribute = ^TLsmSvgChannelSelectorAttribute;
  TLsmSvgChannelSelectorAttribute = record
      base : TLsmAttribute;
      value : TLsmSvgChannelSelector;
    end;
{$endif}

implementation


end.
