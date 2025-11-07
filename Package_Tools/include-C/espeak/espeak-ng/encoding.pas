unit encoding;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2017 Reece H. Dunn
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see: <http://www.gnu.org/licenses/>.
  }
{$ifndef ESPEAK_NG_ENCODING_H}
{$define ESPEAK_NG_ENCODING_H}
{$include <stdint.h>}
{ ISO-8859-12 is not a valid encoding. }
type
  Pespeak_ng_ENCODING = ^Tespeak_ng_ENCODING;
  Tespeak_ng_ENCODING =  Longint;
  Const
    ESPEAKNG_ENCODING_UNKNOWN = 0;
    ESPEAKNG_ENCODING_US_ASCII = 1;
    ESPEAKNG_ENCODING_ISO_8859_1 = 2;
    ESPEAKNG_ENCODING_ISO_8859_2 = 3;
    ESPEAKNG_ENCODING_ISO_8859_3 = 4;
    ESPEAKNG_ENCODING_ISO_8859_4 = 5;
    ESPEAKNG_ENCODING_ISO_8859_5 = 6;
    ESPEAKNG_ENCODING_ISO_8859_6 = 7;
    ESPEAKNG_ENCODING_ISO_8859_7 = 8;
    ESPEAKNG_ENCODING_ISO_8859_8 = 9;
    ESPEAKNG_ENCODING_ISO_8859_9 = 10;
    ESPEAKNG_ENCODING_ISO_8859_10 = 11;
    ESPEAKNG_ENCODING_ISO_8859_11 = 12;
    ESPEAKNG_ENCODING_ISO_8859_13 = 13;
    ESPEAKNG_ENCODING_ISO_8859_14 = 14;
    ESPEAKNG_ENCODING_ISO_8859_15 = 15;
    ESPEAKNG_ENCODING_ISO_8859_16 = 16;
    ESPEAKNG_ENCODING_KOI8_R = 17;
    ESPEAKNG_ENCODING_ISCII = 18;
    ESPEAKNG_ENCODING_UTF_8 = 19;
    ESPEAKNG_ENCODING_ISO_10646_UCS_2 = 20;
;

function espeak_ng_EncodingFromName(encoding:Pchar):Tespeak_ng_ENCODING;cdecl;external libespeak_ng;
type
  Tespeak_ng_TEXT_DECODER_ = Tespeak_ng_TEXT_DECODER;

function create_text_decoder:Pespeak_ng_TEXT_DECODER;cdecl;external libespeak_ng;
procedure destroy_text_decoder(decoder:Pespeak_ng_TEXT_DECODER);cdecl;external libespeak_ng;
function text_decoder_decode_string(decoder:Pespeak_ng_TEXT_DECODER; _string:Pchar; length:longint; encoding:Tespeak_ng_ENCODING):Tespeak_ng_STATUS;cdecl;external libespeak_ng;
function text_decoder_decode_string_auto(decoder:Pespeak_ng_TEXT_DECODER; _string:Pchar; length:longint; encoding:Tespeak_ng_ENCODING):Tespeak_ng_STATUS;cdecl;external libespeak_ng;
function text_decoder_decode_wstring(decoder:Pespeak_ng_TEXT_DECODER; _string:Pwchar_t; length:longint):Tespeak_ng_STATUS;cdecl;external libespeak_ng;
function text_decoder_decode_string_multibyte(decoder:Pespeak_ng_TEXT_DECODER; input:pointer; encoding:Tespeak_ng_ENCODING; flags:longint):Tespeak_ng_STATUS;cdecl;external libespeak_ng;
function text_decoder_eof(decoder:Pespeak_ng_TEXT_DECODER):longint;cdecl;external libespeak_ng;
function text_decoder_getc(decoder:Pespeak_ng_TEXT_DECODER):Tuint32_t;cdecl;external libespeak_ng;
function text_decoder_peekc(decoder:Pespeak_ng_TEXT_DECODER):Tuint32_t;cdecl;external libespeak_ng;
function text_decoder_get_buffer(decoder:Pespeak_ng_TEXT_DECODER):pointer;cdecl;external libespeak_ng;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 7-11-25 17:27:47 ===


implementation



end.
