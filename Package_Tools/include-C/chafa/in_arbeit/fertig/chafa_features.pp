
unit chafa_features;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_features.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_features.h
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
PChafaFeatures  = ^ChafaFeatures;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{ Copyright (C) 2018-2023 Hans Petter Jansson
 *
 * This file is part of Chafa, a program that shows pictures on text terminals.
 *
 * Chafa is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chafa is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Chafa.  If not, see <http://www.gnu.org/licenses/>.  }
{$ifndef __CHAFA_FEATURES_H__}
{$define __CHAFA_FEATURES_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}
{ Features  }
type
  PChafaFeatures = ^TChafaFeatures;
  TChafaFeatures =  Longint;
  Const
    CHAFA_FEATURE_MMX = 1 shl 0;
    CHAFA_FEATURE_SSE41 = 1 shl 1;
    CHAFA_FEATURE_POPCNT = 1 shl 2;
    CHAFA_FEATURE_AVX2 = 1 shl 3;
;

function chafa_get_builtin_features:TChafaFeatures;cdecl;external;
function chafa_get_supported_features:TChafaFeatures;cdecl;external;
function chafa_describe_features(features:TChafaFeatures):Pgchar;cdecl;external;
function chafa_get_n_threads:Tgint;cdecl;external;
procedure chafa_set_n_threads(n:Tgint);cdecl;external;
function chafa_get_n_actual_threads:Tgint;cdecl;external;
{$endif}
{ __CHAFA_FEATURES_H__  }

implementation


end.
