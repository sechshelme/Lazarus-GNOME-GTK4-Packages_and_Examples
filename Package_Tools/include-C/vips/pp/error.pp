
unit error;
interface

{
  Automatically converted by H2Pas 1.0.0 from error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    error.h
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
PGError  = ^GError;
PVipsImage  = ^VipsImage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Error handling.
  }
{

	Copyright (C) 1991-2005 The National Gallery

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_ERROR_H}
{$define VIPS_ERROR_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
(* Const before type ignored *)

function vips_error_buffer:Pchar;cdecl;external;
function vips_error_buffer_copy:Pchar;cdecl;external;
procedure vips_error_clear;cdecl;external;
procedure vips_error_freeze;cdecl;external;
procedure vips_error_thaw;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_error(domain:Pchar; fmt:Pchar; args:array of const);cdecl;external;
procedure vips_error(domain:Pchar; fmt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_verror(domain:Pchar; fmt:Pchar; ap:Tva_list);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_error_system(err:longint; domain:Pchar; fmt:Pchar; args:array of const);cdecl;external;
procedure vips_error_system(err:longint; domain:Pchar; fmt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_verror_system(err:longint; domain:Pchar; fmt:Pchar; ap:Tva_list);cdecl;external;
procedure vips_error_g(error:PPGError);cdecl;external;
procedure vips_g_error(error:PPGError);cdecl;external;
(* Const before type ignored *)
procedure vips_error_exit(fmt:Pchar; args:array of const);cdecl;external;
procedure vips_error_exit(fmt:Pchar);cdecl;external;
(* Const before type ignored *)
function vips_check_uncoded(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_coding(domain:Pchar; im:PVipsImage; coding:TVipsCoding):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_coding_known(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_coding_noneorlabq(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_coding_same(domain:Pchar; im1:PVipsImage; im2:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_mono(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_bands(domain:Pchar; im:PVipsImage; bands:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_bands_1or3(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_bands_atleast(domain:Pchar; im:PVipsImage; bands:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_bands_1orn(domain:Pchar; im1:PVipsImage; im2:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_bands_1orn_unary(domain:Pchar; im:PVipsImage; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_bands_same(domain:Pchar; im1:PVipsImage; im2:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_bandno(domain:Pchar; im:PVipsImage; bandno:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_int(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_uint(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_uintorf(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_noncomplex(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_complex(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_twocomponents(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_format(domain:Pchar; im:PVipsImage; fmt:TVipsBandFormat):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_u8or16(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_8or16(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_u8or16orf(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_format_same(domain:Pchar; im1:PVipsImage; im2:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_size_same(domain:Pchar; im1:PVipsImage; im2:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_oddsquare(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_vector_length(domain:Pchar; n:longint; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_vector(domain:Pchar; n:longint; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_hist(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_matrix(domain:Pchar; im:PVipsImage; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_separable(domain:Pchar; im:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_check_precision_intfloat(domain:Pchar; precision:TVipsPrecision):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_ERROR_H }

implementation


end.
