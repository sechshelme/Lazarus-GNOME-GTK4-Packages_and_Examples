
unit pk_transaction_past;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_transaction_past.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_transaction_past.h
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
PGDateTime  = ^GDateTime;
PPkTransactionPast  = ^PkTransactionPast;
PPkTransactionPastClass  = ^PkTransactionPastClass;
PPkTransactionPastPrivate  = ^PkTransactionPastPrivate;
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

{ was #define dname def_expr }
function PK_TYPE_TRANSACTION_PAST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_PAST(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_PAST_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_TRANSACTION_PAST(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_TRANSACTION_PAST_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_PAST_GET_CLASS(o : longint) : longint;

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


function pk_transaction_past_get_type:TGType;cdecl;external;
function pk_transaction_past_new:PPkTransactionPast;cdecl;external;
(* Const before type ignored *)
function pk_transaction_past_get_cmdline(past:PPkTransactionPast):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_transaction_past_get_data(past:PPkTransactionPast):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_transaction_past_get_id(past:PPkTransactionPast):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_transaction_past_get_timespec(past:PPkTransactionPast):Pgchar;cdecl;external;
function pk_transaction_past_get_datetime(past:PPkTransactionPast):PGDateTime;cdecl;external;
function pk_transaction_past_get_timestamp(past:PPkTransactionPast):Tgint64;cdecl;external;
function pk_transaction_past_get_succeeded(past:PPkTransactionPast):Tgboolean;cdecl;external;
function pk_transaction_past_get_duration(past:PPkTransactionPast):Tguint;cdecl;external;
function pk_transaction_past_get_uid(past:PPkTransactionPast):Tguint;cdecl;external;
function pk_transaction_past_get_role(past:PPkTransactionPast):TPkRoleEnum;cdecl;external;
{$endif}
{ __PK_TRANSACTION_PAST_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_TRANSACTION_PAST : longint; { return type might be wrong }
  begin
    PK_TYPE_TRANSACTION_PAST:=pk_transaction_past_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_PAST(o : longint) : longint;
begin
  PK_TRANSACTION_PAST:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_TRANSACTION_PAST,PkTransactionPast);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_PAST_CLASS(k : longint) : longint;
begin
  PK_TRANSACTION_PAST_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_TRANSACTION_PAST,PkTransactionPastClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_TRANSACTION_PAST(o : longint) : longint;
begin
  PK_IS_TRANSACTION_PAST:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_TRANSACTION_PAST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_TRANSACTION_PAST_CLASS(k : longint) : longint;
begin
  PK_IS_TRANSACTION_PAST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_TRANSACTION_PAST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_TRANSACTION_PAST_GET_CLASS(o : longint) : longint;
begin
  PK_TRANSACTION_PAST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_TRANSACTION_PAST,PkTransactionPastClass);
end;


end.
