unit gmime_utils;

interface

uses
  fp_glib2, fp_gmime3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_UTILS_H__}
{$define __GMIME_UTILS_H__}
{$include <glib.h>}
{$include <stdarg.h>}
{$include <gmime/gmime-format-options.h>}
{$include <gmime/gmime-parser-options.h>}
{$include <gmime/gmime-encodings.h>}

function g_mime_utils_header_decode_date(str:Pchar):PGDateTime;cdecl;external libgmime3;
function g_mime_utils_header_format_date(date:PGDateTime):Pchar;cdecl;external libgmime3;
function g_mime_utils_generate_message_id(fqdn:Pchar):Pchar;cdecl;external libgmime3;
{ decode a message-id  }
function g_mime_utils_decode_message_id(message_id:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_utils_structured_header_fold(options:PGMimeParserOptions; format:PGMimeFormatOptions; header:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_utils_unstructured_header_fold(options:PGMimeParserOptions; format:PGMimeFormatOptions; header:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_utils_header_printf(options:PGMimeParserOptions; format:PGMimeFormatOptions; text:Pchar; args:array of const):Pchar;cdecl;external libgmime3;
function g_mime_utils_header_printf(options:PGMimeParserOptions; format:PGMimeFormatOptions; text:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_utils_header_unfold(value:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_utils_quote_string(str:Pchar):Pchar;cdecl;external libgmime3;
procedure g_mime_utils_unquote_string(str:Pchar);cdecl;external libgmime3;
{ encoding decision making utilities ;-)  }
function g_mime_utils_text_is_8bit(text:Pbyte; len:Tsize_t):Tgboolean;cdecl;external libgmime3;
function g_mime_utils_best_encoding(text:Pbyte; len:Tsize_t):TGMimeContentEncoding;cdecl;external libgmime3;
{ utility function to convert text in an unknown 8bit/multibyte charset to UTF-8  }
function g_mime_utils_decode_8bit(options:PGMimeParserOptions; text:Pchar; len:Tsize_t):Pchar;cdecl;external libgmime3;
{ utilities to (de/en)code headers  }
function g_mime_utils_header_decode_text(options:PGMimeParserOptions; text:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_utils_header_encode_text(options:PGMimeFormatOptions; text:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_utils_header_decode_phrase(options:PGMimeParserOptions; phrase:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_utils_header_encode_phrase(options:PGMimeFormatOptions; phrase:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
{$endif}
{ __GMIME_UTILS_H__  }

// === Konventiert am: 18-9-25 15:34:34 ===


implementation



end.
