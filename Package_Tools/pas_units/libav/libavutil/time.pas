unit time;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2000-2003 Fabrice Bellard
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
{$ifndef AVUTIL_TIME_H}
{$define AVUTIL_TIME_H}
{$include <stdint.h>}
{*
 * Get the current time in microseconds.
  }

function av_gettime:Tint64_t;cdecl;external libavutil;
{*
 * Get the current time in microseconds since some unspecified starting point.
 * On platforms that support it, the time comes from a monotonic clock
 * This property makes this time source ideal for measuring relative time.
 * The returned values may not be monotonic on platforms where a monotonic
 * clock is not available.
  }
function av_gettime_relative:Tint64_t;cdecl;external libavutil;
{*
 * Indicates with a boolean result if the av_gettime_relative() time source
 * is monotonic.
  }
function av_gettime_relative_is_monotonic:longint;cdecl;external libavutil;
{*
 * Sleep for a period of time.  Although the duration is expressed in
 * microseconds, the actual delay may be rounded to the precision of the
 * system timer.
 *
 * @param  usec Number of microseconds to sleep.
 * @return zero on success or (negative) error code.
  }
function av_usleep(usec:dword):longint;cdecl;external libavutil;
{$endif}
{ AVUTIL_TIME_H  }

// === Konventiert am: 14-12-25 17:42:21 ===


implementation



end.
