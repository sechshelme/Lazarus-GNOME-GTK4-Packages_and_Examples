unit gcancellable;

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
{$ifndef __G_CANCELLABLE_H__}
{$define __G_CANCELLABLE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< private > }
  PGCancellable = ^TGCancellable;
  TGCancellable = record
      parent_instance : TGObject;
      priv : PGCancellablePrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGCancellableClass = ^TGCancellableClass;
  TGCancellableClass = record
      parent_class : TGObjectClass;
      cancelled : procedure (cancellable:PGCancellable);cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_cancellable_get_type:TGType;cdecl;external libgio2;
function g_cancellable_new:PGCancellable;cdecl;external libgio2;
{ These are only safe to call inside a cancellable op  }
function g_cancellable_is_cancelled(cancellable:PGCancellable):Tgboolean;cdecl;external libgio2;
function g_cancellable_set_error_if_cancelled(cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_cancellable_get_fd(cancellable:PGCancellable):longint;cdecl;external libgio2;
function g_cancellable_make_pollfd(cancellable:PGCancellable; pollfd:PGPollFD):Tgboolean;cdecl;external libgio2;
procedure g_cancellable_release_fd(cancellable:PGCancellable);cdecl;external libgio2;
function g_cancellable_source_new(cancellable:PGCancellable):PGSource;cdecl;external libgio2;
function g_cancellable_get_current:PGCancellable;cdecl;external libgio2;
procedure g_cancellable_push_current(cancellable:PGCancellable);cdecl;external libgio2;
procedure g_cancellable_pop_current(cancellable:PGCancellable);cdecl;external libgio2;
procedure g_cancellable_reset(cancellable:PGCancellable);cdecl;external libgio2;
function g_cancellable_connect(cancellable:PGCancellable; callback:TGCallback; data:Tgpointer; data_destroy_func:TGDestroyNotify):Tgulong;cdecl;external libgio2;
procedure g_cancellable_disconnect(cancellable:PGCancellable; handler_id:Tgulong);cdecl;external libgio2;
{ This is safe to call from another thread  }
procedure g_cancellable_cancel(cancellable:PGCancellable);cdecl;external libgio2;
{$endif}
{ __G_CANCELLABLE_H__  }

// === Konventiert am: 26-6-26 16:36:21 ===

function G_TYPE_CANCELLABLE : TGType;
function G_CANCELLABLE(obj : Pointer) : PGCancellable;
function G_CANCELLABLE_CLASS(klass : Pointer) : PGCancellableClass;
function G_IS_CANCELLABLE(obj : Pointer) : Tgboolean;
function G_IS_CANCELLABLE_CLASS(klass : Pointer) : Tgboolean;
function G_CANCELLABLE_GET_CLASS(obj : Pointer) : PGCancellableClass;

implementation

function G_TYPE_CANCELLABLE : TGType;
  begin
    G_TYPE_CANCELLABLE:=g_cancellable_get_type;
  end;

function G_CANCELLABLE(obj : Pointer) : PGCancellable;
begin
  Result := PGCancellable(g_type_check_instance_cast(obj, G_TYPE_CANCELLABLE));
end;

function G_CANCELLABLE_CLASS(klass : Pointer) : PGCancellableClass;
begin
  Result := PGCancellableClass(g_type_check_class_cast(klass, G_TYPE_CANCELLABLE));
end;

function G_IS_CANCELLABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_CANCELLABLE);
end;

function G_IS_CANCELLABLE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_CANCELLABLE);
end;

function G_CANCELLABLE_GET_CLASS(obj : Pointer) : PGCancellableClass;
begin
  Result := PGCancellableClass(PGTypeInstance(obj)^.g_class);
end;



end.
