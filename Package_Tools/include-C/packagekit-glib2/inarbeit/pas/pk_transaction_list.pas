unit pk_transaction_list;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2007-2009 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_TRANSACTION_LIST_H}
{$define __PK_TRANSACTION_LIST_H}
{$include <glib-object.h>}

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkTransactionList, g_object_unref) }
{$endif}
type
  PPkTransactionList = ^TPkTransactionList;
  TPkTransactionList = record
      parent : TGObject;
      priv : PPkTransactionListPrivate;
    end;

  PPkTransactionListClass = ^TPkTransactionListClass;
  TPkTransactionListClass = record
      parent_class : TGObjectClass;
      added : procedure (tlist:PPkTransactionList; tid:Pgchar);cdecl;
      removed : procedure (tlist:PPkTransactionList; tid:Pgchar);cdecl;
    end;


function pk_transaction_list_get_type:TGType;cdecl;external libpackagekit ;
function pk_transaction_list_new:PPkTransactionList;cdecl;external libpackagekit ;
function pk_transaction_list_get_ids(tlist:PPkTransactionList):^Pgchar;cdecl;external libpackagekit ;
{$endif}
{ __PK_TRANSACTION_LIST_H  }

// === Konventiert am: 7-9-26 15:13:25 ===

function PK_TYPE_TRANSACTION_LIST : TGType;
function PK_TRANSACTION_LIST(obj : Pointer) : PPkTransactionList;
function PK_TRANSACTION_LIST_CLASS(klass : Pointer) : PPkTransactionListClass;
function PK_IS_TRANSACTION_LIST(obj : Pointer) : Tgboolean;
function PK_IS_TRANSACTION_LIST_CLASS(klass : Pointer) : Tgboolean;
function PK_TRANSACTION_LIST_GET_CLASS(obj : Pointer) : PPkTransactionListClass;

implementation

function PK_TYPE_TRANSACTION_LIST : TGType;
  begin
    PK_TYPE_TRANSACTION_LIST:=pk_transaction_list_get_type;
  end;

function PK_TRANSACTION_LIST(obj : Pointer) : PPkTransactionList;
begin
  Result := PPkTransactionList(g_type_check_instance_cast(obj, PK_TYPE_TRANSACTION_LIST));
end;

function PK_TRANSACTION_LIST_CLASS(klass : Pointer) : PPkTransactionListClass;
begin
  Result := PPkTransactionListClass(g_type_check_class_cast(klass, PK_TYPE_TRANSACTION_LIST));
end;

function PK_IS_TRANSACTION_LIST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_TRANSACTION_LIST);
end;

function PK_IS_TRANSACTION_LIST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_TRANSACTION_LIST);
end;

function PK_TRANSACTION_LIST_GET_CLASS(obj : Pointer) : PPkTransactionListClass;
begin
  Result := PPkTransactionListClass(PGTypeInstance(obj)^.g_class);
end;



end.
