
unit gtlscertificate;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtlscertificate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtlscertificate.h
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
PGError  = ^GError;
PGList  = ^GList;
PGPtrArray  = ^GPtrArray;
PGSocketConnectable  = ^GSocketConnectable;
PGTlsCertificate  = ^GTlsCertificate;
PGTlsCertificateClass  = ^GTlsCertificateClass;
PGTlsCertificatePrivate  = ^GTlsCertificatePrivate;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Red Hat, Inc.
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
  }
{$ifndef __G_TLS_CERTIFICATE_H__}
{$define __G_TLS_CERTIFICATE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_TLS_CERTIFICATE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CERTIFICATE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CERTIFICATE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_CERTIFICATE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_CERTIFICATE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CERTIFICATE_GET_CLASS(inst : longint) : longint;

type
  PGTlsCertificate = ^TGTlsCertificate;
  TGTlsCertificate = record
      parent_instance : TGObject;
      priv : PGTlsCertificatePrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGTlsCertificateClass = ^TGTlsCertificateClass;
  TGTlsCertificateClass = record
      parent_class : TGObjectClass;
      verify : function (cert:PGTlsCertificate; identity:PGSocketConnectable; trusted_ca:PGTlsCertificate):TGTlsCertificateFlags;cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function g_tls_certificate_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_tls_certificate_new_from_pem(data:Pgchar; length:Tgssize; error:PPGError):PGTlsCertificate;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_tls_certificate_new_from_pkcs12(data:Pguint8; length:Tgsize; password:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_tls_certificate_new_from_file_with_password(file:Pgchar; password:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external;
(* Const before type ignored *)
function g_tls_certificate_new_from_file(file:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_tls_certificate_new_from_files(cert_file:Pgchar; key_file:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_tls_certificate_new_from_pkcs11_uris(pkcs11_uri:Pgchar; private_key_pkcs11_uri:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external;
(* Const before type ignored *)
function g_tls_certificate_list_new_from_file(file:Pgchar; error:PPGError):PGList;cdecl;external;
function g_tls_certificate_get_issuer(cert:PGTlsCertificate):PGTlsCertificate;cdecl;external;
function g_tls_certificate_verify(cert:PGTlsCertificate; identity:PGSocketConnectable; trusted_ca:PGTlsCertificate):TGTlsCertificateFlags;cdecl;external;
function g_tls_certificate_is_same(cert_one:PGTlsCertificate; cert_two:PGTlsCertificate):Tgboolean;cdecl;external;
function g_tls_certificate_get_not_valid_before(cert:PGTlsCertificate):PGDateTime;cdecl;external;
function g_tls_certificate_get_not_valid_after(cert:PGTlsCertificate):PGDateTime;cdecl;external;
function g_tls_certificate_get_subject_name(cert:PGTlsCertificate):Pgchar;cdecl;external;
function g_tls_certificate_get_issuer_name(cert:PGTlsCertificate):Pgchar;cdecl;external;
function g_tls_certificate_get_dns_names(cert:PGTlsCertificate):PGPtrArray;cdecl;external;
function g_tls_certificate_get_ip_addresses(cert:PGTlsCertificate):PGPtrArray;cdecl;external;
{$endif}
{ __G_TLS_CERTIFICATE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TLS_CERTIFICATE : longint; { return type might be wrong }
  begin
    G_TYPE_TLS_CERTIFICATE:=g_tls_certificate_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CERTIFICATE(inst : longint) : longint;
begin
  G_TLS_CERTIFICATE:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_TLS_CERTIFICATE,GTlsCertificate);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CERTIFICATE_CLASS(_class : longint) : longint;
begin
  G_TLS_CERTIFICATE_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_TLS_CERTIFICATE,GTlsCertificateClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_CERTIFICATE(inst : longint) : longint;
begin
  G_IS_TLS_CERTIFICATE:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_TLS_CERTIFICATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_CERTIFICATE_CLASS(_class : longint) : longint;
begin
  G_IS_TLS_CERTIFICATE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_TLS_CERTIFICATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CERTIFICATE_GET_CLASS(inst : longint) : longint;
begin
  G_TLS_CERTIFICATE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_TLS_CERTIFICATE,GTlsCertificateClass);
end;


end.
