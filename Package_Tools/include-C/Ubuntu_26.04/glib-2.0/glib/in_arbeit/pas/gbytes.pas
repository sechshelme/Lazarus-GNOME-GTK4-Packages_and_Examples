unit gbytes;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009, 2010 Codethink Limited
 * Copyright © 2011 Collabora Ltd.
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
 *         Stef Walter <stefw@collabora.co.uk>
  }
{$ifndef __G_BYTES_H__}
{$define __G_BYTES_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{$include <glib/garray.h>}

function g_bytes_new(data:Tgconstpointer; size:Tgsize):PGBytes;cdecl;external libglib2;
function g_bytes_new_take(data:Tgpointer; size:Tgsize):PGBytes;cdecl;external libglib2;
function g_bytes_new_static(data:Tgconstpointer; size:Tgsize):PGBytes;cdecl;external libglib2;
function g_bytes_new_with_free_func(data:Tgconstpointer; size:Tgsize; free_func:TGDestroyNotify; user_data:Tgpointer):PGBytes;cdecl;external libglib2;
function g_bytes_new_from_bytes(bytes:PGBytes; offset:Tgsize; length:Tgsize):PGBytes;cdecl;external libglib2;
function g_bytes_get_data(bytes:PGBytes; size:Pgsize):Tgconstpointer;cdecl;external libglib2;
function g_bytes_get_size(bytes:PGBytes):Tgsize;cdecl;external libglib2;
function g_bytes_ref(bytes:PGBytes):PGBytes;cdecl;external libglib2;
procedure g_bytes_unref(bytes:PGBytes);cdecl;external libglib2;
function g_bytes_unref_to_data(bytes:PGBytes; size:Pgsize):Tgpointer;cdecl;external libglib2;
function g_bytes_unref_to_array(bytes:PGBytes):PGByteArray;cdecl;external libglib2;
function g_bytes_hash(bytes:Tgconstpointer):Tguint;cdecl;external libglib2;
function g_bytes_equal(bytes1:Tgconstpointer; bytes2:Tgconstpointer):Tgboolean;cdecl;external libglib2;
function g_bytes_compare(bytes1:Tgconstpointer; bytes2:Tgconstpointer):Tgint;cdecl;external libglib2;
function g_bytes_get_region(bytes:PGBytes; element_size:Tgsize; offset:Tgsize; n_elements:Tgsize):Tgconstpointer;cdecl;external libglib2;
{$endif}
{ __G_BYTES_H__  }

// === Konventiert am: 22-6-26 16:01:12 ===


implementation



end.
