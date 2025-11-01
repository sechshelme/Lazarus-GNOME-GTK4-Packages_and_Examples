
unit cd_color;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_color.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_color.h
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
PCdColorBlackbodyFlags  = ^CdColorBlackbodyFlags;
PCdColorLab  = ^CdColorLab;
PCdColorRGB  = ^CdColorRGB;
PCdColorRGB8  = ^CdColorRGB8;
PCdColorSwatch  = ^CdColorSwatch;
PCdColorUVW  = ^CdColorUVW;
PCdColorXYZ  = ^CdColorXYZ;
PCdColorYxy  = ^CdColorYxy;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010-2014 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_COLOR_H__}
{$define __CD_COLOR_H__}
{$include <glib-object.h>}
type
  PCdColorRGB8 = ^TCdColorRGB8;
  TCdColorRGB8 = record
      R : Tguint8;
      G : Tguint8;
      B : Tguint8;
    end;

  PCdColorLab = ^TCdColorLab;
  TCdColorLab = record
      L : Tgdouble;
      a : Tgdouble;
      b : Tgdouble;
    end;

  PCdColorYxy = ^TCdColorYxy;
  TCdColorYxy = record
      Y : Tgdouble;
      x : Tgdouble;
      y : Tgdouble;
    end;

  PCdColorXYZ = ^TCdColorXYZ;
  TCdColorXYZ = record
      X : Tgdouble;
      Y : Tgdouble;
      Z : Tgdouble;
    end;

  PCdColorRGB = ^TCdColorRGB;
  TCdColorRGB = record
      R : Tgdouble;
      G : Tgdouble;
      B : Tgdouble;
    end;

  PCdColorUVW = ^TCdColorUVW;
  TCdColorUVW = record
      U : Tgdouble;
      V : Tgdouble;
      W : Tgdouble;
    end;
{*
 * CdColorBlackbodyFlags:
 * @CD_COLOR_BLACKBODY_FLAG_NONE:		No flags set.
 * @CD_COLOR_BLACKBODY_FLAG_USE_PLANCKIAN:	Use Planckian below 5000K
 *
 * Flags used when returning an RGB color from a temperature.
 *
 * Since: 1.3.5
 * }
{ Since: 1.3.5  }
{ Since: 1.3.5  }
{< private > }

  PCdColorBlackbodyFlags = ^TCdColorBlackbodyFlags;
  TCdColorBlackbodyFlags =  Longint;
  Const
    CD_COLOR_BLACKBODY_FLAG_NONE = 0;
    CD_COLOR_BLACKBODY_FLAG_USE_PLANCKIAN = 1;
    CD_COLOR_BLACKBODY_FLAG_LAST = 2;
;
type

{ was #define dname def_expr }
function CD_TYPE_COLOR_RGB : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_COLOR_XYZ : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_COLOR_LAB : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_COLOR_YXY : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_COLOR_UVW : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_COLOR_SWATCH : longint; { return type might be wrong }

{ types  }
function cd_color_xyz_get_type:TGType;cdecl;external;
function cd_color_lab_get_type:TGType;cdecl;external;
function cd_color_rgb_get_type:TGType;cdecl;external;
function cd_color_yxy_get_type:TGType;cdecl;external;
function cd_color_uvw_get_type:TGType;cdecl;external;
function cd_color_swatch_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_color_swatch_get_name(swatch:PCdColorSwatch):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_color_swatch_get_value(swatch:PCdColorSwatch):PCdColorLab;cdecl;external;
function cd_color_xyz_new:PCdColorXYZ;cdecl;external;
function cd_color_lab_new:PCdColorLab;cdecl;external;
function cd_color_rgb_new:PCdColorRGB;cdecl;external;
function cd_color_yxy_new:PCdColorYxy;cdecl;external;
function cd_color_uvw_new:PCdColorUVW;cdecl;external;
function cd_color_swatch_new:PCdColorSwatch;cdecl;external;
procedure cd_color_xyz_free(src:PCdColorXYZ);cdecl;external;
procedure cd_color_rgb_free(src:PCdColorRGB);cdecl;external;
procedure cd_color_lab_free(src:PCdColorLab);cdecl;external;
procedure cd_color_yxy_free(src:PCdColorYxy);cdecl;external;
procedure cd_color_uvw_free(src:PCdColorUVW);cdecl;external;
procedure cd_color_swatch_free(src:PCdColorSwatch);cdecl;external;
(* Const before type ignored *)
function cd_color_xyz_dup(src:PCdColorXYZ):PCdColorXYZ;cdecl;external;
(* Const before type ignored *)
function cd_color_lab_dup(src:PCdColorLab):PCdColorLab;cdecl;external;
(* Const before type ignored *)
function cd_color_rgb_dup(src:PCdColorRGB):PCdColorRGB;cdecl;external;
(* Const before type ignored *)
function cd_color_yxy_dup(src:PCdColorYxy):PCdColorYxy;cdecl;external;
(* Const before type ignored *)
function cd_color_uvw_dup(src:PCdColorUVW):PCdColorUVW;cdecl;external;
(* Const before type ignored *)
function cd_color_swatch_dup(src:PCdColorSwatch):PCdColorSwatch;cdecl;external;
procedure cd_color_xyz_set(dest:PCdColorXYZ; X:Tgdouble; Y:Tgdouble; Z:Tgdouble);cdecl;external;
procedure cd_color_rgb_set(dest:PCdColorRGB; R:Tgdouble; G:Tgdouble; B:Tgdouble);cdecl;external;
procedure cd_color_lab_set(dest:PCdColorLab; L:Tgdouble; a:Tgdouble; b:Tgdouble);cdecl;external;
procedure cd_color_yxy_set(dest:PCdColorYxy; Y:Tgdouble; x:Tgdouble; y:Tgdouble);cdecl;external;
procedure cd_color_uvw_set(dest:PCdColorUVW; U:Tgdouble; V:Tgdouble; W:Tgdouble);cdecl;external;
(* Const before type ignored *)
procedure cd_color_swatch_set_name(dest:PCdColorSwatch; name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure cd_color_swatch_set_value(dest:PCdColorSwatch; value:PCdColorLab);cdecl;external;
(* Const before type ignored *)
procedure cd_color_xyz_copy(src:PCdColorXYZ; dest:PCdColorXYZ);cdecl;external;
(* Const before type ignored *)
procedure cd_color_yxy_copy(src:PCdColorYxy; dest:PCdColorYxy);cdecl;external;
(* Const before type ignored *)
procedure cd_color_uvw_copy(src:PCdColorUVW; dest:PCdColorUVW);cdecl;external;
(* Const before type ignored *)
procedure cd_color_lab_copy(src:PCdColorLab; dest:PCdColorLab);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_color_lab_delta_e76(p1:PCdColorLab; p2:PCdColorLab):Tgdouble;cdecl;external;
procedure cd_color_xyz_clear(dest:PCdColorXYZ);cdecl;external;
(* Const before type ignored *)
procedure cd_color_rgb_copy(src:PCdColorRGB; dest:PCdColorRGB);cdecl;external;
(* Const before type ignored *)
procedure cd_color_rgb8_to_rgb(src:PCdColorRGB8; dest:PCdColorRGB);cdecl;external;
(* Const before type ignored *)
procedure cd_color_rgb_to_rgb8(src:PCdColorRGB; dest:PCdColorRGB8);cdecl;external;
(* Const before type ignored *)
procedure cd_color_yxy_to_xyz(src:PCdColorYxy; dest:PCdColorXYZ);cdecl;external;
(* Const before type ignored *)
procedure cd_color_xyz_to_yxy(src:PCdColorXYZ; dest:PCdColorYxy);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_color_xyz_to_uvw(src:PCdColorXYZ; whitepoint:PCdColorXYZ; dest:PCdColorUVW);cdecl;external;
(* Const before type ignored *)
procedure cd_color_yxy_to_uvw(src:PCdColorYxy; dest:PCdColorUVW);cdecl;external;
procedure cd_color_uvw_set_planckian_locus(dest:PCdColorUVW; temp:Tgdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_color_uvw_get_chroma_difference(p1:PCdColorUVW; p2:PCdColorUVW):Tgdouble;cdecl;external;
function cd_color_get_blackbody_rgb(temp:Tguint; result:PCdColorRGB):Tgboolean;cdecl;external;
function cd_color_get_blackbody_rgb_full(temp:Tgdouble; result:PCdColorRGB; flags:TCdColorBlackbodyFlags):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_color_rgb_interpolate(p1:PCdColorRGB; p2:PCdColorRGB; index:Tgdouble; result:PCdColorRGB);cdecl;external;
procedure cd_color_rgb_from_wavelength(dest:PCdColorRGB; wavelength:Tgdouble);cdecl;external;
(* Const before type ignored *)
function cd_color_xyz_to_cct(src:PCdColorXYZ):Tgdouble;cdecl;external;
(* Const before type ignored *)
procedure cd_color_xyz_normalize(src:PCdColorXYZ; max:Tgdouble; dest:PCdColorXYZ);cdecl;external;
function cd_color_rgb_array_new:PGPtrArray;cdecl;external;
(* Const before type ignored *)
function cd_color_rgb_array_is_monotonic(array:PGPtrArray):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_color_rgb_array_interpolate(array:PGPtrArray; new_length:Tguint):PGPtrArray;cdecl;external;
{$endif}
{ __CD_COLOR_H__  }

implementation

{ was #define dname def_expr }
function CD_TYPE_COLOR_RGB : longint; { return type might be wrong }
  begin
    CD_TYPE_COLOR_RGB:=cd_color_rgb_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_COLOR_XYZ : longint; { return type might be wrong }
  begin
    CD_TYPE_COLOR_XYZ:=cd_color_xyz_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_COLOR_LAB : longint; { return type might be wrong }
  begin
    CD_TYPE_COLOR_LAB:=cd_color_lab_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_COLOR_YXY : longint; { return type might be wrong }
  begin
    CD_TYPE_COLOR_YXY:=cd_color_yxy_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_COLOR_UVW : longint; { return type might be wrong }
  begin
    CD_TYPE_COLOR_UVW:=cd_color_uvw_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_COLOR_SWATCH : longint; { return type might be wrong }
  begin
    CD_TYPE_COLOR_SWATCH:=cd_color_swatch_get_type;
  end;


end.
