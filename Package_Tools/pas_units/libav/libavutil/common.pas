unit common;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>
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
 * common internal and external API header
  }
{$ifndef AVUTIL_COMMON_H}
{$define AVUTIL_COMMON_H}
{$if defined(__cplusplus) && !defined(__STDC_CONSTANT_MACROS) && !defined(UINT64_C)}
{$error missing -D__STDC_CONSTANT_MACROS / #define __STDC_CONSTANT_MACROS}
{$endif}
{$include <errno.h>}
{$include <inttypes.h>}
{$include <limits.h>}
{$include <math.h>}
{$include <stdint.h>}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include "attributes.h"}
{$include "error.h"}
{$include "macros.h"}
{ misc math functions  }
{$ifdef HAVE_AV_CONFIG_H}
{$include "config.h"}
{$include "intmath.h"}
{$endif}
{$ifndef av_log2}

function av_log2(v:dword):longint;cdecl;external libavutil;
{$endif}
{$ifndef av_log2_16bit}

function av_log2_16bit(v:dword):longint;cdecl;external libavutil;
{$endif}
{*
 * Clip a signed integer value into the amin-amax range.
 * @param a value to clip
 * @param amin minimum value of the clip range
 * @param amax maximum value of the clip range
 * @return clipped value
  }
{*
 * Count number of bits set to one in x
 * @param x value to count bits of
 * @return the number of bits set to one in x
  }
{$include "mem.h"}
{$ifdef HAVE_AV_CONFIG_H}
{$include "internal.h"}
{$endif}
{ HAVE_AV_CONFIG_H  }
{$endif}
{ AVUTIL_COMMON_H  }

// === Konventiert am: 14-12-25 17:00:16 ===


implementation



end.
