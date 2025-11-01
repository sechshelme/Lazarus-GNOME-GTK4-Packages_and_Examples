
unit cd_it8;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_it8.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_it8.h
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
PCdColorRGB  = ^CdColorRGB;
PCdColorXYZ  = ^CdColorXYZ;
PCdIt8  = ^CdIt8;
PCdIt8Class  = ^CdIt8Class;
PCdIt8Error  = ^CdIt8Error;
PCdIt8Kind  = ^CdIt8Kind;
PCdMat3x3  = ^CdMat3x3;
PCdSpectrum  = ^CdSpectrum;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PGPtrArray  = ^GPtrArray;
Pgsize  = ^gsize;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012-2014 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_IT8_H}
{$define __CD_IT8_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "cd-color.h"}
{$include "cd-math.h"}
{$include "cd-spectrum.h"}

{ was #define dname def_expr }
function CD_IT8_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_IT8_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_IT8 : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdIt8, cd_it8, CD, IT8, GObject) }
{< private > }
{ Padding for future expansion  }
type
  PCdIt8Class = ^TCdIt8Class;
  TCdIt8Class = record
      parent_class : TGObjectClass;
      _cd_it8_reserved1 : procedure ;cdecl;
      _cd_it8_reserved2 : procedure ;cdecl;
      _cd_it8_reserved3 : procedure ;cdecl;
      _cd_it8_reserved4 : procedure ;cdecl;
      _cd_it8_reserved5 : procedure ;cdecl;
      _cd_it8_reserved6 : procedure ;cdecl;
      _cd_it8_reserved7 : procedure ;cdecl;
      _cd_it8_reserved8 : procedure ;cdecl;
    end;

{*
 * CdIt8Error:
 * @CD_IT8_ERROR_FAILED: the transaction failed for an unknown reason
 *
 * Errors that can be thrown
  }
{ Since: 0.1.20  }
{ Since: 1.1.6  }
{ Since: 1.1.6  }
{< private > }

  PCdIt8Error = ^TCdIt8Error;
  TCdIt8Error =  Longint;
  Const
    CD_IT8_ERROR_FAILED = 0;
    CD_IT8_ERROR_INVALID_FORMAT = 1;
    CD_IT8_ERROR_UNKNOWN_KIND = 2;
    CD_IT8_ERROR_LAST = 3;
;
{*
 * CdIt8Kind:
 *
 * The kind of IT8 file.
 * }
{ Since: 0.1.20  }
{ Since: 0.1.20  }
{ Since: 0.1.20  }
{ Since: 0.1.20  }
{ Since: 0.1.26  }
{ Since: 1.1.6  }
{ Since: 1.1.6  }
{ Since: 1.1.6  }
{< private > }
type
  PCdIt8Kind = ^TCdIt8Kind;
  TCdIt8Kind =  Longint;
  Const
    CD_IT8_KIND_UNKNOWN = 0;
    CD_IT8_KIND_TI1 = 1;
    CD_IT8_KIND_TI3 = 2;
    CD_IT8_KIND_CCMX = 3;
    CD_IT8_KIND_CAL = 4;
    CD_IT8_KIND_CCSS = 5;
    CD_IT8_KIND_SPECT = 6;
    CD_IT8_KIND_CMF = 7;
    CD_IT8_KIND_LAST = 8;
;

function cd_it8_error_quark:TGQuark;cdecl;external;
function cd_it8_new:PCdIt8;cdecl;external;
function cd_it8_new_with_kind(kind:TCdIt8Kind):PCdIt8;cdecl;external;
{ sync  }
(* Const before type ignored *)
function cd_it8_load_from_data(it8:PCdIt8; data:Pgchar; size:Tgsize; error:PPGError):Tgboolean;cdecl;external;
function cd_it8_load_from_file(it8:PCdIt8; file:PGFile; error:PPGError):Tgboolean;cdecl;external;
function cd_it8_save_to_file(it8:PCdIt8; file:PGFile; error:PPGError):Tgboolean;cdecl;external;
function cd_it8_save_to_data(it8:PCdIt8; data:PPgchar; size:Pgsize; error:PPGError):Tgboolean;cdecl;external;
{ setters  }
procedure cd_it8_set_kind(it8:PCdIt8; kind:TCdIt8Kind);cdecl;external;
procedure cd_it8_set_normalized(it8:PCdIt8; normalized:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure cd_it8_set_originator(it8:PCdIt8; originator:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure cd_it8_set_title(it8:PCdIt8; title:Pgchar);cdecl;external;
procedure cd_it8_set_spectral(it8:PCdIt8; spectral:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure cd_it8_set_instrument(it8:PCdIt8; instrument:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure cd_it8_set_reference(it8:PCdIt8; reference:Pgchar);cdecl;external;
procedure cd_it8_set_enable_created(it8:PCdIt8; enable_created:Tgboolean);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_it8_add_data(it8:PCdIt8; rgb:PCdColorRGB; xyz:PCdColorXYZ);cdecl;external;
(* Const before type ignored *)
procedure cd_it8_add_option(it8:PCdIt8; option:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure cd_it8_set_matrix(it8:PCdIt8; matrix:PCdMat3x3);cdecl;external;
procedure cd_it8_set_spectrum_array(it8:PCdIt8; data:PGPtrArray);cdecl;external;
procedure cd_it8_add_spectrum(it8:PCdIt8; spectrum:PCdSpectrum);cdecl;external;
{ getters  }
(* Const before type ignored *)
function cd_it8_get_matrix(it8:PCdIt8):PCdMat3x3;cdecl;external;
function cd_it8_get_kind(it8:PCdIt8):TCdIt8Kind;cdecl;external;
function cd_it8_get_normalized(it8:PCdIt8):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_it8_get_originator(it8:PCdIt8):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_it8_get_title(it8:PCdIt8):Pgchar;cdecl;external;
function cd_it8_get_spectral(it8:PCdIt8):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_it8_get_instrument(it8:PCdIt8):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_it8_get_reference(it8:PCdIt8):Pgchar;cdecl;external;
function cd_it8_get_enable_created(it8:PCdIt8):Tgboolean;cdecl;external;
function cd_it8_get_data_size(it8:PCdIt8):Tguint;cdecl;external;
function cd_it8_get_data_item(it8:PCdIt8; idx:Tguint; rgb:PCdColorRGB; xyz:PCdColorXYZ):Tgboolean;cdecl;external;
function cd_it8_get_spectrum_array(it8:PCdIt8):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function cd_it8_get_spectrum_by_id(it8:PCdIt8; id:Pgchar):PCdSpectrum;cdecl;external;
(* Const before type ignored *)
function cd_it8_has_option(it8:PCdIt8; option:Pgchar):Tgboolean;cdecl;external;
function cd_it8_get_xyz_for_rgb(it8:PCdIt8; R:Tgdouble; G:Tgdouble; B:Tgdouble; delta:Tgdouble):PCdColorXYZ;cdecl;external;
{$endif}
{ __CD_IT8_H  }

implementation

{ was #define dname def_expr }
function CD_IT8_ERROR : longint; { return type might be wrong }
  begin
    CD_IT8_ERROR:=cd_it8_error_quark;
  end;

{ was #define dname def_expr }
function CD_IT8_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_IT8_TYPE_ERROR:=cd_it8_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_IT8 : longint; { return type might be wrong }
  begin
    CD_TYPE_IT8:=cd_it8_get_type;
  end;


end.
