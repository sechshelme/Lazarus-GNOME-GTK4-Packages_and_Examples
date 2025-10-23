{$IFDEF read_interface}


type
  PGMimeDigestAlgo = ^TGMimeDigestAlgo;
  TGMimeDigestAlgo = longint;

const
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

type
  PGMimePubKeyAlgo = ^TGMimePubKeyAlgo;
  TGMimePubKeyAlgo = longint;

const
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

type
  PGMimeTrust = ^TGMimeTrust;
  TGMimeTrust = longint;

const
  GMIME_TRUST_UNKNOWN = 0;
  GMIME_TRUST_UNDEFINED = 1;
  GMIME_TRUST_NEVER = 2;
  GMIME_TRUST_MARGINAL = 3;
  GMIME_TRUST_FULL = 4;
  GMIME_TRUST_ULTIMATE = 5;

type
  PGMimeValidity = ^TGMimeValidity;
  TGMimeValidity = longint;

const
  GMIME_VALIDITY_UNKNOWN = 0;
  GMIME_VALIDITY_UNDEFINED = 1;
  GMIME_VALIDITY_NEVER = 2;
  GMIME_VALIDITY_MARGINAL = 3;
  GMIME_VALIDITY_FULL = 4;
  GMIME_VALIDITY_ULTIMATE = 5;

type
  TGMimeCertificate = record
    parent_object: TGObject;
    pubkey_algo: TGMimePubKeyAlgo;
    digest_algo: TGMimeDigestAlgo;
    trust: TGMimeTrust;
    issuer_serial: pchar;
    issuer_name: pchar;
    fingerprint: pchar;
    created: Ttime_t;
    expires: Ttime_t;
    keyid: pchar;
    email: pchar;
    name: pchar;
    user_id: pchar;
    id_validity: TGMimeValidity;
  end;
  PGMimeCertificate = ^TGMimeCertificate;

  TGMimeCertificateClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeCertificateClass = ^TGMimeCertificateClass;

function g_mime_certificate_get_type: TGType; cdecl; external libgmime3;
function g_mime_certificate_new: PGMimeCertificate; cdecl; external libgmime3;
procedure g_mime_certificate_set_trust(cert: PGMimeCertificate; trust: TGMimeTrust); cdecl; external libgmime3;
function g_mime_certificate_get_trust(cert: PGMimeCertificate): TGMimeTrust; cdecl; external libgmime3;
procedure g_mime_certificate_set_pubkey_algo(cert: PGMimeCertificate; algo: TGMimePubKeyAlgo); cdecl; external libgmime3;
function g_mime_certificate_get_pubkey_algo(cert: PGMimeCertificate): TGMimePubKeyAlgo; cdecl; external libgmime3;
procedure g_mime_certificate_set_digest_algo(cert: PGMimeCertificate; algo: TGMimeDigestAlgo); cdecl; external libgmime3;
function g_mime_certificate_get_digest_algo(cert: PGMimeCertificate): TGMimeDigestAlgo; cdecl; external libgmime3;
procedure g_mime_certificate_set_issuer_serial(cert: PGMimeCertificate; issuer_serial: pchar); cdecl; external libgmime3;
function g_mime_certificate_get_issuer_serial(cert: PGMimeCertificate): pchar; cdecl; external libgmime3;
procedure g_mime_certificate_set_issuer_name(cert: PGMimeCertificate; issuer_name: pchar); cdecl; external libgmime3;
function g_mime_certificate_get_issuer_name(cert: PGMimeCertificate): pchar; cdecl; external libgmime3;
procedure g_mime_certificate_set_fingerprint(cert: PGMimeCertificate; fingerprint: pchar); cdecl; external libgmime3;
function g_mime_certificate_get_fingerprint(cert: PGMimeCertificate): pchar; cdecl; external libgmime3;
procedure g_mime_certificate_set_key_id(cert: PGMimeCertificate; key_id: pchar); cdecl; external libgmime3;
function g_mime_certificate_get_key_id(cert: PGMimeCertificate): pchar; cdecl; external libgmime3;
procedure g_mime_certificate_set_email(cert: PGMimeCertificate; email: pchar); cdecl; external libgmime3;
function g_mime_certificate_get_email(cert: PGMimeCertificate): pchar; cdecl; external libgmime3;
procedure g_mime_certificate_set_name(cert: PGMimeCertificate; name: pchar); cdecl; external libgmime3;
function g_mime_certificate_get_name(cert: PGMimeCertificate): pchar; cdecl; external libgmime3;
procedure g_mime_certificate_set_user_id(cert: PGMimeCertificate; user_id: pchar); cdecl; external libgmime3;
function g_mime_certificate_get_user_id(cert: PGMimeCertificate): pchar; cdecl; external libgmime3;
procedure g_mime_certificate_set_id_validity(cert: PGMimeCertificate; validity: TGMimeValidity); cdecl; external libgmime3;
function g_mime_certificate_get_id_validity(cert: PGMimeCertificate): TGMimeValidity; cdecl; external libgmime3;
procedure g_mime_certificate_set_created(cert: PGMimeCertificate; created: Ttime_t); cdecl; external libgmime3;
function g_mime_certificate_get_created(cert: PGMimeCertificate): Ttime_t; cdecl; external libgmime3;
function g_mime_certificate_get_created64(cert: PGMimeCertificate): Tgint64; cdecl; external libgmime3;
procedure g_mime_certificate_set_expires(cert: PGMimeCertificate; expires: Ttime_t); cdecl; external libgmime3;
function g_mime_certificate_get_expires(cert: PGMimeCertificate): Ttime_t; cdecl; external libgmime3;
function g_mime_certificate_get_expires64(cert: PGMimeCertificate): Tgint64; cdecl; external libgmime3;

type
  TGMimeCertificateList = record
    parent_object: TGObject;
    arr: PGPtrArray;
  end;
  PGMimeCertificateList = ^TGMimeCertificateList;

  TGMimeCertificateListClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeCertificateListClass = ^TGMimeCertificateListClass;

function g_mime_certificate_list_get_type: TGType; cdecl; external libgmime3;
function g_mime_certificate_list_new: PGMimeCertificateList; cdecl; external libgmime3;
function g_mime_certificate_list_length(list: PGMimeCertificateList): longint; cdecl; external libgmime3;
procedure g_mime_certificate_list_clear(list: PGMimeCertificateList); cdecl; external libgmime3;
function g_mime_certificate_list_add(list: PGMimeCertificateList; cert: PGMimeCertificate): longint; cdecl; external libgmime3;
procedure g_mime_certificate_list_insert(list: PGMimeCertificateList; index: longint; cert: PGMimeCertificate); cdecl; external libgmime3;
function g_mime_certificate_list_remove(list: PGMimeCertificateList; cert: PGMimeCertificate): Tgboolean; cdecl; external libgmime3;
function g_mime_certificate_list_remove_at(list: PGMimeCertificateList; index: longint): Tgboolean; cdecl; external libgmime3;
function g_mime_certificate_list_contains(list: PGMimeCertificateList; cert: PGMimeCertificate): Tgboolean; cdecl; external libgmime3;
function g_mime_certificate_list_index_of(list: PGMimeCertificateList; cert: PGMimeCertificate): longint; cdecl; external libgmime3;
function g_mime_certificate_list_get_certificate(list: PGMimeCertificateList; index: longint): PGMimeCertificate; cdecl; external libgmime3;
procedure g_mime_certificate_list_set_certificate(list: PGMimeCertificateList; index: longint; cert: PGMimeCertificate); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:25:44 ===

function GMIME_TYPE_CERTIFICATE: TGType;
function GMIME_CERTIFICATE(obj: Pointer): PGMimeCertificate;
function GMIME_CERTIFICATE_CLASS(klass: Pointer): PGMimeCertificateClass;
function GMIME_IS_CERTIFICATE(obj: Pointer): Tgboolean;
function GMIME_IS_CERTIFICATE_CLASS(klass: Pointer): Tgboolean;
function GMIME_CERTIFICATE_GET_CLASS(obj: Pointer): PGMimeCertificateClass;

function GMIME_TYPE_CERTIFICATE_LIST: TGType;
function GMIME_CERTIFICATE_LIST(obj: Pointer): PGMimeCertificateList;
function GMIME_CERTIFICATE_LIST_CLASS(klass: Pointer): PGMimeCertificateListClass;
function GMIME_IS_CERTIFICATE_LIST(obj: Pointer): Tgboolean;
function GMIME_IS_CERTIFICATE_LIST_CLASS(klass: Pointer): Tgboolean;
function GMIME_CERTIFICATE_LIST_GET_CLASS(obj: Pointer): PGMimeCertificateListClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_CERTIFICATE: TGType;
begin
  GMIME_TYPE_CERTIFICATE := g_mime_certificate_get_type;
end;

function GMIME_CERTIFICATE(obj: Pointer): PGMimeCertificate;
begin
  Result := PGMimeCertificate(g_type_check_instance_cast(obj, GMIME_TYPE_CERTIFICATE));
end;

function GMIME_CERTIFICATE_CLASS(klass: Pointer): PGMimeCertificateClass;
begin
  Result := PGMimeCertificateClass(g_type_check_class_cast(klass, GMIME_TYPE_CERTIFICATE));
end;

function GMIME_IS_CERTIFICATE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_CERTIFICATE);
end;

function GMIME_IS_CERTIFICATE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_CERTIFICATE);
end;

function GMIME_CERTIFICATE_GET_CLASS(obj: Pointer): PGMimeCertificateClass;
begin
  Result := PGMimeCertificateClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GMIME_TYPE_CERTIFICATE_LIST: TGType;
begin
  GMIME_TYPE_CERTIFICATE_LIST := g_mime_certificate_list_get_type;
end;

function GMIME_CERTIFICATE_LIST(obj: Pointer): PGMimeCertificateList;
begin
  Result := PGMimeCertificateList(g_type_check_instance_cast(obj, GMIME_TYPE_CERTIFICATE_LIST));
end;

function GMIME_CERTIFICATE_LIST_CLASS(klass: Pointer): PGMimeCertificateListClass;
begin
  Result := PGMimeCertificateListClass(g_type_check_class_cast(klass, GMIME_TYPE_CERTIFICATE_LIST));
end;

function GMIME_IS_CERTIFICATE_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_CERTIFICATE_LIST);
end;

function GMIME_IS_CERTIFICATE_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_CERTIFICATE_LIST);
end;

function GMIME_CERTIFICATE_LIST_GET_CLASS(obj: Pointer): PGMimeCertificateListClass;
begin
  Result := PGMimeCertificateListClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
