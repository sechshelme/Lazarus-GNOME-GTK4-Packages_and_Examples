
unit gchecksum;
interface

{
  Automatically converted by H2Pas 1.0.0 from gchecksum.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gchecksum.h
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGChecksum  = ^GChecksum;
PGChecksumType  = ^GChecksumType;
Pgsize  = ^gsize;
Pguchar  = ^guchar;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gchecksum.h - data hashing functions
 *
 * Copyright (C) 2007  Emmanuele Bassi  <ebassi@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_CHECKSUM_H__}
{$define __G_CHECKSUM_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{$include <glib/gbytes.h>}
{*
 * GChecksumType:
 * @G_CHECKSUM_MD5: Use the MD5 hashing algorithm
 * @G_CHECKSUM_SHA1: Use the SHA-1 hashing algorithm
 * @G_CHECKSUM_SHA256: Use the SHA-256 hashing algorithm
 * @G_CHECKSUM_SHA384: Use the SHA-384 hashing algorithm (Since: 2.51)
 * @G_CHECKSUM_SHA512: Use the SHA-512 hashing algorithm (Since: 2.36)
 *
 * The hashing algorithm to be used by #GChecksum when performing the
 * digest of some data.
 *
 * Note that the #GChecksumType enumeration may be extended at a later
 * date to include new hashing algorithm types.
 *
 * Since: 2.16
  }
type
  PGChecksumType = ^TGChecksumType;
  TGChecksumType =  Longint;
  Const
    G_CHECKSUM_MD5 = 0;
    G_CHECKSUM_SHA1 = 1;
    G_CHECKSUM_SHA256 = 2;
    G_CHECKSUM_SHA512 = 3;
    G_CHECKSUM_SHA384 = 4;
;
type

function g_checksum_type_get_length(checksum_type:TGChecksumType):Tgssize;cdecl;external;
function g_checksum_new(checksum_type:TGChecksumType):PGChecksum;cdecl;external;
procedure g_checksum_reset(checksum:PGChecksum);cdecl;external;
(* Const before type ignored *)
function g_checksum_copy(checksum:PGChecksum):PGChecksum;cdecl;external;
procedure g_checksum_free(checksum:PGChecksum);cdecl;external;
(* Const before type ignored *)
procedure g_checksum_update(checksum:PGChecksum; data:Pguchar; length:Tgssize);cdecl;external;
(* Const before type ignored *)
function g_checksum_get_string(checksum:PGChecksum):Pgchar;cdecl;external;
procedure g_checksum_get_digest(checksum:PGChecksum; buffer:Pguint8; digest_len:Pgsize);cdecl;external;
(* Const before type ignored *)
function g_compute_checksum_for_data(checksum_type:TGChecksumType; data:Pguchar; length:Tgsize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_compute_checksum_for_string(checksum_type:TGChecksumType; str:Pgchar; length:Tgssize):Pgchar;cdecl;external;
function g_compute_checksum_for_bytes(checksum_type:TGChecksumType; data:PGBytes):Pgchar;cdecl;external;
{$endif}
{ __G_CHECKSUM_H__  }

implementation


end.
