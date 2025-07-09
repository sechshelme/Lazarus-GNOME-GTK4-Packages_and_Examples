unit crypto;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2008-2012 Free Software Foundation, Inc.
 *
 * Author: Nikos Mavrogiannopoulos
 *
 * This file is part of GnuTLS.
 *
 * The GnuTLS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>
 *
  }
{$ifndef GNUTLS_CRYPTO_H}
{$define GNUTLS_CRYPTO_H}
{$include <gnutls/gnutls.h>}
{ C++ extern C conditionnal removed }
type
  Pgnutls_cipher_hd_t = ^Tgnutls_cipher_hd_t;
  Tgnutls_cipher_hd_t = Papi_cipher_hd_st;

function gnutls_cipher_init(handle:Pgnutls_cipher_hd_t; cipher:Tgnutls_cipher_algorithm_t; key:Pgnutls_datum_t; iv:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_cipher_encrypt(handle:Tgnutls_cipher_hd_t; text:pointer; textlen:Tsize_t):longint;cdecl;external libgnutls;
function gnutls_cipher_decrypt(handle:Tgnutls_cipher_hd_t; ciphertext:pointer; ciphertextlen:Tsize_t):longint;cdecl;external libgnutls;
function gnutls_cipher_decrypt2(handle:Tgnutls_cipher_hd_t; ciphertext:pointer; ciphertextlen:Tsize_t; text:pointer; textlen:Tsize_t):longint;cdecl;external libgnutls;
function gnutls_cipher_encrypt2(handle:Tgnutls_cipher_hd_t; text:pointer; textlen:Tsize_t; ciphertext:pointer; ciphertextlen:Tsize_t):longint;cdecl;external libgnutls;
{*
 * gnutls_cipher_flags_t:
 * @GNUTLS_CIPHER_PADDING_PKCS7: Flag to indicate PKCS#7 padding
 *
 * Enumeration of flags to control block cipher padding, used by
 * gnutls_cipher_encrypt3() and gnutls_cipher_decrypt3().
 *
 * Since: 3.7.7
  }
type
  Pgnutls_cipher_flags_t = ^Tgnutls_cipher_flags_t;
  Tgnutls_cipher_flags_t =  Longint;
  Const
    GNUTLS_CIPHER_PADDING_PKCS7 = 1;
;

function gnutls_cipher_encrypt3(handle:Tgnutls_cipher_hd_t; ptext:pointer; ptext_len:Tsize_t; ctext:pointer; ctext_len:Psize_t; 
           flags:dword):longint;cdecl;external libgnutls;
function gnutls_cipher_decrypt3(handle:Tgnutls_cipher_hd_t; ctext:pointer; ctext_len:Tsize_t; ptext:pointer; ptext_len:Psize_t; 
           flags:dword):longint;cdecl;external libgnutls;
procedure gnutls_cipher_set_iv(handle:Tgnutls_cipher_hd_t; iv:pointer; ivlen:Tsize_t);cdecl;external libgnutls;
function gnutls_cipher_tag(handle:Tgnutls_cipher_hd_t; tag:pointer; tag_size:Tsize_t):longint;cdecl;external libgnutls;
function gnutls_cipher_add_auth(handle:Tgnutls_cipher_hd_t; text:pointer; text_size:Tsize_t):longint;cdecl;external libgnutls;
procedure gnutls_cipher_deinit(handle:Tgnutls_cipher_hd_t);cdecl;external libgnutls;
function gnutls_cipher_get_block_size(algorithm:Tgnutls_cipher_algorithm_t):dword;cdecl;external libgnutls;
function gnutls_cipher_get_iv_size(algorithm:Tgnutls_cipher_algorithm_t):dword;cdecl;external libgnutls;
function gnutls_cipher_get_tag_size(algorithm:Tgnutls_cipher_algorithm_t):dword;cdecl;external libgnutls;
{ AEAD API
  }
type
  Pgnutls_aead_cipher_hd_t = ^Tgnutls_aead_cipher_hd_t;
  Tgnutls_aead_cipher_hd_t = Papi_aead_cipher_hd_st;

function gnutls_aead_cipher_init(handle:Pgnutls_aead_cipher_hd_t; cipher:Tgnutls_cipher_algorithm_t; key:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_aead_cipher_set_key(handle:Tgnutls_aead_cipher_hd_t; key:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_aead_cipher_decrypt(handle:Tgnutls_aead_cipher_hd_t; nonce:pointer; nonce_len:Tsize_t; auth:pointer; auth_len:Tsize_t; 
           tag_size:Tsize_t; ctext:pointer; ctext_len:Tsize_t; ptext:pointer; ptext_len:Psize_t):longint;cdecl;external libgnutls;
function gnutls_aead_cipher_encrypt(handle:Tgnutls_aead_cipher_hd_t; nonce:pointer; nonce_len:Tsize_t; auth:pointer; auth_len:Tsize_t; 
           tag_size:Tsize_t; ptext:pointer; ptext_len:Tsize_t; ctext:pointer; ctext_len:Psize_t):longint;cdecl;external libgnutls;
function gnutls_aead_cipher_encryptv(handle:Tgnutls_aead_cipher_hd_t; nonce:pointer; nonce_len:Tsize_t; auth_iov:Pgiovec_t; auth_iovcnt:longint; 
           tag_size:Tsize_t; iov:Pgiovec_t; iovcnt:longint; ctext:pointer; ctext_len:Psize_t):longint;cdecl;external libgnutls;
function gnutls_aead_cipher_encryptv2(handle:Tgnutls_aead_cipher_hd_t; nonce:pointer; nonce_len:Tsize_t; auth_iov:Pgiovec_t; auth_iovcnt:longint; 
           iov:Pgiovec_t; iovcnt:longint; tag:pointer; tag_size:Psize_t):longint;cdecl;external libgnutls;
function gnutls_aead_cipher_decryptv2(handle:Tgnutls_aead_cipher_hd_t; nonce:pointer; nonce_len:Tsize_t; auth_iov:Pgiovec_t; auth_iovcnt:longint; 
           iov:Pgiovec_t; iovcnt:longint; tag:pointer; tag_size:Tsize_t):longint;cdecl;external libgnutls;
procedure gnutls_aead_cipher_deinit(handle:Tgnutls_aead_cipher_hd_t);cdecl;external libgnutls;
{ Hash - MAC API  }
type
  Pgnutls_hash_hd_t = ^Tgnutls_hash_hd_t;
  Tgnutls_hash_hd_t = Phash_hd_st;

  Pgnutls_hmac_hd_t = ^Tgnutls_hmac_hd_t;
  Tgnutls_hmac_hd_t = Phmac_hd_st;

function gnutls_mac_get_nonce_size(algorithm:Tgnutls_mac_algorithm_t):Tsize_t;cdecl;external libgnutls;
function gnutls_hmac_init(dig:Pgnutls_hmac_hd_t; algorithm:Tgnutls_mac_algorithm_t; key:pointer; keylen:Tsize_t):longint;cdecl;external libgnutls;
procedure gnutls_hmac_set_nonce(handle:Tgnutls_hmac_hd_t; nonce:pointer; nonce_len:Tsize_t);cdecl;external libgnutls;
function gnutls_hmac(handle:Tgnutls_hmac_hd_t; text:pointer; textlen:Tsize_t):longint;cdecl;external libgnutls;
procedure gnutls_hmac_output(handle:Tgnutls_hmac_hd_t; digest:pointer);cdecl;external libgnutls;
procedure gnutls_hmac_deinit(handle:Tgnutls_hmac_hd_t; digest:pointer);cdecl;external libgnutls;
function gnutls_hmac_get_len(algorithm:Tgnutls_mac_algorithm_t):dword;cdecl;external libgnutls;
function gnutls_hmac_get_key_size(algorithm:Tgnutls_mac_algorithm_t):dword;cdecl;external libgnutls;
function gnutls_hmac_fast(algorithm:Tgnutls_mac_algorithm_t; key:pointer; keylen:Tsize_t; text:pointer; textlen:Tsize_t; 
           digest:pointer):longint;cdecl;external libgnutls;
function gnutls_hmac_copy(handle:Tgnutls_hmac_hd_t):Tgnutls_hmac_hd_t;cdecl;external libgnutls;
function gnutls_hash_init(dig:Pgnutls_hash_hd_t; algorithm:Tgnutls_digest_algorithm_t):longint;cdecl;external libgnutls;
function gnutls_hash(handle:Tgnutls_hash_hd_t; text:pointer; textlen:Tsize_t):longint;cdecl;external libgnutls;
procedure gnutls_hash_output(handle:Tgnutls_hash_hd_t; digest:pointer);cdecl;external libgnutls;
procedure gnutls_hash_deinit(handle:Tgnutls_hash_hd_t; digest:pointer);cdecl;external libgnutls;
function gnutls_hash_get_len(algorithm:Tgnutls_digest_algorithm_t):dword;cdecl;external libgnutls;
function gnutls_hash_fast(algorithm:Tgnutls_digest_algorithm_t; text:pointer; textlen:Tsize_t; digest:pointer):longint;cdecl;external libgnutls;
function gnutls_hash_copy(handle:Tgnutls_hash_hd_t):Tgnutls_hash_hd_t;cdecl;external libgnutls;
{ KDF API  }
function gnutls_hkdf_extract(mac:Tgnutls_mac_algorithm_t; key:Pgnutls_datum_t; salt:Pgnutls_datum_t; output:pointer):longint;cdecl;external libgnutls;
function gnutls_hkdf_expand(mac:Tgnutls_mac_algorithm_t; key:Pgnutls_datum_t; info:Pgnutls_datum_t; output:pointer; length:Tsize_t):longint;cdecl;external libgnutls;
function gnutls_pbkdf2(mac:Tgnutls_mac_algorithm_t; key:Pgnutls_datum_t; salt:Pgnutls_datum_t; iter_count:dword; output:pointer; 
           length:Tsize_t):longint;cdecl;external libgnutls;
{ register ciphers  }
{*
 * gnutls_rnd_level_t:
 * @GNUTLS_RND_NONCE: Non-predictable random number.  Fatal in parts
 *   of session if broken, i.e., vulnerable to statistical analysis.
 * @GNUTLS_RND_RANDOM: Pseudo-random cryptographic random number.
 *   Fatal in session if broken. Example use: temporal keys.
 * @GNUTLS_RND_KEY: Fatal in many sessions if broken. Example use:
 *   Long-term keys.
 *
 * Enumeration of random quality levels.
  }
type
  Pgnutls_rnd_level = ^Tgnutls_rnd_level;
  Tgnutls_rnd_level =  Longint;
  Const
    GNUTLS_RND_NONCE = 0;
    GNUTLS_RND_RANDOM = 1;
    GNUTLS_RND_KEY = 2;
;
  Tgnutls_rnd_level_t = Tgnutls_rnd_level;
  Pgnutls_rnd_level_t = ^Tgnutls_rnd_level_t;

function gnutls_rnd(level:Tgnutls_rnd_level_t; data:pointer; len:Tsize_t):longint;cdecl;external libgnutls;
procedure gnutls_rnd_refresh;cdecl;external libgnutls;
{ API to override ciphers and MAC algorithms 
  }
type

  Tgnutls_cipher_init_func = function (para1:Tgnutls_cipher_algorithm_t; ctx:Ppointer; enc:longint):longint;cdecl;

  Tgnutls_cipher_setkey_func = function (ctx:pointer; key:pointer; keysize:Tsize_t):longint;cdecl;
{ old style ciphers  }

  Tgnutls_cipher_setiv_func = function (ctx:pointer; iv:pointer; ivsize:Tsize_t):longint;cdecl;

  Tgnutls_cipher_getiv_func = function (ctx:pointer; iv:pointer; ivsize:Tsize_t):longint;cdecl;

  Tgnutls_cipher_encrypt_func = function (ctx:pointer; plain:pointer; plainsize:Tsize_t; encr:pointer; encrsize:Tsize_t):longint;cdecl;

  Tgnutls_cipher_decrypt_func = function (ctx:pointer; encr:pointer; encrsize:Tsize_t; plain:pointer; plainsize:Tsize_t):longint;cdecl;
{ aead ciphers  }

  Tgnutls_cipher_auth_func = function (ctx:pointer; data:pointer; datasize:Tsize_t):longint;cdecl;

  Tgnutls_cipher_tag_func = procedure (ctx:pointer; tag:pointer; tagsize:Tsize_t);cdecl;

  Tgnutls_cipher_aead_encrypt_func = function (ctx:pointer; nonce:pointer; noncesize:Tsize_t; auth:pointer; authsize:Tsize_t; 
               tag_size:Tsize_t; plain:pointer; plainsize:Tsize_t; encr:pointer; encrsize:Tsize_t):longint;cdecl;

  Tgnutls_cipher_aead_decrypt_func = function (ctx:pointer; nonce:pointer; noncesize:Tsize_t; auth:pointer; authsize:Tsize_t; 
               tag_size:Tsize_t; encr:pointer; encrsize:Tsize_t; plain:pointer; plainsize:Tsize_t):longint;cdecl;

  Tgnutls_cipher_deinit_func = procedure (ctx:pointer);cdecl;
{_GNUTLS_GCC_ATTR_DEPRECATED }
function gnutls_crypto_register_cipher(algorithm:Tgnutls_cipher_algorithm_t; priority:longint; init:Tgnutls_cipher_init_func; setkey:Tgnutls_cipher_setkey_func; setiv:Tgnutls_cipher_setiv_func; 
           encrypt:Tgnutls_cipher_encrypt_func; decrypt:Tgnutls_cipher_decrypt_func; deinit:Tgnutls_cipher_deinit_func):longint;cdecl;external libgnutls;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_crypto_register_aead_cipher(algorithm:Tgnutls_cipher_algorithm_t; priority:longint; init:Tgnutls_cipher_init_func; setkey:Tgnutls_cipher_setkey_func; aead_encrypt:Tgnutls_cipher_aead_encrypt_func; 
           aead_decrypt:Tgnutls_cipher_aead_decrypt_func; deinit:Tgnutls_cipher_deinit_func):longint;cdecl;external libgnutls;
type

  Tgnutls_mac_init_func = function (para1:Tgnutls_mac_algorithm_t; ctx:Ppointer):longint;cdecl;

  Tgnutls_mac_setkey_func = function (ctx:pointer; key:pointer; keysize:Tsize_t):longint;cdecl;

  Tgnutls_mac_setnonce_func = function (ctx:pointer; nonce:pointer; noncesize:Tsize_t):longint;cdecl;

  Tgnutls_mac_hash_func = function (ctx:pointer; text:pointer; textsize:Tsize_t):longint;cdecl;

  Tgnutls_mac_output_func = function (src_ctx:pointer; digest:pointer; digestsize:Tsize_t):longint;cdecl;

  Tgnutls_mac_deinit_func = procedure (ctx:pointer);cdecl;

  Tgnutls_mac_fast_func = function (para1:Tgnutls_mac_algorithm_t; nonce:pointer; nonce_size:Tsize_t; key:pointer; keysize:Tsize_t; 
               text:pointer; textsize:Tsize_t; digest:pointer):longint;cdecl;

  Pgnutls_mac_copy_func = ^Tgnutls_mac_copy_func;
  Tgnutls_mac_copy_func = function (ctx:pointer):pointer;cdecl;
{_GNUTLS_GCC_ATTR_DEPRECATED }
function gnutls_crypto_register_mac(mac:Tgnutls_mac_algorithm_t; priority:longint; init:Tgnutls_mac_init_func; setkey:Tgnutls_mac_setkey_func; setnonce:Tgnutls_mac_setnonce_func; 
           hash:Tgnutls_mac_hash_func; output:Tgnutls_mac_output_func; deinit:Tgnutls_mac_deinit_func; hash_fast:Tgnutls_mac_fast_func):longint;cdecl;external libgnutls;
type

  Tgnutls_digest_init_func = function (para1:Tgnutls_digest_algorithm_t; ctx:Ppointer):longint;cdecl;

  Tgnutls_digest_hash_func = function (ctx:pointer; text:pointer; textsize:Tsize_t):longint;cdecl;

  Tgnutls_digest_output_func = function (src_ctx:pointer; digest:pointer; digestsize:Tsize_t):longint;cdecl;

  Tgnutls_digest_deinit_func = procedure (ctx:pointer);cdecl;

  Tgnutls_digest_fast_func = function (para1:Tgnutls_digest_algorithm_t; text:pointer; textsize:Tsize_t; digest:pointer):longint;cdecl;

  Pgnutls_digest_copy_func = ^Tgnutls_digest_copy_func;
  Tgnutls_digest_copy_func = function (ctx:pointer):pointer;cdecl;
{_GNUTLS_GCC_ATTR_DEPRECATED }
function gnutls_crypto_register_digest(digest:Tgnutls_digest_algorithm_t; priority:longint; init:Tgnutls_digest_init_func; hash:Tgnutls_digest_hash_func; output:Tgnutls_digest_output_func; 
           deinit:Tgnutls_digest_deinit_func; hash_fast:Tgnutls_digest_fast_func):longint;cdecl;external libgnutls;
{ RSA-PKCS#1 1.5 helper functions  }
function gnutls_encode_ber_digest_info(hash:Tgnutls_digest_algorithm_t; digest:Pgnutls_datum_t; output:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_decode_ber_digest_info(info:Pgnutls_datum_t; hash:Pgnutls_digest_algorithm_t; digest:Pbyte; digest_size:Pdword):longint;cdecl;external libgnutls;
function gnutls_decode_rs_value(sig_value:Pgnutls_datum_t; r:Pgnutls_datum_t; s:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_encode_rs_value(sig_value:Pgnutls_datum_t; r:Pgnutls_datum_t; s:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_encode_gost_rs_value(sig_value:Pgnutls_datum_t; r:Pgnutls_datum_t; s:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_decode_gost_rs_value(sig_value:Pgnutls_datum_t; r:Pgnutls_datum_t; s:Pgnutls_datum_t):longint;cdecl;external libgnutls;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_CRYPTO_H  }

// === Konventiert am: 9-7-25 13:39:27 ===


implementation



end.
