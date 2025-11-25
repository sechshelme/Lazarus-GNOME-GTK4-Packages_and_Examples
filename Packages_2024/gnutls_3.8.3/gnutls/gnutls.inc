{$IFDEF read_interface}


const
  GNUTLS_VERSION = '3.8.3';
  GNUTLS_VERSION_MAJOR = 3;
  GNUTLS_VERSION_MINOR = 8;
  GNUTLS_VERSION_PATCH = 3;
  GNUTLS_VERSION_NUMBER = $030803;

type
  Pgnutls_cipher_algorithm = ^Tgnutls_cipher_algorithm;
  Tgnutls_cipher_algorithm = longint;

const
  GNUTLS_CIPHER_UNKNOWN = 0;
  GNUTLS_CIPHER_NULL = 1;
  GNUTLS_CIPHER_ARCFOUR_128 = 2;
  GNUTLS_CIPHER_3DES_CBC = 3;
  GNUTLS_CIPHER_AES_128_CBC = 4;
  GNUTLS_CIPHER_AES_256_CBC = 5;
  GNUTLS_CIPHER_ARCFOUR_40 = 6;
  GNUTLS_CIPHER_CAMELLIA_128_CBC = 7;
  GNUTLS_CIPHER_CAMELLIA_256_CBC = 8;
  GNUTLS_CIPHER_AES_192_CBC = 9;
  GNUTLS_CIPHER_AES_128_GCM = 10;
  GNUTLS_CIPHER_AES_256_GCM = 11;
  GNUTLS_CIPHER_CAMELLIA_192_CBC = 12;
  GNUTLS_CIPHER_SALSA20_256 = 13;
  GNUTLS_CIPHER_ESTREAM_SALSA20_256 = 14;
  GNUTLS_CIPHER_CAMELLIA_128_GCM = 15;
  GNUTLS_CIPHER_CAMELLIA_256_GCM = 16;
  GNUTLS_CIPHER_RC2_40_CBC = 17;
  GNUTLS_CIPHER_DES_CBC = 18;
  GNUTLS_CIPHER_AES_128_CCM = 19;
  GNUTLS_CIPHER_AES_256_CCM = 20;
  GNUTLS_CIPHER_AES_128_CCM_8 = 21;
  GNUTLS_CIPHER_AES_256_CCM_8 = 22;
  GNUTLS_CIPHER_CHACHA20_POLY1305 = 23;
  GNUTLS_CIPHER_GOST28147_TC26Z_CFB = 24;
  GNUTLS_CIPHER_GOST28147_CPA_CFB = 25;
  GNUTLS_CIPHER_GOST28147_CPB_CFB = 26;
  GNUTLS_CIPHER_GOST28147_CPC_CFB = 27;
  GNUTLS_CIPHER_GOST28147_CPD_CFB = 28;
  GNUTLS_CIPHER_AES_128_CFB8 = 29;
  GNUTLS_CIPHER_AES_192_CFB8 = 30;
  GNUTLS_CIPHER_AES_256_CFB8 = 31;
  GNUTLS_CIPHER_AES_128_XTS = 32;
  GNUTLS_CIPHER_AES_256_XTS = 33;
  GNUTLS_CIPHER_GOST28147_TC26Z_CNT = 34;
  GNUTLS_CIPHER_CHACHA20_64 = 35;
  GNUTLS_CIPHER_CHACHA20_32 = 36;
  GNUTLS_CIPHER_AES_128_SIV = 37;
  GNUTLS_CIPHER_AES_256_SIV = 38;
  GNUTLS_CIPHER_AES_192_GCM = 39;
  GNUTLS_CIPHER_MAGMA_CTR_ACPKM = 40;
  GNUTLS_CIPHER_KUZNYECHIK_CTR_ACPKM = 41;
  GNUTLS_CIPHER_AES_128_SIV_GCM = 42;
  GNUTLS_CIPHER_AES_256_SIV_GCM = 43;
  GNUTLS_CIPHER_IDEA_PGP_CFB = 200;
  GNUTLS_CIPHER_3DES_PGP_CFB = 201;
  GNUTLS_CIPHER_CAST5_PGP_CFB = 202;
  GNUTLS_CIPHER_BLOWFISH_PGP_CFB = 203;
  GNUTLS_CIPHER_SAFER_SK128_PGP_CFB = 204;
  GNUTLS_CIPHER_AES128_PGP_CFB = 205;
  GNUTLS_CIPHER_AES192_PGP_CFB = 206;
  GNUTLS_CIPHER_AES256_PGP_CFB = 207;
  GNUTLS_CIPHER_TWOFISH_PGP_CFB = 208;

const
  GNUTLS_CIPHER_RIJNDAEL_128_CBC = GNUTLS_CIPHER_AES_128_CBC;
  GNUTLS_CIPHER_RIJNDAEL_256_CBC = GNUTLS_CIPHER_AES_256_CBC;
  GNUTLS_CIPHER_RIJNDAEL_CBC = GNUTLS_CIPHER_AES_128_CBC;
  GNUTLS_CIPHER_ARCFOUR = GNUTLS_CIPHER_ARCFOUR_128;

type
  Tgnutls_cipher_algorithm_t = Tgnutls_cipher_algorithm;
  Pgnutls_cipher_algorithm_t = ^Tgnutls_cipher_algorithm_t;

type
  Pgnutls_kx_algorithm_t = ^Tgnutls_kx_algorithm_t;
  Tgnutls_kx_algorithm_t = longint;

const
  GNUTLS_KX_UNKNOWN = 0;
  GNUTLS_KX_RSA = 1;
  GNUTLS_KX_DHE_DSS = 2;
  GNUTLS_KX_DHE_RSA = 3;
  GNUTLS_KX_ANON_DH = 4;
  GNUTLS_KX_SRP = 5;
  GNUTLS_KX_RSA_EXPORT = 6;
  GNUTLS_KX_SRP_RSA = 7;
  GNUTLS_KX_SRP_DSS = 8;
  GNUTLS_KX_PSK = 9;
  GNUTLS_KX_DHE_PSK = 10;
  GNUTLS_KX_ANON_ECDH = 11;
  GNUTLS_KX_ECDHE_RSA = 12;
  GNUTLS_KX_ECDHE_ECDSA = 13;
  GNUTLS_KX_ECDHE_PSK = 14;
  GNUTLS_KX_RSA_PSK = 15;
  GNUTLS_KX_VKO_GOST_12 = 16;

type
  Pgnutls_params_type_t = ^Tgnutls_params_type_t;
  Tgnutls_params_type_t = longint;

const
  GNUTLS_PARAMS_RSA_EXPORT = 1;
  GNUTLS_PARAMS_DH = 2;
  GNUTLS_PARAMS_ECDH = 3;

type
  Pgnutls_credentials_type_t = ^Tgnutls_credentials_type_t;
  Tgnutls_credentials_type_t = longint;

const
  GNUTLS_CRD_CERTIFICATE = 1;
  GNUTLS_CRD_ANON = 2;
  GNUTLS_CRD_SRP = 3;
  GNUTLS_CRD_PSK = 4;
  GNUTLS_CRD_IA = 5;

type
  Pgnutls_mac_algorithm_t = ^Tgnutls_mac_algorithm_t;
  Tgnutls_mac_algorithm_t = longint;

const
  GNUTLS_MAC_UNKNOWN = 0;
  GNUTLS_MAC_NULL = 1;
  GNUTLS_MAC_MD5 = 2;
  GNUTLS_MAC_SHA1 = 3;
  GNUTLS_MAC_RMD160 = 4;
  GNUTLS_MAC_MD2 = 5;
  GNUTLS_MAC_SHA256 = 6;
  GNUTLS_MAC_SHA384 = 7;
  GNUTLS_MAC_SHA512 = 8;
  GNUTLS_MAC_SHA224 = 9;
  GNUTLS_MAC_SHA3_224 = 10;
  GNUTLS_MAC_SHA3_256 = 11;
  GNUTLS_MAC_SHA3_384 = 12;
  GNUTLS_MAC_SHA3_512 = 13;
  GNUTLS_MAC_MD5_SHA1 = 14;
  GNUTLS_MAC_GOSTR_94 = 15;
  GNUTLS_MAC_STREEBOG_256 = 16;
  GNUTLS_MAC_STREEBOG_512 = 17;
  GNUTLS_MAC_AEAD = 200;
  GNUTLS_MAC_UMAC_96 = 201;
  GNUTLS_MAC_UMAC_128 = 202;
  GNUTLS_MAC_AES_CMAC_128 = 203;
  GNUTLS_MAC_AES_CMAC_256 = 204;
  GNUTLS_MAC_AES_GMAC_128 = 205;
  GNUTLS_MAC_AES_GMAC_192 = 206;
  GNUTLS_MAC_AES_GMAC_256 = 207;
  GNUTLS_MAC_GOST28147_TC26Z_IMIT = 208;
  GNUTLS_MAC_SHAKE_128 = 209;
  GNUTLS_MAC_SHAKE_256 = 210;
  GNUTLS_MAC_MAGMA_OMAC = 211;
  GNUTLS_MAC_KUZNYECHIK_OMAC = 212;

type
  Pgnutls_digest_algorithm_t = ^Tgnutls_digest_algorithm_t;
  Tgnutls_digest_algorithm_t = longint;

const
  GNUTLS_DIG_UNKNOWN = GNUTLS_MAC_UNKNOWN;
  GNUTLS_DIG_NULL = GNUTLS_MAC_NULL;
  GNUTLS_DIG_MD5 = GNUTLS_MAC_MD5;
  GNUTLS_DIG_SHA1 = GNUTLS_MAC_SHA1;
  GNUTLS_DIG_RMD160 = GNUTLS_MAC_RMD160;
  GNUTLS_DIG_MD2 = GNUTLS_MAC_MD2;
  GNUTLS_DIG_SHA256 = GNUTLS_MAC_SHA256;
  GNUTLS_DIG_SHA384 = GNUTLS_MAC_SHA384;
  GNUTLS_DIG_SHA512 = GNUTLS_MAC_SHA512;
  GNUTLS_DIG_SHA224 = GNUTLS_MAC_SHA224;
  GNUTLS_DIG_SHA3_224 = GNUTLS_MAC_SHA3_224;
  GNUTLS_DIG_SHA3_256 = GNUTLS_MAC_SHA3_256;
  GNUTLS_DIG_SHA3_384 = GNUTLS_MAC_SHA3_384;
  GNUTLS_DIG_SHA3_512 = GNUTLS_MAC_SHA3_512;
  GNUTLS_DIG_MD5_SHA1 = GNUTLS_MAC_MD5_SHA1;
  GNUTLS_DIG_GOSTR_94 = GNUTLS_MAC_GOSTR_94;
  GNUTLS_DIG_STREEBOG_256 = GNUTLS_MAC_STREEBOG_256;
  GNUTLS_DIG_STREEBOG_512 = GNUTLS_MAC_STREEBOG_512;
  GNUTLS_DIG_SHAKE_128 = GNUTLS_MAC_SHAKE_128;
  GNUTLS_DIG_SHAKE_256 = GNUTLS_MAC_SHAKE_256;

const
  GNUTLS_MAC_SHA = GNUTLS_MAC_SHA1;
  GNUTLS_DIG_SHA = GNUTLS_DIG_SHA1;

const
  GNUTLS_MAX_ALGORITHM_NUM = 128;
  GNUTLS_MAX_SESSION_ID_SIZE = 32;

type
  Pgnutls_compression_method_t = ^Tgnutls_compression_method_t;
  Tgnutls_compression_method_t = longint;

const
  GNUTLS_COMP_UNKNOWN = 0;
  GNUTLS_COMP_NULL = 1;
  GNUTLS_COMP_DEFLATE = 2;
  GNUTLS_COMP_ZLIB = GNUTLS_COMP_DEFLATE;
  GNUTLS_COMP_BROTLI = 3;
  GNUTLS_COMP_ZSTD = 4;

type
  Pgnutls_init_flags_t = ^Tgnutls_init_flags_t;
  Tgnutls_init_flags_t = longint;

const
  GNUTLS_SERVER = 1;
  GNUTLS_CLIENT = 1 shl 1;
  GNUTLS_DATAGRAM = 1 shl 2;
  GNUTLS_NONBLOCK = 1 shl 3;
  GNUTLS_NO_DEFAULT_EXTENSIONS = 1 shl 4;
  GNUTLS_NO_REPLAY_PROTECTION = 1 shl 5;
  GNUTLS_NO_SIGNAL = 1 shl 6;
  GNUTLS_ALLOW_ID_CHANGE = 1 shl 7;
  GNUTLS_ENABLE_FALSE_START = 1 shl 8;
  GNUTLS_FORCE_CLIENT_CERT = 1 shl 9;
  GNUTLS_NO_TICKETS = 1 shl 10;
  GNUTLS_KEY_SHARE_TOP = 1 shl 11;
  GNUTLS_KEY_SHARE_TOP2 = 1 shl 12;
  GNUTLS_KEY_SHARE_TOP3 = 1 shl 13;
  GNUTLS_POST_HANDSHAKE_AUTH = 1 shl 14;
  GNUTLS_NO_AUTO_REKEY = 1 shl 15;
  GNUTLS_SAFE_PADDING_CHECK = 1 shl 16;
  GNUTLS_ENABLE_EARLY_START = 1 shl 17;
  GNUTLS_ENABLE_RAWPK = 1 shl 18;
  GNUTLS_AUTO_REAUTH = 1 shl 19;
  GNUTLS_ENABLE_EARLY_DATA = 1 shl 20;
  GNUTLS_NO_AUTO_SEND_TICKET = 1 shl 21;
  GNUTLS_NO_END_OF_EARLY_DATA = 1 shl 22;
  GNUTLS_NO_TICKETS_TLS12 = 1 shl 23;
  GNUTLS_NO_STATUS_REQUEST = 1 shl 24;

const
  GNUTLS_ENABLE_CERT_TYPE_NEG = 0;
  GNUTLS_NO_EXTENSIONS = GNUTLS_NO_DEFAULT_EXTENSIONS;

type
  Pgnutls_alert_level_t = ^Tgnutls_alert_level_t;
  Tgnutls_alert_level_t = longint;

const
  GNUTLS_AL_WARNING = 1;
  GNUTLS_AL_FATAL = 2;

type
  Pgnutls_alert_description_t = ^Tgnutls_alert_description_t;
  Tgnutls_alert_description_t = longint;

const
  GNUTLS_A_CLOSE_NOTIFY = 0;
  GNUTLS_A_UNEXPECTED_MESSAGE = 10;
  GNUTLS_A_BAD_RECORD_MAC = 20;
  GNUTLS_A_DECRYPTION_FAILED = 21;
  GNUTLS_A_RECORD_OVERFLOW = 22;
  GNUTLS_A_DECOMPRESSION_FAILURE = 30;
  GNUTLS_A_HANDSHAKE_FAILURE = 40;
  GNUTLS_A_SSL3_NO_CERTIFICATE = 41;
  GNUTLS_A_BAD_CERTIFICATE = 42;
  GNUTLS_A_UNSUPPORTED_CERTIFICATE = 43;
  GNUTLS_A_CERTIFICATE_REVOKED = 44;
  GNUTLS_A_CERTIFICATE_EXPIRED = 45;
  GNUTLS_A_CERTIFICATE_UNKNOWN = 46;
  GNUTLS_A_ILLEGAL_PARAMETER = 47;
  GNUTLS_A_UNKNOWN_CA = 48;
  GNUTLS_A_ACCESS_DENIED = 49;
  GNUTLS_A_DECODE_ERROR = 50;
  GNUTLS_A_DECRYPT_ERROR = 51;
  GNUTLS_A_EXPORT_RESTRICTION = 60;
  GNUTLS_A_PROTOCOL_VERSION = 70;
  GNUTLS_A_INSUFFICIENT_SECURITY = 71;
  GNUTLS_A_INTERNAL_ERROR = 80;
  GNUTLS_A_INAPPROPRIATE_FALLBACK = 86;
  GNUTLS_A_USER_CANCELED = 90;
  GNUTLS_A_NO_RENEGOTIATION = 100;
  GNUTLS_A_MISSING_EXTENSION = 109;
  GNUTLS_A_UNSUPPORTED_EXTENSION = 110;
  GNUTLS_A_CERTIFICATE_UNOBTAINABLE = 111;
  GNUTLS_A_UNRECOGNIZED_NAME = 112;
  GNUTLS_A_UNKNOWN_PSK_IDENTITY = 115;
  GNUTLS_A_CERTIFICATE_REQUIRED = 116;
  GNUTLS_A_NO_APPLICATION_PROTOCOL = 120;
  GNUTLS_A_MAX = GNUTLS_A_NO_APPLICATION_PROTOCOL;

type
  Pgnutls_handshake_description_t = ^Tgnutls_handshake_description_t;
  Tgnutls_handshake_description_t = longint;

const
  GNUTLS_HANDSHAKE_HELLO_REQUEST = 0;
  GNUTLS_HANDSHAKE_CLIENT_HELLO = 1;
  GNUTLS_HANDSHAKE_SERVER_HELLO = 2;
  GNUTLS_HANDSHAKE_HELLO_VERIFY_REQUEST = 3;
  GNUTLS_HANDSHAKE_NEW_SESSION_TICKET = 4;
  GNUTLS_HANDSHAKE_END_OF_EARLY_DATA = 5;
  GNUTLS_HANDSHAKE_ENCRYPTED_EXTENSIONS = 8;
  GNUTLS_HANDSHAKE_CERTIFICATE_PKT = 11;
  GNUTLS_HANDSHAKE_SERVER_KEY_EXCHANGE = 12;
  GNUTLS_HANDSHAKE_CERTIFICATE_REQUEST = 13;
  GNUTLS_HANDSHAKE_SERVER_HELLO_DONE = 14;
  GNUTLS_HANDSHAKE_CERTIFICATE_VERIFY = 15;
  GNUTLS_HANDSHAKE_CLIENT_KEY_EXCHANGE = 16;
  GNUTLS_HANDSHAKE_FINISHED = 20;
  GNUTLS_HANDSHAKE_CERTIFICATE_STATUS = 22;
  GNUTLS_HANDSHAKE_SUPPLEMENTAL = 23;
  GNUTLS_HANDSHAKE_KEY_UPDATE = 24;
  GNUTLS_HANDSHAKE_COMPRESSED_CERTIFICATE_PKT = 25;
  GNUTLS_HANDSHAKE_CHANGE_CIPHER_SPEC = 254;
  GNUTLS_HANDSHAKE_CLIENT_HELLO_V2 = 1024;
  GNUTLS_HANDSHAKE_HELLO_RETRY_REQUEST = 1025;

const
  GNUTLS_HANDSHAKE_ANY = dword(-1);

function gnutls_handshake_description_get_name(_type: Tgnutls_handshake_description_t): pchar; cdecl; external libgnutls;

type
  Pgnutls_certificate_status_t = ^Tgnutls_certificate_status_t;
  Tgnutls_certificate_status_t = longint;

const
  GNUTLS_CERT_INVALID = 1 shl 1;
  GNUTLS_CERT_REVOKED = 1 shl 5;
  GNUTLS_CERT_SIGNER_NOT_FOUND = 1 shl 6;
  GNUTLS_CERT_SIGNER_NOT_CA = 1 shl 7;
  GNUTLS_CERT_INSECURE_ALGORITHM = 1 shl 8;
  GNUTLS_CERT_NOT_ACTIVATED = 1 shl 9;
  GNUTLS_CERT_EXPIRED = 1 shl 10;
  GNUTLS_CERT_SIGNATURE_FAILURE = 1 shl 11;
  GNUTLS_CERT_REVOCATION_DATA_SUPERSEDED = 1 shl 12;
  GNUTLS_CERT_UNEXPECTED_OWNER = 1 shl 14;
  GNUTLS_CERT_REVOCATION_DATA_ISSUED_IN_FUTURE = 1 shl 15;
  GNUTLS_CERT_SIGNER_CONSTRAINTS_FAILURE = 1 shl 16;
  GNUTLS_CERT_MISMATCH = 1 shl 17;
  GNUTLS_CERT_PURPOSE_MISMATCH = 1 shl 18;
  GNUTLS_CERT_MISSING_OCSP_STATUS = 1 shl 19;
  GNUTLS_CERT_INVALID_OCSP_STATUS = 1 shl 20;
  GNUTLS_CERT_UNKNOWN_CRIT_EXTENSIONS = 1 shl 21;

type
  Pgnutls_certificate_request_t = ^Tgnutls_certificate_request_t;
  Tgnutls_certificate_request_t = longint;

const
  GNUTLS_CERT_IGNORE = 0;
  GNUTLS_CERT_REQUEST = 1;
  GNUTLS_CERT_REQUIRE = 2;

type
  Pgnutls_openpgp_crt_status_t = ^Tgnutls_openpgp_crt_status_t;
  Tgnutls_openpgp_crt_status_t = longint;

const
  GNUTLS_OPENPGP_CERT = 0;
  GNUTLS_OPENPGP_CERT_FINGERPRINT = 1;

type
  Pgnutls_close_request_t = ^Tgnutls_close_request_t;
  Tgnutls_close_request_t = longint;

const
  GNUTLS_SHUT_RDWR = 0;
  GNUTLS_SHUT_WR = 1;

type
  Pgnutls_protocol_t = ^Tgnutls_protocol_t;
  Tgnutls_protocol_t = longint;

const
  GNUTLS_SSL3 = 1;
  GNUTLS_TLS1_0 = 2;
  GNUTLS_TLS1 = GNUTLS_TLS1_0;
  GNUTLS_TLS1_1 = 3;
  GNUTLS_TLS1_2 = 4;
  GNUTLS_TLS1_3 = 5;
  GNUTLS_DTLS0_9 = 200;
  GNUTLS_DTLS1_0 = 201;
  GNUTLS_DTLS1_2 = 202;
  GNUTLS_DTLS_VERSION_MIN = GNUTLS_DTLS0_9;
  GNUTLS_DTLS_VERSION_MAX = GNUTLS_DTLS1_2;
  GNUTLS_TLS_VERSION_MAX = GNUTLS_TLS1_3;
  GNUTLS_VERSION_UNKNOWN = $ff;

type
  Pgnutls_certificate_type_t = ^Tgnutls_certificate_type_t;
  Tgnutls_certificate_type_t = longint;

const
  GNUTLS_CRT_UNKNOWN = 0;
  GNUTLS_CRT_X509 = 1;
  GNUTLS_CRT_OPENPGP = 2;
  GNUTLS_CRT_RAWPK = 3;
  GNUTLS_CRT_MAX = GNUTLS_CRT_RAWPK;

const
  GNUTLS_CRT_RAW = GNUTLS_CRT_RAWPK;

type
  Pgnutls_x509_crt_fmt_t = ^Tgnutls_x509_crt_fmt_t;
  Tgnutls_x509_crt_fmt_t = longint;

const
  GNUTLS_X509_FMT_DER = 0;
  GNUTLS_X509_FMT_PEM = 1;

type
  Pgnutls_certificate_print_formats = ^Tgnutls_certificate_print_formats;
  Tgnutls_certificate_print_formats = longint;

const
  GNUTLS_CRT_PRINT_FULL = 0;
  GNUTLS_CRT_PRINT_ONELINE = 1;
  GNUTLS_CRT_PRINT_UNSIGNED_FULL = 2;
  GNUTLS_CRT_PRINT_COMPACT = 3;
  GNUTLS_CRT_PRINT_FULL_NUMBERS = 4;

type
  Tgnutls_certificate_print_formats_t = Tgnutls_certificate_print_formats;
  Pgnutls_certificate_print_formats_t = ^Tgnutls_certificate_print_formats_t;

type
  Pgnutls_pk_algorithm_t = ^Tgnutls_pk_algorithm_t;
  Tgnutls_pk_algorithm_t = longint;

const
  GNUTLS_PK_UNKNOWN = 0;
  GNUTLS_PK_RSA = 1;
  GNUTLS_PK_DSA = 2;
  GNUTLS_PK_DH = 3;
  GNUTLS_PK_ECDSA = 4;
  GNUTLS_PK_ECDH_X25519 = 5;
  GNUTLS_PK_RSA_PSS = 6;
  GNUTLS_PK_EDDSA_ED25519 = 7;
  GNUTLS_PK_GOST_01 = 8;
  GNUTLS_PK_GOST_12_256 = 9;
  GNUTLS_PK_GOST_12_512 = 10;
  GNUTLS_PK_ECDH_X448 = 11;
  GNUTLS_PK_EDDSA_ED448 = 12;
  GNUTLS_PK_MAX = GNUTLS_PK_EDDSA_ED448;

const
  GNUTLS_PK_ECC = GNUTLS_PK_ECDSA;
  GNUTLS_PK_EC = GNUTLS_PK_ECDSA;
  GNUTLS_PK_ECDHX = GNUTLS_PK_ECDH_X25519;

function gnutls_pk_algorithm_get_name(algorithm: Tgnutls_pk_algorithm_t): pchar; cdecl; external libgnutls;

type
  Pgnutls_sign_algorithm_t = ^Tgnutls_sign_algorithm_t;
  Tgnutls_sign_algorithm_t = longint;

const
  GNUTLS_SIGN_UNKNOWN = 0;
  GNUTLS_SIGN_RSA_SHA1 = 1;
  GNUTLS_SIGN_RSA_SHA = GNUTLS_SIGN_RSA_SHA1;
  GNUTLS_SIGN_DSA_SHA1 = 2;
  GNUTLS_SIGN_DSA_SHA = GNUTLS_SIGN_DSA_SHA1;
  GNUTLS_SIGN_RSA_MD5 = 3;
  GNUTLS_SIGN_RSA_MD2 = 4;
  GNUTLS_SIGN_RSA_RMD160 = 5;
  GNUTLS_SIGN_RSA_SHA256 = 6;
  GNUTLS_SIGN_RSA_SHA384 = 7;
  GNUTLS_SIGN_RSA_SHA512 = 8;
  GNUTLS_SIGN_RSA_SHA224 = 9;
  GNUTLS_SIGN_DSA_SHA224 = 10;
  GNUTLS_SIGN_DSA_SHA256 = 11;
  GNUTLS_SIGN_ECDSA_SHA1 = 12;
  GNUTLS_SIGN_ECDSA_SHA224 = 13;
  GNUTLS_SIGN_ECDSA_SHA256 = 14;
  GNUTLS_SIGN_ECDSA_SHA384 = 15;
  GNUTLS_SIGN_ECDSA_SHA512 = 16;
  GNUTLS_SIGN_DSA_SHA384 = 17;
  GNUTLS_SIGN_DSA_SHA512 = 18;
  GNUTLS_SIGN_ECDSA_SHA3_224 = 20;
  GNUTLS_SIGN_ECDSA_SHA3_256 = 21;
  GNUTLS_SIGN_ECDSA_SHA3_384 = 22;
  GNUTLS_SIGN_ECDSA_SHA3_512 = 23;
  GNUTLS_SIGN_DSA_SHA3_224 = 24;
  GNUTLS_SIGN_DSA_SHA3_256 = 25;
  GNUTLS_SIGN_DSA_SHA3_384 = 26;
  GNUTLS_SIGN_DSA_SHA3_512 = 27;
  GNUTLS_SIGN_RSA_SHA3_224 = 28;
  GNUTLS_SIGN_RSA_SHA3_256 = 29;
  GNUTLS_SIGN_RSA_SHA3_384 = 30;
  GNUTLS_SIGN_RSA_SHA3_512 = 31;
  GNUTLS_SIGN_RSA_PSS_SHA256 = 32;
  GNUTLS_SIGN_RSA_PSS_SHA384 = 33;
  GNUTLS_SIGN_RSA_PSS_SHA512 = 34;
  GNUTLS_SIGN_EDDSA_ED25519 = 35;
  GNUTLS_SIGN_RSA_RAW = 36;
  GNUTLS_SIGN_ECDSA_SECP256R1_SHA256 = 37;
  GNUTLS_SIGN_ECDSA_SECP384R1_SHA384 = 38;
  GNUTLS_SIGN_ECDSA_SECP521R1_SHA512 = 39;
  GNUTLS_SIGN_RSA_PSS_RSAE_SHA256 = 40;
  GNUTLS_SIGN_RSA_PSS_RSAE_SHA384 = 41;
  GNUTLS_SIGN_RSA_PSS_RSAE_SHA512 = 42;
  GNUTLS_SIGN_GOST_94 = 43;
  GNUTLS_SIGN_GOST_256 = 44;
  GNUTLS_SIGN_GOST_512 = 45;
  GNUTLS_SIGN_EDDSA_ED448 = 46;
  GNUTLS_SIGN_MAX = GNUTLS_SIGN_EDDSA_ED448;

type
  Pgnutls_ecc_curve_t = ^Tgnutls_ecc_curve_t;
  Tgnutls_ecc_curve_t = longint;

const
  GNUTLS_ECC_CURVE_INVALID = 0;
  GNUTLS_ECC_CURVE_SECP224R1 = 1;
  GNUTLS_ECC_CURVE_SECP256R1 = 2;
  GNUTLS_ECC_CURVE_SECP384R1 = 3;
  GNUTLS_ECC_CURVE_SECP521R1 = 4;
  GNUTLS_ECC_CURVE_SECP192R1 = 5;
  GNUTLS_ECC_CURVE_X25519 = 6;
  GNUTLS_ECC_CURVE_ED25519 = 7;
  GNUTLS_ECC_CURVE_GOST256CPA = 8;
  GNUTLS_ECC_CURVE_GOST256CPB = 9;
  GNUTLS_ECC_CURVE_GOST256CPC = 10;
  GNUTLS_ECC_CURVE_GOST256CPXA = 11;
  GNUTLS_ECC_CURVE_GOST256CPXB = 12;
  GNUTLS_ECC_CURVE_GOST512A = 13;
  GNUTLS_ECC_CURVE_GOST512B = 14;
  GNUTLS_ECC_CURVE_GOST512C = 15;
  GNUTLS_ECC_CURVE_GOST256A = 16;
  GNUTLS_ECC_CURVE_GOST256B = 17;
  GNUTLS_ECC_CURVE_GOST256C = 18;
  GNUTLS_ECC_CURVE_GOST256D = 19;
  GNUTLS_ECC_CURVE_X448 = 20;
  GNUTLS_ECC_CURVE_ED448 = 21;
  GNUTLS_ECC_CURVE_MAX = GNUTLS_ECC_CURVE_ED448;

type
  Pgnutls_group_t = ^Tgnutls_group_t;
  Tgnutls_group_t = longint;

const
  GNUTLS_GROUP_INVALID = 0;
  GNUTLS_GROUP_SECP192R1 = GNUTLS_ECC_CURVE_SECP192R1;
  GNUTLS_GROUP_SECP224R1 = GNUTLS_ECC_CURVE_SECP224R1;
  GNUTLS_GROUP_SECP256R1 = GNUTLS_ECC_CURVE_SECP256R1;
  GNUTLS_GROUP_SECP384R1 = GNUTLS_ECC_CURVE_SECP384R1;
  GNUTLS_GROUP_SECP521R1 = GNUTLS_ECC_CURVE_SECP521R1;
  GNUTLS_GROUP_X25519 = GNUTLS_ECC_CURVE_X25519;
  GNUTLS_GROUP_X448 = GNUTLS_ECC_CURVE_X448;
  GNUTLS_GROUP_GC256A = GNUTLS_ECC_CURVE_GOST256A;
  GNUTLS_GROUP_GC256B = GNUTLS_ECC_CURVE_GOST256B;
  GNUTLS_GROUP_GC256C = GNUTLS_ECC_CURVE_GOST256C;
  GNUTLS_GROUP_GC256D = GNUTLS_ECC_CURVE_GOST256D;
  GNUTLS_GROUP_GC512A = GNUTLS_ECC_CURVE_GOST512A;
  GNUTLS_GROUP_GC512B = GNUTLS_ECC_CURVE_GOST512B;
  GNUTLS_GROUP_GC512C = GNUTLS_ECC_CURVE_GOST512C;
  GNUTLS_GROUP_FFDHE2048 = 256;
  GNUTLS_GROUP_FFDHE3072 = 257;
  GNUTLS_GROUP_FFDHE4096 = 258;
  GNUTLS_GROUP_FFDHE8192 = 259;
  GNUTLS_GROUP_FFDHE6144 = 260;
  GNUTLS_GROUP_MAX = GNUTLS_GROUP_FFDHE6144;

function GNUTLS_CURVE_TO_BITS(curve: longint): dword;
function GNUTLS_BITS_TO_CURVE(bits: longint): longint;
function GNUTLS_BITS_ARE_CURVE(bits: longint): longint;

type
  Pgnutls_sec_param_t = ^Tgnutls_sec_param_t;
  Tgnutls_sec_param_t = longint;

const
  GNUTLS_SEC_PARAM_UNKNOWN = 0;
  GNUTLS_SEC_PARAM_INSECURE = 5;
  GNUTLS_SEC_PARAM_EXPORT = 10;
  GNUTLS_SEC_PARAM_VERY_WEAK = 15;
  GNUTLS_SEC_PARAM_WEAK = 20;
  GNUTLS_SEC_PARAM_LOW = 25;
  GNUTLS_SEC_PARAM_LEGACY = 30;
  GNUTLS_SEC_PARAM_MEDIUM = 35;
  GNUTLS_SEC_PARAM_HIGH = 40;
  GNUTLS_SEC_PARAM_ULTRA = 45;
  GNUTLS_SEC_PARAM_FUTURE = 50;
  GNUTLS_SEC_PARAM_MAX = GNUTLS_SEC_PARAM_FUTURE;

const
  GNUTLS_SEC_PARAM_NORMAL = GNUTLS_SEC_PARAM_MEDIUM;

type
  Pgnutls_channel_binding_t = ^Tgnutls_channel_binding_t;
  Tgnutls_channel_binding_t = longint;

const
  GNUTLS_CB_TLS_UNIQUE = 0;
  GNUTLS_CB_TLS_SERVER_END_POINT = 1;
  GNUTLS_CB_TLS_EXPORTER = 2;

type
  Pgnutls_gost_paramset_t = ^Tgnutls_gost_paramset_t;
  Tgnutls_gost_paramset_t = longint;

const
  GNUTLS_GOST_PARAMSET_UNKNOWN = 0;
  GNUTLS_GOST_PARAMSET_TC26_Z = 1;
  GNUTLS_GOST_PARAMSET_CP_A = 2;
  GNUTLS_GOST_PARAMSET_CP_B = 3;
  GNUTLS_GOST_PARAMSET_CP_C = 4;
  GNUTLS_GOST_PARAMSET_CP_D = 5;

type
  Pgnutls_ctype_target_t = ^Tgnutls_ctype_target_t;
  Tgnutls_ctype_target_t = longint;

const
  GNUTLS_CTYPE_CLIENT = 0;
  GNUTLS_CTYPE_SERVER = 1;
  GNUTLS_CTYPE_OURS = 2;
  GNUTLS_CTYPE_PEERS = 3;

type
  Tgnutls_transport_ptr_t = pointer;
  Pgnutls_transport_ptr_t = ^Tgnutls_transport_ptr_t;

  Tgnutls_session_int = record
  end;
  Tgnutls_session_t = ^Tgnutls_session_int;
  Pgnutls_session_t = ^Tgnutls_session_t;

  Tgnutls_dh_params_int = record
  end;
  Tgnutls_dh_params_t = ^Tgnutls_dh_params_int;
  Pgnutls_dh_params_t = ^Tgnutls_dh_params_t;

  Tgnutls_x509_privkey_int = record
  end;
  Tgnutls_rsa_params_t = ^Tgnutls_x509_privkey_int;
  Pgnutls_rsa_params_t = ^Tgnutls_rsa_params_t;

  Tgnutls_priority_st = record
  end;
  Tgnutls_priority_t = ^Tgnutls_priority_st;
  Pgnutls_priority_t = ^Tgnutls_priority_t;

  Tgnutls_datum_t = record
    data: pbyte;
    size: dword;
  end;
  Pgnutls_datum_t = ^Tgnutls_datum_t;
  PPgnutls_datum_t = ^Pgnutls_datum_t;

  Tgnutls_library_config_st = record
    name: pchar;
    value: pchar;
  end;
  Pgnutls_library_config_st = ^Tgnutls_library_config_st;

  Tgnutls_params_st = record
    _type: Tgnutls_params_type_t;
    params: record
      case longint of
        0: (dh: Tgnutls_dh_params_t);
        1: (rsa_export: Tgnutls_rsa_params_t);
      end;
    deinit: longint;
  end;
  Pgnutls_params_st = ^Tgnutls_params_st;

  Tgnutls_params_function = function(session: Tgnutls_session_t; ptype: Tgnutls_params_type_t; params: Pgnutls_params_st): integer; cdecl;

function gnutls_init(session: Pgnutls_session_t; flags: dword): longint; cdecl; external libgnutls;
procedure gnutls_deinit(session: Tgnutls_session_t); cdecl; external libgnutls;

function gnutls_bye(session: Tgnutls_session_t; how: Tgnutls_close_request_t): longint; cdecl; external libgnutls;
function gnutls_handshake(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_reauth(session: Tgnutls_session_t; flags: dword): longint; cdecl; external libgnutls;

const
  GNUTLS_DEFAULT_HANDSHAKE_TIMEOUT = dword(-(1));
  GNUTLS_INDEFINITE_TIMEOUT = dword(-(2));

procedure gnutls_handshake_set_timeout(session: Tgnutls_session_t; ms: dword); cdecl; external libgnutls;
function gnutls_rehandshake(session: Tgnutls_session_t): longint; cdecl; external libgnutls;

const
  GNUTLS_KU_PEER = 1;

function gnutls_session_key_update(session: Tgnutls_session_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_alert_get(session: Tgnutls_session_t): Tgnutls_alert_description_t; cdecl; external libgnutls;
function gnutls_alert_send(session: Tgnutls_session_t; level: Tgnutls_alert_level_t; desc: Tgnutls_alert_description_t): longint; cdecl; external libgnutls;
function gnutls_alert_send_appropriate(session: Tgnutls_session_t; err: longint): longint; cdecl; external libgnutls;
function gnutls_alert_get_name(alert: Tgnutls_alert_description_t): pchar; cdecl; external libgnutls;
function gnutls_alert_get_strname(alert: Tgnutls_alert_description_t): pchar; cdecl; external libgnutls;
function gnutls_pk_bits_to_sec_param(algo: Tgnutls_pk_algorithm_t; bits: dword): Tgnutls_sec_param_t; cdecl; external libgnutls;
function gnutls_sec_param_get_name(param: Tgnutls_sec_param_t): pchar; cdecl; external libgnutls;
function gnutls_sec_param_to_pk_bits(algo: Tgnutls_pk_algorithm_t; param: Tgnutls_sec_param_t): dword; cdecl; external libgnutls;
function gnutls_sec_param_to_symmetric_bits(param: Tgnutls_sec_param_t): dword; cdecl; external libgnutls;
function gnutls_ecc_curve_get_name(curve: Tgnutls_ecc_curve_t): pchar; cdecl; external libgnutls;
function gnutls_ecc_curve_get_oid(curve: Tgnutls_ecc_curve_t): pchar; cdecl; external libgnutls;
function gnutls_group_get_name(group: Tgnutls_group_t): pchar; cdecl; external libgnutls;
function gnutls_ecc_curve_get_size(curve: Tgnutls_ecc_curve_t): longint; cdecl; external libgnutls;
function gnutls_ecc_curve_get(session: Tgnutls_session_t): Tgnutls_ecc_curve_t; cdecl; external libgnutls;
function gnutls_group_get(session: Tgnutls_session_t): Tgnutls_group_t; cdecl; external libgnutls;
function gnutls_cipher_get(session: Tgnutls_session_t): Tgnutls_cipher_algorithm_t; cdecl; external libgnutls;
function gnutls_early_cipher_get(session: Tgnutls_session_t): Tgnutls_cipher_algorithm_t; cdecl; external libgnutls;
function gnutls_kx_get(session: Tgnutls_session_t): Tgnutls_kx_algorithm_t; cdecl; external libgnutls;
function gnutls_mac_get(session: Tgnutls_session_t): Tgnutls_mac_algorithm_t; cdecl; external libgnutls;
function gnutls_prf_hash_get(session: Tgnutls_session_t): Tgnutls_digest_algorithm_t; cdecl; external libgnutls;
function gnutls_early_prf_hash_get(session: Tgnutls_session_t): Tgnutls_digest_algorithm_t; cdecl; external libgnutls;
function gnutls_certificate_type_get(session: Tgnutls_session_t): Tgnutls_certificate_type_t; cdecl; external libgnutls;
function gnutls_certificate_type_get2(session: Tgnutls_session_t; target: Tgnutls_ctype_target_t): Tgnutls_certificate_type_t; cdecl; external libgnutls;
function gnutls_sign_algorithm_get(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_sign_algorithm_get_client(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_sign_algorithm_get_requested(session: Tgnutls_session_t; indx: Tsize_t; algo: Pgnutls_sign_algorithm_t): longint; cdecl; external libgnutls;
function gnutls_cipher_get_name(algorithm: Tgnutls_cipher_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_mac_get_name(algorithm: Tgnutls_mac_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_digest_get_name(algorithm: Tgnutls_digest_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_digest_get_oid(algorithm: Tgnutls_digest_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_kx_get_name(algorithm: Tgnutls_kx_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_certificate_type_get_name(_type: Tgnutls_certificate_type_t): pchar; cdecl; external libgnutls;
function gnutls_pk_get_name(algorithm: Tgnutls_pk_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_pk_get_oid(algorithm: Tgnutls_pk_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_sign_get_name(algorithm: Tgnutls_sign_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_sign_get_oid(sign: Tgnutls_sign_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_gost_paramset_get_name(param: Tgnutls_gost_paramset_t): pchar; cdecl; external libgnutls;
function gnutls_gost_paramset_get_oid(param: Tgnutls_gost_paramset_t): pchar; cdecl; external libgnutls;
function gnutls_cipher_get_key_size(algorithm: Tgnutls_cipher_algorithm_t): Tsize_t; cdecl; external libgnutls;
function gnutls_mac_get_key_size(algorithm: Tgnutls_mac_algorithm_t): Tsize_t; cdecl; external libgnutls;
function gnutls_sign_is_secure(algorithm: Tgnutls_sign_algorithm_t): dword; cdecl; external libgnutls;

const
  GNUTLS_SIGN_FLAG_SECURE_FOR_CERTS = 1;

function gnutls_sign_is_secure2(algorithm: Tgnutls_sign_algorithm_t; flags: dword): dword; cdecl; external libgnutls;
function gnutls_sign_get_hash_algorithm(sign: Tgnutls_sign_algorithm_t): Tgnutls_digest_algorithm_t; cdecl; external libgnutls;
function gnutls_sign_get_pk_algorithm(sign: Tgnutls_sign_algorithm_t): Tgnutls_pk_algorithm_t; cdecl; external libgnutls;
function gnutls_pk_to_sign(pk: Tgnutls_pk_algorithm_t; hash: Tgnutls_digest_algorithm_t): Tgnutls_sign_algorithm_t; cdecl; external libgnutls;
function gnutls_sign_supports_pk_algorithm(sign: Tgnutls_sign_algorithm_t; pk: Tgnutls_pk_algorithm_t): dword; cdecl; external libgnutls;

function gnutls_sign_algorithm_get_name(alg: Tgnutls_sign_algorithm_t): pchar; cdecl; external libgnutls name 'gnutls_sign_get_name';

function gnutls_mac_get_id(name: pchar): Tgnutls_mac_algorithm_t; cdecl; external libgnutls;
function gnutls_digest_get_id(name: pchar): Tgnutls_digest_algorithm_t; cdecl; external libgnutls;
function gnutls_cipher_get_id(name: pchar): Tgnutls_cipher_algorithm_t; cdecl; external libgnutls;
function gnutls_kx_get_id(name: pchar): Tgnutls_kx_algorithm_t; cdecl; external libgnutls;
function gnutls_protocol_get_id(name: pchar): Tgnutls_protocol_t; cdecl; external libgnutls;
function gnutls_certificate_type_get_id(name: pchar): Tgnutls_certificate_type_t; cdecl; external libgnutls;
function gnutls_pk_get_id(name: pchar): Tgnutls_pk_algorithm_t; cdecl; external libgnutls;
function gnutls_sign_get_id(name: pchar): Tgnutls_sign_algorithm_t; cdecl; external libgnutls;
function gnutls_ecc_curve_get_id(name: pchar): Tgnutls_ecc_curve_t; cdecl; external libgnutls;
function gnutls_ecc_curve_get_pk(curve: Tgnutls_ecc_curve_t): Tgnutls_pk_algorithm_t; cdecl; external libgnutls;
function gnutls_group_get_id(name: pchar): Tgnutls_group_t; cdecl; external libgnutls;
function gnutls_oid_to_digest(oid: pchar): Tgnutls_digest_algorithm_t; cdecl; external libgnutls;
function gnutls_oid_to_mac(oid: pchar): Tgnutls_mac_algorithm_t; cdecl; external libgnutls;
function gnutls_oid_to_pk(oid: pchar): Tgnutls_pk_algorithm_t; cdecl; external libgnutls;
function gnutls_oid_to_sign(oid: pchar): Tgnutls_sign_algorithm_t; cdecl; external libgnutls;
function gnutls_oid_to_ecc_curve(oid: pchar): Tgnutls_ecc_curve_t; cdecl; external libgnutls;
function gnutls_oid_to_gost_paramset(oid: pchar): Tgnutls_gost_paramset_t; cdecl; external libgnutls;
function gnutls_ecc_curve_list: Pgnutls_ecc_curve_t; cdecl; external libgnutls;
function gnutls_group_list: Pgnutls_group_t; cdecl; external libgnutls;
function gnutls_cipher_list: Pgnutls_cipher_algorithm_t; cdecl; external libgnutls;
function gnutls_mac_list: Pgnutls_mac_algorithm_t; cdecl; external libgnutls;
function gnutls_digest_list: Pgnutls_digest_algorithm_t; cdecl; external libgnutls;
function gnutls_protocol_list: Pgnutls_protocol_t; cdecl; external libgnutls;
function gnutls_certificate_type_list: Pgnutls_certificate_type_t; cdecl; external libgnutls;
function gnutls_kx_list: Pgnutls_kx_algorithm_t; cdecl; external libgnutls;
function gnutls_pk_list: Pgnutls_pk_algorithm_t; cdecl; external libgnutls;
function gnutls_sign_list: Pgnutls_sign_algorithm_t; cdecl; external libgnutls;
function gnutls_cipher_suite_info(idx: Tsize_t; cs_id: pbyte; kx: Pgnutls_kx_algorithm_t; cipher: Pgnutls_cipher_algorithm_t; mac: Pgnutls_mac_algorithm_t; min_version: Pgnutls_protocol_t): pchar; cdecl; external libgnutls;
function gnutls_ecc_curve_set_enabled(curve: Tgnutls_ecc_curve_t; enabled: dword): longint; cdecl; external libgnutls;
function gnutls_sign_set_secure(sign: Tgnutls_sign_algorithm_t; secure: dword): longint; cdecl; external libgnutls;
function gnutls_sign_set_secure_for_certs(sign: Tgnutls_sign_algorithm_t; secure: dword): longint; cdecl; external libgnutls;
function gnutls_digest_set_secure(dig: Tgnutls_digest_algorithm_t; secure: dword): longint; cdecl; external libgnutls;
function gnutls_protocol_set_enabled(version: Tgnutls_protocol_t; enabled: dword): longint; cdecl; external libgnutls;
function gnutls_error_is_fatal(error: longint): longint; cdecl; external libgnutls;
function gnutls_error_to_alert(err: longint; level: Plongint): longint; cdecl; external libgnutls;
procedure gnutls_perror(error: longint); cdecl; external libgnutls;
function gnutls_strerror(error: longint): pchar; cdecl; external libgnutls;
function gnutls_strerror_name(error: longint): pchar; cdecl; external libgnutls;
procedure gnutls_handshake_set_private_extensions(session: Tgnutls_session_t; allow: longint); cdecl; external libgnutls;
function gnutls_handshake_set_random(session: Tgnutls_session_t; random: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_handshake_get_last_out(session: Tgnutls_session_t): Tgnutls_handshake_description_t; cdecl; external libgnutls;
function gnutls_handshake_get_last_in(session: Tgnutls_session_t): Tgnutls_handshake_description_t; cdecl; external libgnutls;

const
  GNUTLS_HEARTBEAT_WAIT = 1;

function gnutls_heartbeat_ping(session: Tgnutls_session_t; data_size: Tsize_t; max_tries: dword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_heartbeat_pong(session: Tgnutls_session_t; flags: dword): longint; cdecl; external libgnutls;
procedure gnutls_record_set_timeout(session: Tgnutls_session_t; ms: dword); cdecl; external libgnutls;
procedure gnutls_record_disable_padding(session: Tgnutls_session_t); cdecl; external libgnutls;
procedure gnutls_record_cork(session: Tgnutls_session_t); cdecl; external libgnutls;

const
  GNUTLS_RECORD_WAIT = 1;

function gnutls_record_uncork(session: Tgnutls_session_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_record_discard_queued(session: Tgnutls_session_t): Tsize_t; cdecl; external libgnutls;

type
  Tseq_number = array[0..7] of byte;

function gnutls_record_get_state(session: Tgnutls_session_t; read: dword; mac_key: Pgnutls_datum_t; IV: Pgnutls_datum_t; cipher_key: Pgnutls_datum_t;
  seq_number: Tseq_number): longint; cdecl; external libgnutls;
function gnutls_record_set_state(session: Tgnutls_session_t; read: dword; seq_number: Tseq_number): longint; cdecl; external libgnutls;

type
  Tgnutls_range_st = record
    low: Tsize_t;
    high: Tsize_t;
  end;
  Pgnutls_range_st = ^Tgnutls_range_st;

function gnutls_range_split(session: Tgnutls_session_t; orig: Pgnutls_range_st; small_range: Pgnutls_range_st; rem_range: Pgnutls_range_st): longint; cdecl; external libgnutls;
function gnutls_record_send(session: Tgnutls_session_t; data: pointer; data_size: Tsize_t): Tssize_t; cdecl; external libgnutls;
function gnutls_record_send2(session: Tgnutls_session_t; data: pointer; data_size: Tsize_t; pad: Tsize_t; flags: dword): Tssize_t; cdecl; external libgnutls;
function gnutls_record_send_range(session: Tgnutls_session_t; data: pointer; data_size: Tsize_t; range: Pgnutls_range_st): Tssize_t; cdecl; external libgnutls;
function gnutls_record_send_file(session: Tgnutls_session_t; fd: longint; offset: Poff_t; count: Tsize_t): Tssize_t; cdecl; external libgnutls;
function gnutls_record_recv(session: Tgnutls_session_t; data: pointer; data_size: Tsize_t): Tssize_t; cdecl; external libgnutls;

type
  Tgnutls_packet_t = Pmbuffer_st;
  Pgnutls_packet_t = ^Tgnutls_packet_t;

function gnutls_record_recv_packet(session: Tgnutls_session_t; packet: Pgnutls_packet_t): Tssize_t; cdecl; external libgnutls;
procedure gnutls_packet_get(packet: Tgnutls_packet_t; data: Pgnutls_datum_t; sequence: pbyte); cdecl; external libgnutls;
procedure gnutls_packet_deinit(packet: Tgnutls_packet_t); cdecl; external libgnutls;

function gnutls_read(session: Pointer; data: Pointer; data_size: Tsize_t): integer; cdecl; external libgnutls name 'gnutls_record_recv';
function gnutls_write(session: Pointer; data: Pointer; data_size: Tsize_t): integer; cdecl; external libgnutls name 'gnutls_record_send';

function gnutls_record_recv_seq(session: Tgnutls_session_t; data: pointer; data_size: Tsize_t; seq: pbyte): Tssize_t; cdecl; external libgnutls;
function gnutls_record_overhead_size(session: Tgnutls_session_t): Tsize_t; cdecl; external libgnutls;
function gnutls_est_record_overhead_size(version: Tgnutls_protocol_t; cipher: Tgnutls_cipher_algorithm_t; mac: Tgnutls_mac_algorithm_t; comp: Tgnutls_compression_method_t; flags: dword): Tsize_t; cdecl; external libgnutls;
procedure gnutls_session_enable_compatibility_mode(session: Tgnutls_session_t); cdecl; external libgnutls;

procedure gnutls_record_set_max_empty_records(session, x: longint); unimplemented;

function gnutls_record_can_use_length_hiding(session: Tgnutls_session_t): dword; cdecl; external libgnutls;
function gnutls_record_get_direction(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_record_get_max_size(session: Tgnutls_session_t): Tsize_t; cdecl; external libgnutls;
function gnutls_record_set_max_size(session: Tgnutls_session_t; size: Tsize_t): Tssize_t; cdecl; external libgnutls;
function gnutls_record_set_max_recv_size(session: Tgnutls_session_t; size: Tsize_t): Tssize_t; cdecl; external libgnutls;
function gnutls_record_check_pending(session: Tgnutls_session_t): Tsize_t; cdecl; external libgnutls;
function gnutls_record_check_corked(session: Tgnutls_session_t): Tsize_t; cdecl; external libgnutls;
function gnutls_record_get_max_early_data_size(session: Tgnutls_session_t): Tsize_t; cdecl; external libgnutls;
function gnutls_record_set_max_early_data_size(session: Tgnutls_session_t; size: Tsize_t): longint; cdecl; external libgnutls;
function gnutls_record_send_early_data(session: Tgnutls_session_t; data: pointer; length: Tsize_t): Tssize_t; cdecl; external libgnutls;
function gnutls_record_recv_early_data(session: Tgnutls_session_t; data: pointer; data_size: Tsize_t): Tssize_t; cdecl; external libgnutls;
procedure gnutls_session_force_valid(session: Tgnutls_session_t); cdecl; external libgnutls;
function gnutls_prf(session: Tgnutls_session_t; label_size: Tsize_t; _label: pchar; server_random_first: longint; extra_size: Tsize_t; extra: pchar; outsize: Tsize_t; out_: pchar): longint; cdecl; external libgnutls;
function gnutls_prf_rfc5705(session: Tgnutls_session_t; label_size: Tsize_t; _label: pchar; context_size: Tsize_t; context: pchar; outsize: Tsize_t; out_: pchar): longint; cdecl; external libgnutls;
function gnutls_prf_early(session: Tgnutls_session_t; label_size: Tsize_t; _label: pchar; context_size: Tsize_t; context: pchar; outsize: Tsize_t; out_: pchar): longint; cdecl; external libgnutls;
function gnutls_prf_raw(session: Tgnutls_session_t; label_size: Tsize_t; _label: pchar; seed_size: Tsize_t; seed: pchar; outsize: Tsize_t; out_: pchar): longint; cdecl; external libgnutls;

type
  Pgnutls_server_name_type_t = ^Tgnutls_server_name_type_t;
  Tgnutls_server_name_type_t = longint;

const
  GNUTLS_NAME_DNS = 1;

function gnutls_server_name_set(session: Tgnutls_session_t; _type: Tgnutls_server_name_type_t; name: pointer; name_length: Tsize_t): longint; cdecl; external libgnutls;
function gnutls_server_name_get(session: Tgnutls_session_t; data: pointer; data_length: Psize_t; _type: Pdword; indx: dword): longint; cdecl; external libgnutls;
function gnutls_heartbeat_get_timeout(session: Tgnutls_session_t): dword; cdecl; external libgnutls;
procedure gnutls_heartbeat_set_timeouts(session: Tgnutls_session_t; retrans_timeout: dword; total_timeout: dword); cdecl; external libgnutls;

const
  GNUTLS_HB_PEER_ALLOWED_TO_SEND = 1;
  GNUTLS_HB_PEER_NOT_ALLOWED_TO_SEND = 1 shl 1;

procedure gnutls_heartbeat_enable(session: Tgnutls_session_t; _type: dword); cdecl; external libgnutls;

const
  GNUTLS_HB_LOCAL_ALLOWED_TO_SEND = 1 shl 2;

function gnutls_heartbeat_allowed(session: Tgnutls_session_t; _type: dword): dword; cdecl; external libgnutls;
function gnutls_safe_renegotiation_status(session: Tgnutls_session_t): dword; cdecl; external libgnutls;
function gnutls_session_ext_master_secret_status(session: Tgnutls_session_t): dword; cdecl; external libgnutls;
function gnutls_session_etm_status(session: Tgnutls_session_t): dword; cdecl; external libgnutls;

type
  Pgnutls_session_flags_t = ^Tgnutls_session_flags_t;
  Tgnutls_session_flags_t = longint;

const
  GNUTLS_SFLAGS_SAFE_RENEGOTIATION = 1;
  GNUTLS_SFLAGS_EXT_MASTER_SECRET = 1 shl 1;
  GNUTLS_SFLAGS_ETM = 1 shl 2;
  GNUTLS_SFLAGS_HB_LOCAL_SEND = 1 shl 3;
  GNUTLS_SFLAGS_HB_PEER_SEND = 1 shl 4;
  GNUTLS_SFLAGS_FALSE_START = 1 shl 5;
  GNUTLS_SFLAGS_RFC7919 = 1 shl 6;
  GNUTLS_SFLAGS_SESSION_TICKET = 1 shl 7;
  GNUTLS_SFLAGS_POST_HANDSHAKE_AUTH = 1 shl 8;
  GNUTLS_SFLAGS_EARLY_START = 1 shl 9;
  GNUTLS_SFLAGS_EARLY_DATA = 1 shl 10;
  GNUTLS_SFLAGS_CLI_REQUESTED_OCSP = 1 shl 11;
  GNUTLS_SFLAGS_SERV_REQUESTED_OCSP = 1 shl 12;

function gnutls_session_get_flags(session: Tgnutls_session_t): dword; cdecl; external libgnutls;

type
  Pgnutls_supplemental_data_format_type_t = ^Tgnutls_supplemental_data_format_type_t;
  Tgnutls_supplemental_data_format_type_t = longint;

const
  GNUTLS_SUPPLEMENTAL_UNKNOWN = 0;

function gnutls_supplemental_get_name(_type: Tgnutls_supplemental_data_format_type_t): pchar; cdecl; external libgnutls;
function gnutls_session_ticket_key_generate(key: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_session_ticket_enable_client(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_session_ticket_enable_server(session: Tgnutls_session_t; key: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_session_ticket_send(session: Tgnutls_session_t; nr: dword; flags: dword): longint; cdecl; external libgnutls;

type
  Pgnutls_srtp_profile_t = ^Tgnutls_srtp_profile_t;
  Tgnutls_srtp_profile_t = longint;

const
  GNUTLS_SRTP_AES128_CM_HMAC_SHA1_80 = $0001;
  GNUTLS_SRTP_AES128_CM_HMAC_SHA1_32 = $0002;
  GNUTLS_SRTP_NULL_HMAC_SHA1_80 = $0005;
  GNUTLS_SRTP_NULL_HMAC_SHA1_32 = $0006;
  GNUTLS_SRTP_AEAD_AES_128_GCM = $0007;
  GNUTLS_SRTP_AEAD_AES_256_GCM = $0008;

function gnutls_srtp_set_profile(session: Tgnutls_session_t; profile: Tgnutls_srtp_profile_t): longint; cdecl; external libgnutls;
function gnutls_srtp_set_profile_direct(session: Tgnutls_session_t; profiles: pchar; err_pos: PPchar): longint; cdecl; external libgnutls;
function gnutls_srtp_get_selected_profile(session: Tgnutls_session_t; profile: Pgnutls_srtp_profile_t): longint; cdecl; external libgnutls;
function gnutls_srtp_get_profile_name(profile: Tgnutls_srtp_profile_t): pchar; cdecl; external libgnutls;
function gnutls_srtp_get_profile_id(name: pchar; profile: Pgnutls_srtp_profile_t): longint; cdecl; external libgnutls;
function gnutls_srtp_get_keys(session: Tgnutls_session_t; key_material: pointer; key_material_size: dword; client_key: Pgnutls_datum_t; client_salt: Pgnutls_datum_t;
  server_key: Pgnutls_datum_t; server_salt: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_srtp_set_mki(session: Tgnutls_session_t; mki: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_srtp_get_mki(session: Tgnutls_session_t; mki: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_compress_certificate_get_selected_method(session: Tgnutls_session_t): Tgnutls_compression_method_t; cdecl; external libgnutls;
function gnutls_compress_certificate_set_methods(session: Tgnutls_session_t; methods: Pgnutls_compression_method_t; methods_len: Tsize_t): longint; cdecl; external libgnutls;

type
  Pgnutls_alpn_flags_t = ^Tgnutls_alpn_flags_t;
  Tgnutls_alpn_flags_t = longint;

const
  GNUTLS_ALPN_MANDATORY = 1;
  GNUTLS_ALPN_SERVER_PRECEDENCE = 1 shl 1;

const
  GNUTLS_ALPN_MAND = GNUTLS_ALPN_MANDATORY;

function gnutls_alpn_get_selected_protocol(session: Tgnutls_session_t; protocol: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_alpn_set_protocols(session: Tgnutls_session_t; protocols: Pgnutls_datum_t; protocols_size: dword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_key_generate(key: Pgnutls_datum_t; key_size: dword): longint; cdecl; external libgnutls;

const
  GNUTLS_PRIORITY_INIT_DEF_APPEND = 1;

function gnutls_priority_init(priority_cache: Pgnutls_priority_t; priorities: pchar; err_pos: PPchar): longint; cdecl; external libgnutls;
function gnutls_priority_init2(priority_cache: Pgnutls_priority_t; priorities: pchar; err_pos: PPchar; flags: dword): longint; cdecl; external libgnutls;
procedure gnutls_priority_deinit(priority_cache: Tgnutls_priority_t); cdecl; external libgnutls;
function gnutls_priority_get_cipher_suite_index(pcache: Tgnutls_priority_t; idx: dword; sidx: Pdword): longint; cdecl; external libgnutls;

const
  GNUTLS_PRIORITY_LIST_INIT_KEYWORDS = 1;
  GNUTLS_PRIORITY_LIST_SPECIAL = 2;

function gnutls_priority_string_list(iter: dword; flags: dword): pchar; cdecl; external libgnutls;
function gnutls_priority_set(session: Tgnutls_session_t; priority: Tgnutls_priority_t): longint; cdecl; external libgnutls;
function gnutls_priority_set_direct(session: Tgnutls_session_t; priorities: pchar; err_pos: PPchar): longint; cdecl; external libgnutls;
function gnutls_priority_certificate_type_list(pcache: Tgnutls_priority_t; list: PPdword): longint; cdecl; external libgnutls;
function gnutls_priority_certificate_type_list2(pcache: Tgnutls_priority_t; list: PPdword; target: Tgnutls_ctype_target_t): longint; cdecl; external libgnutls;
function gnutls_priority_sign_list(pcache: Tgnutls_priority_t; list: PPdword): longint; cdecl; external libgnutls;
function gnutls_priority_protocol_list(pcache: Tgnutls_priority_t; list: PPdword): longint; cdecl; external libgnutls;
function gnutls_priority_ecc_curve_list(pcache: Tgnutls_priority_t; list: PPdword): longint; cdecl; external libgnutls;
function gnutls_priority_group_list(pcache: Tgnutls_priority_t; list: PPdword): longint; cdecl; external libgnutls;
function gnutls_priority_kx_list(pcache: Tgnutls_priority_t; list: PPdword): longint; cdecl; external libgnutls;
function gnutls_priority_cipher_list(pcache: Tgnutls_priority_t; list: PPdword): longint; cdecl; external libgnutls;
function gnutls_priority_mac_list(pcache: Tgnutls_priority_t; list: PPdword): longint; cdecl; external libgnutls;
function gnutls_get_system_config_file: pchar; cdecl; external libgnutls;
function gnutls_set_default_priority(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_set_default_priority_append(session: Tgnutls_session_t; add_prio: pchar; err_pos: PPchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_cipher_suite_get_name(kx_algorithm: Tgnutls_kx_algorithm_t; cipher_algorithm: Tgnutls_cipher_algorithm_t; mac_algorithm: Tgnutls_mac_algorithm_t): pchar; cdecl; external libgnutls;
function gnutls_ciphersuite_get(session: Tgnutls_session_t): pchar; cdecl; external libgnutls;
function gnutls_protocol_get_version(session: Tgnutls_session_t): Tgnutls_protocol_t; cdecl; external libgnutls;
function gnutls_protocol_get_name(version: Tgnutls_protocol_t): pchar; cdecl; external libgnutls;
function gnutls_session_set_data(session: Tgnutls_session_t; session_data: pointer; session_data_size: Tsize_t): longint; cdecl; external libgnutls;
function gnutls_session_get_data(session: Tgnutls_session_t; session_data: pointer; session_data_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_session_get_data2(session: Tgnutls_session_t; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
procedure gnutls_session_get_random(session: Tgnutls_session_t; client: Pgnutls_datum_t; server: Pgnutls_datum_t); cdecl; external libgnutls;
procedure gnutls_session_get_master_secret(session: Tgnutls_session_t; secret: Pgnutls_datum_t); cdecl; external libgnutls;
function gnutls_session_get_desc(session: Tgnutls_session_t): pchar; cdecl; external libgnutls;

type
  Tgnutls_certificate_verify_function = function(session: Tgnutls_session_t): integer; cdecl;

procedure gnutls_session_set_verify_function(session: Tgnutls_session_t; func: Tgnutls_certificate_verify_function); cdecl; external libgnutls;

type
  Pgnutls_vdata_types_t = ^Tgnutls_vdata_types_t;
  Tgnutls_vdata_types_t = longint;

const
  GNUTLS_DT_UNKNOWN = 0;
  GNUTLS_DT_DNS_HOSTNAME = 1;
  GNUTLS_DT_KEY_PURPOSE_OID = 2;
  GNUTLS_DT_RFC822NAME = 3;
  GNUTLS_DT_IP_ADDRESS = 4;

type
  Tgnutls_typed_vdata_st = record
    _type: Tgnutls_vdata_types_t;
    data: pbyte;
    size: dword;
  end;
  Pgnutls_typed_vdata_st = ^Tgnutls_typed_vdata_st;

procedure gnutls_session_set_verify_cert(session: Tgnutls_session_t; hostname: pchar; flags: dword); cdecl; external libgnutls;
procedure gnutls_session_set_verify_cert2(session: Tgnutls_session_t; data: Pgnutls_typed_vdata_st; elements: dword; flags: dword); cdecl; external libgnutls;
function gnutls_session_get_verify_cert_status(para1: Tgnutls_session_t): dword; cdecl; external libgnutls;
function gnutls_session_set_premaster(session: Tgnutls_session_t; entity: dword; version: Tgnutls_protocol_t; kx: Tgnutls_kx_algorithm_t; cipher: Tgnutls_cipher_algorithm_t;
  mac: Tgnutls_mac_algorithm_t; comp: Tgnutls_compression_method_t; master: Pgnutls_datum_t; session_id: Pgnutls_datum_t): longint; cdecl; external libgnutls;

const
  GNUTLS_MAX_SESSION_ID = 32;

function gnutls_session_get_id(session: Tgnutls_session_t; session_id: pointer; session_id_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_session_get_id2(session: Tgnutls_session_t; session_id: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_session_set_id(session: Tgnutls_session_t; sid: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_session_channel_binding(session: Tgnutls_session_t; cbtype: Tgnutls_channel_binding_t; cb: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_session_is_resumed(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_session_resumption_requested(session: Tgnutls_session_t): longint; cdecl; external libgnutls;

type
  Tgnutls_db_store_func = function(para1: pointer; key: Tgnutls_datum_t; data: Tgnutls_datum_t): longint; cdecl;
  Tgnutls_db_remove_func = function(para1: pointer; key: Tgnutls_datum_t): longint; cdecl;
  Tgnutls_db_retr_func = function(para1: pointer; key: Tgnutls_datum_t): Tgnutls_datum_t; cdecl;

procedure gnutls_db_set_cache_expiration(session: Tgnutls_session_t; seconds: longint); cdecl; external libgnutls;
function gnutls_db_get_default_cache_expiration: dword; cdecl; external libgnutls;
procedure gnutls_db_remove_session(session: Tgnutls_session_t); cdecl; external libgnutls;
procedure gnutls_db_set_retrieve_function(session: Tgnutls_session_t; retr_func: Tgnutls_db_retr_func); cdecl; external libgnutls;
procedure gnutls_db_set_remove_function(session: Tgnutls_session_t; rem_func: Tgnutls_db_remove_func); cdecl; external libgnutls;
procedure gnutls_db_set_store_function(session: Tgnutls_session_t; store_func: Tgnutls_db_store_func); cdecl; external libgnutls;
procedure gnutls_db_set_ptr(session: Tgnutls_session_t; ptr: pointer); cdecl; external libgnutls;
function gnutls_db_get_ptr(session: Tgnutls_session_t): pointer; cdecl; external libgnutls;
function gnutls_db_check_entry(session: Tgnutls_session_t; session_entry: Tgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_db_check_entry_time(entry: Pgnutls_datum_t): Ttime_t; cdecl; external libgnutls;
function gnutls_db_check_entry_expire_time(entry: Pgnutls_datum_t): Ttime_t; cdecl; external libgnutls;

const
  GNUTLS_HOOK_POST = 1;
  GNUTLS_HOOK_PRE = 0;
  GNUTLS_HOOK_BOTH = -(1);

type
  Tgnutls_handshake_hook_func = function(para1: Tgnutls_session_t; htype: dword; when: dword; incoming: dword; msg: Pgnutls_datum_t): longint; cdecl;

procedure gnutls_handshake_set_hook_function(session: Tgnutls_session_t; htype: dword; when: longint; func: Tgnutls_handshake_hook_func); cdecl; external libgnutls;

type
  Tgnutls_handshake_simple_hook_func = function(para1: Tgnutls_session_t): longint; cdecl;
  Tgnutls_handshake_post_client_hello_func = Tgnutls_handshake_simple_hook_func;

procedure gnutls_handshake_set_post_client_hello_function(session: Tgnutls_session_t; func: Tgnutls_handshake_simple_hook_func); cdecl; external libgnutls;
procedure gnutls_handshake_set_max_packet_length(session: Tgnutls_session_t; max: Tsize_t); cdecl; external libgnutls;
function gnutls_check_version(req_version: pchar): pchar; cdecl; external libgnutls;

procedure gnutls_credentials_clear(session: Tgnutls_session_t); cdecl; external libgnutls;
function gnutls_credentials_set(session: Tgnutls_session_t; _type: Tgnutls_credentials_type_t; cred: pointer): longint; cdecl; external libgnutls;
function gnutls_credentials_get(session: Tgnutls_session_t; _type: Tgnutls_credentials_type_t; cred: Ppointer): longint; cdecl; external libgnutls;

function gnutls_cred_set(session: Tgnutls_session_t; _type: Tgnutls_credentials_type_t; cred: Pointer): longint; cdecl; external libgnutls name 'gnutls_credentials_set';

type
  Tgnutls_pubkey_st = record
  end;
  Tgnutls_pubkey_t = ^Tgnutls_pubkey_st;
  Pgnutls_pubkey_t = ^Tgnutls_pubkey_t;

  Tgnutls_privkey_st = record
  end;
  Tgnutls_privkey_t = ^Tgnutls_privkey_st;
  Pgnutls_privkey_t = ^Tgnutls_privkey_t;

  Pgnutls_x509_privkey_t = ^Tgnutls_x509_privkey_t;
  Tgnutls_x509_privkey_t = ^Tgnutls_x509_privkey_int;

  Tgnutls_x509_crl_int = record
  end;
  Tgnutls_x509_crl_t = ^Tgnutls_x509_crl_int;
  Pgnutls_x509_crl_t = ^Tgnutls_x509_crl_t;
  PPgnutls_x509_crl_t = ^Pgnutls_x509_crl_t;

  Tgnutls_x509_crt_int = record
  end;
  Tgnutls_x509_crt_t = ^Tgnutls_x509_crt_int;
  Pgnutls_x509_crt_t = ^Tgnutls_x509_crt_t;
  PPgnutls_x509_crt_t = ^Pgnutls_x509_crt_t;

  Tgnutls_x509_crq_int = record
  end;
  Tgnutls_x509_crq_t = ^Tgnutls_x509_crq_int;
  Pgnutls_x509_crq_t = ^Tgnutls_x509_crq_t;

  Tgnutls_openpgp_keyring_int = record
  end;
  Tgnutls_openpgp_keyring_t = ^Tgnutls_openpgp_keyring_int;
  Pgnutls_openpgp_keyring_t = ^Tgnutls_openpgp_keyring_t;

  Tgnutls_certificate_credentials_st = record
  end;
  Tgnutls_certificate_credentials_t = ^Tgnutls_certificate_credentials_st;
  Pgnutls_certificate_credentials_t = ^Tgnutls_certificate_credentials_t;

  Tgnutls_certificate_server_credentials = Tgnutls_certificate_credentials_t;
  Tgnutls_certificate_client_credentials = Tgnutls_certificate_credentials_t;

  Tgnutls_anon_server_credentials_st = record
  end;
  Tgnutls_anon_server_credentials_t = ^Tgnutls_anon_server_credentials_st;
  Pgnutls_anon_server_credentials_t = ^Tgnutls_anon_server_credentials_t;

  Tgnutls_anon_client_credentials_st = record
  end;
  Tgnutls_anon_client_credentials_t = ^Tgnutls_anon_client_credentials_st;
  Pgnutls_anon_client_credentials_t = ^Tgnutls_anon_client_credentials_t;

procedure gnutls_anon_free_server_credentials(sc: Tgnutls_anon_server_credentials_t); cdecl; external libgnutls;
function gnutls_anon_allocate_server_credentials(sc: Pgnutls_anon_server_credentials_t): longint; cdecl; external libgnutls;
procedure gnutls_anon_set_server_dh_params(res: Tgnutls_anon_server_credentials_t; dh_params: Tgnutls_dh_params_t); cdecl; external libgnutls;
function gnutls_anon_set_server_known_dh_params(res: Tgnutls_anon_server_credentials_t; sec_param: Tgnutls_sec_param_t): longint; cdecl; external libgnutls;
procedure gnutls_anon_set_server_params_function(res: Tgnutls_anon_server_credentials_t; func: Tgnutls_params_function); cdecl; external libgnutls;
procedure gnutls_anon_free_client_credentials(sc: Tgnutls_anon_client_credentials_t); cdecl; external libgnutls;
function gnutls_anon_allocate_client_credentials(sc: Pgnutls_anon_client_credentials_t): longint; cdecl; external libgnutls;

procedure gnutls_certificate_free_credentials(sc: Tgnutls_certificate_credentials_t); cdecl; external libgnutls;
function gnutls_certificate_allocate_credentials(res: Pgnutls_certificate_credentials_t): longint; cdecl; external libgnutls;
function gnutls_certificate_get_issuer(sc: Tgnutls_certificate_credentials_t; cert: Tgnutls_x509_crt_t; issuer: Pgnutls_x509_crt_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_certificate_get_crt_raw(sc: Tgnutls_certificate_credentials_t; idx1: dword; idx2: dword; cert: Pgnutls_datum_t): longint; cdecl; external libgnutls;
procedure gnutls_certificate_free_keys(sc: Tgnutls_certificate_credentials_t); cdecl; external libgnutls;
procedure gnutls_certificate_free_cas(sc: Tgnutls_certificate_credentials_t); cdecl; external libgnutls;
procedure gnutls_certificate_free_ca_names(sc: Tgnutls_certificate_credentials_t); cdecl; external libgnutls;
procedure gnutls_certificate_free_crls(sc: Tgnutls_certificate_credentials_t); cdecl; external libgnutls;
procedure gnutls_certificate_set_dh_params(res: Tgnutls_certificate_credentials_t; dh_params: Tgnutls_dh_params_t); cdecl; external libgnutls;
function gnutls_certificate_set_known_dh_params(res: Tgnutls_certificate_credentials_t; sec_param: Tgnutls_sec_param_t): longint; cdecl; external libgnutls;
procedure gnutls_certificate_set_verify_flags(res: Tgnutls_certificate_credentials_t; flags: dword); cdecl; external libgnutls;
function gnutls_certificate_get_verify_flags(res: Tgnutls_certificate_credentials_t): dword; cdecl; external libgnutls;

type
  Pgnutls_certificate_flags = ^Tgnutls_certificate_flags;
  Tgnutls_certificate_flags = longint;

const
  GNUTLS_CERTIFICATE_SKIP_KEY_CERT_MATCH = 1;
  GNUTLS_CERTIFICATE_API_V2 = 1 shl 1;
  GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK = 1 shl 2;
  GNUTLS_CERTIFICATE_VERIFY_CRLS = 1 shl 3;

procedure gnutls_certificate_set_flags(para1: Tgnutls_certificate_credentials_t; flags: dword); cdecl; external libgnutls;
procedure gnutls_certificate_set_verify_limits(res: Tgnutls_certificate_credentials_t; max_bits: dword; max_depth: dword); cdecl; external libgnutls;
function gnutls_certificate_set_x509_system_trust(cred: Tgnutls_certificate_credentials_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_trust_file(cred: Tgnutls_certificate_credentials_t; cafile: pchar; _type: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_trust_dir(cred: Tgnutls_certificate_credentials_t; ca_dir: pchar; _type: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_trust_mem(res: Tgnutls_certificate_credentials_t; ca: Pgnutls_datum_t; _type: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_crl_file(res: Tgnutls_certificate_credentials_t; crlfile: pchar; _type: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_crl_mem(res: Tgnutls_certificate_credentials_t; CRL: Pgnutls_datum_t; _type: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_key_file(res: Tgnutls_certificate_credentials_t; certfile: pchar; keyfile: pchar; _type: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_key_file2(res: Tgnutls_certificate_credentials_t; certfile: pchar; keyfile: pchar; _type: Tgnutls_x509_crt_fmt_t; pass: pchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_key_mem(res: Tgnutls_certificate_credentials_t; cert: Pgnutls_datum_t; key: Pgnutls_datum_t; _type: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_key_mem2(res: Tgnutls_certificate_credentials_t; cert: Pgnutls_datum_t; key: Pgnutls_datum_t; _type: Tgnutls_x509_crt_fmt_t; pass: pchar; flags: dword): longint; cdecl; external libgnutls;
procedure gnutls_certificate_send_x509_rdn_sequence(session: Tgnutls_session_t; status: longint); cdecl; external libgnutls;
function gnutls_certificate_set_x509_simple_pkcs12_file(res: Tgnutls_certificate_credentials_t; pkcs12file: pchar; _type: Tgnutls_x509_crt_fmt_t; password: pchar): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_simple_pkcs12_mem(res: Tgnutls_certificate_credentials_t; p12blob: Pgnutls_datum_t; _type: Tgnutls_x509_crt_fmt_t; password: pchar): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_key(res: Tgnutls_certificate_credentials_t; cert_list: Pgnutls_x509_crt_t; cert_list_size: longint; key: Tgnutls_x509_privkey_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_trust(res: Tgnutls_certificate_credentials_t; ca_list: Pgnutls_x509_crt_t; ca_list_size: longint): longint; cdecl; external libgnutls;
function gnutls_certificate_set_x509_crl(res: Tgnutls_certificate_credentials_t; crl_list: Pgnutls_x509_crl_t; crl_list_size: longint): longint; cdecl; external libgnutls;
function gnutls_certificate_get_x509_key(res: Tgnutls_certificate_credentials_t; index: dword; key: Pgnutls_x509_privkey_t): longint; cdecl; external libgnutls;
function gnutls_certificate_get_x509_crt(res: Tgnutls_certificate_credentials_t; index: dword; crt_list: PPgnutls_x509_crt_t; crt_list_size: Pdword): longint; cdecl; external libgnutls;

type
  Tgnutls_status_request_ocsp_func = function(session: Tgnutls_session_t; ptr: pointer; ocsp_response: Pgnutls_datum_t): longint; cdecl;

procedure gnutls_certificate_set_ocsp_status_request_function(res: Tgnutls_certificate_credentials_t; ocsp_func: Tgnutls_status_request_ocsp_func; ptr: pointer); cdecl; external libgnutls;
function gnutls_certificate_set_ocsp_status_request_function2(res: Tgnutls_certificate_credentials_t; idx: dword; ocsp_func: Tgnutls_status_request_ocsp_func; ptr: pointer): longint; cdecl; external libgnutls;
function gnutls_certificate_set_ocsp_status_request_file(res: Tgnutls_certificate_credentials_t; response_file: pchar; idx: dword): longint; cdecl; external libgnutls;
function gnutls_certificate_set_ocsp_status_request_file2(res: Tgnutls_certificate_credentials_t; response_file: pchar; idx: dword; fmt: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_ocsp_status_request_mem(res: Tgnutls_certificate_credentials_t; resp: Pgnutls_datum_t; idx: dword; fmt: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;

type
  Tgnutls_ocsp_data_st = record
    version: dword;
    response: Tgnutls_datum_t;
    exptime: Ttime_t;
    padding: array[0..31] of byte;
  end;
  Pgnutls_ocsp_data_st = ^Tgnutls_ocsp_data_st;
  PPgnutls_ocsp_data_st = ^Pgnutls_ocsp_data_st;

function gnutls_certificate_get_ocsp_expiration(sc: Tgnutls_certificate_credentials_t; idx: dword; oidx: longint; flags: dword): Ttime_t; cdecl; external libgnutls;
function gnutls_ocsp_status_request_enable_client(session: Tgnutls_session_t; responder_id: Pgnutls_datum_t; responder_id_size: Tsize_t; request_extensions: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_ocsp_status_request_get(session: Tgnutls_session_t; response: Pgnutls_datum_t): longint; cdecl; external libgnutls;

const
  GNUTLS_OCSP_SR_IS_AVAIL = 1;

function gnutls_ocsp_status_request_is_checked(session: Tgnutls_session_t; flags: dword): dword; cdecl; external libgnutls;
function gnutls_ocsp_status_request_get2(session: Tgnutls_session_t; idx: dword; response: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_certificate_set_rawpk_key_mem(cred: Tgnutls_certificate_credentials_t; spki: Pgnutls_datum_t; pkey: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t; pass: pchar;
  key_usage: dword; names: PPchar; names_length: dword; flags: dword): longint; cdecl; external libgnutls;
function gnutls_certificate_set_rawpk_key_file(cred: Tgnutls_certificate_credentials_t; rawpkfile: pchar; privkeyfile: pchar; format: Tgnutls_x509_crt_fmt_t; pass: pchar;
  key_usage: dword; names: PPchar; names_length: dword; privkey_flags: dword; pkcs11_flags: dword): longint; cdecl; external libgnutls;
function gnutls_global_init: longint; cdecl; external libgnutls;
procedure gnutls_global_deinit; cdecl; external libgnutls;
function gnutls_get_library_config: Pgnutls_library_config_st; cdecl; external libgnutls;

type
  Tgnutls_time_func = function(t: Ptime_t): Ttime_t; cdecl;
  Tmutex_init_func = function(mutex: Ppointer): longint; cdecl;
  Tmutex_lock_func = function(mutex: Ppointer): longint; cdecl;
  Tmutex_unlock_func = function(mutex: Ppointer): longint; cdecl;
  Tmutex_deinit_func = function(mutex: Ppointer): longint; cdecl;

procedure gnutls_global_set_mutex(init: Tmutex_init_func; deinit: Tmutex_deinit_func; lock: Tmutex_lock_func; unlock: Tmutex_unlock_func); cdecl; external libgnutls;

type
  Tgnutls_alloc_function = function(para1: Tsize_t): pointer; cdecl;
  Tgnutls_calloc_function = function(para1: Tsize_t; para2: Tsize_t): pointer; cdecl;
  Tgnutls_is_secure_function = function(para1: pointer): longint; cdecl;
  Tgnutls_free_function = procedure(para1: pointer); cdecl;
  Tgnutls_realloc_function = function(para1: pointer; para2: Tsize_t): pointer; cdecl;

procedure gnutls_global_set_time_function(time_func: Tgnutls_time_func); cdecl; external libgnutls;

var
  gnutls_malloc: Tgnutls_alloc_function; cvar;external libgnutls;
  gnutls_realloc: Tgnutls_realloc_function; cvar;external libgnutls;
  gnutls_calloc: Tgnutls_calloc_function; cvar;external libgnutls;
  gnutls_free: Tgnutls_free_function; cvar;external libgnutls;
  gnutls_strdup: function(para1: pchar): pchar; cvar;external libgnutls;

procedure gnutls_memset(data: pointer; c: longint; size: Tsize_t); cdecl; external libgnutls;
function gnutls_memcmp(s1: pointer; s2: pointer; n: Tsize_t): longint; cdecl; external libgnutls;

type
  Tgnutls_log_func = procedure(level: longint; msg: pchar); cdecl;
  Tgnutls_audit_log_func = procedure(para1: Tgnutls_session_t; para2: pchar); cdecl;

procedure gnutls_global_set_log_function(log_func: Tgnutls_log_func); cdecl; external libgnutls;
procedure gnutls_global_set_audit_log_function(log_func: Tgnutls_audit_log_func); cdecl; external libgnutls;
procedure gnutls_global_set_log_level(level: longint); cdecl; external libgnutls;

type
  Tgnutls_keylog_func = function(session: Tgnutls_session_t; _label: pchar; secret: Pgnutls_datum_t): longint; cdecl;

function gnutls_session_get_keylog_function(session: Tgnutls_session_t): Tgnutls_keylog_func; cdecl; external libgnutls;
procedure gnutls_session_set_keylog_function(session: Tgnutls_session_t; func: Tgnutls_keylog_func); cdecl; external libgnutls;
function gnutls_dh_params_init(dh_params: Pgnutls_dh_params_t): longint; cdecl; external libgnutls;
procedure gnutls_dh_params_deinit(dh_params: Tgnutls_dh_params_t); cdecl; external libgnutls;
function gnutls_dh_params_import_raw(dh_params: Tgnutls_dh_params_t; prime: Pgnutls_datum_t; generator: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_dh_params_import_dsa(dh_params: Tgnutls_dh_params_t; key: Tgnutls_x509_privkey_t): longint; cdecl; external libgnutls;
function gnutls_dh_params_import_raw2(dh_params: Tgnutls_dh_params_t; prime: Pgnutls_datum_t; generator: Pgnutls_datum_t; key_bits: dword): longint; cdecl; external libgnutls;
function gnutls_dh_params_import_raw3(dh_params: Tgnutls_dh_params_t; prime: Pgnutls_datum_t; q: Pgnutls_datum_t; generator: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_dh_params_import_pkcs3(params: Tgnutls_dh_params_t; pkcs3_params: Pgnutls_datum_t; format: Tgnutls_x509_crt_fmt_t): longint; cdecl; external libgnutls;
function gnutls_dh_params_generate2(params: Tgnutls_dh_params_t; bits: dword): longint; cdecl; external libgnutls;
function gnutls_dh_params_export_pkcs3(params: Tgnutls_dh_params_t; format: Tgnutls_x509_crt_fmt_t; params_data: pbyte; params_data_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_dh_params_export2_pkcs3(params: Tgnutls_dh_params_t; format: Tgnutls_x509_crt_fmt_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_dh_params_export_raw(params: Tgnutls_dh_params_t; prime: Pgnutls_datum_t; generator: Pgnutls_datum_t; bits: Pdword): longint; cdecl; external libgnutls;
function gnutls_dh_params_cpy(dst: Tgnutls_dh_params_t; src: Tgnutls_dh_params_t): longint; cdecl; external libgnutls;

type
  Tgnutls_pull_func = function(para1: Tgnutls_transport_ptr_t; para2: pointer; para3: Tsize_t): Tssize_t; cdecl;
  Tgnutls_push_func = function(para1: Tgnutls_transport_ptr_t; para2: pointer; para3: Tsize_t): Tssize_t; cdecl;

function gnutls_system_recv_timeout(ptr: Tgnutls_transport_ptr_t; ms: dword): longint; cdecl; external libgnutls;

type
  Tgnutls_pull_timeout_func = function(para1: Tgnutls_transport_ptr_t; ms: dword): longint; cdecl;
  Tgnutls_vec_push_func = function(para1: Tgnutls_transport_ptr_t; iov: Pgiovec_t; iovcnt: longint): Tssize_t; cdecl;
  Tgnutls_errno_func = function(para1: Tgnutls_transport_ptr_t): longint; cdecl;

procedure gnutls_transport_set_int2(session: Tgnutls_session_t; r: longint; s: longint); cdecl; external libgnutls;
procedure gnutls_transport_set_int(s: Tgnutls_session_t; i: longint);

procedure gnutls_transport_get_int2(session: Tgnutls_session_t; r: Plongint; s: Plongint); cdecl; external libgnutls;
function gnutls_transport_get_int(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
procedure gnutls_transport_set_ptr(session: Tgnutls_session_t; ptr: Tgnutls_transport_ptr_t); cdecl; external libgnutls;
procedure gnutls_transport_set_ptr2(session: Tgnutls_session_t; recv_ptr: Tgnutls_transport_ptr_t; send_ptr: Tgnutls_transport_ptr_t); cdecl; external libgnutls;
function gnutls_transport_get_ptr(session: Tgnutls_session_t): Tgnutls_transport_ptr_t; cdecl; external libgnutls;
procedure gnutls_transport_get_ptr2(session: Tgnutls_session_t; recv_ptr: Pgnutls_transport_ptr_t; send_ptr: Pgnutls_transport_ptr_t); cdecl; external libgnutls;
procedure gnutls_transport_set_vec_push_function(session: Tgnutls_session_t; vec_func: Tgnutls_vec_push_func); cdecl; external libgnutls;
procedure gnutls_transport_set_push_function(session: Tgnutls_session_t; push_func: Tgnutls_push_func); cdecl; external libgnutls;
procedure gnutls_transport_set_pull_function(session: Tgnutls_session_t; pull_func: Tgnutls_pull_func); cdecl; external libgnutls;
procedure gnutls_transport_set_pull_timeout_function(session: Tgnutls_session_t; func: Tgnutls_pull_timeout_func); cdecl; external libgnutls;
procedure gnutls_transport_set_errno_function(session: Tgnutls_session_t; errno_func: Tgnutls_errno_func); cdecl; external libgnutls;
procedure gnutls_transport_set_errno(session: Tgnutls_session_t; err: longint); cdecl; external libgnutls;
procedure gnutls_session_set_ptr(session: Tgnutls_session_t; ptr: pointer); cdecl; external libgnutls;
function gnutls_session_get_ptr(session: Tgnutls_session_t): pointer; cdecl; external libgnutls;
procedure gnutls_openpgp_send_cert(session: Tgnutls_session_t; status: Tgnutls_openpgp_crt_status_t); cdecl; external libgnutls;
function gnutls_fingerprint(algo: Tgnutls_digest_algorithm_t; data: Pgnutls_datum_t; result: pointer; result_size: Psize_t): longint; cdecl; external libgnutls;

type
  Pgnutls_random_art = ^Tgnutls_random_art;
  Tgnutls_random_art = longint;

const
  GNUTLS_RANDOM_ART_OPENSSH = 1;

type
  Tgnutls_random_art_t = Tgnutls_random_art;
  Pgnutls_random_art_t = ^Tgnutls_random_art_t;

function gnutls_random_art(_type: Tgnutls_random_art_t; key_type: pchar; key_size: dword; fpr: pointer; fpr_size: Tsize_t;
  art: Pgnutls_datum_t): longint; cdecl; external libgnutls;

const
  GNUTLS_IDNA_FORCE_2008 = 1 shl 1;

function gnutls_idna_map(input: pchar; ilen: dword; out_: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_idna_reverse_map(input: pchar; ilen: dword; out_: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

type
  Tgnutls_srp_server_credentials_st = record
  end;
  Tgnutls_srp_server_credentials_t = ^Tgnutls_srp_server_credentials_st;
  Pgnutls_srp_server_credentials_t = ^Tgnutls_srp_server_credentials_t;

  Tgnutls_srp_client_credentials_st = record
  end;
  Tgnutls_srp_client_credentials_t = ^Tgnutls_srp_client_credentials_st;
  Pgnutls_srp_client_credentials_t = ^Tgnutls_srp_client_credentials_t;

procedure gnutls_srp_free_client_credentials(sc: Tgnutls_srp_client_credentials_t); cdecl; external libgnutls;
function gnutls_srp_allocate_client_credentials(sc: Pgnutls_srp_client_credentials_t): longint; cdecl; external libgnutls;
function gnutls_srp_set_client_credentials(res: Tgnutls_srp_client_credentials_t; username: pchar; password: pchar): longint; cdecl; external libgnutls;
procedure gnutls_srp_free_server_credentials(sc: Tgnutls_srp_server_credentials_t); cdecl; external libgnutls;
function gnutls_srp_allocate_server_credentials(sc: Pgnutls_srp_server_credentials_t): longint; cdecl; external libgnutls;
function gnutls_srp_set_server_credentials_file(res: Tgnutls_srp_server_credentials_t; password_file: pchar; password_conf_file: pchar): longint; cdecl; external libgnutls;
function gnutls_srp_server_get_username(session: Tgnutls_session_t): pchar; cdecl; external libgnutls;
procedure gnutls_srp_set_prime_bits(session: Tgnutls_session_t; bits: dword); cdecl; external libgnutls;
function gnutls_srp_verifier(username: pchar; password: pchar; salt: Pgnutls_datum_t; generator: Pgnutls_datum_t; prime: Pgnutls_datum_t;
  res: Pgnutls_datum_t): longint; cdecl; external libgnutls;

var
  gnutls_srp_8192_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_8192_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_4096_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_4096_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_3072_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_3072_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_2048_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_2048_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_1536_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_1536_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_1024_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_srp_1024_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_8192_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_8192_group_q: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_8192_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_8192_key_bits: dword; cvar;external libgnutls;
  gnutls_ffdhe_6144_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_6144_group_q: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_6144_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_6144_key_bits: dword; cvar;external libgnutls;
  gnutls_ffdhe_4096_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_4096_group_q: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_4096_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_4096_key_bits: dword; cvar;external libgnutls;
  gnutls_ffdhe_3072_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_3072_group_q: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_3072_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_3072_key_bits: dword; cvar;external libgnutls;
  gnutls_ffdhe_2048_group_prime: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_2048_group_q: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_2048_group_generator: Tgnutls_datum_t; cvar;external libgnutls;
  gnutls_ffdhe_2048_key_bits: dword; cvar;external libgnutls;

type
  Tgnutls_srp_server_credentials_function = function(session: Tgnutls_session_t; username: pansichar; salt: Pgnutls_datum_t; verifier: Pgnutls_datum_t; generator: Pgnutls_datum_t; prime: Pgnutls_datum_t): integer; cdecl;

procedure gnutls_srp_set_server_credentials_function(cred: Tgnutls_srp_server_credentials_t; func: Tgnutls_srp_server_credentials_function); cdecl; external libgnutls;

type
  Tgnutls_srp_client_credentials_function = function(session: Tgnutls_session_t; username: PPChar; password: PPChar): integer; cdecl;

procedure gnutls_srp_set_client_credentials_function(cred: Tgnutls_srp_client_credentials_t; func: Tgnutls_srp_client_credentials_function); cdecl; external libgnutls;
function gnutls_srp_base64_encode(data: Pgnutls_datum_t; result: pchar; result_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_srp_base64_encode2(data: Pgnutls_datum_t; result: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_srp_base64_decode(b64_data: Pgnutls_datum_t; result: pchar; result_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_srp_base64_decode2(b64_data: Pgnutls_datum_t; result: Pgnutls_datum_t): longint; cdecl; external libgnutls;

function gnutls_srp_base64_encode_alloc(input: Pgnutls_datum_t; output: PPgnutls_datum_t): integer; cdecl; external libgnutls name 'gnutls_srp_base64_encode2';
function gnutls_srp_base64_decode_alloc(input: Pgnutls_datum_t; output: PPgnutls_datum_t): integer; cdecl; external libgnutls name 'gnutls_srp_base64_decode2';

procedure gnutls_srp_set_server_fake_salt_seed(sc: Tgnutls_srp_server_credentials_t; seed: Pgnutls_datum_t; salt_length: dword); cdecl; external libgnutls;

type
  Tgnutls_psk_server_credentials_st = record
  end;
  Tgnutls_psk_server_credentials_t = ^Tgnutls_psk_server_credentials_st;
  Pgnutls_psk_server_credentials_t = ^Tgnutls_psk_server_credentials_t;

  Tgnutls_psk_client_credentials_st = record
  end;
  Tgnutls_psk_client_credentials_t = ^Tgnutls_psk_client_credentials_st;
  Pgnutls_psk_client_credentials_t = ^Tgnutls_psk_client_credentials_t;

type
  Pgnutls_psk_key_flags = ^Tgnutls_psk_key_flags;
  Tgnutls_psk_key_flags = longint;

const
  GNUTLS_PSK_KEY_RAW = 0;
  GNUTLS_PSK_KEY_HEX = 1 shl 0;
  GNUTLS_PSK_KEY_EXT = 1 shl 1;

procedure gnutls_psk_free_client_credentials(sc: Tgnutls_psk_client_credentials_t); cdecl; external libgnutls;
function gnutls_psk_allocate_client_credentials(sc: Pgnutls_psk_client_credentials_t): longint; cdecl; external libgnutls;
function gnutls_psk_set_client_credentials(res: Tgnutls_psk_client_credentials_t; username: pchar; key: Pgnutls_datum_t; flags: Tgnutls_psk_key_flags): longint; cdecl; external libgnutls;
function gnutls_psk_set_client_credentials2(res: Tgnutls_psk_client_credentials_t; username: Pgnutls_datum_t; key: Pgnutls_datum_t; flags: Tgnutls_psk_key_flags): longint; cdecl; external libgnutls;
procedure gnutls_psk_free_server_credentials(sc: Tgnutls_psk_server_credentials_t); cdecl; external libgnutls;
function gnutls_psk_allocate_server_credentials(sc: Pgnutls_psk_server_credentials_t): longint; cdecl; external libgnutls;
function gnutls_psk_set_server_credentials_file(res: Tgnutls_psk_server_credentials_t; password_file: pchar): longint; cdecl; external libgnutls;
function gnutls_psk_set_server_credentials_hint(res: Tgnutls_psk_server_credentials_t; hint: pchar): longint; cdecl; external libgnutls;
function gnutls_psk_server_get_username(session: Tgnutls_session_t): pchar; cdecl; external libgnutls;
function gnutls_psk_server_get_username2(session: Tgnutls_session_t; out_: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_psk_client_get_hint(session: Tgnutls_session_t): pchar; cdecl; external libgnutls;

type
  Tgnutls_psk_server_credentials_function = function(session: Tgnutls_session_t; username: pansichar; key: Pgnutls_datum_t): integer; cdecl;
  Tgnutls_psk_server_credentials_function2 = function(session: Tgnutls_session_t; username: Pgnutls_datum_t; key: Pgnutls_datum_t): integer; cdecl;
  Tgnutls_psk_server_credentials_function3 = function(session: Tgnutls_session_t; username: Pgnutls_datum_t; key: Pgnutls_datum_t; flags: Pgnutls_psk_key_flags): integer; cdecl;

procedure gnutls_psk_set_server_credentials_function(cred: Tgnutls_psk_server_credentials_t; func: Tgnutls_psk_server_credentials_function); cdecl; external libgnutls;
procedure gnutls_psk_set_server_credentials_function2(cred: Tgnutls_psk_server_credentials_t; func: Tgnutls_psk_server_credentials_function2); cdecl; external libgnutls;
procedure gnutls_psk_set_server_credentials_function3(cred: Tgnutls_psk_server_credentials_t; func: Tgnutls_psk_server_credentials_function3); cdecl; external libgnutls;
function gnutls_psk_format_imported_identity(identity: Pgnutls_datum_t; context: Pgnutls_datum_t; version: Tgnutls_protocol_t; hash: Tgnutls_digest_algorithm_t; imported_identity: Pgnutls_datum_t): longint; cdecl; external libgnutls;

type
  Tgnutls_psk_client_credentials_function = function(session: Tgnutls_session_t; username: PPChar; key: Pgnutls_datum_t): integer; cdecl;
  Tgnutls_psk_client_credentials_function2 = function(session: Tgnutls_session_t; username: Pgnutls_datum_t; key: Pgnutls_datum_t): integer; cdecl;
  Tgnutls_psk_client_credentials_function3 = function(session: Tgnutls_session_t; username: Pgnutls_datum_t; key: Pgnutls_datum_t; flags: Pgnutls_psk_key_flags): integer; cdecl;

procedure gnutls_psk_set_client_credentials_function(cred: Tgnutls_psk_client_credentials_t; func: Tgnutls_psk_client_credentials_function); cdecl; external libgnutls;
procedure gnutls_psk_set_client_credentials_function2(cred: Tgnutls_psk_client_credentials_t; func: Tgnutls_psk_client_credentials_function2); cdecl; external libgnutls;
procedure gnutls_psk_set_client_credentials_function3(cred: Tgnutls_psk_client_credentials_t; func: Tgnutls_psk_client_credentials_function3); cdecl; external libgnutls;
function gnutls_hex_encode(data: Pgnutls_datum_t; result: pchar; result_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_hex_decode(hex_data: Pgnutls_datum_t; result: pointer; result_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_hex_encode2(data: Pgnutls_datum_t; result: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_hex_decode2(data: Pgnutls_datum_t; result: Pgnutls_datum_t): longint; cdecl; external libgnutls;
procedure gnutls_psk_set_server_dh_params(res: Tgnutls_psk_server_credentials_t; dh_params: Tgnutls_dh_params_t); cdecl; external libgnutls;
function gnutls_psk_set_server_known_dh_params(res: Tgnutls_psk_server_credentials_t; sec_param: Tgnutls_sec_param_t): longint; cdecl; external libgnutls;
procedure gnutls_psk_set_server_params_function(res: Tgnutls_psk_server_credentials_t; func: Tgnutls_params_function); cdecl; external libgnutls;

type
  Pgnutls_x509_subject_alt_name_t = ^Tgnutls_x509_subject_alt_name_t;
  Tgnutls_x509_subject_alt_name_t = longint;

const
  GNUTLS_SAN_DNSNAME = 1;
  GNUTLS_SAN_RFC822NAME = 2;
  GNUTLS_SAN_URI = 3;
  GNUTLS_SAN_IPADDRESS = 4;
  GNUTLS_SAN_OTHERNAME = 5;
  GNUTLS_SAN_DN = 6;
  GNUTLS_SAN_REGISTERED_ID = 7;
  GNUTLS_SAN_MAX = GNUTLS_SAN_REGISTERED_ID;
  GNUTLS_SAN_OTHERNAME_XMPP = 1000;
  GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL = 1001;
  GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL = 1002;

type
  Tgnutls_openpgp_crt_int = record
  end;
  Tgnutls_openpgp_crt_t = ^Tgnutls_openpgp_crt_int;
  Pgnutls_openpgp_crt_t = ^Tgnutls_openpgp_crt_t;
  PPgnutls_openpgp_crt_t = ^Pgnutls_openpgp_crt_t;

  Tgnutls_openpgp_privkey_int = record
  end;
  Tgnutls_openpgp_privkey_t = ^Tgnutls_openpgp_privkey_int;
  Pgnutls_openpgp_privkey_t = ^Tgnutls_openpgp_privkey_t;

  Tgnutls_pkcs11_privkey_st = record
  end;
  Tgnutls_pkcs11_privkey_t = ^Tgnutls_pkcs11_privkey_st;
  Pgnutls_pkcs11_privkey_t = ^Tgnutls_pkcs11_privkey_t;

  Pgnutls_privkey_type_t = ^Tgnutls_privkey_type_t;
  Tgnutls_privkey_type_t = longint;

const
  GNUTLS_PRIVKEY_X509 = 0;
  GNUTLS_PRIVKEY_OPENPGP = 1;
  GNUTLS_PRIVKEY_PKCS11 = 2;
  GNUTLS_PRIVKEY_EXT = 3;

type
  Tgnutls_retr2_st = record
    cert_type: Tgnutls_certificate_type_t;
    key_type: Tgnutls_privkey_type_t;
    cert: record
      case longint of
        0: (x509: Pgnutls_x509_crt_t);
        1: (pgp: Tgnutls_openpgp_crt_t);
      end;
    ncerts: dword;
    key: record
      case longint of
        0: (x509: Tgnutls_x509_privkey_t);
        1: (pgp: Tgnutls_openpgp_privkey_t);
        2: (pkcs11: Tgnutls_pkcs11_privkey_t);
      end;
    deinit_all: dword;
  end;
  Pgnutls_retr2_st = ^Tgnutls_retr2_st;

function gnutls_auth_get_type(session: Tgnutls_session_t): Tgnutls_credentials_type_t; cdecl; external libgnutls;
function gnutls_auth_server_get_type(session: Tgnutls_session_t): Tgnutls_credentials_type_t; cdecl; external libgnutls;
function gnutls_auth_client_get_type(session: Tgnutls_session_t): Tgnutls_credentials_type_t; cdecl; external libgnutls;
procedure gnutls_dh_set_prime_bits(session: Tgnutls_session_t; bits: dword); cdecl; external libgnutls;
function gnutls_dh_get_secret_bits(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_dh_get_peers_public_bits(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_dh_get_prime_bits(session: Tgnutls_session_t): longint; cdecl; external libgnutls;
function gnutls_dh_get_group(session: Tgnutls_session_t; raw_gen: Pgnutls_datum_t; raw_prime: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_dh_get_pubkey(session: Tgnutls_session_t; raw_key: Pgnutls_datum_t): longint; cdecl; external libgnutls;

type
  Tgnutls_certificate_retrieve_function = function(session: Tgnutls_session_t; req_ca_rdn: Pgnutls_datum_t; nreqs: integer; pk_algos: Pgnutls_pk_algorithm_t; pk_algos_length: integer; retr: Pgnutls_retr2_st): integer; cdecl;

procedure gnutls_certificate_set_retrieve_function(cred: Tgnutls_certificate_credentials_t; func: Tgnutls_certificate_retrieve_function); cdecl; external libgnutls;
procedure gnutls_certificate_set_verify_function(cred: Tgnutls_certificate_credentials_t; func: Tgnutls_certificate_verify_function); cdecl; external libgnutls;
procedure gnutls_certificate_server_set_request(session: Tgnutls_session_t; req: Tgnutls_certificate_request_t); cdecl; external libgnutls;
function gnutls_certificate_get_peers(session: Tgnutls_session_t; list_size: Pdword): Pgnutls_datum_t; cdecl; external libgnutls;
function gnutls_certificate_get_ours(session: Tgnutls_session_t): Pgnutls_datum_t; cdecl; external libgnutls;
function gnutls_certificate_get_peers_subkey_id(session: Tgnutls_session_t; id: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_certificate_activation_time_peers(session: Tgnutls_session_t): Ttime_t; cdecl; external libgnutls;
function gnutls_certificate_expiration_time_peers(session: Tgnutls_session_t): Ttime_t; cdecl; external libgnutls;
function gnutls_certificate_client_get_request_status(session: Tgnutls_session_t): dword; cdecl; external libgnutls;
function gnutls_certificate_verify_peers2(session: Tgnutls_session_t; status: Pdword): longint; cdecl; external libgnutls;
function gnutls_certificate_verify_peers3(session: Tgnutls_session_t; hostname: pchar; status: Pdword): longint; cdecl; external libgnutls;
function gnutls_certificate_verify_peers(session: Tgnutls_session_t; data: Pgnutls_typed_vdata_st; elements: dword; status: Pdword): longint; cdecl; external libgnutls;
function gnutls_certificate_verification_status_print(status: dword; _type: Tgnutls_certificate_type_t; out_: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_pem_base64_encode(msg: pchar; data: Pgnutls_datum_t; result: pchar; result_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pem_base64_decode(header: pchar; b64_data: Pgnutls_datum_t; result: pbyte; result_size: Psize_t): longint; cdecl; external libgnutls;
function gnutls_pem_base64_encode2(msg: pchar; data: Pgnutls_datum_t; result: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_pem_base64_decode2(header: pchar; b64_data: Pgnutls_datum_t; result: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_base64_encode2(data: Pgnutls_datum_t; result: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_base64_decode2(b64_data: Pgnutls_datum_t; result: Pgnutls_datum_t): longint; cdecl; external libgnutls;

function gnutls_pem_base64_encode_alloc(header: pansichar; input: Pgnutls_datum_t; output: PPgnutls_datum_t): integer; cdecl; external libgnutls name 'gnutls_pem_base64_encode2';
function gnutls_pem_base64_decode_alloc(header: pansichar; input: Pgnutls_datum_t; output: PPgnutls_datum_t): integer; cdecl; external libgnutls name 'gnutls_pem_base64_decode2';

const
  GNUTLS_KEY_DIGITAL_SIGNATURE = 128;
  GNUTLS_KEY_NON_REPUDIATION = 64;
  GNUTLS_KEY_KEY_ENCIPHERMENT = 32;
  GNUTLS_KEY_DATA_ENCIPHERMENT = 16;
  GNUTLS_KEY_KEY_AGREEMENT = 8;
  GNUTLS_KEY_KEY_CERT_SIGN = 4;
  GNUTLS_KEY_CRL_SIGN = 2;
  GNUTLS_KEY_ENCIPHER_ONLY = 1;
  GNUTLS_KEY_DECIPHER_ONLY = 32768;

procedure gnutls_certificate_set_params_function(res: Tgnutls_certificate_credentials_t; func: Tgnutls_params_function); cdecl; external libgnutls;
procedure gnutls_anon_set_params_function(res: Tgnutls_anon_server_credentials_t; func: Tgnutls_params_function); cdecl; external libgnutls;
procedure gnutls_psk_set_params_function(res: Tgnutls_psk_server_credentials_t; func: Tgnutls_params_function); cdecl; external libgnutls;
function gnutls_hex2bin(hex_data: pchar; hex_size: Tsize_t; bin_data: pointer; bin_size: Psize_t): longint; cdecl; external libgnutls;

type
  Tgnutls_tdb_store_func = function(db_name: pchar; host: pchar; service: pchar; expiration: Ttime_t; pubkey: Pgnutls_datum_t): longint; cdecl;
  Tgnutls_tdb_store_commitment_func = function(db_name: pchar; host: pchar; service: pchar; expiration: Ttime_t; hash_algo: Tgnutls_digest_algorithm_t; hash: Pgnutls_datum_t): longint; cdecl;

  Tgnutls_tdb_verify_func = function(db_name: pchar; host: pchar; service: pchar; pubkey: Pgnutls_datum_t): longint; cdecl;

  Tgnutls_tdb_int = record
  end;
  Tgnutls_tdb_t = ^Tgnutls_tdb_int;
  Pgnutls_tdb_t = ^Tgnutls_tdb_t;

function gnutls_tdb_init(tdb: Pgnutls_tdb_t): longint; cdecl; external libgnutls;
procedure gnutls_tdb_set_store_func(tdb: Tgnutls_tdb_t; store: Tgnutls_tdb_store_func); cdecl; external libgnutls;
procedure gnutls_tdb_set_store_commitment_func(tdb: Tgnutls_tdb_t; cstore: Tgnutls_tdb_store_commitment_func); cdecl; external libgnutls;
procedure gnutls_tdb_set_verify_func(tdb: Tgnutls_tdb_t; verify: Tgnutls_tdb_verify_func); cdecl; external libgnutls;
procedure gnutls_tdb_deinit(tdb: Tgnutls_tdb_t); cdecl; external libgnutls;
function gnutls_verify_stored_pubkey(db_name: pchar; tdb: Tgnutls_tdb_t; host: pchar; service: pchar; cert_type: Tgnutls_certificate_type_t;
  cert: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

const
  GNUTLS_SCOMMIT_FLAG_ALLOW_BROKEN = 1;

function gnutls_store_commitment(db_name: pchar; tdb: Tgnutls_tdb_t; host: pchar; service: pchar; hash_algo: Tgnutls_digest_algorithm_t;
  hash: Pgnutls_datum_t; expiration: Ttime_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_store_pubkey(db_name: pchar; tdb: Tgnutls_tdb_t; host: pchar; service: pchar; cert_type: Tgnutls_certificate_type_t;
  cert: Pgnutls_datum_t; expiration: Ttime_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_load_file(filename: pchar; data: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_url_is_supported(url: pchar): dword; cdecl; external libgnutls;

type
  Pgnutls_pin_flag_t = ^Tgnutls_pin_flag_t;
  Tgnutls_pin_flag_t = longint;

const
  GNUTLS_PIN_USER = 1 shl 0;
  GNUTLS_PIN_SO = 1 shl 1;
  GNUTLS_PIN_FINAL_TRY = 1 shl 2;
  GNUTLS_PIN_COUNT_LOW = 1 shl 3;
  GNUTLS_PIN_CONTEXT_SPECIFIC = 1 shl 4;
  GNUTLS_PIN_WRONG = 1 shl 5;

const
  GNUTLS_PKCS11_PIN_USER = GNUTLS_PIN_USER;
  GNUTLS_PKCS11_PIN_SO = GNUTLS_PIN_SO;
  GNUTLS_PKCS11_PIN_FINAL_TRY = GNUTLS_PIN_FINAL_TRY;
  GNUTLS_PKCS11_PIN_COUNT_LOW = GNUTLS_PIN_COUNT_LOW;
  GNUTLS_PKCS11_PIN_CONTEXT_SPECIFIC = GNUTLS_PIN_CONTEXT_SPECIFIC;
  GNUTLS_PKCS11_PIN_WRONG = GNUTLS_PIN_WRONG;

type
  Tgnutls_pin_callback_t = function(userdata: pointer; attempt: longint; token_url: pchar; token_label: pchar; flags: dword; pin: pchar; pin_max: Tsize_t): longint; cdecl;

procedure gnutls_certificate_set_pin_function(para1: Tgnutls_certificate_credentials_t; fn: Tgnutls_pin_callback_t; userdata: pointer); cdecl; external libgnutls;

type
  Tgnutls_buffer_st = record
  end;
  Tgnutls_buffer_t = ^Tgnutls_buffer_st;
  Pgnutls_buffer_t = ^Tgnutls_buffer_t;

function gnutls_buffer_append_data(para1: Tgnutls_buffer_t; data: pointer; data_size: Tsize_t): longint; cdecl; external libgnutls;

const
  GNUTLS_UTF8_IGNORE_ERRS = 1;

function gnutls_utf8_password_normalize(password: pbyte; password_len: dword; out_: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

type
  Pgnutls_ext_priv_data_t = ^Tgnutls_ext_priv_data_t;
  Tgnutls_ext_priv_data_t = pointer;

procedure gnutls_ext_set_data(session: Tgnutls_session_t; _type: dword; para3: Tgnutls_ext_priv_data_t); cdecl; external libgnutls;
function gnutls_ext_get_data(session: Tgnutls_session_t; _type: dword; para3: Pgnutls_ext_priv_data_t): longint; cdecl; external libgnutls;
function gnutls_ext_get_current_msg(session: Tgnutls_session_t): dword; cdecl; external libgnutls;

type
  Tgnutls_ext_recv_func = function(session: Tgnutls_session_t; data: pbyte; len: Tsize_t): longint; cdecl;
  Tgnutls_ext_send_func = function(session: Tgnutls_session_t; extdata: Tgnutls_buffer_t): longint; cdecl;
  Tgnutls_ext_deinit_data_func = procedure(data: Tgnutls_ext_priv_data_t); cdecl;
  Tgnutls_ext_pack_func = function(data: Tgnutls_ext_priv_data_t; packed_data: Tgnutls_buffer_t): longint; cdecl;
  Tgnutls_ext_unpack_func = function(packed_data: Tgnutls_buffer_t; data: Pgnutls_ext_priv_data_t): longint; cdecl;

const
  GNUTLS_EXT_RAW_FLAG_TLS_CLIENT_HELLO = 1;
  GNUTLS_EXT_RAW_FLAG_DTLS_CLIENT_HELLO = 1 shl 1;

type
  Tgnutls_ext_raw_process_func = function(ctx: pointer; tls_id: dword; data: pbyte; data_size: dword): longint; cdecl;

function gnutls_ext_raw_parse(ctx: pointer; cb: Tgnutls_ext_raw_process_func; data: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;

type
  Pgnutls_ext_parse_type_t = ^Tgnutls_ext_parse_type_t;
  Tgnutls_ext_parse_type_t = longint;

const
  GNUTLS_EXT_ANY = 0;
  GNUTLS_EXT_APPLICATION = 1;
  GNUTLS_EXT_TLS = 2;
  GNUTLS_EXT_MANDATORY = 3;
  GNUTLS_EXT_NONE = 4;
  GNUTLS_EXT_VERSION_NEG = 5;

type
  Pgnutls_ext_flags_t = ^Tgnutls_ext_flags_t;
  Tgnutls_ext_flags_t = longint;

const
  GNUTLS_EXT_FLAG_OVERRIDE_INTERNAL = 1;
  GNUTLS_EXT_FLAG_CLIENT_HELLO = 1 shl 1;
  GNUTLS_EXT_FLAG_TLS12_SERVER_HELLO = 1 shl 2;
  GNUTLS_EXT_FLAG_TLS13_SERVER_HELLO = 1 shl 3;
  GNUTLS_EXT_FLAG_EE = 1 shl 4;
  GNUTLS_EXT_FLAG_HRR = 1 shl 5;
  GNUTLS_EXT_FLAG_IGNORE_CLIENT_REQUEST = 1 shl 6;
  GNUTLS_EXT_FLAG_TLS = 1 shl 7;
  GNUTLS_EXT_FLAG_DTLS = 1 shl 8;

function gnutls_ext_register(name: pchar; _type: longint; parse_point: Tgnutls_ext_parse_type_t; recv_func: Tgnutls_ext_recv_func; send_func: Tgnutls_ext_send_func;
  deinit_func: Tgnutls_ext_deinit_data_func; pack_func: Tgnutls_ext_pack_func; unpack_func: Tgnutls_ext_unpack_func): longint; cdecl; external libgnutls;
function gnutls_session_ext_register(para1: Tgnutls_session_t; name: pchar; _type: longint; parse_point: Tgnutls_ext_parse_type_t; recv_func: Tgnutls_ext_recv_func;
  send_func: Tgnutls_ext_send_func; deinit_func: Tgnutls_ext_deinit_data_func; pack_func: Tgnutls_ext_pack_func; unpack_func: Tgnutls_ext_unpack_func; flags: dword): longint; cdecl; external libgnutls;
function gnutls_ext_get_name(ext: dword): pchar; cdecl; external libgnutls;
function gnutls_ext_get_name2(session: Tgnutls_session_t; tls_id: dword; parse_point: Tgnutls_ext_parse_type_t): pchar; cdecl; external libgnutls;

type
  Tgnutls_supp_recv_func = function(session: Tgnutls_session_t; data: pbyte; data_size: Tsize_t): longint; cdecl;
  Tgnutls_supp_send_func = function(session: Tgnutls_session_t; buf: Tgnutls_buffer_t): longint; cdecl;

function gnutls_supplemental_register(name: pchar; _type: Tgnutls_supplemental_data_format_type_t; supp_recv_func: Tgnutls_supp_recv_func; supp_send_func: Tgnutls_supp_send_func): longint; cdecl; external libgnutls;
function gnutls_session_supplemental_register(session: Tgnutls_session_t; name: pchar; _type: Tgnutls_supplemental_data_format_type_t; supp_recv_func: Tgnutls_supp_recv_func; supp_send_func: Tgnutls_supp_send_func;
  flags: dword): longint; cdecl; external libgnutls;
procedure gnutls_supplemental_recv(session: Tgnutls_session_t; do_recv_supplemental: dword); cdecl; external libgnutls;
procedure gnutls_supplemental_send(session: Tgnutls_session_t; do_send_supplemental: dword); cdecl; external libgnutls;

type
  Tgnutls_anti_replay_st = record
  end;
  Tgnutls_anti_replay_t = ^Tgnutls_anti_replay_st;
  Pgnutls_anti_replay_t = ^Tgnutls_anti_replay_t;

function gnutls_anti_replay_init(anti_replay: Pgnutls_anti_replay_t): longint; cdecl; external libgnutls;
procedure gnutls_anti_replay_deinit(anti_replay: Tgnutls_anti_replay_t); cdecl; external libgnutls;
procedure gnutls_anti_replay_set_window(anti_replay: Tgnutls_anti_replay_t; window: dword); cdecl; external libgnutls;
procedure gnutls_anti_replay_enable(session: Tgnutls_session_t; anti_replay: Tgnutls_anti_replay_t); cdecl; external libgnutls;

type
  Tgnutls_db_add_func = function(para1: pointer; exp_time: Ttime_t; key: Pgnutls_datum_t; data: Pgnutls_datum_t): longint; cdecl;

procedure gnutls_anti_replay_set_add_function(para1: Tgnutls_anti_replay_t; add_func: Tgnutls_db_add_func); cdecl; external libgnutls;
procedure gnutls_anti_replay_set_ptr(para1: Tgnutls_anti_replay_t; ptr: pointer); cdecl; external libgnutls;

type
  Pgnutls_record_encryption_level_t = ^Tgnutls_record_encryption_level_t;
  Tgnutls_record_encryption_level_t = longint;

const
  GNUTLS_ENCRYPTION_LEVEL_INITIAL = 0;
  GNUTLS_ENCRYPTION_LEVEL_EARLY = 1;
  GNUTLS_ENCRYPTION_LEVEL_HANDSHAKE = 2;
  GNUTLS_ENCRYPTION_LEVEL_APPLICATION = 3;

type
  Tgnutls_handshake_read_func = function(session: Tgnutls_session_t; level: Tgnutls_record_encryption_level_t; htype: Tgnutls_handshake_description_t; data: pointer; data_size: Tsize_t): longint; cdecl;

procedure gnutls_handshake_set_read_function(session: Tgnutls_session_t; func: Tgnutls_handshake_read_func); cdecl; external libgnutls;
function gnutls_handshake_write(session: Tgnutls_session_t; level: Tgnutls_record_encryption_level_t; data: pointer; data_size: Tsize_t): longint; cdecl; external libgnutls;

type
  Tgnutls_handshake_secret_func = function(session: Tgnutls_session_t; level: Tgnutls_record_encryption_level_t; secret_read: pointer; secret_write: pointer; secret_size: Tsize_t): longint; cdecl;

procedure gnutls_handshake_set_secret_function(session: Tgnutls_session_t; func: Tgnutls_handshake_secret_func); cdecl; external libgnutls;

type
  Tgnutls_alert_read_func = function(session: Tgnutls_session_t; level: Tgnutls_record_encryption_level_t; alert_level: Tgnutls_alert_level_t; alert_desc: Tgnutls_alert_description_t): longint; cdecl;

procedure gnutls_alert_set_read_function(session: Tgnutls_session_t; func: Tgnutls_alert_read_func); cdecl; external libgnutls;
function gnutls_fips140_mode_enabled: dword; cdecl; external libgnutls;

type
  Pgnutls_fips_mode_t = ^Tgnutls_fips_mode_t;
  Tgnutls_fips_mode_t = longint;

const
  GNUTLS_FIPS140_DISABLED = 0;
  GNUTLS_FIPS140_STRICT = 1;
  GNUTLS_FIPS140_SELFTESTS = 2;
  GNUTLS_FIPS140_LAX = 3;
  GNUTLS_FIPS140_LOG = 4;

const
  GNUTLS_FIPS140_SET_MODE_THREAD = 1;

procedure gnutls_fips140_set_mode(mode: Tgnutls_fips_mode_t; flags: dword); cdecl; external libgnutls;

procedure GNUTLS_FIPS140_SET_LAX_MODE;
procedure GNUTLS_FIPS140_SET_STRICT_MODE;

type
  Tgnutls_fips140_context_st = record
  end;
  Tgnutls_fips140_context_t = ^Tgnutls_fips140_context_st;
  Pgnutls_fips140_context_t = ^Tgnutls_fips140_context_t;

function gnutls_fips140_context_init(context: Pgnutls_fips140_context_t): longint; cdecl; external libgnutls;
procedure gnutls_fips140_context_deinit(context: Tgnutls_fips140_context_t); cdecl; external libgnutls;

type
  Pgnutls_fips140_operation_state_t = ^Tgnutls_fips140_operation_state_t;
  Tgnutls_fips140_operation_state_t = longint;

const
  GNUTLS_FIPS140_OP_INITIAL = 0;
  GNUTLS_FIPS140_OP_APPROVED = 1;
  GNUTLS_FIPS140_OP_NOT_APPROVED = 2;
  GNUTLS_FIPS140_OP_ERROR = 3;

function gnutls_fips140_get_operation_state(context: Tgnutls_fips140_context_t): Tgnutls_fips140_operation_state_t; cdecl; external libgnutls;
function gnutls_fips140_push_context(context: Tgnutls_fips140_context_t): longint; cdecl; external libgnutls;
function gnutls_fips140_pop_context: longint; cdecl; external libgnutls;
function gnutls_fips140_run_self_tests: longint; cdecl; external libgnutls;

type
  Pgnutls_transport_ktls_enable_flags_t = ^Tgnutls_transport_ktls_enable_flags_t;
  Tgnutls_transport_ktls_enable_flags_t = longint;

const
  GNUTLS_KTLS_RECV = 1 shl 0;
  GNUTLS_KTLS_SEND = 1 shl 1;
  GNUTLS_KTLS_DUPLEX = GNUTLS_KTLS_RECV or GNUTLS_KTLS_SEND;

function gnutls_transport_is_ktls_enabled(session: Tgnutls_session_t): Tgnutls_transport_ktls_enable_flags_t; cdecl; external libgnutls;

const
  GNUTLS_E_SUCCESS = 0;
  GNUTLS_E_UNKNOWN_COMPRESSION_ALGORITHM = -(3);
  GNUTLS_E_UNKNOWN_CIPHER_TYPE = -(6);
  GNUTLS_E_LARGE_PACKET = -(7);
  GNUTLS_E_UNSUPPORTED_VERSION_PACKET = -(8);
  GNUTLS_E_UNEXPECTED_PACKET_LENGTH = -(9);
  GNUTLS_E_TLS_PACKET_DECODING_ERROR = GNUTLS_E_UNEXPECTED_PACKET_LENGTH;
  GNUTLS_E_INVALID_SESSION = -(10);
  GNUTLS_E_FATAL_ALERT_RECEIVED = -(12);
  GNUTLS_E_UNEXPECTED_PACKET = -(15);
  GNUTLS_E_WARNING_ALERT_RECEIVED = -(16);
  GNUTLS_E_ERROR_IN_FINISHED_PACKET = -(18);
  GNUTLS_E_UNEXPECTED_HANDSHAKE_PACKET = -(19);
  GNUTLS_E_UNKNOWN_CIPHER_SUITE = -(21);
  GNUTLS_E_UNWANTED_ALGORITHM = -(22);
  GNUTLS_E_MPI_SCAN_FAILED = -(23);
  GNUTLS_E_DECRYPTION_FAILED = -(24);
  GNUTLS_E_MEMORY_ERROR = -(25);
  GNUTLS_E_DECOMPRESSION_FAILED = -(26);
  GNUTLS_E_COMPRESSION_FAILED = -(27);
  GNUTLS_E_AGAIN = -(28);
  GNUTLS_E_EXPIRED = -(29);
  GNUTLS_E_DB_ERROR = -(30);
  GNUTLS_E_KEYFILE_ERROR = -(31);
  GNUTLS_E_SRP_PWD_ERROR = GNUTLS_E_KEYFILE_ERROR;
  GNUTLS_E_INSUFFICIENT_CREDENTIALS = -(32);
  GNUTLS_E_INSUFICIENT_CREDENTIALS = GNUTLS_E_INSUFFICIENT_CREDENTIALS;
  GNUTLS_E_INSUFFICIENT_CRED = GNUTLS_E_INSUFFICIENT_CREDENTIALS;
  GNUTLS_E_INSUFICIENT_CRED = GNUTLS_E_INSUFFICIENT_CREDENTIALS;
  GNUTLS_E_HASH_FAILED = -(33);
  GNUTLS_E_BASE64_DECODING_ERROR = -(34);
  GNUTLS_E_MPI_PRINT_FAILED = -(35);
  GNUTLS_E_REHANDSHAKE = -(37);
  GNUTLS_E_GOT_APPLICATION_DATA = -(38);
  GNUTLS_E_RECORD_LIMIT_REACHED = -(39);
  GNUTLS_E_ENCRYPTION_FAILED = -(40);
  GNUTLS_E_PK_ENCRYPTION_FAILED = -(44);
  GNUTLS_E_PK_DECRYPTION_FAILED = -(45);
  GNUTLS_E_PK_SIGN_FAILED = -(46);
  GNUTLS_E_X509_UNSUPPORTED_CRITICAL_EXTENSION = -(47);
  GNUTLS_E_KEY_USAGE_VIOLATION = -(48);
  GNUTLS_E_NO_CERTIFICATE_FOUND = -(49);
  GNUTLS_E_INVALID_REQUEST = -(50);
  GNUTLS_E_SHORT_MEMORY_BUFFER = -(51);
  GNUTLS_E_INTERRUPTED = -(52);
  GNUTLS_E_PUSH_ERROR = -(53);
  GNUTLS_E_PULL_ERROR = -(54);
  GNUTLS_E_RECEIVED_ILLEGAL_PARAMETER = -(55);
  GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE = -(56);
  GNUTLS_E_PKCS1_WRONG_PAD = -(57);
  GNUTLS_E_RECEIVED_ILLEGAL_EXTENSION = -(58);
  GNUTLS_E_INTERNAL_ERROR = -(59);
  GNUTLS_E_DH_PRIME_UNACCEPTABLE = -(63);
  GNUTLS_E_FILE_ERROR = -(64);
  GNUTLS_E_TOO_MANY_EMPTY_PACKETS = -(78);
  GNUTLS_E_UNKNOWN_PK_ALGORITHM = -(80);
  GNUTLS_E_TOO_MANY_HANDSHAKE_PACKETS = -(81);
  GNUTLS_E_RECEIVED_DISALLOWED_NAME = -(82);
  GNUTLS_E_CERTIFICATE_REQUIRED = -(112);
  GNUTLS_E_NO_TEMPORARY_RSA_PARAMS = -(84);
  GNUTLS_E_NO_COMPRESSION_ALGORITHMS = -(86);
  GNUTLS_E_NO_CIPHER_SUITES = -(87);
  GNUTLS_E_OPENPGP_GETKEY_FAILED = -(88);
  GNUTLS_E_PK_SIG_VERIFY_FAILED = -(89);
  GNUTLS_E_ILLEGAL_SRP_USERNAME = -(90);
  GNUTLS_E_KEYFILE_PARSING_ERROR = -(91);
  GNUTLS_E_SRP_PWD_PARSING_ERROR = GNUTLS_E_KEYFILE_PARSING_ERROR;
  GNUTLS_E_NO_TEMPORARY_DH_PARAMS = -(93);
  GNUTLS_E_ASN1_ELEMENT_NOT_FOUND = -(67);
  GNUTLS_E_ASN1_IDENTIFIER_NOT_FOUND = -(68);
  GNUTLS_E_ASN1_DER_ERROR = -(69);
  GNUTLS_E_ASN1_VALUE_NOT_FOUND = -(70);
  GNUTLS_E_ASN1_GENERIC_ERROR = -(71);
  GNUTLS_E_ASN1_VALUE_NOT_VALID = -(72);
  GNUTLS_E_ASN1_TAG_ERROR = -(73);
  GNUTLS_E_ASN1_TAG_IMPLICIT = -(74);
  GNUTLS_E_ASN1_TYPE_ANY_ERROR = -(75);
  GNUTLS_E_ASN1_SYNTAX_ERROR = -(76);
  GNUTLS_E_ASN1_DER_OVERFLOW = -(77);
  GNUTLS_E_OPENPGP_UID_REVOKED = -(79);
  GNUTLS_E_CERTIFICATE_ERROR = -(43);
  GNUTLS_E_X509_CERTIFICATE_ERROR = GNUTLS_E_CERTIFICATE_ERROR;
  GNUTLS_E_CERTIFICATE_KEY_MISMATCH = -(60);
  GNUTLS_E_UNSUPPORTED_CERTIFICATE_TYPE = -(61);
  GNUTLS_E_X509_UNKNOWN_SAN = -(62);
  GNUTLS_E_OPENPGP_FINGERPRINT_UNSUPPORTED = -(94);
  GNUTLS_E_X509_UNSUPPORTED_ATTRIBUTE = -(95);
  GNUTLS_E_UNKNOWN_HASH_ALGORITHM = -(96);
  GNUTLS_E_UNKNOWN_PKCS_CONTENT_TYPE = -(97);
  GNUTLS_E_UNKNOWN_PKCS_BAG_TYPE = -(98);
  GNUTLS_E_INVALID_PASSWORD = -(99);
  GNUTLS_E_MAC_VERIFY_FAILED = -(100);
  GNUTLS_E_CONSTRAINT_ERROR = -(101);
  GNUTLS_E_WARNING_IA_IPHF_RECEIVED = -(102);
  GNUTLS_E_WARNING_IA_FPHF_RECEIVED = -(103);
  GNUTLS_E_IA_VERIFY_FAILED = -(104);
  GNUTLS_E_UNKNOWN_ALGORITHM = -(105);
  GNUTLS_E_UNSUPPORTED_SIGNATURE_ALGORITHM = -(106);
  GNUTLS_E_SAFE_RENEGOTIATION_FAILED = -(107);
  GNUTLS_E_UNSAFE_RENEGOTIATION_DENIED = -(108);
  GNUTLS_E_UNKNOWN_SRP_USERNAME = -(109);
  GNUTLS_E_PREMATURE_TERMINATION = -(110);
  GNUTLS_E_MALFORMED_CIDR = -(111);
  GNUTLS_E_BASE64_ENCODING_ERROR = -(201);
  GNUTLS_E_INCOMPATIBLE_GCRYPT_LIBRARY = -(202);
  GNUTLS_E_INCOMPATIBLE_CRYPTO_LIBRARY = -(202);
  GNUTLS_E_INCOMPATIBLE_LIBTASN1_LIBRARY = -(203);
  GNUTLS_E_OPENPGP_KEYRING_ERROR = -(204);
  GNUTLS_E_X509_UNSUPPORTED_OID = -(205);
  GNUTLS_E_RANDOM_FAILED = -(206);
  GNUTLS_E_BASE64_UNEXPECTED_HEADER_ERROR = -(207);
  GNUTLS_E_OPENPGP_SUBKEY_ERROR = -(208);
  GNUTLS_E_ALREADY_REGISTERED = -(209);
  GNUTLS_E_CRYPTO_ALREADY_REGISTERED = GNUTLS_E_ALREADY_REGISTERED;
  GNUTLS_E_HANDSHAKE_TOO_LARGE = -(210);
  GNUTLS_E_CRYPTODEV_IOCTL_ERROR = -(211);
  GNUTLS_E_CRYPTODEV_DEVICE_ERROR = -(212);
  GNUTLS_E_CHANNEL_BINDING_NOT_AVAILABLE = -(213);
  GNUTLS_E_BAD_COOKIE = -(214);
  GNUTLS_E_OPENPGP_PREFERRED_KEY_ERROR = -(215);
  GNUTLS_E_INCOMPAT_DSA_KEY_WITH_TLS_PROTOCOL = -(216);
  GNUTLS_E_INSUFFICIENT_SECURITY = -(217);
  GNUTLS_E_HEARTBEAT_PONG_RECEIVED = -(292);
  GNUTLS_E_HEARTBEAT_PING_RECEIVED = -(293);
  GNUTLS_E_UNRECOGNIZED_NAME = -(294);
  GNUTLS_E_PKCS11_ERROR = -(300);
  GNUTLS_E_PKCS11_LOAD_ERROR = -(301);
  GNUTLS_E_PARSING_ERROR = -(302);
  GNUTLS_E_PKCS11_PIN_ERROR = -(303);
  GNUTLS_E_PKCS11_SLOT_ERROR = -(305);
  GNUTLS_E_LOCKING_ERROR = -(306);
  GNUTLS_E_PKCS11_ATTRIBUTE_ERROR = -(307);
  GNUTLS_E_PKCS11_DEVICE_ERROR = -(308);
  GNUTLS_E_PKCS11_DATA_ERROR = -(309);
  GNUTLS_E_PKCS11_UNSUPPORTED_FEATURE_ERROR = -(310);
  GNUTLS_E_PKCS11_KEY_ERROR = -(311);
  GNUTLS_E_PKCS11_PIN_EXPIRED = -(312);
  GNUTLS_E_PKCS11_PIN_LOCKED = -(313);
  GNUTLS_E_PKCS11_SESSION_ERROR = -(314);
  GNUTLS_E_PKCS11_SIGNATURE_ERROR = -(315);
  GNUTLS_E_PKCS11_TOKEN_ERROR = -(316);
  GNUTLS_E_PKCS11_USER_ERROR = -(317);
  GNUTLS_E_CRYPTO_INIT_FAILED = -(318);
  GNUTLS_E_TIMEDOUT = -(319);
  GNUTLS_E_USER_ERROR = -(320);
  GNUTLS_E_ECC_NO_SUPPORTED_CURVES = -(321);
  GNUTLS_E_ECC_UNSUPPORTED_CURVE = -(322);
  GNUTLS_E_PKCS11_REQUESTED_OBJECT_NOT_AVAILBLE = -(323);
  GNUTLS_E_CERTIFICATE_LIST_UNSORTED = -(324);
  GNUTLS_E_ILLEGAL_PARAMETER = -(325);
  GNUTLS_E_NO_PRIORITIES_WERE_SET = -(326);
  GNUTLS_E_X509_UNSUPPORTED_EXTENSION = -(327);
  GNUTLS_E_SESSION_EOF = -(328);
  GNUTLS_E_TPM_ERROR = -(329);
  GNUTLS_E_TPM_KEY_PASSWORD_ERROR = -(330);
  GNUTLS_E_TPM_SRK_PASSWORD_ERROR = -(331);
  GNUTLS_E_TPM_SESSION_ERROR = -(332);
  GNUTLS_E_TPM_KEY_NOT_FOUND = -(333);
  GNUTLS_E_TPM_UNINITIALIZED = -(334);
  GNUTLS_E_TPM_NO_LIB = -(335);
  GNUTLS_E_NO_CERTIFICATE_STATUS = -(340);
  GNUTLS_E_OCSP_RESPONSE_ERROR = -(341);
  GNUTLS_E_RANDOM_DEVICE_ERROR = -(342);
  GNUTLS_E_AUTH_ERROR = -(343);
  GNUTLS_E_NO_APPLICATION_PROTOCOL = -(344);
  GNUTLS_E_SOCKETS_INIT_ERROR = -(345);
  GNUTLS_E_KEY_IMPORT_FAILED = -(346);
  GNUTLS_E_INAPPROPRIATE_FALLBACK = -(347);
  GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR = -(348);
  GNUTLS_E_PRIVKEY_VERIFICATION_ERROR = -(349);
  GNUTLS_E_UNEXPECTED_EXTENSIONS_LENGTH = -(350);
  GNUTLS_E_ASN1_EMBEDDED_NULL_IN_STRING = -(351);
  GNUTLS_E_SELF_TEST_ERROR = -(400);
  GNUTLS_E_NO_SELF_TEST = -(401);
  GNUTLS_E_LIB_IN_ERROR_STATE = -(402);
  GNUTLS_E_PK_GENERATION_ERROR = -(403);
  GNUTLS_E_IDNA_ERROR = -(404);
  GNUTLS_E_NEED_FALLBACK = -(405);
  GNUTLS_E_SESSION_USER_ID_CHANGED = -(406);
  GNUTLS_E_HANDSHAKE_DURING_FALSE_START = -(407);
  GNUTLS_E_UNAVAILABLE_DURING_HANDSHAKE = -(408);
  GNUTLS_E_PK_INVALID_PUBKEY = -(409);
  GNUTLS_E_PK_INVALID_PRIVKEY = -(410);
  GNUTLS_E_NOT_YET_ACTIVATED = -(411);
  GNUTLS_E_INVALID_UTF8_STRING = -(412);
  GNUTLS_E_NO_EMBEDDED_DATA = -(413);
  GNUTLS_E_INVALID_UTF8_EMAIL = -(414);
  GNUTLS_E_INVALID_PASSWORD_STRING = -(415);
  GNUTLS_E_CERTIFICATE_TIME_ERROR = -(416);
  GNUTLS_E_RECORD_OVERFLOW = -(417);
  GNUTLS_E_ASN1_TIME_ERROR = -(418);
  GNUTLS_E_INCOMPATIBLE_SIG_WITH_KEY = -(419);
  GNUTLS_E_PK_INVALID_PUBKEY_PARAMS = -(420);
  GNUTLS_E_PK_NO_VALIDATION_PARAMS = -(421);
  GNUTLS_E_OCSP_MISMATCH_WITH_CERTS = -(422);
  GNUTLS_E_NO_COMMON_KEY_SHARE = -(423);
  GNUTLS_E_REAUTH_REQUEST = -(424);
  GNUTLS_E_TOO_MANY_MATCHES = -(425);
  GNUTLS_E_CRL_VERIFICATION_ERROR = -(426);
  GNUTLS_E_MISSING_EXTENSION = -(427);
  GNUTLS_E_DB_ENTRY_EXISTS = -(428);
  GNUTLS_E_EARLY_DATA_REJECTED = -(429);
  GNUTLS_E_X509_DUPLICATE_EXTENSION = -(430);
  GNUTLS_E_UNIMPLEMENTED_FEATURE = -(1250);
  GNUTLS_E_INT_RET_0 = -(1251);
  GNUTLS_E_INT_CHECK_AGAIN = -(1252);
  GNUTLS_E_APPLICATION_ERROR_MAX = -(65000);
  GNUTLS_E_APPLICATION_ERROR_MIN = -(65500);

  // === Konventiert am: 5-7-25 16:58:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GNUTLS_CURVE_TO_BITS(curve: longint): dword;
begin
  GNUTLS_CURVE_TO_BITS := dword(((dword(1)) shl 31) or (dword(curve)));
end;

function GNUTLS_BITS_TO_CURVE(bits: longint): longint;
begin
  GNUTLS_BITS_TO_CURVE := (dword(bits)) and $7FFFFFFF;
end;

function GNUTLS_BITS_ARE_CURVE(bits: longint): longint;
begin
  GNUTLS_BITS_ARE_CURVE := (dword(bits)) and $80000000;
end;

procedure gnutls_record_set_max_empty_records(session, x: longint);
begin
end;

procedure gnutls_transport_set_int(s: Tgnutls_session_t; i: longint);
begin
  gnutls_transport_set_int2(s, i, i);
end;

// =========

procedure GNUTLS_FIPS140_SET_LAX_MODE;
begin
  if gnutls_fips140_mode_enabled <> 0 then begin
    gnutls_fips140_set_mode(GNUTLS_FIPS140_LAX, GNUTLS_FIPS140_SET_MODE_THREAD);
  end;
end;

procedure GNUTLS_FIPS140_SET_STRICT_MODE;
begin
  if gnutls_fips140_mode_enabled <> 0 then begin
    gnutls_fips140_set_mode(GNUTLS_FIPS140_STRICT, GNUTLS_FIPS140_SET_MODE_THREAD);
  end;
end;



{$ENDIF read_implementation}
