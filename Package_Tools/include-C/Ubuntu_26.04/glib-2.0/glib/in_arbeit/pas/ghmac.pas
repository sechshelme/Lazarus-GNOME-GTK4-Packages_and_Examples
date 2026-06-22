unit ghmac;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ ghmac.h - secure data hashing
 *
 * Copyright (C) 2011  Stef Walter  <stefw@collabora.co.uk>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_HMAC_H__}
{$define __G_HMAC_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{$include "gchecksum.h"}
type

function g_hmac_new(digest_type:TGChecksumType; key:Pguchar; key_len:Tgsize):PGHmac;cdecl;external libglib2;
function g_hmac_copy(hmac:PGHmac):PGHmac;cdecl;external libglib2;
function g_hmac_ref(hmac:PGHmac):PGHmac;cdecl;external libglib2;
procedure g_hmac_unref(hmac:PGHmac);cdecl;external libglib2;
procedure g_hmac_update(hmac:PGHmac; data:Pguchar; length:Tgssize);cdecl;external libglib2;
function g_hmac_get_string(hmac:PGHmac):Pgchar;cdecl;external libglib2;
procedure g_hmac_get_digest(hmac:PGHmac; buffer:Pguint8; digest_len:Pgsize);cdecl;external libglib2;
function g_compute_hmac_for_data(digest_type:TGChecksumType; key:Pguchar; key_len:Tgsize; data:Pguchar; length:Tgsize):Pgchar;cdecl;external libglib2;
function g_compute_hmac_for_string(digest_type:TGChecksumType; key:Pguchar; key_len:Tgsize; str:Pgchar; length:Tgssize):Pgchar;cdecl;external libglib2;
function g_compute_hmac_for_bytes(digest_type:TGChecksumType; key:PGBytes; data:PGBytes):Pgchar;cdecl;external libglib2;
{$endif}
{ __G_CHECKSUM_H__  }

// === Konventiert am: 22-6-26 16:36:06 ===


implementation



end.
