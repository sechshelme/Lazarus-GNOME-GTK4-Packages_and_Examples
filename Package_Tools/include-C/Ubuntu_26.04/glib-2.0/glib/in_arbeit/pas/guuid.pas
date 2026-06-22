unit guuid;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ guuid.h - UUID functions
 *
 * Copyright (C) 2013-2015, 2017 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of the
 * licence, or (at your option) any later version.
 *
 * This is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301
 * USA.
 *
 * Authors: Marc-André Lureau <marcandre.lureau@redhat.com>
  }
{$ifndef __G_UUID_H__}
{$define __G_UUID_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}

function g_uuid_string_is_valid(str:Pgchar):Tgboolean;cdecl;external libglib2;
function g_uuid_string_random:Pgchar;cdecl;external libglib2;
{$endif}
{ __G_UUID_H__  }

// === Konventiert am: 22-6-26 20:02:59 ===


implementation



end.
