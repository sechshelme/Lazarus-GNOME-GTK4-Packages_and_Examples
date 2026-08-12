unit gegl_enums;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2011 Michael Muré <batolettre@gmail.com>
 *
  }
{ This file holds public enums from GEGL
 *
 * !!!!!!!!!!!! NOTE !!!!!!!!!!!!!!
 *
 * Normally, gegl-enums.c file would be be generated my glib-mkenums,
 * but we use the enum values' registered names for translatable,
 * human readable labels for the GUI, so gegl-enums.c is maintained
 * manually.
 *
 * DON'T FORGET TO UPDATE gegl-enums.c AFTER CHANGING THIS HEADER
 *
 * !!!!!!!!!!!! NOTE !!!!!!!!!!!!!!
  }
{$ifndef __GEGL_ENUMS_H__}
{$define __GEGL_ENUMS_H__}
type
  PGeglDitherMethod = ^TGeglDitherMethod;
  TGeglDitherMethod =  Longint;
  Const
    GEGL_DITHER_NONE = 0;
    GEGL_DITHER_FLOYD_STEINBERG = 1;
    GEGL_DITHER_BAYER = 2;
    GEGL_DITHER_RANDOM = 3;
    GEGL_DITHER_RANDOM_COVARIANT = 4;
    GEGL_DITHER_ARITHMETIC_ADD = 5;
    GEGL_DITHER_ARITHMETIC_ADD_COVARIANT = 6;
    GEGL_DITHER_ARITHMETIC_XOR = 7;
    GEGL_DITHER_ARITHMETIC_XOR_COVARIANT = 8;
    GEGL_DITHER_BLUE_NOISE = 9;
    GEGL_DITHER_BLUE_NOISE_COVARIANT = 10;
;

function gegl_dither_method_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_DITHER_METHOD : longint; { return type might be wrong }

type
  PGeglDistanceMetric = ^TGeglDistanceMetric;
  TGeglDistanceMetric =  Longint;
  Const
    GEGL_DISTANCE_METRIC_EUCLIDEAN = 0;
    GEGL_DISTANCE_METRIC_MANHATTAN = 1;
    GEGL_DISTANCE_METRIC_CHEBYSHEV = 2;
;

function gegl_distance_metric_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_DISTANCE_METRIC : longint; { return type might be wrong }

type
  PGeglOrientation = ^TGeglOrientation;
  TGeglOrientation =  Longint;
  Const
    GEGL_ORIENTATION_HORIZONTAL = 0;
    GEGL_ORIENTATION_VERTICAL = 1;
;

function gegl_orientation_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_ORIENTATION : longint; { return type might be wrong }

{ pass this one to just ensure a format is float  }
{ Y YA RGB RGBA          }
{ Y' Y'A R'G'B' R'G'B'A  }
{ Y~ Y~A R~G~B~ R~G~B~A  }
{ YaA RaGaBaA            }
{ Y~aA R~aG~aB~aA        }
{ Y YaA RGB RaGaBaA            }
{ Y~ Y~aA R~G~B~A R~aG~aB~aA        }
{ add alpha if missing keep as premultiplied if already so   }
type
  TGeglBablVariant =  Longint;
  Const
    GEGL_BABL_VARIANT_FLOAT = 0;
    GEGL_BABL_VARIANT_LINEAR = 1;
    GEGL_BABL_VARIANT_NONLINEAR = 2;
    GEGL_BABL_VARIANT_PERCEPTUAL = 3;
    GEGL_BABL_VARIANT_LINEAR_PREMULTIPLIED = 4;
    GEGL_BABL_VARIANT_PERCEPTUAL_PREMULTIPLIED = 5;
    GEGL_BABL_VARIANT_LINEAR_PREMULTIPLIED_IF_ALPHA = 6;
    GEGL_BABL_VARIANT_PERCEPTUAL_PREMULTIPLIED_IF_ALPHA = 7;
    GEGL_BABL_VARIANT_ALPHA = 8;

type
  PGeglBablVariant = ^TGeglBablVariant;
  TGeglBablVariant = TGeglBablVariant;

function gegl_babl_variant_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_BABL_VARIANT : longint; { return type might be wrong }

type
  PGeglCachePolicy = ^TGeglCachePolicy;
  TGeglCachePolicy =  Longint;
  Const
    GEGL_CACHE_POLICY_AUTO = 0;
    GEGL_CACHE_POLICY_NEVER = 1;
    GEGL_CACHE_POLICY_ALWAYS = 2;
;

function gegl_cache_policy_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_CACHE_POLICY : longint; { return type might be wrong }

{$endif}
{ __GEGL_ENUMS_H__  }

// === Konventiert am: 12-8-26 14:47:18 ===


implementation


{ was #define dname def_expr }
function GEGL_TYPE_DITHER_METHOD : longint; { return type might be wrong }
  begin
    GEGL_TYPE_DITHER_METHOD:=gegl_dither_method_get_type;
  end;

{ was #define dname def_expr }
function GEGL_TYPE_DISTANCE_METRIC : longint; { return type might be wrong }
  begin
    GEGL_TYPE_DISTANCE_METRIC:=gegl_distance_metric_get_type;
  end;

{ was #define dname def_expr }
function GEGL_TYPE_ORIENTATION : longint; { return type might be wrong }
  begin
    GEGL_TYPE_ORIENTATION:=gegl_orientation_get_type;
  end;

{ was #define dname def_expr }
function GEGL_TYPE_BABL_VARIANT : longint; { return type might be wrong }
  begin
    GEGL_TYPE_BABL_VARIANT:=gegl_babl_variant_get_type;
  end;

{ was #define dname def_expr }
function GEGL_TYPE_CACHE_POLICY : longint; { return type might be wrong }
  begin
    GEGL_TYPE_CACHE_POLICY:=gegl_cache_policy_get_type;
  end;


end.
