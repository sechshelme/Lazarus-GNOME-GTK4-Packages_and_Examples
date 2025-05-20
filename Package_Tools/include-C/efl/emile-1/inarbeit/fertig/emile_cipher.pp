
unit emile_cipher;
interface

{
  Automatically converted by H2Pas 1.0.0 from emile_cipher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    emile_cipher.h
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
PEina_Binbuf  = ^Eina_Binbuf;
PEmile_Cipher_Algorithm  = ^Emile_Cipher_Algorithm;
PEmile_Cipher_Backend  = ^Emile_Cipher_Backend;
PEmile_Cipher_Type  = ^Emile_Cipher_Type;
PEmile_SSL  = ^Emile_SSL;
PEmile_Want_Type  = ^Emile_Want_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EMILE_CIPHER_H_}
{$define EMILE_CIPHER_H_}
{*
 * @defgroup Emile_Cipher_Group Top level functions
 * @ingroup Emile
 * Function that allow ciphering content.
 *
 * @
  }
{*
 * @typedef Emile_Cipher_Backend
 *
 * Flags describing the implemented backend.
 *
 * @since 1.14
  }
{ < deprecated since 1.27  }
type
  PEmile_Cipher_Backend = ^TEmile_Cipher_Backend;
  TEmile_Cipher_Backend =  Longint;
  Const
    EMILE_NONE = 0;
    EMILE_OPENSSL = 1;
    EMILE_GNUTLS = 2;
;
{*
 * @typedef Emile_Cipher_Algorithm
 *
 * Flags describing known cipher algorithm.
 *
 * @since 1.14
  }
type
  PEmile_Cipher_Algorithm = ^TEmile_Cipher_Algorithm;
  TEmile_Cipher_Algorithm =  Longint;
  Const
    EMILE_AES256_CBC = 0;
;
{*
 * Force the initialization of the underlying cipher library.
 *
 * This call force the initialisation of OpenSSL, so
 * that you get the same setup for everyone.
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
 * @see emile_cipher_module_get
 *
 * @since 1.14
  }

function emile_cipher_init:TEina_Bool;cdecl;external;
{*
 * Get the name of the current used backend.
 *
 * @return the name of the current cipher backend.
 * @since 1.14
  }
function emile_cipher_module_get:TEmile_Cipher_Backend;cdecl;external;
{*
 * Cipher a buffer with a defined algorithm and key.
 *
 * @param algo The algorithm to use to cipher the buffer.
 * @param in The buffer to cipher.
 * @param key The symetric key to use for ciphering.
 * @param length The length of the symetric key to be used.
 * @return the ciphered buffer or NULL on error.
 *
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emile_binbuf_cipher(algo:TEmile_Cipher_Algorithm; in:PEina_Binbuf; key:Pchar; length:dword):PEina_Binbuf;cdecl;external;
{*
 * Decipher a buffer with a defined algorithm and key.
 *
 * @param algo The algorithm to use to decipher the buffer.
 * @param in The ciphered buffer to decipher.
 * @param key The symetric key used to cipher the buffer.
 * @param length The length of the symetric key used to cipher the buffer.
 * @return the clear buffer or NULL on error.
 *
 * @note This won't detect if the given key is the correct one or not. You
 * have to check that the returned data make sense. You should also not treat
 * them as safe.
 *
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function emile_binbuf_decipher(algo:TEmile_Cipher_Algorithm; in:PEina_Binbuf; key:Pchar; length:dword):PEina_Binbuf;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
type

  PEmile_Cipher_Type = ^TEmile_Cipher_Type;
  TEmile_Cipher_Type =  Longint;
  Const
    EMILE_SSLv23 = 0;
    EMILE_TLSv1 = 1;
;
type
  PEmile_Want_Type = ^TEmile_Want_Type;
  TEmile_Want_Type =  Longint;
  Const
    EMILE_WANT_NOTHING = 0;
    EMILE_WANT_READ = 1;
    EMILE_WANT_WRITE = 3;
;
(* Const before type ignored *)
(* Const before type ignored *)

function emile_binbuf_hmac_sha1(key:Pchar; key_len:dword; data:PEina_Binbuf; digest:array[0..19] of byte):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emile_binbuf_sha1(data:PEina_Binbuf; digest:array[0..19] of byte):TEina_Bool;cdecl;external;
function emile_cipher_server_listen(t:TEmile_Cipher_Type):PEmile_SSL;cdecl;external;
function emile_cipher_client_connect(server:PEmile_SSL; fd:longint):PEmile_SSL;cdecl;external;
function emile_cipher_server_connect(t:TEmile_Cipher_Type):PEmile_SSL;cdecl;external;
function emile_cipher_free(emile:PEmile_SSL):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emile_cipher_cafile_add(emile:PEmile_SSL; file:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emile_cipher_cert_add(emile:PEmile_SSL; file:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emile_cipher_privkey_add(emile:PEmile_SSL; file:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emile_cipher_crl_add(emile:PEmile_SSL; file:Pchar):TEina_Bool;cdecl;external;
function emile_cipher_read(emile:PEmile_SSL; buffer:PEina_Binbuf):longint;cdecl;external;
(* Const before type ignored *)
function emile_cipher_write(emile:PEmile_SSL; buffer:PEina_Binbuf):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function emile_cipher_error_get(emile:PEmile_SSL):Pchar;cdecl;external;
(* Const before type ignored *)
function emile_cipher_verify_name_set(emile:PEmile_SSL; name:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function emile_cipher_verify_name_get(emile:PEmile_SSL):Pchar;cdecl;external;
procedure emile_cipher_verify_set(emile:PEmile_SSL; verify:TEina_Bool);cdecl;external;
procedure emile_cipher_verify_basic_set(emile:PEmile_SSL; verify_basic:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function emile_cipher_verify_get(emile:PEmile_SSL):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function emile_cipher_verify_basic_get(emile:PEmile_SSL):TEina_Bool;cdecl;external;
{$endif}
{*
 * @
  }
{$endif}

implementation


end.
