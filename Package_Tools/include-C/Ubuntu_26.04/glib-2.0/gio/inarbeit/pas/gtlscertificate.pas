unit gtlscertificate;

interface

uses
  fp_glib2;

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


function g_tls_certificate_get_type:TGType;cdecl;external libgio2;
function g_tls_certificate_new_from_pem(data:Pgchar; length:Tgssize; error:PPGError):PGTlsCertificate;cdecl;external libgio2;
function g_tls_certificate_new_from_pkcs12(data:Pguint8; length:Tgsize; password:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external libgio2;
function g_tls_certificate_new_from_file_with_password(file:Pgchar; password:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external libgio2;
function g_tls_certificate_new_from_file(file:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external libgio2;
function g_tls_certificate_new_from_files(cert_file:Pgchar; key_file:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external libgio2;
function g_tls_certificate_new_from_pkcs11_uris(pkcs11_uri:Pgchar; private_key_pkcs11_uri:Pgchar; error:PPGError):PGTlsCertificate;cdecl;external libgio2;
function g_tls_certificate_list_new_from_file(file:Pgchar; error:PPGError):PGList;cdecl;external libgio2;
function g_tls_certificate_get_issuer(cert:PGTlsCertificate):PGTlsCertificate;cdecl;external libgio2;
function g_tls_certificate_verify(cert:PGTlsCertificate; identity:PGSocketConnectable; trusted_ca:PGTlsCertificate):TGTlsCertificateFlags;cdecl;external libgio2;
function g_tls_certificate_is_same(cert_one:PGTlsCertificate; cert_two:PGTlsCertificate):Tgboolean;cdecl;external libgio2;
function g_tls_certificate_get_not_valid_before(cert:PGTlsCertificate):PGDateTime;cdecl;external libgio2;
function g_tls_certificate_get_not_valid_after(cert:PGTlsCertificate):PGDateTime;cdecl;external libgio2;
function g_tls_certificate_get_subject_name(cert:PGTlsCertificate):Pgchar;cdecl;external libgio2;
function g_tls_certificate_get_issuer_name(cert:PGTlsCertificate):Pgchar;cdecl;external libgio2;
function g_tls_certificate_get_dns_names(cert:PGTlsCertificate):PGPtrArray;cdecl;external libgio2;
function g_tls_certificate_get_ip_addresses(cert:PGTlsCertificate):PGPtrArray;cdecl;external libgio2;
{$endif}
{ __G_TLS_CERTIFICATE_H__  }

// === Konventiert am: 26-6-26 20:04:30 ===

function G_TYPE_TLS_CERTIFICATE : TGType;
function G_TLS_CERTIFICATE(obj : Pointer) : PGTlsCertificate;
function G_TLS_CERTIFICATE_CLASS(klass : Pointer) : PGTlsCertificateClass;
function G_IS_TLS_CERTIFICATE(obj : Pointer) : Tgboolean;
function G_IS_TLS_CERTIFICATE_CLASS(klass : Pointer) : Tgboolean;
function G_TLS_CERTIFICATE_GET_CLASS(obj : Pointer) : PGTlsCertificateClass;

implementation

function G_TYPE_TLS_CERTIFICATE : TGType;
  begin
    G_TYPE_TLS_CERTIFICATE:=g_tls_certificate_get_type;
  end;

function G_TLS_CERTIFICATE(obj : Pointer) : PGTlsCertificate;
begin
  Result := PGTlsCertificate(g_type_check_instance_cast(obj, G_TYPE_TLS_CERTIFICATE));
end;

function G_TLS_CERTIFICATE_CLASS(klass : Pointer) : PGTlsCertificateClass;
begin
  Result := PGTlsCertificateClass(g_type_check_class_cast(klass, G_TYPE_TLS_CERTIFICATE));
end;

function G_IS_TLS_CERTIFICATE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TLS_CERTIFICATE);
end;

function G_IS_TLS_CERTIFICATE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_TLS_CERTIFICATE);
end;

function G_TLS_CERTIFICATE_GET_CLASS(obj : Pointer) : PGTlsCertificateClass;
begin
  Result := PGTlsCertificateClass(PGTypeInstance(obj)^.g_class);
end;



end.
