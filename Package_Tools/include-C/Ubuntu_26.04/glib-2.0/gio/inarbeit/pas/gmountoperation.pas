unit gmountoperation;

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
{$ifndef __G_MOUNT_OPERATION_H__}
{$define __G_MOUNT_OPERATION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
  PGMountOperation = ^TGMountOperation;
  TGMountOperation = record
      parent_instance : TGObject;
      priv : PGMountOperationPrivate;
    end;

{ signals:  }
{*
   * GMountOperationClass::ask_question:
   * @op: a #GMountOperation
   * @message: string containing a message to display to the user
   * @choices: (array zero-terminated=1) (element-type utf8): an array of
   *    strings for each possible choice
   *
   * Virtual implementation of #GMountOperation::ask-question.
    }
{*
   * GMountOperationClass::show_processes:
   * @op: a #GMountOperation
   * @message: string containing a message to display to the user
   * @processes: (element-type GPid): an array of #GPid for processes blocking
   *    the operation
   * @choices: (array zero-terminated=1) (element-type utf8): an array of
   *    strings for each possible choice
   *
   * Virtual implementation of #GMountOperation::show-processes.
   *
   * Since: 2.22
    }
{< private > }
{ Padding for future expansion  }
  PGMountOperationClass = ^TGMountOperationClass;
  TGMountOperationClass = record
      parent_class : TGObjectClass;
      ask_password : procedure (op:PGMountOperation; message:Pchar; default_user:Pchar; default_domain:Pchar; flags:TGAskPasswordFlags);cdecl;
      ask_question : procedure (op:PGMountOperation; message:Pchar; choices:PPchar);cdecl;
      reply : procedure (op:PGMountOperation; result:TGMountOperationResult);cdecl;
      aborted : procedure (op:PGMountOperation);cdecl;
      show_processes : procedure (op:PGMountOperation; message:Pgchar; processes:PGArray; choices:PPgchar);cdecl;
      show_unmount_progress : procedure (op:PGMountOperation; message:Pgchar; time_left:Tgint64; bytes_left:Tgint64);cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
      _g_reserved7 : procedure ;cdecl;
      _g_reserved8 : procedure ;cdecl;
      _g_reserved9 : procedure ;cdecl;
    end;


function g_mount_operation_get_type:TGType;cdecl;external libgio2;
function g_mount_operation_new:PGMountOperation;cdecl;external libgio2;
function g_mount_operation_get_username(op:PGMountOperation):Pchar;cdecl;external libgio2;
procedure g_mount_operation_set_username(op:PGMountOperation; username:Pchar);cdecl;external libgio2;
function g_mount_operation_get_password(op:PGMountOperation):Pchar;cdecl;external libgio2;
procedure g_mount_operation_set_password(op:PGMountOperation; password:Pchar);cdecl;external libgio2;
function g_mount_operation_get_anonymous(op:PGMountOperation):Tgboolean;cdecl;external libgio2;
procedure g_mount_operation_set_anonymous(op:PGMountOperation; anonymous:Tgboolean);cdecl;external libgio2;
function g_mount_operation_get_domain(op:PGMountOperation):Pchar;cdecl;external libgio2;
procedure g_mount_operation_set_domain(op:PGMountOperation; domain:Pchar);cdecl;external libgio2;
function g_mount_operation_get_password_save(op:PGMountOperation):TGPasswordSave;cdecl;external libgio2;
procedure g_mount_operation_set_password_save(op:PGMountOperation; save:TGPasswordSave);cdecl;external libgio2;
function g_mount_operation_get_choice(op:PGMountOperation):longint;cdecl;external libgio2;
procedure g_mount_operation_set_choice(op:PGMountOperation; choice:longint);cdecl;external libgio2;
procedure g_mount_operation_reply(op:PGMountOperation; result:TGMountOperationResult);cdecl;external libgio2;
function g_mount_operation_get_is_tcrypt_hidden_volume(op:PGMountOperation):Tgboolean;cdecl;external libgio2;
procedure g_mount_operation_set_is_tcrypt_hidden_volume(op:PGMountOperation; hidden_volume:Tgboolean);cdecl;external libgio2;
function g_mount_operation_get_is_tcrypt_system_volume(op:PGMountOperation):Tgboolean;cdecl;external libgio2;
procedure g_mount_operation_set_is_tcrypt_system_volume(op:PGMountOperation; system_volume:Tgboolean);cdecl;external libgio2;
function g_mount_operation_get_pim(op:PGMountOperation):Tguint;cdecl;external libgio2;
procedure g_mount_operation_set_pim(op:PGMountOperation; pim:Tguint);cdecl;external libgio2;
{$endif}
{ __G_MOUNT_OPERATION_H__  }

// === Konventiert am: 26-6-26 19:44:31 ===

function G_TYPE_MOUNT_OPERATION : TGType;
function G_MOUNT_OPERATION(obj : Pointer) : PGMountOperation;
function G_MOUNT_OPERATION_CLASS(klass : Pointer) : PGMountOperationClass;
function G_IS_MOUNT_OPERATION(obj : Pointer) : Tgboolean;
function G_IS_MOUNT_OPERATION_CLASS(klass : Pointer) : Tgboolean;
function G_MOUNT_OPERATION_GET_CLASS(obj : Pointer) : PGMountOperationClass;

implementation

function G_TYPE_MOUNT_OPERATION : TGType;
  begin
    G_TYPE_MOUNT_OPERATION:=g_mount_operation_get_type;
  end;

function G_MOUNT_OPERATION(obj : Pointer) : PGMountOperation;
begin
  Result := PGMountOperation(g_type_check_instance_cast(obj, G_TYPE_MOUNT_OPERATION));
end;

function G_MOUNT_OPERATION_CLASS(klass : Pointer) : PGMountOperationClass;
begin
  Result := PGMountOperationClass(g_type_check_class_cast(klass, G_TYPE_MOUNT_OPERATION));
end;

function G_IS_MOUNT_OPERATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_MOUNT_OPERATION);
end;

function G_IS_MOUNT_OPERATION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_MOUNT_OPERATION);
end;

function G_MOUNT_OPERATION_GET_CLASS(obj : Pointer) : PGMountOperationClass;
begin
  Result := PGMountOperationClass(PGTypeInstance(obj)^.g_class);
end;



end.
