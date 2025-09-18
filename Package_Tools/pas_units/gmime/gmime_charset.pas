unit gmime_charset;

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
{$ifndef __GMIME_CHARSET_H__}
{$define __GMIME_CHARSET_H__}
{$include <glib.h>}
{$include <sys/types.h>}

procedure g_mime_charset_map_init;cdecl;external libgmime3;
procedure g_mime_charset_map_shutdown;cdecl;external libgmime3;
function g_mime_locale_charset:Pchar;cdecl;external libgmime3;
function g_mime_locale_language:Pchar;cdecl;external libgmime3;
function g_mime_charset_language(charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_charset_canon_name(charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_charset_iconv_name(charset:Pchar):Pchar;cdecl;external libgmime3;
{$ifndef GMIME_DISABLE_DEPRECATED}

function g_mime_charset_name(charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_charset_locale_name:Pchar;cdecl;external libgmime3;
{$endif}

function g_mime_charset_iso_to_windows(isocharset:Pchar):Pchar;cdecl;external libgmime3;
type
{*
 * GMimeCharset:
 * @mask: charset mask
 * @level: charset level
 *
 * State used by g_mime_charset_best() and g_mime_charset_best_name().
 * }
  PGMimeCharset = ^TGMimeCharset;
  TGMimeCharset = record
      mask : dword;
      level : dword;
    end;


procedure g_mime_charset_init(charset:PGMimeCharset);cdecl;external libgmime3;
procedure g_mime_charset_step(charset:PGMimeCharset; inbuf:Pchar; inlen:Tsize_t);cdecl;external libgmime3;
function g_mime_charset_best_name(charset:PGMimeCharset):Pchar;cdecl;external libgmime3;
function g_mime_charset_best(inbuf:Pchar; inlen:Tsize_t):Pchar;cdecl;external libgmime3;
function g_mime_charset_can_encode(mask:PGMimeCharset; charset:Pchar; text:Pchar; len:Tsize_t):Tgboolean;cdecl;external libgmime3;
{$endif}
{ __GMIME_CHARSET_H__  }

// === Konventiert am: 18-9-25 15:26:01 ===


implementation



end.
