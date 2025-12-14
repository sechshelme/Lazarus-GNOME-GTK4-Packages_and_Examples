unit intfloat;

interface

uses
  fp_ffmpeg;

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

// === Konventiert am: 14-12-25 17:31:30 ===


implementation



end.
