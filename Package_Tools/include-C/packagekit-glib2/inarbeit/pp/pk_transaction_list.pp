
unit pk_transaction_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_transaction_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_transaction_list.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PPkTransactionList  = ^PkTransactionList;
PPkTransactionListClass  = ^PkTransactionListClass;
PPkTransactionListPrivate  = ^PkTransactionListPrivate;
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

{ was #define dname def_expr }
function PK_TYPE_TRANSACTION_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_LIST(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_LIST_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_TRANSACTION_LIST(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_TRANSACTION_LIST_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_LIST_GET_CLASS(o : longint) : longint;

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

(* Const before type ignored *)
(* Const before type ignored *)
  PPkTransactionListClass = ^TPkTransactionListClass;
  TPkTransactionListClass = record
      parent_class : TGObjectClass;
      added : procedure (tlist:PPkTransactionList; tid:Pgchar);cdecl;
      removed : procedure (tlist:PPkTransactionList; tid:Pgchar);cdecl;
    end;


function pk_transaction_list_get_type:TGType;cdecl;external;
function pk_transaction_list_new:PPkTransactionList;cdecl;external;
function pk_transaction_list_get_ids(tlist:PPkTransactionList):^Pgchar;cdecl;external;
{$endif}
{ __PK_TRANSACTION_LIST_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_TRANSACTION_LIST : longint; { return type might be wrong }
  begin
    PK_TYPE_TRANSACTION_LIST:=pk_transaction_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_LIST(o : longint) : longint;
begin
  PK_TRANSACTION_LIST:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_TRANSACTION_LIST,PkTransactionList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_LIST_CLASS(k : longint) : longint;
begin
  PK_TRANSACTION_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_TRANSACTION_LIST,PkTransactionListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_TRANSACTION_LIST(o : longint) : longint;
begin
  PK_IS_TRANSACTION_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_TRANSACTION_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_TRANSACTION_LIST_CLASS(k : longint) : longint;
begin
  PK_IS_TRANSACTION_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_TRANSACTION_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_LIST_GET_CLASS(o : longint) : longint;
begin
  PK_TRANSACTION_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_TRANSACTION_LIST,PkTransactionListClass);
end;


end.
