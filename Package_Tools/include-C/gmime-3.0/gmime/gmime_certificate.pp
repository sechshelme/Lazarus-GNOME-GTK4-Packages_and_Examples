
unit gmime_certificate;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_certificate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_certificate.h
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
Pchar  = ^char;
PGMimeCertificate  = ^GMimeCertificate;
PGMimeCertificateClass  = ^GMimeCertificateClass;
PGMimeCertificateList  = ^GMimeCertificateList;
PGMimeCertificateListClass  = ^GMimeCertificateListClass;
PGMimeDigestAlgo  = ^GMimeDigestAlgo;
PGMimePubKeyAlgo  = ^GMimePubKeyAlgo;
PGMimeTrust  = ^GMimeTrust;
PGMimeValidity  = ^GMimeValidity;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_CERTIFICATE_H__}
{$define __GMIME_CERTIFICATE_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <time.h>}

{ was #define dname def_expr }
function GMIME_TYPE_CERTIFICATE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CERTIFICATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CERTIFICATE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GMIME_TYPE_CERTIFICATE_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CERTIFICATE_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CERTIFICATE_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_LIST_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeDigestAlgo:
 * @GMIME_DIGEST_ALGO_DEFAULT: The default hash algorithm.
 * @GMIME_DIGEST_ALGO_MD5: The MD5 hash algorithm.
 * @GMIME_DIGEST_ALGO_SHA1: The SHA-1 hash algorithm.
 * @GMIME_DIGEST_ALGO_RIPEMD160: The RIPEMD-160 hash algorithm.
 * @GMIME_DIGEST_ALGO_MD2: The MD2 hash algorithm.
 * @GMIME_DIGEST_ALGO_TIGER192: The TIGER-192 hash algorithm.
 * @GMIME_DIGEST_ALGO_HAVAL5160: The HAVAL-5-160 hash algorithm.
 * @GMIME_DIGEST_ALGO_SHA256: The SHA-256 hash algorithm.
 * @GMIME_DIGEST_ALGO_SHA384: The SHA-384 hash algorithm.
 * @GMIME_DIGEST_ALGO_SHA512: The SHA-512 hash algorithm.
 * @GMIME_DIGEST_ALGO_SHA224: The SHA-224 hash algorithm.
 * @GMIME_DIGEST_ALGO_MD4: The MD4 hash algorithm.
 * @GMIME_DIGEST_ALGO_CRC32: The CRC32 hash algorithm.
 * @GMIME_DIGEST_ALGO_CRC32_RFC1510: The rfc1510 CRC32 hash algorithm.
 * @GMIME_DIGEST_ALGO_CRC32_RFC2440: The rfc2440 CRC32 hash algorithm.
 *
 * A hash algorithm.
 * }

  PGMimeDigestAlgo = ^TGMimeDigestAlgo;
  TGMimeDigestAlgo =  Longint;
  Const
    GMIME_DIGEST_ALGO_DEFAULT = 0;
    GMIME_DIGEST_ALGO_MD5 = 1;
    GMIME_DIGEST_ALGO_SHA1 = 2;
    GMIME_DIGEST_ALGO_RIPEMD160 = 3;
    GMIME_DIGEST_ALGO_MD2 = 5;
    GMIME_DIGEST_ALGO_TIGER192 = 6;
    GMIME_DIGEST_ALGO_HAVAL5160 = 7;
    GMIME_DIGEST_ALGO_SHA256 = 8;
    GMIME_DIGEST_ALGO_SHA384 = 9;
    GMIME_DIGEST_ALGO_SHA512 = 10;
    GMIME_DIGEST_ALGO_SHA224 = 11;
    GMIME_DIGEST_ALGO_MD4 = 301;
    GMIME_DIGEST_ALGO_CRC32 = 302;
    GMIME_DIGEST_ALGO_CRC32_RFC1510 = 303;
    GMIME_DIGEST_ALGO_CRC32_RFC2440 = 304;
;
{*
 * GMimePubKeyAlgo:
 * @GMIME_PUBKEY_ALGO_DEFAULT: The default public-key algorithm.
 * @GMIME_PUBKEY_ALGO_RSA: The RSA algorithm.
 * @GMIME_PUBKEY_ALGO_RSA_E: An encryption-only RSA algorithm.
 * @GMIME_PUBKEY_ALGO_RSA_S: A signature-only RSA algorithm.
 * @GMIME_PUBKEY_ALGO_ELG_E: An encryption-only ElGamal algorithm.
 * @GMIME_PUBKEY_ALGO_DSA: The DSA algorithm.
 * @GMIME_PUBKEY_ALGO_ECC: The Eliptic Curve algorithm.
 * @GMIME_PUBKEY_ALGO_ELG: The ElGamal algorithm.
 * @GMIME_PUBKEY_ALGO_ECDSA: The Eliptic Curve + DSA algorithm.
 * @GMIME_PUBKEY_ALGO_ECDH: The Eliptic Curve + Diffie Helman algorithm.
 * @GMIME_PUBKEY_ALGO_EDDSA: The Eliptic Curve + DSA algorithm.
 *
 * A public-key algorithm.
 * }
type
  PGMimePubKeyAlgo = ^TGMimePubKeyAlgo;
  TGMimePubKeyAlgo =  Longint;
  Const
    GMIME_PUBKEY_ALGO_DEFAULT = 0;
    GMIME_PUBKEY_ALGO_RSA = 1;
    GMIME_PUBKEY_ALGO_RSA_E = 2;
    GMIME_PUBKEY_ALGO_RSA_S = 3;
    GMIME_PUBKEY_ALGO_ELG_E = 16;
    GMIME_PUBKEY_ALGO_DSA = 17;
    GMIME_PUBKEY_ALGO_ECC = 18;
    GMIME_PUBKEY_ALGO_ELG = 20;
    GMIME_PUBKEY_ALGO_ECDSA = 301;
    GMIME_PUBKEY_ALGO_ECDH = 302;
    GMIME_PUBKEY_ALGO_EDDSA = 303;
;
{*
 * GMimeTrust:
 * @GMIME_TRUST_UNKNOWN: We do not know whether to rely on identity assertions made by the certificate.
 * @GMIME_TRUST_UNDEFINED: We do not have enough information to decide whether to rely on identity assertions made by the certificate.
 * @GMIME_TRUST_NEVER: We should never rely on identity assertions made by the certificate.
 * @GMIME_TRUST_MARGINAL: We can rely on identity assertions made by this certificate as long as they are corroborated by other marginally-trusted certificates.
 * @GMIME_TRUST_FULL: We can rely on identity assertions made by this certificate.
 * @GMIME_TRUST_ULTIMATE: This certificate is an undeniable root of trust (e.g. normally, this is a certificate controlled by the user themselves).
 *
 * The trust level of a certificate.  Trust level tries to answer the
 * question: "How much is the user willing to rely on cryptographic
 * identity assertions made by the owner of this certificate?"
 * 
 * By way of comparison with web browser X.509 certificate validation
 * stacks, the certificate of a "Root CA" has @GMIME_TRUST_ULTIMATE,
 * while the certificate of an intermediate CA has @GMIME_TRUST_FULL,
 * and an end-entity certificate (e.g., with CA:FALSE set) would have
 * @GMIME_TRUST_NEVER.
 * }
type
  PGMimeTrust = ^TGMimeTrust;
  TGMimeTrust =  Longint;
  Const
    GMIME_TRUST_UNKNOWN = 0;
    GMIME_TRUST_UNDEFINED = 1;
    GMIME_TRUST_NEVER = 2;
    GMIME_TRUST_MARGINAL = 3;
    GMIME_TRUST_FULL = 4;
    GMIME_TRUST_ULTIMATE = 5;
;
{*
 * GMimeValidity:
 * @GMIME_VALIDITY_UNKNOWN: The User ID of the certificate is of unknown validity.
 * @GMIME_VALIDITY_UNDEFINED: The User ID of the certificate is undefined.
 * @GMIME_VALIDITY_NEVER: The User ID of the certificate is never to be treated as valid.
 * @GMIME_VALIDITY_MARGINAL: The User ID of the certificate is marginally valid (e.g. it has been certified by only one marginally-trusted party).
 * @GMIME_VALIDITY_FULL: The User ID of the certificate is fully valid.
 * @GMIME_VALIDITY_ULTIMATE: The User ID of the certificate is ultimately valid (i.e., usually the certificate belongs to the local user themselves).
 *
 * The validity level of a certificate's User ID.  Validity level
 * tries to answer the question: "How strongly do we believe that this
 * certificate belongs to the party it says it belongs to?"
 *
 * Note that some OpenPGP certificates have multiple User IDs, and
 * each User ID may have a different validity level (e.g. depending on
 * which third parties have certified which User IDs, and which third
 * parties the local user has chosen to trust).
 *
 * Similarly, an X.509 certificate can have multiple SubjectAltNames,
 * and each name may also have a different validity level (e.g. if the
 * issuing CA is bound by name constraints).
 *
 * Note that the GMime API currently only exposes the highest-validty
 * User ID for any given certificate.
 * }
type
  PGMimeValidity = ^TGMimeValidity;
  TGMimeValidity =  Longint;
  Const
    GMIME_VALIDITY_UNKNOWN = 0;
    GMIME_VALIDITY_UNDEFINED = 1;
    GMIME_VALIDITY_NEVER = 2;
    GMIME_VALIDITY_MARGINAL = 3;
    GMIME_VALIDITY_FULL = 4;
    GMIME_VALIDITY_ULTIMATE = 5;
;
{*
 * GMimeCertificate:
 * @parent_object: parent #GObject
 * @pubkey_algo: The public-key algorithm used by the certificate, if known.
 * @digest_algo: The digest algorithm used by the certificate, if known.
 * @trust: The level of trust assigned to this certificate.
 * @issuer_serial: The issuer of the certificate, if known.
 * @issuer_name: The issuer of the certificate, if known.
 * @fingerprint: A hex string representing the certificate's fingerprint.
 * @created: The creation date of the certificate.
 * @expires: The expiration date of the certificate.
 * @keyid: The certificate's key id.
 * @email: The email address of the person or entity.
 * @name: The name of the person or entity.
 * @user_id: The full User ID of the certificate.
 * @id_validity: the validity of the email address, name, and User ID.
 *
 * An object containing useful information about a certificate.
 * }
type
  PGMimeCertificate = ^TGMimeCertificate;
  TGMimeCertificate = record
      parent_object : TGObject;
      pubkey_algo : TGMimePubKeyAlgo;
      digest_algo : TGMimeDigestAlgo;
      trust : TGMimeTrust;
      issuer_serial : Pchar;
      issuer_name : Pchar;
      fingerprint : Pchar;
      created : Ttime_t;
      expires : Ttime_t;
      keyid : Pchar;
      email : Pchar;
      name : Pchar;
      user_id : Pchar;
      id_validity : TGMimeValidity;
    end;

  PGMimeCertificateClass = ^TGMimeCertificateClass;
  TGMimeCertificateClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_certificate_get_type:TGType;cdecl;external;
function g_mime_certificate_new:PGMimeCertificate;cdecl;external;
procedure g_mime_certificate_set_trust(cert:PGMimeCertificate; trust:TGMimeTrust);cdecl;external;
function g_mime_certificate_get_trust(cert:PGMimeCertificate):TGMimeTrust;cdecl;external;
procedure g_mime_certificate_set_pubkey_algo(cert:PGMimeCertificate; algo:TGMimePubKeyAlgo);cdecl;external;
function g_mime_certificate_get_pubkey_algo(cert:PGMimeCertificate):TGMimePubKeyAlgo;cdecl;external;
procedure g_mime_certificate_set_digest_algo(cert:PGMimeCertificate; algo:TGMimeDigestAlgo);cdecl;external;
function g_mime_certificate_get_digest_algo(cert:PGMimeCertificate):TGMimeDigestAlgo;cdecl;external;
(* Const before type ignored *)
procedure g_mime_certificate_set_issuer_serial(cert:PGMimeCertificate; issuer_serial:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_certificate_get_issuer_serial(cert:PGMimeCertificate):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_certificate_set_issuer_name(cert:PGMimeCertificate; issuer_name:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_certificate_get_issuer_name(cert:PGMimeCertificate):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_certificate_set_fingerprint(cert:PGMimeCertificate; fingerprint:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_certificate_get_fingerprint(cert:PGMimeCertificate):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_certificate_set_key_id(cert:PGMimeCertificate; key_id:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_certificate_get_key_id(cert:PGMimeCertificate):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_certificate_set_email(cert:PGMimeCertificate; email:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_certificate_get_email(cert:PGMimeCertificate):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_certificate_set_name(cert:PGMimeCertificate; name:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_certificate_get_name(cert:PGMimeCertificate):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_certificate_set_user_id(cert:PGMimeCertificate; user_id:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_certificate_get_user_id(cert:PGMimeCertificate):Pchar;cdecl;external;
procedure g_mime_certificate_set_id_validity(cert:PGMimeCertificate; validity:TGMimeValidity);cdecl;external;
function g_mime_certificate_get_id_validity(cert:PGMimeCertificate):TGMimeValidity;cdecl;external;
procedure g_mime_certificate_set_created(cert:PGMimeCertificate; created:Ttime_t);cdecl;external;
function g_mime_certificate_get_created(cert:PGMimeCertificate):Ttime_t;cdecl;external;
function g_mime_certificate_get_created64(cert:PGMimeCertificate):Tgint64;cdecl;external;
procedure g_mime_certificate_set_expires(cert:PGMimeCertificate; expires:Ttime_t);cdecl;external;
function g_mime_certificate_get_expires(cert:PGMimeCertificate):Ttime_t;cdecl;external;
function g_mime_certificate_get_expires64(cert:PGMimeCertificate):Tgint64;cdecl;external;
{*
 * GMimeCertificateList:
 * @parent_object: parent #GObject
 * @array: An array of #GMimeCertificate objects.
 *
 * A collection of #GMimeCertificate objects.
 * }
type
  PGMimeCertificateList = ^TGMimeCertificateList;
  TGMimeCertificateList = record
      parent_object : TGObject;
      array : PGPtrArray;
    end;

  PGMimeCertificateListClass = ^TGMimeCertificateListClass;
  TGMimeCertificateListClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_certificate_list_get_type:TGType;cdecl;external;
function g_mime_certificate_list_new:PGMimeCertificateList;cdecl;external;
function g_mime_certificate_list_length(list:PGMimeCertificateList):longint;cdecl;external;
procedure g_mime_certificate_list_clear(list:PGMimeCertificateList);cdecl;external;
function g_mime_certificate_list_add(list:PGMimeCertificateList; cert:PGMimeCertificate):longint;cdecl;external;
procedure g_mime_certificate_list_insert(list:PGMimeCertificateList; index:longint; cert:PGMimeCertificate);cdecl;external;
function g_mime_certificate_list_remove(list:PGMimeCertificateList; cert:PGMimeCertificate):Tgboolean;cdecl;external;
function g_mime_certificate_list_remove_at(list:PGMimeCertificateList; index:longint):Tgboolean;cdecl;external;
function g_mime_certificate_list_contains(list:PGMimeCertificateList; cert:PGMimeCertificate):Tgboolean;cdecl;external;
function g_mime_certificate_list_index_of(list:PGMimeCertificateList; cert:PGMimeCertificate):longint;cdecl;external;
function g_mime_certificate_list_get_certificate(list:PGMimeCertificateList; index:longint):PGMimeCertificate;cdecl;external;
procedure g_mime_certificate_list_set_certificate(list:PGMimeCertificateList; index:longint; cert:PGMimeCertificate);cdecl;external;
{$endif}
{ __GMIME_CERTIFICATE_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_CERTIFICATE : longint; { return type might be wrong }
  begin
    GMIME_TYPE_CERTIFICATE:=g_mime_certificate_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE(obj : longint) : longint;
begin
  GMIME_CERTIFICATE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_CERTIFICATE,GMimeCertificate);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_CLASS(klass : longint) : longint;
begin
  GMIME_CERTIFICATE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_CERTIFICATE,GMimeCertificateClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CERTIFICATE(obj : longint) : longint;
begin
  GMIME_IS_CERTIFICATE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_CERTIFICATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CERTIFICATE_CLASS(klass : longint) : longint;
begin
  GMIME_IS_CERTIFICATE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_CERTIFICATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_GET_CLASS(obj : longint) : longint;
begin
  GMIME_CERTIFICATE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_CERTIFICATE,GMimeCertificateClass);
end;

{ was #define dname def_expr }
function GMIME_TYPE_CERTIFICATE_LIST : longint; { return type might be wrong }
  begin
    GMIME_TYPE_CERTIFICATE_LIST:=g_mime_certificate_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_LIST(obj : longint) : longint;
begin
  GMIME_CERTIFICATE_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_CERTIFICATE_LIST,GMimeCertificateList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_LIST_CLASS(klass : longint) : longint;
begin
  GMIME_CERTIFICATE_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_CERTIFICATE_LIST,GMimeCertificateListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CERTIFICATE_LIST(obj : longint) : longint;
begin
  GMIME_IS_CERTIFICATE_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_CERTIFICATE_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CERTIFICATE_LIST_CLASS(klass : longint) : longint;
begin
  GMIME_IS_CERTIFICATE_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_CERTIFICATE_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CERTIFICATE_LIST_GET_CLASS(obj : longint) : longint;
begin
  GMIME_CERTIFICATE_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_CERTIFICATE_LIST,GMimeCertificateListClass);
end;


end.
