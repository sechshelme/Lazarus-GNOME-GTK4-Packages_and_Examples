unit timestamp;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
 * timestamp utils, mostly useful for debugging/logging purposes
  }
{$ifndef AVUTIL_TIMESTAMP_H}
{$define AVUTIL_TIMESTAMP_H}
{$include "avutil.h"}

const
  AV_TS_MAX_STRING_SIZE = 32;  
{*
 * Fill the provided buffer with a string containing a timestamp
 * representation.
 *
 * @param buf a buffer with size in bytes of at least AV_TS_MAX_STRING_SIZE
 * @param ts the timestamp to represent
 * @return the buffer in input
  }
{*
 * Convenience macro, the return value should be used only directly in
 * function arguments but never stand-alone.
  }
{*
 * Fill the provided buffer with a string containing a timestamp time
 * representation.
 *
 * @param buf a buffer with size in bytes of at least AV_TS_MAX_STRING_SIZE
 * @param ts the timestamp to represent
 * @param tb the timebase of the timestamp
 * @return the buffer in input
  }
{*
 * Convenience macro, the return value should be used only directly in
 * function arguments but never stand-alone.
  }
{$endif}
{ AVUTIL_TIMESTAMP_H  }

// === Konventiert am: 14-12-25 17:42:16 ===


implementation



end.
