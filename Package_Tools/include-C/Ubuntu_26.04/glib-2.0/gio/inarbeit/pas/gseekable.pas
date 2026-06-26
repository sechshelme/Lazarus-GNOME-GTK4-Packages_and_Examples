unit gseekable;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_SEEKABLE_H__}
{$define __G_SEEKABLE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{*
 * GSeekableIface:
 * @g_iface: The parent interface.
 * @tell: Tells the current location within a stream.
 * @can_seek: Checks if seeking is supported by the stream.
 * @seek: Seeks to a location within a stream.
 * @can_truncate: Checks if truncation is supported by the stream.
 * @truncate_fn: Truncates a stream.
 *
 * Provides an interface for implementing seekable functionality on I/O Streams.
 * }
{ Virtual Table  }
{ TODO: Async seek/truncate  }
  PGSeekableIface = ^TGSeekableIface;
  TGSeekableIface = record
      g_iface : TGTypeInterface;
      tell : function (seekable:PGSeekable):Tgoffset;cdecl;
      can_seek : function (seekable:PGSeekable):Tgboolean;cdecl;
      seek : function (seekable:PGSeekable; offset:Tgoffset; _type:TGSeekType; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      can_truncate : function (seekable:PGSeekable):Tgboolean;cdecl;
      truncate_fn : function (seekable:PGSeekable; offset:Tgoffset; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
    end;


function g_seekable_get_type:TGType;cdecl;external libgio2;
function g_seekable_tell(seekable:PGSeekable):Tgoffset;cdecl;external libgio2;
function g_seekable_can_seek(seekable:PGSeekable):Tgboolean;cdecl;external libgio2;
function g_seekable_seek(seekable:PGSeekable; offset:Tgoffset; _type:TGSeekType; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_seekable_can_truncate(seekable:PGSeekable):Tgboolean;cdecl;external libgio2;
function g_seekable_truncate(seekable:PGSeekable; offset:Tgoffset; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_SEEKABLE_H__  }

// === Konventiert am: 26-6-26 19:52:41 ===

function G_TYPE_SEEKABLE : TGType;
function G_SEEKABLE(obj : Pointer) : PGSeekable;
function G_IS_SEEKABLE(obj : Pointer) : Tgboolean;
function G_SEEKABLE_GET_IFACE(obj : Pointer) : PGSeekableIface;

implementation

function G_TYPE_SEEKABLE : TGType;
  begin
    G_TYPE_SEEKABLE:=g_seekable_get_type;
  end;

function G_SEEKABLE(obj : Pointer) : PGSeekable;
begin
  Result := PGSeekable(g_type_check_instance_cast(obj, G_TYPE_SEEKABLE));
end;

function G_IS_SEEKABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SEEKABLE);
end;

function G_SEEKABLE_GET_IFACE(obj : Pointer) : PGSeekableIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_SEEKABLE);
end;



end.
