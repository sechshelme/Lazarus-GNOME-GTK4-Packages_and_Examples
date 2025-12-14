unit base64;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2006 Ryan Martell. (rdm4@martellventures.com)
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
{$ifndef AVUTIL_BASE64_H}
{$define AVUTIL_BASE64_H}
{$include <stdint.h>}
{*
 * @defgroup lavu_base64 Base64
 * @ingroup lavu_crypto
 * @
  }
{*
 * Decode a base64-encoded string.
 *
 * @param out      buffer for decoded data
 * @param in       null-terminated input string
 * @param out_size size in bytes of the out buffer, must be at
 *                 least 3/4 of the length of in, that is AV_BASE64_DECODE_SIZE(strlen(in))
 * @return         number of bytes written, or a negative value in case of
 *                 invalid input
  }

function av_base64_decode(out:Puint8_t; in:Pchar; out_size:longint):longint;cdecl;external libavutil;
{*
 * Calculate the output size in bytes needed to decode a base64 string
 * with length x to a data buffer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BASE64_DECODE_SIZE(x : longint) : longint;

{*
 * Encode data to base64 and null-terminate.
 *
 * @param out      buffer for encoded data
 * @param out_size size in bytes of the out buffer (including the
 *                 null terminator), must be at least AV_BASE64_SIZE(in_size)
 * @param in       input buffer containing the data to encode
 * @param in_size  size in bytes of the in buffer
 * @return         out or NULL in case of error
  }
function av_base64_encode(out:Pchar; out_size:longint; in:Puint8_t; in_size:longint):Pchar;cdecl;external libavutil;
{*
 * Calculate the output size needed to base64-encode x bytes to a
 * null-terminated string.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BASE64_SIZE(x : longint) : longint;

{*
  * @
   }
{$endif}
{ AVUTIL_BASE64_H  }

// === Konventiert am: 14-12-25 15:59:47 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BASE64_DECODE_SIZE(x : longint) : longint;
begin
  AV_BASE64_DECODE_SIZE:=(x*3)/4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BASE64_SIZE(x : longint) : longint;
begin
  AV_BASE64_SIZE:=(((Tx(+(2)))/3)*4)+1;
end;


end.
