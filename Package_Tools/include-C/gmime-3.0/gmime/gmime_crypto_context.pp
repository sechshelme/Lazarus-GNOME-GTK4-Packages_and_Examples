
unit gmime_crypto_context;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_crypto_context.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_crypto_context.h
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
PGError  = ^GError;
PGMimeCertificateList  = ^GMimeCertificateList;
PGMimeCipherAlgo  = ^GMimeCipherAlgo;
PGMimeCryptoContext  = ^GMimeCryptoContext;
PGMimeCryptoContextClass  = ^GMimeCryptoContextClass;
PGMimeCryptoContextNewFunc  = ^GMimeCryptoContextNewFunc;
PGMimeDecryptFlags  = ^GMimeDecryptFlags;
PGMimeDecryptResult  = ^GMimeDecryptResult;
PGMimeDecryptResultClass  = ^GMimeDecryptResultClass;
PGMimeEncryptFlags  = ^GMimeEncryptFlags;
PGMimeSignatureList  = ^GMimeSignatureList;
PGMimeStream  = ^GMimeStream;
PGMimeVerifyFlags  = ^GMimeVerifyFlags;
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
{$ifndef __GMIME_CRYPTO_CONTEXT_H__}
{$define __GMIME_CRYPTO_CONTEXT_H__}
{$include <gmime/gmime-signature.h>}
{$include <gmime/gmime-stream.h>}

{ was #define dname def_expr }
function GMIME_TYPE_CRYPTO_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CRYPTO_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CRYPTO_CONTEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CRYPTO_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CRYPTO_CONTEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CRYPTO_CONTEXT_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GMIME_TYPE_DECRYPT_RESULT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DECRYPT_RESULT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DECRYPT_RESULT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_DECRYPT_RESULT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_DECRYPT_RESULT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DECRYPT_RESULT_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimePasswordRequestFunc:
 * @ctx: the #GMimeCryptoContext making the request
 * @user_id: the user_id of the password being requested
 * @prompt: a string containing some helpful context for the prompt
 * @reprompt: %TRUE if this password request is a reprompt due to a previously bad password response
 * @response: a stream for the application to write the password to (followed by a newline '\n' character)
 * @err: a #GError for the callback to set if an error occurs
 *
 * A password request callback allowing a #GMimeCryptoContext to
 * prompt the user for a password for a given key.
 *
 * Returns: %TRUE on success or %FALSE on error.
 * }
(* Const before type ignored *)
(* Const before type ignored *)

  TGMimePasswordRequestFunc = function (ctx:PGMimeCryptoContext; user_id:Pchar; prompt:Pchar; reprompt:Tgboolean; response:PGMimeStream; 
               err:PPGError):Tgboolean;cdecl;
{*
 * GMimeCryptoContextNewFunc:
 *
 * A callback used to create a new instance of a #GMimeCryptoContext subclass.
 *
 * Returns: a new #GMimeCryptoContext instance.
 * }

  PGMimeCryptoContextNewFunc = ^TGMimeCryptoContextNewFunc;
  TGMimeCryptoContextNewFunc = function :PGMimeCryptoContext;cdecl;
{*
 * GMimeDecryptFlags:
 * @GMIME_DECRYPT_NONE: No flags specified.
 * @GMIME_DECRYPT_EXPORT_SESSION_KEY: Export the decryption session-key.
 * @GMIME_DECRYPT_NO_VERIFY: Disable signature verification.
 * @GMIME_DECRYPT_ENABLE_KEYSERVER_LOOKUPS: Enable OpenPGP keyserver lookups.
 * @GMIME_DECRYPT_ENABLE_ONLINE_CERTIFICATE_CHECKS: Enable CRL and OCSP checks that require network lookups.
 *
 * Decryption flags.
 * }
{ Note: these values must stay in sync with GMimeVerifyFlags  }

  PGMimeDecryptFlags = ^TGMimeDecryptFlags;
  TGMimeDecryptFlags =  Longint;
  Const
    GMIME_DECRYPT_NONE = 0;
    GMIME_DECRYPT_EXPORT_SESSION_KEY = 1 shl 0;
    GMIME_DECRYPT_NO_VERIFY = 1 shl 1;
    GMIME_DECRYPT_ENABLE_KEYSERVER_LOOKUPS = 1 shl 15;
    GMIME_DECRYPT_ENABLE_ONLINE_CERTIFICATE_CHECKS = 1 shl 15;
;
{*
 * GMimeEncryptFlags:
 * @GMIME_ENCRYPT_NONE: No flags specified.
 * @GMIME_ENCRYPT_ALWAYS_TRUST: Always trust the specified keys.
 * @GMIME_ENCRYPT_NO_COMPRESS: Don't compress the plaintext before encrypting.
 * @GMIME_ENCRYPT_SYMMETRIC: Encrypt symmetrically.
 * @GMIME_ENCRYPT_THROW_KEYIDS: Do not include the key ids in the ciphertext.
 *
 * Encryption flags.
 * }
type
  PGMimeEncryptFlags = ^TGMimeEncryptFlags;
  TGMimeEncryptFlags =  Longint;
  Const
    GMIME_ENCRYPT_NONE = 0;
    GMIME_ENCRYPT_ALWAYS_TRUST = 1;
    GMIME_ENCRYPT_NO_COMPRESS = 16;
    GMIME_ENCRYPT_SYMMETRIC = 32;
    GMIME_ENCRYPT_THROW_KEYIDS = 64;
;
{*
 * GMimeVerifyFlags:
 * @GMIME_VERIFY_NONE: No flags specified.
 * @GMIME_VERIFY_ENABLE_KEYSERVER_LOOKUPS: Enable OpenPGP keyserver lookups.
 * @GMIME_VERIFY_ENABLE_ONLINE_CERTIFICATE_CHECKS: Enable CRL and OCSP checks that require network lookups.
 *
 * Signature verification flags.
 * }
type
  PGMimeVerifyFlags = ^TGMimeVerifyFlags;
  TGMimeVerifyFlags =  Longint;
  Const
    GMIME_VERIFY_NONE = 0;
    GMIME_VERIFY_ENABLE_KEYSERVER_LOOKUPS = 1 shl 15;
    GMIME_VERIFY_ENABLE_ONLINE_CERTIFICATE_CHECKS = 1 shl 15;
;
{*
 * GMimeCryptoContext:
 * @parent_object: parent #GObject
 * @request_passwd: a callback for requesting a password
 *
 * A crypto context for use with MIME.
 * }
type
  PGMimeCryptoContext = ^TGMimeCryptoContext;
  TGMimeCryptoContext = record
      parent_object : TGObject;
      request_passwd : TGMimePasswordRequestFunc;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{$if 0}
{$endif}
type
  PGMimeCryptoContextClass = ^TGMimeCryptoContextClass;
  TGMimeCryptoContextClass = record
      parent_class : TGObjectClass;
      digest_id : function (ctx:PGMimeCryptoContext; name:Pchar):TGMimeDigestAlgo;cdecl;
      digest_name : function (ctx:PGMimeCryptoContext; digest:TGMimeDigestAlgo):Pchar;cdecl;
      get_signature_protocol : function (ctx:PGMimeCryptoContext):Pchar;cdecl;
      get_encryption_protocol : function (ctx:PGMimeCryptoContext):Pchar;cdecl;
      get_key_exchange_protocol : function (ctx:PGMimeCryptoContext):Pchar;cdecl;
      sign : function (ctx:PGMimeCryptoContext; detach:Tgboolean; userid:Pchar; istream:PGMimeStream; ostream:PGMimeStream; 
                   err:PPGError):longint;cdecl;
      verify : function (ctx:PGMimeCryptoContext; flags:TGMimeVerifyFlags; istream:PGMimeStream; sigstream:PGMimeStream; ostream:PGMimeStream; 
                   err:PPGError):PGMimeSignatureList;cdecl;
      encrypt : function (ctx:PGMimeCryptoContext; sign:Tgboolean; userid:Pchar; flags:TGMimeEncryptFlags; recipients:PGPtrArray; 
                   istream:PGMimeStream; ostream:PGMimeStream; err:PPGError):longint;cdecl;
      decrypt : function (ctx:PGMimeCryptoContext; flags:TGMimeDecryptFlags; session_key:Pchar; istream:PGMimeStream; ostream:PGMimeStream; 
                   err:PPGError):PGMimeDecryptResult;cdecl;
      import_keys : function (ctx:PGMimeCryptoContext; istream:PGMimeStream; err:PPGError):longint;cdecl;
      export_keys : function (ctx:PGMimeCryptoContext; keys:PPchar; ostream:PGMimeStream; err:PPGError):longint;cdecl;
      compress : function (ctx:PGMimeCryptoContext; istream:PGMimeStream; ostream:PGMimeStream; err:PPGError):longint;cdecl;
      decompress : function (ctx:PGMimeCryptoContext; istream:PGMimeStream; ostream:PGMimeStream; err:PPGError):longint;cdecl;
    end;


function g_mime_crypto_context_get_type:TGType;cdecl;external;
(* Const before type ignored *)
procedure g_mime_crypto_context_register(protocol:Pchar; callback:TGMimeCryptoContextNewFunc);cdecl;external;
(* Const before type ignored *)
function g_mime_crypto_context_new(protocol:Pchar):PGMimeCryptoContext;cdecl;external;
procedure g_mime_crypto_context_set_request_password(ctx:PGMimeCryptoContext; request_passwd:TGMimePasswordRequestFunc);cdecl;external;
{ digest algo mapping  }
(* Const before type ignored *)
function g_mime_crypto_context_digest_id(ctx:PGMimeCryptoContext; name:Pchar):TGMimeDigestAlgo;cdecl;external;
(* Const before type ignored *)
function g_mime_crypto_context_digest_name(ctx:PGMimeCryptoContext; digest:TGMimeDigestAlgo):Pchar;cdecl;external;
{ protocol routines  }
(* Const before type ignored *)
function g_mime_crypto_context_get_signature_protocol(ctx:PGMimeCryptoContext):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_crypto_context_get_encryption_protocol(ctx:PGMimeCryptoContext):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_crypto_context_get_key_exchange_protocol(ctx:PGMimeCryptoContext):Pchar;cdecl;external;
{ crypto routines  }
(* Const before type ignored *)
function g_mime_crypto_context_sign(ctx:PGMimeCryptoContext; detach:Tgboolean; userid:Pchar; istream:PGMimeStream; ostream:PGMimeStream; 
           err:PPGError):longint;cdecl;external;
function g_mime_crypto_context_verify(ctx:PGMimeCryptoContext; flags:TGMimeVerifyFlags; istream:PGMimeStream; sigstream:PGMimeStream; ostream:PGMimeStream; 
           err:PPGError):PGMimeSignatureList;cdecl;external;
(* Const before type ignored *)
function g_mime_crypto_context_encrypt(ctx:PGMimeCryptoContext; sign:Tgboolean; userid:Pchar; flags:TGMimeEncryptFlags; recipients:PGPtrArray; 
           istream:PGMimeStream; ostream:PGMimeStream; err:PPGError):longint;cdecl;external;
(* Const before type ignored *)
function g_mime_crypto_context_decrypt(ctx:PGMimeCryptoContext; flags:TGMimeDecryptFlags; session_key:Pchar; istream:PGMimeStream; ostream:PGMimeStream; 
           err:PPGError):PGMimeDecryptResult;cdecl;external;
{ key/certificate routines  }
function g_mime_crypto_context_import_keys(ctx:PGMimeCryptoContext; istream:PGMimeStream; err:PPGError):longint;cdecl;external;
(* Const before type ignored *)
function g_mime_crypto_context_export_keys(ctx:PGMimeCryptoContext; keys:PPchar; ostream:PGMimeStream; err:PPGError):longint;cdecl;external;
{*
 * GMimeCipherAlgo:
 * @GMIME_CIPHER_ALGO_DEFAULT: The default (or unknown) cipher.
 * @GMIME_CIPHER_ALGO_IDEA: The IDEA cipher.
 * @GMIME_CIPHER_ALGO_3DES: The 3DES cipher.
 * @GMIME_CIPHER_ALGO_CAST5: The CAST5 cipher.
 * @GMIME_CIPHER_ALGO_BLOWFISH: The Blowfish cipher.
 * @GMIME_CIPHER_ALGO_AES: The AES (aka RIJANDALE) cipher.
 * @GMIME_CIPHER_ALGO_AES192: The AES-192 cipher.
 * @GMIME_CIPHER_ALGO_AES256: The AES-256 cipher.
 * @GMIME_CIPHER_ALGO_TWOFISH: The Twofish cipher.
 * @GMIME_CIPHER_ALGO_CAMELLIA128: The Camellia-128 cipher.
 * @GMIME_CIPHER_ALGO_CAMELLIA192: The Camellia-192 cipher.
 * @GMIME_CIPHER_ALGO_CAMELLIA256: The Camellia-256 cipher.
 *
 * A cipher algorithm.
 * }
type
  PGMimeCipherAlgo = ^TGMimeCipherAlgo;
  TGMimeCipherAlgo =  Longint;
  Const
    GMIME_CIPHER_ALGO_DEFAULT = 0;
    GMIME_CIPHER_ALGO_IDEA = 1;
    GMIME_CIPHER_ALGO_3DES = 2;
    GMIME_CIPHER_ALGO_CAST5 = 3;
    GMIME_CIPHER_ALGO_BLOWFISH = 4;
    GMIME_CIPHER_ALGO_AES = 7;
    GMIME_CIPHER_ALGO_AES192 = 8;
    GMIME_CIPHER_ALGO_AES256 = 9;
    GMIME_CIPHER_ALGO_TWOFISH = 10;
    GMIME_CIPHER_ALGO_CAMELLIA128 = 11;
    GMIME_CIPHER_ALGO_CAMELLIA192 = 12;
    GMIME_CIPHER_ALGO_CAMELLIA256 = 13;
;
{*
 * GMimeDecryptResult:
 * @parent_object: parent #GObject
 * @recipients: A #GMimeCertificateList
 * @signatures: A #GMimeSignatureList if signed or %NULL otherwise.
 * @cipher: The cipher algorithm used to encrypt the stream.
 * @mdc: The MDC digest algorithm used, if any.
 * @session_key: The session key if requested or %NULL otherwise.
 *
 * An object containing the results from decrypting an encrypted stream.
 * }
type
  PGMimeDecryptResult = ^TGMimeDecryptResult;
  TGMimeDecryptResult = record
      parent_object : TGObject;
      recipients : PGMimeCertificateList;
      signatures : PGMimeSignatureList;
      cipher : TGMimeCipherAlgo;
      mdc : TGMimeDigestAlgo;
      session_key : Pchar;
    end;

  PGMimeDecryptResultClass = ^TGMimeDecryptResultClass;
  TGMimeDecryptResultClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_decrypt_result_get_type:TGType;cdecl;external;
function g_mime_decrypt_result_new:PGMimeDecryptResult;cdecl;external;
procedure g_mime_decrypt_result_set_recipients(result:PGMimeDecryptResult; recipients:PGMimeCertificateList);cdecl;external;
function g_mime_decrypt_result_get_recipients(result:PGMimeDecryptResult):PGMimeCertificateList;cdecl;external;
procedure g_mime_decrypt_result_set_signatures(result:PGMimeDecryptResult; signatures:PGMimeSignatureList);cdecl;external;
function g_mime_decrypt_result_get_signatures(result:PGMimeDecryptResult):PGMimeSignatureList;cdecl;external;
procedure g_mime_decrypt_result_set_cipher(result:PGMimeDecryptResult; cipher:TGMimeCipherAlgo);cdecl;external;
function g_mime_decrypt_result_get_cipher(result:PGMimeDecryptResult):TGMimeCipherAlgo;cdecl;external;
procedure g_mime_decrypt_result_set_mdc(result:PGMimeDecryptResult; mdc:TGMimeDigestAlgo);cdecl;external;
function g_mime_decrypt_result_get_mdc(result:PGMimeDecryptResult):TGMimeDigestAlgo;cdecl;external;
(* Const before type ignored *)
procedure g_mime_decrypt_result_set_session_key(result:PGMimeDecryptResult; session_key:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_decrypt_result_get_session_key(result:PGMimeDecryptResult):Pchar;cdecl;external;
{$endif}
{ __GMIME_CRYPTO_CONTEXT_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_CRYPTO_CONTEXT : longint; { return type might be wrong }
  begin
    GMIME_TYPE_CRYPTO_CONTEXT:=g_mime_crypto_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CRYPTO_CONTEXT(obj : longint) : longint;
begin
  GMIME_CRYPTO_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_CRYPTO_CONTEXT,GMimeCryptoContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CRYPTO_CONTEXT_CLASS(klass : longint) : longint;
begin
  GMIME_CRYPTO_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_CRYPTO_CONTEXT,GMimeCryptoContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CRYPTO_CONTEXT(obj : longint) : longint;
begin
  GMIME_IS_CRYPTO_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_CRYPTO_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CRYPTO_CONTEXT_CLASS(klass : longint) : longint;
begin
  GMIME_IS_CRYPTO_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_CRYPTO_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CRYPTO_CONTEXT_GET_CLASS(obj : longint) : longint;
begin
  GMIME_CRYPTO_CONTEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_CRYPTO_CONTEXT,GMimeCryptoContextClass);
end;

{ was #define dname def_expr }
function GMIME_TYPE_DECRYPT_RESULT : longint; { return type might be wrong }
  begin
    GMIME_TYPE_DECRYPT_RESULT:=g_mime_decrypt_result_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DECRYPT_RESULT(obj : longint) : longint;
begin
  GMIME_DECRYPT_RESULT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_DECRYPT_RESULT,GMimeDecryptResult);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DECRYPT_RESULT_CLASS(klass : longint) : longint;
begin
  GMIME_DECRYPT_RESULT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_DECRYPT_RESULT,GMimeDecryptResultClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_DECRYPT_RESULT(obj : longint) : longint;
begin
  GMIME_IS_DECRYPT_RESULT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_DECRYPT_RESULT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_DECRYPT_RESULT_CLASS(klass : longint) : longint;
begin
  GMIME_IS_DECRYPT_RESULT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_DECRYPT_RESULT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_DECRYPT_RESULT_GET_CLASS(obj : longint) : longint;
begin
  GMIME_DECRYPT_RESULT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_DECRYPT_RESULT,GMimeDecryptResultClass);
end;


end.
