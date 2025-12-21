
unit intfloat;
interface

{
  Automatically converted by H2Pas 1.0.0 from intfloat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    intfloat.h
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
Pav_intfloat32  = ^av_intfloat32;
Pav_intfloat64  = ^av_intfloat64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2011 Mans Rullgard
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
{$ifndef AVUTIL_INTFLOAT_H}
{$define AVUTIL_INTFLOAT_H}
{$include <stdint.h>}
{$include "attributes.h"}
type
  Pav_intfloat32 = ^Tav_intfloat32;
  Tav_intfloat32 = record
      case longint of
        0 : ( i : Tuint32_t );
        1 : ( f : single );
      end;

  Pav_intfloat64 = ^Tav_intfloat64;
  Tav_intfloat64 = record
      case longint of
        0 : ( i : Tuint64_t );
        1 : ( f : Tdouble );
      end;

{$endif}
{ AVUTIL_INTFLOAT_H  }

implementation


end.
