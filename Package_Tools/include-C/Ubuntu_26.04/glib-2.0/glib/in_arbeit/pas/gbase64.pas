unit gbase64;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gbase64.h - Base64 coding functions
 *
 *  Copyright (C) 2005  Alexander Larsson <alexl@redhat.com>
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
{$ifndef __G_BASE64_H__}
{$define __G_BASE64_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}

function g_base64_encode_step(in:Pguchar; len:Tgsize; break_lines:Tgboolean; out:Pgchar; state:Pgint; 
           save:Pgint):Tgsize;cdecl;external libglib2;
function g_base64_encode_close(break_lines:Tgboolean; out:Pgchar; state:Pgint; save:Pgint):Tgsize;cdecl;external libglib2;
function g_base64_encode(data:Pguchar; len:Tgsize):Pgchar;cdecl;external libglib2;
function g_base64_decode_step(in:Pgchar; len:Tgsize; out:Pguchar; state:Pgint; save:Pguint):Tgsize;cdecl;external libglib2;
function g_base64_decode(text:Pgchar; out_len:Pgsize):Pguchar;cdecl;external libglib2;
function g_base64_decode_inplace(text:Pgchar; out_len:Pgsize):Pguchar;cdecl;external libglib2;
{$endif}
{ __G_BASE64_H__  }

// === Konventiert am: 22-6-26 16:00:55 ===


implementation



end.
