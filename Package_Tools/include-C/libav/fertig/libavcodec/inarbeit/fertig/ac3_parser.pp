
unit ac3_parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from ac3_parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ac3_parser.h
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
Puint16_t  = ^uint16_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AC-3 parser prototypes
 * Copyright (c) 2003 Fabrice Bellard
 * Copyright (c) 2003 Michael Niedermayer
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
{$ifndef AVCODEC_AC3_PARSER_H}
{$define AVCODEC_AC3_PARSER_H}
{$include <stddef.h>}
{$include <stdint.h>}
{*
 * Extract the bitstream ID and the frame size from AC-3 data.
  }
(* Const before type ignored *)

function av_ac3_parse_header(buf:Puint8_t; size:Tsize_t; bitstream_id:Puint8_t; frame_size:Puint16_t):longint;cdecl;external;
{$endif}
{ AVCODEC_AC3_PARSER_H  }

implementation


end.
