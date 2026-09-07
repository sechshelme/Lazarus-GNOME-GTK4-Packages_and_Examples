unit pk_transaction_past;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009 Richard Hughes <richard@hughsie.com>
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
{$ifndef __PK_TRANSACTION_PAST_H}
{$define __PK_TRANSACTION_PAST_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-enum.h>}
{$include <packagekit-glib2/pk-source.h>}

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkTransactionPast, g_object_unref) }
{$endif}
type
  PPkTransactionPast = ^TPkTransactionPast;
  TPkTransactionPast = record
      parent : TPkSource;
      priv : PPkTransactionPastPrivate;
    end;

{ padding for future expansion  }
  PPkTransactionPastClass = ^TPkTransactionPastClass;
  TPkTransactionPastClass = record
      parent_class : TPkSourceClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_transaction_past_get_type:TGType;cdecl;external libpackagekit ;
function pk_transaction_past_new:PPkTransactionPast;cdecl;external libpackagekit ;
function pk_transaction_past_get_cmdline(past:PPkTransactionPast):Pgchar;cdecl;external libpackagekit ;
function pk_transaction_past_get_data(past:PPkTransactionPast):Pgchar;cdecl;external libpackagekit ;
function pk_transaction_past_get_id(past:PPkTransactionPast):Pgchar;cdecl;external libpackagekit ;
function pk_transaction_past_get_timespec(past:PPkTransactionPast):Pgchar;cdecl;external libpackagekit ;
function pk_transaction_past_get_datetime(past:PPkTransactionPast):PGDateTime;cdecl;external libpackagekit ;
function pk_transaction_past_get_timestamp(past:PPkTransactionPast):Tgint64;cdecl;external libpackagekit ;
function pk_transaction_past_get_succeeded(past:PPkTransactionPast):Tgboolean;cdecl;external libpackagekit ;
function pk_transaction_past_get_duration(past:PPkTransactionPast):Tguint;cdecl;external libpackagekit ;
function pk_transaction_past_get_uid(past:PPkTransactionPast):Tguint;cdecl;external libpackagekit ;
function pk_transaction_past_get_role(past:PPkTransactionPast):TPkRoleEnum;cdecl;external libpackagekit ;
{$endif}
{ __PK_TRANSACTION_PAST_H  }

// === Konventiert am: 7-9-26 15:13:21 ===

function PK_TYPE_TRANSACTION_PAST : TGType;
function PK_TRANSACTION_PAST(obj : Pointer) : PPkTransactionPast;
function PK_TRANSACTION_PAST_CLASS(klass : Pointer) : PPkTransactionPastClass;
function PK_IS_TRANSACTION_PAST(obj : Pointer) : Tgboolean;
function PK_IS_TRANSACTION_PAST_CLASS(klass : Pointer) : Tgboolean;
function PK_TRANSACTION_PAST_GET_CLASS(obj : Pointer) : PPkTransactionPastClass;

implementation

function PK_TYPE_TRANSACTION_PAST : TGType;
  begin
    PK_TYPE_TRANSACTION_PAST:=pk_transaction_past_get_type;
  end;

function PK_TRANSACTION_PAST(obj : Pointer) : PPkTransactionPast;
begin
  Result := PPkTransactionPast(g_type_check_instance_cast(obj, PK_TYPE_TRANSACTION_PAST));
end;

function PK_TRANSACTION_PAST_CLASS(klass : Pointer) : PPkTransactionPastClass;
begin
  Result := PPkTransactionPastClass(g_type_check_class_cast(klass, PK_TYPE_TRANSACTION_PAST));
end;

function PK_IS_TRANSACTION_PAST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_TRANSACTION_PAST);
end;

function PK_IS_TRANSACTION_PAST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_TRANSACTION_PAST);
end;

function PK_TRANSACTION_PAST_GET_CLASS(obj : Pointer) : PPkTransactionPastClass;
begin
  Result := PPkTransactionPastClass(PGTypeInstance(obj)^.g_class);
end;



end.
