
unit gtlsdatabase;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtlsdatabase.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtlsdatabase.h
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
PGAsyncResult  = ^GAsyncResult;
PGByteArray  = ^GByteArray;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGList  = ^GList;
PGSocketConnectable  = ^GSocketConnectable;
PGTlsCertificate  = ^GTlsCertificate;
PGTlsDatabase  = ^GTlsDatabase;
PGTlsDatabaseClass  = ^GTlsDatabaseClass;
PGTlsDatabasePrivate  = ^GTlsDatabasePrivate;
PGTlsInteraction  = ^GTlsInteraction;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Collabora, Ltd.
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
 * Author: Stef Walter <stefw@collabora.co.uk>
  }
{$ifndef __G_TLS_DATABASE_H__}
{$define __G_TLS_DATABASE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

const
  G_TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER = '1.3.6.1.5.5.7.3.1';  
  G_TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT = '1.3.6.1.5.5.7.3.2';  

{ was #define dname def_expr }
function G_TYPE_TLS_DATABASE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_DATABASE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_DATABASE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_DATABASE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_DATABASE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_DATABASE_GET_CLASS(inst : longint) : longint;

type
  PGTlsDatabase = ^TGTlsDatabase;
  TGTlsDatabase = record
      parent_instance : TGObject;
      priv : PGTlsDatabasePrivate;
    end;

{ virtual methods  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ Padding for future expansion  }
  PGTlsDatabaseClass = ^TGTlsDatabaseClass;
  TGTlsDatabaseClass = record
      parent_class : TGObjectClass;
      verify_chain : function (self:PGTlsDatabase; chain:PGTlsCertificate; purpose:Pgchar; identity:PGSocketConnectable; interaction:PGTlsInteraction; 
                   flags:TGTlsDatabaseVerifyFlags; cancellable:PGCancellable; error:PPGError):TGTlsCertificateFlags;cdecl;
      verify_chain_async : procedure (self:PGTlsDatabase; chain:PGTlsCertificate; purpose:Pgchar; identity:PGSocketConnectable; interaction:PGTlsInteraction; 
                    flags:TGTlsDatabaseVerifyFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      verify_chain_finish : function (self:PGTlsDatabase; result:PGAsyncResult; error:PPGError):TGTlsCertificateFlags;cdecl;
      create_certificate_handle : function (self:PGTlsDatabase; certificate:PGTlsCertificate):Pgchar;cdecl;
      lookup_certificate_for_handle : function (self:PGTlsDatabase; handle:Pgchar; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
                   error:PPGError):PGTlsCertificate;cdecl;
      lookup_certificate_for_handle_async : procedure (self:PGTlsDatabase; handle:Pgchar; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      lookup_certificate_for_handle_finish : function (self:PGTlsDatabase; result:PGAsyncResult; error:PPGError):PGTlsCertificate;cdecl;
      lookup_certificate_issuer : function (self:PGTlsDatabase; certificate:PGTlsCertificate; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
                   error:PPGError):PGTlsCertificate;cdecl;
      lookup_certificate_issuer_async : procedure (self:PGTlsDatabase; certificate:PGTlsCertificate; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      lookup_certificate_issuer_finish : function (self:PGTlsDatabase; result:PGAsyncResult; error:PPGError):PGTlsCertificate;cdecl;
      lookup_certificates_issued_by : function (self:PGTlsDatabase; issuer_raw_dn:PGByteArray; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
                   error:PPGError):PGList;cdecl;
      lookup_certificates_issued_by_async : procedure (self:PGTlsDatabase; issuer_raw_dn:PGByteArray; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      lookup_certificates_issued_by_finish : function (self:PGTlsDatabase; result:PGAsyncResult; error:PPGError):PGList;cdecl;
      padding : array[0..15] of Tgpointer;
    end;


function g_tls_database_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_tls_database_verify_chain(self:PGTlsDatabase; chain:PGTlsCertificate; purpose:Pgchar; identity:PGSocketConnectable; interaction:PGTlsInteraction; 
           flags:TGTlsDatabaseVerifyFlags; cancellable:PGCancellable; error:PPGError):TGTlsCertificateFlags;cdecl;external;
(* Const before type ignored *)
procedure g_tls_database_verify_chain_async(self:PGTlsDatabase; chain:PGTlsCertificate; purpose:Pgchar; identity:PGSocketConnectable; interaction:PGTlsInteraction; 
            flags:TGTlsDatabaseVerifyFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_tls_database_verify_chain_finish(self:PGTlsDatabase; result:PGAsyncResult; error:PPGError):TGTlsCertificateFlags;cdecl;external;
function g_tls_database_create_certificate_handle(self:PGTlsDatabase; certificate:PGTlsCertificate):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_tls_database_lookup_certificate_for_handle(self:PGTlsDatabase; handle:Pgchar; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
           error:PPGError):PGTlsCertificate;cdecl;external;
(* Const before type ignored *)
procedure g_tls_database_lookup_certificate_for_handle_async(self:PGTlsDatabase; handle:Pgchar; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_tls_database_lookup_certificate_for_handle_finish(self:PGTlsDatabase; result:PGAsyncResult; error:PPGError):PGTlsCertificate;cdecl;external;
function g_tls_database_lookup_certificate_issuer(self:PGTlsDatabase; certificate:PGTlsCertificate; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
           error:PPGError):PGTlsCertificate;cdecl;external;
procedure g_tls_database_lookup_certificate_issuer_async(self:PGTlsDatabase; certificate:PGTlsCertificate; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_tls_database_lookup_certificate_issuer_finish(self:PGTlsDatabase; result:PGAsyncResult; error:PPGError):PGTlsCertificate;cdecl;external;
function g_tls_database_lookup_certificates_issued_by(self:PGTlsDatabase; issuer_raw_dn:PGByteArray; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
           error:PPGError):PGList;cdecl;external;
procedure g_tls_database_lookup_certificates_issued_by_async(self:PGTlsDatabase; issuer_raw_dn:PGByteArray; interaction:PGTlsInteraction; flags:TGTlsDatabaseLookupFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_tls_database_lookup_certificates_issued_by_finish(self:PGTlsDatabase; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
{$endif}
{ __G_TLS_DATABASE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TLS_DATABASE : longint; { return type might be wrong }
  begin
    G_TYPE_TLS_DATABASE:=g_tls_database_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_DATABASE(inst : longint) : longint;
begin
  G_TLS_DATABASE:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_TLS_DATABASE,GTlsDatabase);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_DATABASE_CLASS(_class : longint) : longint;
begin
  G_TLS_DATABASE_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_TLS_DATABASE,GTlsDatabaseClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_DATABASE(inst : longint) : longint;
begin
  G_IS_TLS_DATABASE:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_TLS_DATABASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_DATABASE_CLASS(_class : longint) : longint;
begin
  G_IS_TLS_DATABASE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_TLS_DATABASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_DATABASE_GET_CLASS(inst : longint) : longint;
begin
  G_TLS_DATABASE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_TLS_DATABASE,GTlsDatabaseClass);
end;


end.
