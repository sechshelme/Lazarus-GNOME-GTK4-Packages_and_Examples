
unit openpgp;
interface

{
  Automatically converted by H2Pas 1.0.0 from openpgp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    openpgp.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
Pgnutls_datum_t  = ^gnutls_datum_t;
Pgnutls_openpgp_crt_fmt  = ^gnutls_openpgp_crt_fmt;
Pgnutls_openpgp_crt_fmt_t  = ^gnutls_openpgp_crt_fmt_t;
Pgnutls_openpgp_crt_t  = ^gnutls_openpgp_crt_t;
Pgnutls_openpgp_keyid_t  = ^gnutls_openpgp_keyid_t;
Pgnutls_openpgp_keyring_t  = ^gnutls_openpgp_keyring_t;
Pgnutls_openpgp_privkey_t  = ^gnutls_openpgp_privkey_t;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2003-2012 Free Software Foundation, Inc.
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
{ This file contains the types and prototypes for the OpenPGP
 * key and private key parsing functions.
  }
{$ifndef GNUTLS_OPENPGP_H}
{$define GNUTLS_OPENPGP_H}
{$include <gnutls/gnutls.h>}
{$include <limits.h>}
{ C++ extern C conditionnal removed }
{ Openpgp certificate stuff
  }
{*
 * gnutls_openpgp_crt_fmt_t:
 * @GNUTLS_OPENPGP_FMT_RAW: OpenPGP certificate in raw format.
 * @GNUTLS_OPENPGP_FMT_BASE64: OpenPGP certificate in base64 format.
 *
 * Enumeration of different OpenPGP key formats.
  }
type
  Pgnutls_openpgp_crt_fmt = ^Tgnutls_openpgp_crt_fmt;
  Tgnutls_openpgp_crt_fmt =  Longint;
  Const
    GNUTLS_OPENPGP_FMT_RAW = 0;
    GNUTLS_OPENPGP_FMT_BASE64 = 1;
;
  Tgnutls_openpgp_crt_fmt_t = Tgnutls_openpgp_crt_fmt;
  Pgnutls_openpgp_crt_fmt_t = ^Tgnutls_openpgp_crt_fmt_t;
  GNUTLS_OPENPGP_KEYID_SIZE = 8;  
  GNUTLS_OPENPGP_V4_FINGERPRINT_SIZE = 20;  
type
  Pgnutls_openpgp_keyid_t = ^Tgnutls_openpgp_keyid_t;
  Tgnutls_openpgp_keyid_t = array[0..(GNUTLS_OPENPGP_KEYID_SIZE)-1] of byte;
{ gnutls_openpgp_cert_t should be defined in gnutls.h
  }
{ initializes the memory for gnutls_openpgp_crt_t struct  }
{_GNUTLS_GCC_ATTR_DEPRECATED }
function gnutls_openpgp_crt_init(key:Pgnutls_openpgp_crt_t):longint;cdecl;external;
{ frees all memory  }
{_GNUTLS_GCC_ATTR_DEPRECATED }procedure gnutls_openpgp_crt_deinit(key:Tgnutls_openpgp_crt_t);cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_import(key:Tgnutls_openpgp_crt_t; data:Pgnutls_datum_t; format:Tgnutls_openpgp_crt_fmt_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_export(key:Tgnutls_openpgp_crt_t; format:Tgnutls_openpgp_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_export2(key:Tgnutls_openpgp_crt_t; format:Tgnutls_openpgp_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_print(cert:Tgnutls_openpgp_crt_t; format:Tgnutls_certificate_print_formats_t; out:Pgnutls_datum_t):longint;cdecl;external;
{ The key_usage flags are defined in gnutls.h. They are
 * the GNUTLS_KEY_* definitions.
  }
const
  GNUTLS_OPENPGP_MASTER_KEYID_IDX = INT_MAX;  
{_GNUTLS_GCC_ATTR_DEPRECATED }
function gnutls_openpgp_crt_get_key_usage(key:Tgnutls_openpgp_crt_t; key_usage:Pdword):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_fingerprint(key:Tgnutls_openpgp_crt_t; fpr:pointer; fprlen:Psize_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_fingerprint(key:Tgnutls_openpgp_crt_t; idx:dword; fpr:pointer; fprlen:Psize_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_name(key:Tgnutls_openpgp_crt_t; idx:longint; buf:Pchar; sizeof_buf:Psize_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_pk_algorithm(key:Tgnutls_openpgp_crt_t; bits:Pdword):Tgnutls_pk_algorithm_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_version(key:Tgnutls_openpgp_crt_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_creation_time(key:Tgnutls_openpgp_crt_t):Ttime_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_expiration_time(key:Tgnutls_openpgp_crt_t):Ttime_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_key_id(key:Tgnutls_openpgp_crt_t; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_check_hostname(key:Tgnutls_openpgp_crt_t; hostname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_check_hostname2(key:Tgnutls_openpgp_crt_t; hostname:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_check_email(key:Tgnutls_openpgp_crt_t; email:Pchar; flags:dword):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_revoked_status(key:Tgnutls_openpgp_crt_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_count(key:Tgnutls_openpgp_crt_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_idx(key:Tgnutls_openpgp_crt_t; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_revoked_status(key:Tgnutls_openpgp_crt_t; idx:dword):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_pk_algorithm(key:Tgnutls_openpgp_crt_t; idx:dword; bits:Pdword):Tgnutls_pk_algorithm_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_creation_time(key:Tgnutls_openpgp_crt_t; idx:dword):Ttime_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_expiration_time(key:Tgnutls_openpgp_crt_t; idx:dword):Ttime_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_id(key:Tgnutls_openpgp_crt_t; idx:dword; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_usage(key:Tgnutls_openpgp_crt_t; idx:dword; key_usage:Pdword):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_pk_dsa_raw(crt:Tgnutls_openpgp_crt_t; idx:dword; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; 
           y:Pgnutls_datum_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_subkey_pk_rsa_raw(crt:Tgnutls_openpgp_crt_t; idx:dword; m:Pgnutls_datum_t; e:Pgnutls_datum_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_pk_dsa_raw(crt:Tgnutls_openpgp_crt_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_pk_rsa_raw(crt:Tgnutls_openpgp_crt_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_preferred_key_id(key:Tgnutls_openpgp_crt_t; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_set_preferred_key_id(key:Tgnutls_openpgp_crt_t; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
{ privkey stuff.
  }
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_init(key:Pgnutls_openpgp_privkey_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }procedure gnutls_openpgp_privkey_deinit(key:Tgnutls_openpgp_privkey_t);cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_pk_algorithm(key:Tgnutls_openpgp_privkey_t; bits:Pdword):Tgnutls_pk_algorithm_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_sec_param(key:Tgnutls_openpgp_privkey_t):Tgnutls_sec_param_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_import(key:Tgnutls_openpgp_privkey_t; data:Pgnutls_datum_t; format:Tgnutls_openpgp_crt_fmt_t; password:Pchar; flags:dword):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_fingerprint(key:Tgnutls_openpgp_privkey_t; fpr:pointer; fprlen:Psize_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_subkey_fingerprint(key:Tgnutls_openpgp_privkey_t; idx:dword; fpr:pointer; fprlen:Psize_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_key_id(key:Tgnutls_openpgp_privkey_t; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_subkey_count(key:Tgnutls_openpgp_privkey_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_subkey_idx(key:Tgnutls_openpgp_privkey_t; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_subkey_revoked_status(key:Tgnutls_openpgp_privkey_t; idx:dword):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_revoked_status(key:Tgnutls_openpgp_privkey_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_subkey_pk_algorithm(key:Tgnutls_openpgp_privkey_t; idx:dword; bits:Pdword):Tgnutls_pk_algorithm_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_subkey_expiration_time(key:Tgnutls_openpgp_privkey_t; idx:dword):Ttime_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_subkey_id(key:Tgnutls_openpgp_privkey_t; idx:dword; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_subkey_creation_time(key:Tgnutls_openpgp_privkey_t; idx:dword):Ttime_t;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_export_subkey_dsa_raw(pkey:Tgnutls_openpgp_privkey_t; idx:dword; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; 
           y:Pgnutls_datum_t; x:Pgnutls_datum_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_export_subkey_rsa_raw(pkey:Tgnutls_openpgp_privkey_t; idx:dword; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; 
           p:Pgnutls_datum_t; q:Pgnutls_datum_t; u:Pgnutls_datum_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_export_dsa_raw(pkey:Tgnutls_openpgp_privkey_t; p:Pgnutls_datum_t; q:Pgnutls_datum_t; g:Pgnutls_datum_t; y:Pgnutls_datum_t; 
           x:Pgnutls_datum_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_export_rsa_raw(pkey:Tgnutls_openpgp_privkey_t; m:Pgnutls_datum_t; e:Pgnutls_datum_t; d:Pgnutls_datum_t; p:Pgnutls_datum_t; 
           q:Pgnutls_datum_t; u:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_export(key:Tgnutls_openpgp_privkey_t; format:Tgnutls_openpgp_crt_fmt_t; password:Pchar; flags:dword; output_data:pointer; 
           output_data_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_export2(key:Tgnutls_openpgp_privkey_t; format:Tgnutls_openpgp_crt_fmt_t; password:Pchar; flags:dword; out:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_set_preferred_key_id(key:Tgnutls_openpgp_privkey_t; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_privkey_get_preferred_key_id(key:Tgnutls_openpgp_privkey_t; keyid:Tgnutls_openpgp_keyid_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_get_auth_subkey(crt:Tgnutls_openpgp_crt_t; keyid:Tgnutls_openpgp_keyid_t; flag:dword):longint;cdecl;external;
{ Keyring stuff.
  }
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_keyring_init(keyring:Pgnutls_openpgp_keyring_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }procedure gnutls_openpgp_keyring_deinit(keyring:Tgnutls_openpgp_keyring_t);cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_keyring_import(keyring:Tgnutls_openpgp_keyring_t; data:Pgnutls_datum_t; format:Tgnutls_openpgp_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_keyring_check_id(ring:Tgnutls_openpgp_keyring_t; keyid:Tgnutls_openpgp_keyid_t; flags:dword):longint;cdecl;external;
{ the output of the verification  }
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_verify_ring(key:Tgnutls_openpgp_crt_t; keyring:Tgnutls_openpgp_keyring_t; flags:dword; verify:Pdword):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_crt_verify_self(key:Tgnutls_openpgp_crt_t; flags:dword; verify:Pdword):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_keyring_get_crt(ring:Tgnutls_openpgp_keyring_t; idx:dword; cert:Pgnutls_openpgp_crt_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_openpgp_keyring_get_crt_count(ring:Tgnutls_openpgp_keyring_t):longint;cdecl;external;
{*
 * gnutls_openpgp_recv_key_func:
 * @session: a TLS session
 * @keyfpr: key fingerprint
 * @keyfpr_length: length of key fingerprint
 * @key: output key.
 *
 * A callback of this type is used to retrieve OpenPGP keys.  Only
 * useful on the server, and will only be used if the peer send a key
 * fingerprint instead of a full key.  See also
 * gnutls_openpgp_set_recv_key_function().
 *
 * The variable @key must be allocated using gnutls_malloc().
 *
 * Returns: On success, %GNUTLS_E_SUCCESS (zero) is returned,
 *   otherwise an error code is returned.
  }
(* Const before type ignored *)
type

  Tgnutls_openpgp_recv_key_func = function (session:Tgnutls_session_t; keyfpr:Pbyte; keyfpr_length:dword; key:Pgnutls_datum_t):longint;cdecl;
{_GNUTLS_GCC_ATTR_DEPRECATED }
procedure gnutls_openpgp_set_recv_key_function(session:Tgnutls_session_t; func:Tgnutls_openpgp_recv_key_func);cdecl;external;
{ certificate authentication stuff.
  }
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_set_openpgp_key(res:Tgnutls_certificate_credentials_t; crt:Tgnutls_openpgp_crt_t; pkey:Tgnutls_openpgp_privkey_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_get_openpgp_key(res:Tgnutls_certificate_credentials_t; index:dword; key:Pgnutls_openpgp_privkey_t):longint;cdecl;external;
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_get_openpgp_crt(res:Tgnutls_certificate_credentials_t; index:dword; crt_list:PPgnutls_openpgp_crt_t; crt_list_size:Pdword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_set_openpgp_key_file(res:Tgnutls_certificate_credentials_t; certfile:Pchar; keyfile:Pchar; format:Tgnutls_openpgp_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_set_openpgp_key_mem(res:Tgnutls_certificate_credentials_t; cert:Pgnutls_datum_t; key:Pgnutls_datum_t; format:Tgnutls_openpgp_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_set_openpgp_key_file2(res:Tgnutls_certificate_credentials_t; certfile:Pchar; keyfile:Pchar; subkey_id:Pchar; format:Tgnutls_openpgp_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_set_openpgp_key_mem2(res:Tgnutls_certificate_credentials_t; cert:Pgnutls_datum_t; key:Pgnutls_datum_t; subkey_id:Pchar; format:Tgnutls_openpgp_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_set_openpgp_keyring_mem(c:Tgnutls_certificate_credentials_t; data:Pbyte; dlen:Tsize_t; format:Tgnutls_openpgp_crt_fmt_t):longint;cdecl;external;
(* Const before type ignored *)
{_GNUTLS_GCC_ATTR_DEPRECATED }function gnutls_certificate_set_openpgp_keyring_file(c:Tgnutls_certificate_credentials_t; file:Pchar; format:Tgnutls_openpgp_crt_fmt_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_OPENPGP_H  }

implementation


end.
