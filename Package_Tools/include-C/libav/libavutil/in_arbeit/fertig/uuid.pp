
unit uuid;
interface

{
  Automatically converted by H2Pas 1.0.0 from uuid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    uuid.h
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
PAVUUID  = ^AVUUID;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2022 Pierre-Anthony Lemieux <pal@palemieux.com>
 *                    Zane van Iperen <zane@zanevaniperen.com>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{*
 * @file
 * UUID parsing and serialization utilities.
 * The library treats the UUID as an opaque sequence of 16 unsigned bytes,
 * i.e. ignoring the internal layout of the UUID, which depends on the type
 * of the UUID.
 *
 * @author Pierre-Anthony Lemieux <pal@palemieux.com>
 * @author Zane van Iperen <zane@zanevaniperen.com>
  }
{$ifndef AVUTIL_UUID_H}
{$define AVUTIL_UUID_H}
{$include <stdint.h>}
{$include <string.h>}

const
  AV_UUID_LEN = 16;  
{ Binary representation of a UUID  }
type
  PAVUUID = ^TAVUUID;
  TAVUUID = array[0..(AV_UUID_LEN)-1] of Tuint8_t;
{*
 * Parses a string representation of a UUID formatted according to IETF RFC 4122
 * into an AVUUID. The parsing is case-insensitive. The string must be 37
 * characters long, including the terminating NUL character.
 *
 * Example string representation: "2fceebd0-7017-433d-bafb-d073a7116696"
 *
 * @param[in]  in  String representation of a UUID,
 *                 e.g. 2fceebd0-7017-433d-bafb-d073a7116696
 * @param[out] uu  AVUUID
 * @return         A non-zero value in case of an error.
  }
(* Const before type ignored *)

function av_uuid_parse(in:Pchar; uu:TAVUUID):longint;cdecl;external;
{*
 * Parses a URN representation of a UUID, as specified at IETF RFC 4122,
 * into an AVUUID. The parsing is case-insensitive. The string must be 46
 * characters long, including the terminating NUL character.
 *
 * Example string representation: "urn:uuid:2fceebd0-7017-433d-bafb-d073a7116696"
 *
 * @param[in]  in  URN UUID
 * @param[out] uu  AVUUID
 * @return         A non-zero value in case of an error.
  }
(* Const before type ignored *)
function av_uuid_urn_parse(in:Pchar; uu:TAVUUID):longint;cdecl;external;
{*
 * Parses a string representation of a UUID formatted according to IETF RFC 4122
 * into an AVUUID. The parsing is case-insensitive.
 *
 * @param[in]  in_start Pointer to the first character of the string representation
 * @param[in]  in_end   Pointer to the character after the last character of the
 *                      string representation. That memory location is never
 *                      accessed. It is an error if `in_end - in_start != 36`.
 * @param[out] uu       AVUUID
 * @return              A non-zero value in case of an error.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function av_uuid_parse_range(in_start:Pchar; in_end:Pchar; uu:TAVUUID):longint;cdecl;external;
{*
 * Serializes a AVUUID into a string representation according to IETF RFC 4122.
 * The string is lowercase and always 37 characters long, including the
 * terminating NUL character.
 *
 * @param[in]  uu  AVUUID
 * @param[out] out Pointer to an array of no less than 37 characters.
  }
(* Const before type ignored *)
procedure av_uuid_unparse(uu:TAVUUID; out:Pchar);cdecl;external;
{*
 * Compares two UUIDs for equality.
 *
 * @param[in]  uu1  AVUUID
 * @param[in]  uu2  AVUUID
 * @return          Nonzero if uu1 and uu2 are identical, 0 otherwise
  }
{$endif}
{ AVUTIL_UUID_H  }

implementation


end.
