
unit random_seed;
interface

{
  Automatically converted by H2Pas 1.0.0 from random_seed.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    random_seed.h
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
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2009 Baptiste Coudurier <baptiste.coudurier@gmail.com>
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
{$ifndef AVUTIL_RANDOM_SEED_H}
{$define AVUTIL_RANDOM_SEED_H}
{$include <stddef.h>}
{$include <stdint.h>}
{*
 * @addtogroup lavu_crypto
 * @
  }
{*
 * Get a seed to use in conjunction with random functions.
 * This function tries to provide a good seed at a best effort bases.
 * Its possible to call this function multiple times if more bits are needed.
 * It can be quite slow, which is why it should only be used as seed for a faster
 * PRNG. The quality of the seed depends on the platform.
  }

function av_get_random_seed:Tuint32_t;cdecl;external;
{*
 * Generate cryptographically secure random data, i.e. suitable for use as
 * encryption keys and similar.
 *
 * @param buf buffer into which the random data will be written
 * @param len size of buf in bytes
 *
 * @retval 0                         success, len bytes of random data was written
 *                                   into buf
 * @retval "a negative AVERROR code" random data could not be generated
  }
function av_random_bytes(buf:Puint8_t; len:Tsize_t):longint;cdecl;external;
{*
 * @
  }
{$endif}
{ AVUTIL_RANDOM_SEED_H  }

implementation


end.
