
unit adler32;
interface

{
  Automatically converted by H2Pas 1.0.0 from adler32.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adler32.h
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
PAVAdler  = ^AVAdler;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * copyright (c) 2006 Mans Rullgard
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
 * @ingroup lavu_adler32
 * Public header for Adler-32 hash function implementation.
  }
{$ifndef AVUTIL_ADLER32_H}
{$define AVUTIL_ADLER32_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "attributes.h"}
{*
 * @defgroup lavu_adler32 Adler-32
 * @ingroup lavu_hash
 * Adler-32 hash function implementation.
 *
 * @
  }
type
  PAVAdler = ^TAVAdler;
  TAVAdler = Tuint32_t;
{*
 * Calculate the Adler32 checksum of a buffer.
 *
 * Passing the return value to a subsequent av_adler32_update() call
 * allows the checksum of multiple buffers to be calculated as though
 * they were concatenated.
 *
 * @param adler initial checksum value
 * @param buf   pointer to input buffer
 * @param len   size of input buffer
 * @return      updated checksum
  }
(* Const before type ignored *)

function av_adler32_update(adler:TAVAdler; buf:Puint8_t; len:Tsize_t):TAVAdler;cdecl;external;
{*
 * @
  }
{$endif}
{ AVUTIL_ADLER32_H  }

implementation


end.
