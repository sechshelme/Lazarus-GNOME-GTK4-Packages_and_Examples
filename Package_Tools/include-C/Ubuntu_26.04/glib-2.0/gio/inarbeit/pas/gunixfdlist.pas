unit gunixfdlist;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2009 Codethink Limited
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_UNIX_FD_LIST_H__}
{$define __G_UNIX_FD_LIST_H__}
{$include <gio/gio.h>}

type
{< private > }
{ Padding for future expansion  }
  PGUnixFDListClass = ^TGUnixFDListClass;
  TGUnixFDListClass = record
      parent_class : TGObjectClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;

  PGUnixFDList = ^TGUnixFDList;
  TGUnixFDList = record
      parent_instance : TGObject;
      priv : PGUnixFDListPrivate;
    end;


function g_unix_fd_list_get_type:TGType;cdecl;external libgio2;
function g_unix_fd_list_new:PGUnixFDList;cdecl;external libgio2;
function g_unix_fd_list_new_from_array(fds:Pgint; n_fds:Tgint):PGUnixFDList;cdecl;external libgio2;
function g_unix_fd_list_append(list:PGUnixFDList; fd:Tgint; error:PPGError):Tgint;cdecl;external libgio2;
function g_unix_fd_list_get_length(list:PGUnixFDList):Tgint;cdecl;external libgio2;
function g_unix_fd_list_get(list:PGUnixFDList; index_:Tgint; error:PPGError):Tgint;cdecl;external libgio2;
function g_unix_fd_list_peek_fds(list:PGUnixFDList; length:Pgint):Pgint;cdecl;external libgio2;
function g_unix_fd_list_steal_fds(list:PGUnixFDList; length:Pgint):Pgint;cdecl;external libgio2;
{$endif}
{ __G_UNIX_FD_LIST_H__  }

// === Konventiert am: 26-6-26 20:07:13 ===

function G_TYPE_UNIX_FD_LIST : TGType;
function G_UNIX_FD_LIST(obj : Pointer) : PGUnixFDList;
function G_UNIX_FD_LIST_CLASS(klass : Pointer) : PGUnixFDListClass;
function G_IS_UNIX_FD_LIST(obj : Pointer) : Tgboolean;
function G_IS_UNIX_FD_LIST_CLASS(klass : Pointer) : Tgboolean;
function G_UNIX_FD_LIST_GET_CLASS(obj : Pointer) : PGUnixFDListClass;

implementation

function G_TYPE_UNIX_FD_LIST : TGType;
  begin
    G_TYPE_UNIX_FD_LIST:=g_unix_fd_list_get_type;
  end;

function G_UNIX_FD_LIST(obj : Pointer) : PGUnixFDList;
begin
  Result := PGUnixFDList(g_type_check_instance_cast(obj, G_TYPE_UNIX_FD_LIST));
end;

function G_UNIX_FD_LIST_CLASS(klass : Pointer) : PGUnixFDListClass;
begin
  Result := PGUnixFDListClass(g_type_check_class_cast(klass, G_TYPE_UNIX_FD_LIST));
end;

function G_IS_UNIX_FD_LIST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_UNIX_FD_LIST);
end;

function G_IS_UNIX_FD_LIST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_UNIX_FD_LIST);
end;

function G_UNIX_FD_LIST_GET_CLASS(obj : Pointer) : PGUnixFDListClass;
begin
  Result := PGUnixFDListClass(PGTypeInstance(obj)^.g_class);
end;



end.
