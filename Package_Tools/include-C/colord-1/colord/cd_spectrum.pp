
unit cd_spectrum;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_spectrum.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_spectrum.h
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
PCdSpectrum  = ^CdSpectrum;
PGArray  = ^GArray;
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2014-2015 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_SPECTRUM_H__}
{$define __CD_SPECTRUM_H__}
{$include <glib-object.h>}
type

{ was #define dname def_expr }
function CD_TYPE_SPECTRUM : longint; { return type might be wrong }

function cd_spectrum_get_type:TGType;cdecl;external;
function cd_spectrum_new:PCdSpectrum;cdecl;external;
function cd_spectrum_sized_new(reserved_size:Tguint):PCdSpectrum;cdecl;external;
function cd_spectrum_planckian_new(temperature:Tgdouble):PCdSpectrum;cdecl;external;
function cd_spectrum_planckian_new_full(temperature:Tgdouble; start:Tgdouble; end:Tgdouble; resolution:Tgdouble):PCdSpectrum;cdecl;external;
procedure cd_spectrum_free(spectrum:PCdSpectrum);cdecl;external;
(* Const before type ignored *)
function cd_spectrum_dup(spectrum:PCdSpectrum):PCdSpectrum;cdecl;external;
procedure cd_spectrum_limit_min(spectrum:PCdSpectrum; value:Tgdouble);cdecl;external;
procedure cd_spectrum_limit_max(spectrum:PCdSpectrum; value:Tgdouble);cdecl;external;
procedure cd_spectrum_normalize(spectrum:PCdSpectrum; wavelength:Tgdouble; value:Tgdouble);cdecl;external;
procedure cd_spectrum_normalize_max(spectrum:PCdSpectrum; value:Tgdouble);cdecl;external;
function cd_spectrum_subtract(s1:PCdSpectrum; s2:PCdSpectrum; resolution:Tgdouble):PCdSpectrum;cdecl;external;
function cd_spectrum_to_string(spectrum:PCdSpectrum; max_width:Tguint; max_height:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_spectrum_get_id(spectrum:PCdSpectrum):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_data(spectrum:PCdSpectrum):PGArray;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_start(spectrum:PCdSpectrum):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_end(spectrum:PCdSpectrum):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_norm(spectrum:PCdSpectrum):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_resolution(spectrum:PCdSpectrum):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_size(spectrum:PCdSpectrum):Tguint;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_value_max(spectrum:PCdSpectrum):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_value_min(spectrum:PCdSpectrum):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_value(spectrum:PCdSpectrum; idx:Tguint):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_value_raw(spectrum:PCdSpectrum; idx:Tguint):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_wavelength(spectrum:PCdSpectrum; idx:Tguint):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_spectrum_get_value_for_nm(spectrum:PCdSpectrum; wavelength:Tgdouble):Tgdouble;cdecl;external;
(* Const before type ignored *)
procedure cd_spectrum_set_id(spectrum:PCdSpectrum; id:Pgchar);cdecl;external;
procedure cd_spectrum_set_data(spectrum:PCdSpectrum; value:PGArray);cdecl;external;
procedure cd_spectrum_set_start(spectrum:PCdSpectrum; start:Tgdouble);cdecl;external;
procedure cd_spectrum_set_end(spectrum:PCdSpectrum; end:Tgdouble);cdecl;external;
procedure cd_spectrum_set_norm(spectrum:PCdSpectrum; norm:Tgdouble);cdecl;external;
procedure cd_spectrum_set_value(spectrum:PCdSpectrum; idx:Tguint; data:Tgdouble);cdecl;external;
procedure cd_spectrum_add_value(spectrum:PCdSpectrum; data:Tgdouble);cdecl;external;
procedure cd_spectrum_set_wavelength_cal(spectrum:PCdSpectrum; c1:Tgdouble; c2:Tgdouble; c3:Tgdouble);cdecl;external;
procedure cd_spectrum_get_wavelength_cal(spectrum:PCdSpectrum; c1:Pgdouble; c2:Pgdouble; c3:Pgdouble);cdecl;external;
function cd_spectrum_multiply(s1:PCdSpectrum; s2:PCdSpectrum; resolution:Tgdouble):PCdSpectrum;cdecl;external;
function cd_spectrum_multiply_scalar(spectrum:PCdSpectrum; value:Tgdouble):PCdSpectrum;cdecl;external;
function cd_spectrum_resample(spectrum:PCdSpectrum; start:Tgdouble; end:Tgdouble; resolution:Tgdouble):PCdSpectrum;cdecl;external;
function cd_spectrum_resample_to_size(spectrum:PCdSpectrum; size:Tguint):PCdSpectrum;cdecl;external;
{$endif}
{ __CD_SPECTRUM_H__  }

implementation

{ was #define dname def_expr }
function CD_TYPE_SPECTRUM : longint; { return type might be wrong }
  begin
    CD_TYPE_SPECTRUM:=cd_spectrum_get_type;
  end;


end.
