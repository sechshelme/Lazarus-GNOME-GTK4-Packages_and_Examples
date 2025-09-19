unit gmime_crypto_context;

interface

uses
  fp_glib2, fp_gmime3, gmime_stream, gmime_certificate, gmime_signature;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  type
    PGMimeCipherAlgo = ^TGMimeCipherAlgo;
    TGMimeCipherAlgo = longint;

  const
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

  type
    TGMimeDecryptResult = record
      parent_object: TGObject;
      recipients: PGMimeCertificateList;
      signatures: PGMimeSignatureList;
      cipher: TGMimeCipherAlgo;
      mdc: TGMimeDigestAlgo;
      session_key: pchar;
    end;
    PGMimeDecryptResult = ^TGMimeDecryptResult;

    TGMimeDecryptResultClass = record
      parent_class: TGObjectClass;
    end;
    PGMimeDecryptResultClass = ^TGMimeDecryptResultClass;

type
  PGMimeCryptoContext = ^TGMimeCryptoContext;

  TGMimePasswordRequestFunc = function(ctx: PGMimeCryptoContext; user_id: pchar; prompt: pchar; reprompt: Tgboolean; response: PGMimeStream; err: PPGError): Tgboolean; cdecl;
  TGMimeCryptoContextNewFunc = function: PGMimeCryptoContext; cdecl;

  TGMimeCryptoContext = record
    parent_object: TGObject;
    request_passwd: TGMimePasswordRequestFunc;
  end;

  PGMimeDecryptFlags = ^TGMimeDecryptFlags;
  TGMimeDecryptFlags = longint;

const
  GMIME_DECRYPT_NONE = 0;
  GMIME_DECRYPT_EXPORT_SESSION_KEY = 1 shl 0;
  GMIME_DECRYPT_NO_VERIFY = 1 shl 1;
  GMIME_DECRYPT_ENABLE_KEYSERVER_LOOKUPS = 1 shl 15;
  GMIME_DECRYPT_ENABLE_ONLINE_CERTIFICATE_CHECKS = 1 shl 15;

type
  PGMimeEncryptFlags = ^TGMimeEncryptFlags;
  TGMimeEncryptFlags = longint;

const
  GMIME_ENCRYPT_NONE = 0;
  GMIME_ENCRYPT_ALWAYS_TRUST = 1;
  GMIME_ENCRYPT_NO_COMPRESS = 16;
  GMIME_ENCRYPT_SYMMETRIC = 32;
  GMIME_ENCRYPT_THROW_KEYIDS = 64;

type
  PGMimeVerifyFlags = ^TGMimeVerifyFlags;
  TGMimeVerifyFlags = longint;

const
  GMIME_VERIFY_NONE = 0;
  GMIME_VERIFY_ENABLE_KEYSERVER_LOOKUPS = 1 shl 15;
  GMIME_VERIFY_ENABLE_ONLINE_CERTIFICATE_CHECKS = 1 shl 15;

type
  TGMimeCryptoContextClass = record
    parent_class: TGObjectClass;
    digest_id: function(ctx: PGMimeCryptoContext; name: pchar): TGMimeDigestAlgo; cdecl;
    digest_name: function(ctx: PGMimeCryptoContext; digest: TGMimeDigestAlgo): pchar; cdecl;
    get_signature_protocol: function(ctx: PGMimeCryptoContext): pchar; cdecl;
    get_encryption_protocol: function(ctx: PGMimeCryptoContext): pchar; cdecl;
    get_key_exchange_protocol: function(ctx: PGMimeCryptoContext): pchar; cdecl;
    sign: function(ctx: PGMimeCryptoContext; detach: Tgboolean; userid: pchar; istream: PGMimeStream; ostream: PGMimeStream;
      err: PPGError): longint; cdecl;
    verify: function(ctx: PGMimeCryptoContext; flags: TGMimeVerifyFlags; istream: PGMimeStream; sigstream: PGMimeStream; ostream: PGMimeStream;
      err: PPGError): PGMimeSignatureList; cdecl;
    encrypt: function(ctx: PGMimeCryptoContext; sign: Tgboolean; userid: pchar; flags: TGMimeEncryptFlags; recipients: PGPtrArray;
      istream: PGMimeStream; ostream: PGMimeStream; err: PPGError): longint; cdecl;
    decrypt: function(ctx: PGMimeCryptoContext; flags: TGMimeDecryptFlags; session_key: pchar; istream: PGMimeStream; ostream: PGMimeStream;
      err: PPGError): PGMimeDecryptResult; cdecl;
    import_keys: function(ctx: PGMimeCryptoContext; istream: PGMimeStream; err: PPGError): longint; cdecl;
    export_keys: function(ctx: PGMimeCryptoContext; keys: PPchar; ostream: PGMimeStream; err: PPGError): longint; cdecl;
    compress: function(ctx: PGMimeCryptoContext; istream: PGMimeStream; ostream: PGMimeStream; err: PPGError): longint; cdecl;
    decompress: function(ctx: PGMimeCryptoContext; istream: PGMimeStream; ostream: PGMimeStream; err: PPGError): longint; cdecl;
  end;
  PGMimeCryptoContextClass = ^TGMimeCryptoContextClass;

function g_mime_crypto_context_get_type: TGType; cdecl; external libgmime3;
procedure g_mime_crypto_context_register(protocol: pchar; callback: TGMimeCryptoContextNewFunc); cdecl; external libgmime3;
function g_mime_crypto_context_new(protocol: pchar): PGMimeCryptoContext; cdecl; external libgmime3;
procedure g_mime_crypto_context_set_request_password(ctx: PGMimeCryptoContext; request_passwd: TGMimePasswordRequestFunc); cdecl; external libgmime3;
function g_mime_crypto_context_digest_id(ctx: PGMimeCryptoContext; name: pchar): TGMimeDigestAlgo; cdecl; external libgmime3;
function g_mime_crypto_context_digest_name(ctx: PGMimeCryptoContext; digest: TGMimeDigestAlgo): pchar; cdecl; external libgmime3;
function g_mime_crypto_context_get_signature_protocol(ctx: PGMimeCryptoContext): pchar; cdecl; external libgmime3;
function g_mime_crypto_context_get_encryption_protocol(ctx: PGMimeCryptoContext): pchar; cdecl; external libgmime3;
function g_mime_crypto_context_get_key_exchange_protocol(ctx: PGMimeCryptoContext): pchar; cdecl; external libgmime3;
function g_mime_crypto_context_sign(ctx: PGMimeCryptoContext; detach: Tgboolean; userid: pchar; istream: PGMimeStream; ostream: PGMimeStream;
  err: PPGError): longint; cdecl; external libgmime3;
function g_mime_crypto_context_verify(ctx: PGMimeCryptoContext; flags: TGMimeVerifyFlags; istream: PGMimeStream; sigstream: PGMimeStream; ostream: PGMimeStream;
  err: PPGError): PGMimeSignatureList; cdecl; external libgmime3;
function g_mime_crypto_context_encrypt(ctx: PGMimeCryptoContext; sign: Tgboolean; userid: pchar; flags: TGMimeEncryptFlags; recipients: PGPtrArray;
  istream: PGMimeStream; ostream: PGMimeStream; err: PPGError): longint; cdecl; external libgmime3;
function g_mime_crypto_context_decrypt(ctx: PGMimeCryptoContext; flags: TGMimeDecryptFlags; session_key: pchar; istream: PGMimeStream; ostream: PGMimeStream;
  err: PPGError): PGMimeDecryptResult; cdecl; external libgmime3;
function g_mime_crypto_context_import_keys(ctx: PGMimeCryptoContext; istream: PGMimeStream; err: PPGError): longint; cdecl; external libgmime3;
function g_mime_crypto_context_export_keys(ctx: PGMimeCryptoContext; keys: PPchar; ostream: PGMimeStream; err: PPGError): longint; cdecl; external libgmime3;

function g_mime_decrypt_result_get_type: TGType; cdecl; external libgmime3;
function g_mime_decrypt_result_new: PGMimeDecryptResult; cdecl; external libgmime3;
procedure g_mime_decrypt_result_set_recipients(result: PGMimeDecryptResult; recipients: PGMimeCertificateList); cdecl; external libgmime3;
function g_mime_decrypt_result_get_recipients(result: PGMimeDecryptResult): PGMimeCertificateList; cdecl; external libgmime3;
procedure g_mime_decrypt_result_set_signatures(result: PGMimeDecryptResult; signatures: PGMimeSignatureList); cdecl; external libgmime3;
function g_mime_decrypt_result_get_signatures(result: PGMimeDecryptResult): PGMimeSignatureList; cdecl; external libgmime3;
procedure g_mime_decrypt_result_set_cipher(result: PGMimeDecryptResult; cipher: TGMimeCipherAlgo); cdecl; external libgmime3;
function g_mime_decrypt_result_get_cipher(result: PGMimeDecryptResult): TGMimeCipherAlgo; cdecl; external libgmime3;
procedure g_mime_decrypt_result_set_mdc(result: PGMimeDecryptResult; mdc: TGMimeDigestAlgo); cdecl; external libgmime3;
function g_mime_decrypt_result_get_mdc(result: PGMimeDecryptResult): TGMimeDigestAlgo; cdecl; external libgmime3;
procedure g_mime_decrypt_result_set_session_key(result: PGMimeDecryptResult; session_key: pchar); cdecl; external libgmime3;
function g_mime_decrypt_result_get_session_key(result: PGMimeDecryptResult): pchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:26:19 ===

function GMIME_TYPE_CRYPTO_CONTEXT: TGType;
function GMIME_CRYPTO_CONTEXT(obj: Pointer): PGMimeCryptoContext;
function GMIME_CRYPTO_CONTEXT_CLASS(klass: Pointer): PGMimeCryptoContextClass;
function GMIME_IS_CRYPTO_CONTEXT(obj: Pointer): Tgboolean;
function GMIME_IS_CRYPTO_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function GMIME_CRYPTO_CONTEXT_GET_CLASS(obj: Pointer): PGMimeCryptoContextClass;

function GMIME_TYPE_DECRYPT_RESULT: TGType;
function GMIME_DECRYPT_RESULT(obj: Pointer): PGMimeDecryptResult;
function GMIME_DECRYPT_RESULT_CLASS(klass: Pointer): PGMimeDecryptResultClass;
function GMIME_IS_DECRYPT_RESULT(obj: Pointer): Tgboolean;
function GMIME_IS_DECRYPT_RESULT_CLASS(klass: Pointer): Tgboolean;
function GMIME_DECRYPT_RESULT_GET_CLASS(obj: Pointer): PGMimeDecryptResultClass;


implementation

function GMIME_TYPE_CRYPTO_CONTEXT: TGType;
begin
  GMIME_TYPE_CRYPTO_CONTEXT := g_mime_crypto_context_get_type;
end;

function GMIME_CRYPTO_CONTEXT(obj: Pointer): PGMimeCryptoContext;
begin
  Result := PGMimeCryptoContext(g_type_check_instance_cast(obj, GMIME_TYPE_CRYPTO_CONTEXT));
end;

function GMIME_CRYPTO_CONTEXT_CLASS(klass: Pointer): PGMimeCryptoContextClass;
begin
  Result := PGMimeCryptoContextClass(g_type_check_class_cast(klass, GMIME_TYPE_CRYPTO_CONTEXT));
end;

function GMIME_IS_CRYPTO_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_CRYPTO_CONTEXT);
end;

function GMIME_IS_CRYPTO_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_CRYPTO_CONTEXT);
end;

function GMIME_CRYPTO_CONTEXT_GET_CLASS(obj: Pointer): PGMimeCryptoContextClass;
begin
  Result := PGMimeCryptoContextClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GMIME_TYPE_DECRYPT_RESULT: TGType;
begin
  GMIME_TYPE_DECRYPT_RESULT := g_mime_decrypt_result_get_type;
end;

function GMIME_DECRYPT_RESULT(obj: Pointer): PGMimeDecryptResult;
begin
  Result := PGMimeDecryptResult(g_type_check_instance_cast(obj, GMIME_TYPE_DECRYPT_RESULT));
end;

function GMIME_DECRYPT_RESULT_CLASS(klass: Pointer): PGMimeDecryptResultClass;
begin
  Result := PGMimeDecryptResultClass(g_type_check_class_cast(klass, GMIME_TYPE_DECRYPT_RESULT));
end;

function GMIME_IS_DECRYPT_RESULT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_DECRYPT_RESULT);
end;

function GMIME_IS_DECRYPT_RESULT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_DECRYPT_RESULT);
end;

function GMIME_DECRYPT_RESULT_GET_CLASS(obj: Pointer): PGMimeDecryptResultClass;
begin
  Result := PGMimeDecryptResultClass(PGTypeInstance(obj)^.g_class);
end;


end.
