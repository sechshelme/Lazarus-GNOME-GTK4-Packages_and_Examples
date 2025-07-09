
unit pkcs11;
interface

{
  Automatically converted by H2Pas 1.0.0 from pkcs11.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pkcs11.h
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
Pdword  = ^dword;
Pgnutls_datum_t  = ^gnutls_datum_t;
Pgnutls_pkcs11_obj_flags  = ^gnutls_pkcs11_obj_flags;
Pgnutls_pkcs11_obj_info_t  = ^gnutls_pkcs11_obj_info_t;
Pgnutls_pkcs11_obj_st  = ^gnutls_pkcs11_obj_st;
Pgnutls_pkcs11_obj_t  = ^gnutls_pkcs11_obj_t;
Pgnutls_pkcs11_obj_type_t  = ^gnutls_pkcs11_obj_type_t;
Pgnutls_pkcs11_privkey_t  = ^gnutls_pkcs11_privkey_t;
Pgnutls_pkcs11_token_info_t  = ^gnutls_pkcs11_token_info_t;
Pgnutls_pkcs11_url_type_t  = ^gnutls_pkcs11_url_type_t;
Pgnutls_x509_crt_t  = ^gnutls_x509_crt_t;
Pgnutls_x509_ext_st  = ^gnutls_x509_ext_st;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2010-2012 Free Software Foundation, Inc.
 * Copyright (C) 2016-2018 Red Hat, Inc.
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
{$ifndef GNUTLS_PKCS11_H}
{$define GNUTLS_PKCS11_H}
{$include <stdarg.h>}
{$include <gnutls/gnutls.h>}
{$include <gnutls/x509.h>}
{ C++ extern C conditionnal removed }

const
  GNUTLS_PKCS11_MAX_PIN_LEN = 256;  
{*
 * gnutls_pkcs11_token_callback_t:
 * @userdata: user-controlled data from gnutls_pkcs11_set_token_function().
 * @label: token label.
 * @retry: retry counter, initially 0.
 *
 * Token callback function. The callback will be used to ask the user
 * to re-insert the token with given (null terminated) label.  The
 * callback should return zero if token has been inserted by user and
 * a negative error code otherwise.  It might be called multiple times
 * if the token is not detected and the retry counter will be
 * increased.
 *
 * Returns: %GNUTLS_E_SUCCESS (0) on success or a negative error code
 * on error.
 *
 * Since: 2.12.0
 * }
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
type

  Tgnutls_pkcs11_token_callback_t = function (userdata:pointer; _label:Pchar; retry:dword):longint;cdecl;
  Pgnutls_pkcs11_obj_st = ^Tgnutls_pkcs11_obj_st;
  Tgnutls_pkcs11_obj_st = record
      {undefined structure}
    end;


  Pgnutls_pkcs11_obj_t = ^Tgnutls_pkcs11_obj_t;
  Tgnutls_pkcs11_obj_t = Pgnutls_pkcs11_obj_st;
{ Manual loading of libraries  }

const
  GNUTLS_PKCS11_FLAG_MANUAL = 0;  
{ Automatically load libraries by reading /etc/gnutls/pkcs11.conf  }
  GNUTLS_PKCS11_FLAG_AUTO = 1;  
{ Automatically load trusted libraries by reading /etc/gnutls/pkcs11.conf  }
  GNUTLS_PKCS11_FLAG_AUTO_TRUSTED = 1 shl 1;  
{ pkcs11.conf format:
 * load = /lib/xxx-pkcs11.so
 * load = /lib/yyy-pkcs11.so
  }
(* Const before type ignored *)

function gnutls_pkcs11_init(flags:dword; deprecated_config_file:Pchar):longint;cdecl;external;
function gnutls_pkcs11_reinit:longint;cdecl;external;
procedure gnutls_pkcs11_deinit;cdecl;external;
procedure gnutls_pkcs11_set_token_function(fn:Tgnutls_pkcs11_token_callback_t; userdata:pointer);cdecl;external;
procedure gnutls_pkcs11_set_pin_function(fn:Tgnutls_pin_callback_t; userdata:pointer);cdecl;external;
function gnutls_pkcs11_get_pin_function(userdata:Ppointer):Tgnutls_pin_callback_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pkcs11_add_provider(name:Pchar; params:Pchar):longint;cdecl;external;
function gnutls_pkcs11_obj_init(obj:Pgnutls_pkcs11_obj_t):longint;cdecl;external;
procedure gnutls_pkcs11_obj_set_pin_function(obj:Tgnutls_pkcs11_obj_t; fn:Tgnutls_pin_callback_t; userdata:pointer);cdecl;external;
{*
 * gnutls_pkcs11_obj_flags:
 * @GNUTLS_PKCS11_OBJ_FLAG_LOGIN: Force login in the token for the operation (seek+store). 
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED: object marked as trusted (seek+store).
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_SENSITIVE: object is explicitly marked as sensitive -unexportable (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_LOGIN_SO: force login as a security officer in the token for the operation (seek+store).
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_PRIVATE: marked as private -requires PIN to access (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_NOT_PRIVATE: marked as not private (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_ANY: When retrieving an object, do not set any requirements (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_TRUSTED: When retrieving an object, only retrieve the marked as trusted (alias to %GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED).
 *   In gnutls_pkcs11_crt_is_known() it implies %GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_COMPARE if %GNUTLS_PKCS11_OBJ_FLAG_COMPARE_KEY is not given.
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_DISTRUSTED: When writing an object, mark it as distrusted (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_DISTRUSTED: When retrieving an object, only retrieve the marked as distrusted (seek).
 * @GNUTLS_PKCS11_OBJ_FLAG_COMPARE: When checking an object's presence, fully compare it before returning any result (seek).
 * @GNUTLS_PKCS11_OBJ_FLAG_COMPARE_KEY: When checking an object's presence, compare the key before returning any result (seek).
 * @GNUTLS_PKCS11_OBJ_FLAG_PRESENT_IN_TRUSTED_MODULE: The object must be present in a marked as trusted module (seek).
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_CA: Mark the object as a CA (seek+store).
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_KEY_WRAP: Mark the generated key pair as wrapping and unwrapping keys (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_OVERWRITE_TRUSTMOD_EXT: When an issuer is requested, override its extensions with the ones present in the trust module (seek).
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_ALWAYS_AUTH: Mark the key pair as requiring authentication (pin entry) before every operation (seek+store).
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_EXTRACTABLE: Mark the key pair as being extractable (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_NEVER_EXTRACTABLE: If set, the object was never marked as extractable (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_CRT: When searching, restrict to certificates only (seek).
 * @GNUTLS_PKCS11_OBJ_FLAG_PUBKEY: When searching, restrict to public key objects only (seek).
 * @GNUTLS_PKCS11_OBJ_FLAG_PRIVKEY: When searching, restrict to private key objects only (seek).
 * @GNUTLS_PKCS11_OBJ_FLAG_NO_STORE_PUBKEY: When generating a keypair don't store the public key (store).
 * @GNUTLS_PKCS11_OBJ_FLAG_MARK_NOT_SENSITIVE: object marked as not sensitive -exportable (store).
 *
 * Enumeration of different PKCS #11 object flags. Some flags are used
 * to mark objects when storing, while others are also used while seeking
 * or retrieving objects.
  }
{ flags 1<<29 and later are reserved - see pkcs11_int.h  }
type
  Pgnutls_pkcs11_obj_flags = ^Tgnutls_pkcs11_obj_flags;
  Tgnutls_pkcs11_obj_flags =  Longint;
  Const
    GNUTLS_PKCS11_OBJ_FLAG_LOGIN = 1 shl 0;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED = 1 shl 1;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_SENSITIVE = 1 shl 2;
    GNUTLS_PKCS11_OBJ_FLAG_LOGIN_SO = 1 shl 3;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_PRIVATE = 1 shl 4;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_NOT_PRIVATE = 1 shl 5;
    GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_ANY = 1 shl 6;
    GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_TRUSTED = GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_DISTRUSTED = 1 shl 8;
    GNUTLS_PKCS11_OBJ_FLAG_RETRIEVE_DISTRUSTED = GNUTLS_PKCS11_OBJ_FLAG_MARK_DISTRUSTED;
    GNUTLS_PKCS11_OBJ_FLAG_COMPARE = 1 shl 9;
    GNUTLS_PKCS11_OBJ_FLAG_PRESENT_IN_TRUSTED_MODULE = 1 shl 10;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_CA = 1 shl 11;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_KEY_WRAP = 1 shl 12;
    GNUTLS_PKCS11_OBJ_FLAG_COMPARE_KEY = 1 shl 13;
    GNUTLS_PKCS11_OBJ_FLAG_OVERWRITE_TRUSTMOD_EXT = 1 shl 14;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_ALWAYS_AUTH = 1 shl 15;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_EXTRACTABLE = 1 shl 16;
    GNUTLS_PKCS11_OBJ_FLAG_NEVER_EXTRACTABLE = 1 shl 17;
    GNUTLS_PKCS11_OBJ_FLAG_CRT = 1 shl 18;
    GNUTLS_PKCS11_OBJ_FLAG_WITH_PRIVKEY = 1 shl 19;
    GNUTLS_PKCS11_OBJ_FLAG_PUBKEY = 1 shl 20;
    GNUTLS_PKCS11_OBJ_FLAG_NO_STORE_PUBKEY = GNUTLS_PKCS11_OBJ_FLAG_PUBKEY;
    GNUTLS_PKCS11_OBJ_FLAG_PRIVKEY = 1 shl 21;
    GNUTLS_PKCS11_OBJ_FLAG_MARK_NOT_SENSITIVE = 1 shl 22;
;
  gnutls_pkcs11_obj_attr_t = gnutls_pkcs11_obj_flags;  
{*
 * gnutls_pkcs11_url_type_t:
 * @GNUTLS_PKCS11_URL_GENERIC: A generic-purpose URL.
 * @GNUTLS_PKCS11_URL_LIB: A URL that specifies the library used as well.
 * @GNUTLS_PKCS11_URL_LIB_VERSION: A URL that specifies the library and its version.
 *
 * Enumeration of different URL extraction flags.
  }
{ URL specifies the object on token level  }
{ URL specifies the object on module level  }
{ URL specifies the object on module and version level  }
type
  Pgnutls_pkcs11_url_type_t = ^Tgnutls_pkcs11_url_type_t;
  Tgnutls_pkcs11_url_type_t =  Longint;
  Const
    GNUTLS_PKCS11_URL_GENERIC = 0;
    GNUTLS_PKCS11_URL_LIB = 1;
    GNUTLS_PKCS11_URL_LIB_VERSION = 2;
;
(* Const before type ignored *)
{ GNUTLS_PKCS11_OBJ_FLAG_*  }
function gnutls_pkcs11_obj_import_url(obj:Tgnutls_pkcs11_obj_t; url:Pchar; flags:dword):longint;cdecl;external;
function gnutls_pkcs11_obj_export_url(obj:Tgnutls_pkcs11_obj_t; detailed:Tgnutls_pkcs11_url_type_t; url:PPchar):longint;cdecl;external;
procedure gnutls_pkcs11_obj_deinit(obj:Tgnutls_pkcs11_obj_t);cdecl;external;
function gnutls_pkcs11_obj_export(obj:Tgnutls_pkcs11_obj_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_pkcs11_obj_export2(obj:Tgnutls_pkcs11_obj_t; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_pkcs11_obj_export3(obj:Tgnutls_pkcs11_obj_t; fmt:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_get_raw_issuer(url:Pchar; cert:Tgnutls_x509_crt_t; issuer:Pgnutls_datum_t; fmt:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pkcs11_get_raw_issuer_by_dn(url:Pchar; dn:Pgnutls_datum_t; issuer:Pgnutls_datum_t; fmt:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pkcs11_get_raw_issuer_by_subject_key_id(url:Pchar; dn:Pgnutls_datum_t; spki:Pgnutls_datum_t; issuer:Pgnutls_datum_t; fmt:Tgnutls_x509_crt_fmt_t; 
           flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_crt_is_known(url:Pchar; cert:Tgnutls_x509_crt_t; flags:dword):dword;cdecl;external;
{$if 0}
{ for documentation  }
(* Const before type ignored *)
(* Const before type ignored *)
{ GNUTLS_PKCS11_OBJ_FLAG_*  }
function gnutls_pkcs11_copy_x509_crt(token_url:Pchar; crt:Tgnutls_x509_crt_t; _label:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pkcs11_copy_x509_privkey(token_url:Pchar; key:Tgnutls_x509_privkey_t; _label:Pchar; key_usage:dword; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pkcs11_privkey_generate2(url:Pchar; pk:Tgnutls_pk_algorithm_t; bits:dword; _label:Pchar; fmt:Tgnutls_x509_crt_fmt_t; 
           pubkey:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pkcs11_privkey_generate(url:Pchar; pk:Tgnutls_pk_algorithm_t; bits:dword; _label:Pchar; flags:dword):longint;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gnutls_pkcs11_copy_pubkey(token_url:Pchar; crt:Tgnutls_pubkey_t; _label:Pchar; cid:Pgnutls_datum_t; key_usage:dword; 
           flags:dword):longint;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_copy_x509_crt(url,crt,_label,flags : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ GNUTLS_PKCS11_OBJ_FLAG_*  }function gnutls_pkcs11_copy_x509_crt2(token_url:Pchar; crt:Tgnutls_x509_crt_t; _label:Pchar; id:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_copy_x509_privkey(url,key,_label,usage,flags : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{GNUTLS_KEY_*  }{ GNUTLS_PKCS11_OBJ_FLAG_*  }
function gnutls_pkcs11_copy_x509_privkey2(token_url:Pchar; key:Tgnutls_x509_privkey_t; _label:Pchar; cid:Pgnutls_datum_t; key_usage:dword; 
           flags:dword):longint;cdecl;external;
(* Const before type ignored *)
{ GNUTLS_PKCS11_OBJ_FLAG_*  }function gnutls_pkcs11_delete_url(object_url:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
{ GNUTLS_KEY_*  }{ GNUTLS_PKCS11_OBJ_FLAG_*  }function gnutls_pkcs11_copy_secret_key(token_url:Pchar; key:Pgnutls_datum_t; _label:Pchar; key_usage:dword; flags:dword):longint;cdecl;external;
{*
 * gnutls_pkcs11_obj_info_t:
 * @GNUTLS_PKCS11_OBJ_ID_HEX: The object ID in hex. Null-terminated text.
 * @GNUTLS_PKCS11_OBJ_LABEL: The object label. Null-terminated text.
 * @GNUTLS_PKCS11_OBJ_TOKEN_LABEL: The token's label. Null-terminated text.
 * @GNUTLS_PKCS11_OBJ_TOKEN_SERIAL: The token's serial number. Null-terminated text.
 * @GNUTLS_PKCS11_OBJ_TOKEN_MANUFACTURER: The token's manufacturer. Null-terminated text.
 * @GNUTLS_PKCS11_OBJ_TOKEN_MODEL: The token's model. Null-terminated text.
 * @GNUTLS_PKCS11_OBJ_ID: The object ID. Raw bytes.
 * @GNUTLS_PKCS11_OBJ_LIBRARY_VERSION: The library's version. Null-terminated text.
 * @GNUTLS_PKCS11_OBJ_LIBRARY_DESCRIPTION: The library's description. Null-terminated text.
 * @GNUTLS_PKCS11_OBJ_LIBRARY_MANUFACTURER: The library's manufacturer name. Null-terminated text.
 *
 * Enumeration of several object information types.
  }
{ the pkcs11 provider library info   }
type
  Pgnutls_pkcs11_obj_info_t = ^Tgnutls_pkcs11_obj_info_t;
  Tgnutls_pkcs11_obj_info_t =  Longint;
  Const
    GNUTLS_PKCS11_OBJ_ID_HEX = 1;
    GNUTLS_PKCS11_OBJ_LABEL = 2;
    GNUTLS_PKCS11_OBJ_TOKEN_LABEL = 3;
    GNUTLS_PKCS11_OBJ_TOKEN_SERIAL = 4;
    GNUTLS_PKCS11_OBJ_TOKEN_MANUFACTURER = 5;
    GNUTLS_PKCS11_OBJ_TOKEN_MODEL = 6;
    GNUTLS_PKCS11_OBJ_ID = 7;
    GNUTLS_PKCS11_OBJ_LIBRARY_VERSION = 8;
    GNUTLS_PKCS11_OBJ_LIBRARY_DESCRIPTION = 9;
    GNUTLS_PKCS11_OBJ_LIBRARY_MANUFACTURER = 10;
;

function gnutls_pkcs11_obj_get_ptr(obj:Tgnutls_pkcs11_obj_t; ptr:Ppointer; session:Ppointer; ohandle:Ppointer; slot_id:Pdword; 
           flags:dword):longint;cdecl;external;
function gnutls_pkcs11_obj_get_info(obj:Tgnutls_pkcs11_obj_t; itype:Tgnutls_pkcs11_obj_info_t; output:pointer; output_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_obj_set_info(obj:Tgnutls_pkcs11_obj_t; itype:Tgnutls_pkcs11_obj_info_t; data:pointer; data_size:Tsize_t; flags:dword):longint;cdecl;external;
const
  GNUTLS_PKCS11_OBJ_ATTR_CRT_ALL = GNUTLS_PKCS11_OBJ_FLAG_CRT;  
{ always match the given URL  }
  GNUTLS_PKCS11_OBJ_ATTR_MATCH = 0;  
{ match everything!  }
  GNUTLS_PKCS11_OBJ_ATTR_ALL = 0;  
  GNUTLS_PKCS11_OBJ_ATTR_CRT_TRUSTED = GNUTLS_PKCS11_OBJ_FLAG_CRT or GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED;  
  GNUTLS_PKCS11_OBJ_ATTR_CRT_WITH_PRIVKEY = GNUTLS_PKCS11_OBJ_FLAG_CRT or GNUTLS_PKCS11_OBJ_FLAG_WITH_PRIVKEY;  
  GNUTLS_PKCS11_OBJ_ATTR_CRT_TRUSTED_CA = (GNUTLS_PKCS11_OBJ_FLAG_CRT or GNUTLS_PKCS11_OBJ_FLAG_MARK_CA) or GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED;  
  GNUTLS_PKCS11_OBJ_ATTR_PUBKEY = GNUTLS_PKCS11_OBJ_FLAG_PUBKEY;  
  GNUTLS_PKCS11_OBJ_ATTR_PRIVKEY = GNUTLS_PKCS11_OBJ_FLAG_PRIVKEY;  
{*
 * gnutls_pkcs11_token_info_t:
 * @GNUTLS_PKCS11_TOKEN_LABEL: The token's label (string)
 * @GNUTLS_PKCS11_TOKEN_SERIAL: The token's serial number (string)
 * @GNUTLS_PKCS11_TOKEN_MANUFACTURER: The token's manufacturer (string)
 * @GNUTLS_PKCS11_TOKEN_MODEL: The token's model (string)
 * @GNUTLS_PKCS11_TOKEN_MODNAME: The token's module name (string - since 3.4.3). This value is
 *   unavailable for providers which were manually loaded.
 *
 * Enumeration of types for retrieving token information.
  }
type
  Pgnutls_pkcs11_token_info_t = ^Tgnutls_pkcs11_token_info_t;
  Tgnutls_pkcs11_token_info_t =  Longint;
  Const
    GNUTLS_PKCS11_TOKEN_LABEL = 0;
    GNUTLS_PKCS11_TOKEN_SERIAL = 1;
    GNUTLS_PKCS11_TOKEN_MANUFACTURER = 2;
    GNUTLS_PKCS11_TOKEN_MODEL = 3;
    GNUTLS_PKCS11_TOKEN_MODNAME = 4;
;
{*
 * gnutls_pkcs11_obj_type_t:
 * @GNUTLS_PKCS11_OBJ_UNKNOWN: Unknown PKCS11 object.
 * @GNUTLS_PKCS11_OBJ_X509_CRT: X.509 certificate.
 * @GNUTLS_PKCS11_OBJ_PUBKEY: Public key.
 * @GNUTLS_PKCS11_OBJ_PRIVKEY: Private key.
 * @GNUTLS_PKCS11_OBJ_SECRET_KEY: Secret key.
 * @GNUTLS_PKCS11_OBJ_DATA: Data object.
 * @GNUTLS_PKCS11_OBJ_X509_CRT_EXTENSION: X.509 certificate extension (supported by p11-kit trust module only).
 *
 * Enumeration of object types.
  }
type
  Pgnutls_pkcs11_obj_type_t = ^Tgnutls_pkcs11_obj_type_t;
  Tgnutls_pkcs11_obj_type_t =  Longint;
  Const
    GNUTLS_PKCS11_OBJ_UNKNOWN = 0;
    GNUTLS_PKCS11_OBJ_X509_CRT = 1;
    GNUTLS_PKCS11_OBJ_PUBKEY = 2;
    GNUTLS_PKCS11_OBJ_PRIVKEY = 3;
    GNUTLS_PKCS11_OBJ_SECRET_KEY = 4;
    GNUTLS_PKCS11_OBJ_DATA = 5;
    GNUTLS_PKCS11_OBJ_X509_CRT_EXTENSION = 6;
;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gnutls_pkcs11_token_init(token_url:Pchar; so_pin:Pchar; _label:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_token_get_ptr(url:Pchar; ptr:Ppointer; slot_id:Pdword; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_token_get_mechanism(url:Pchar; idx:dword; mechanism:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_token_check_mechanism(url:Pchar; mechanism:dword; ptr:pointer; psize:dword; flags:dword):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{gnutls_pin_flag_t  }function gnutls_pkcs11_token_set_pin(token_url:Pchar; oldpin:Pchar; newpin:Pchar; flags:dword):longint;cdecl;external;
function gnutls_pkcs11_token_get_url(seq:dword; detailed:Tgnutls_pkcs11_url_type_t; url:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_token_get_info(url:Pchar; ttype:Tgnutls_pkcs11_token_info_t; output:pointer; output_size:Psize_t):longint;cdecl;external;
const
  GNUTLS_PKCS11_TOKEN_HW = 1;  
{ p11-kit trusted  }
  GNUTLS_PKCS11_TOKEN_TRUSTED = 1 shl 1;  
{ CKF_RNG  }
  GNUTLS_PKCS11_TOKEN_RNG = 1 shl 2;  
{ CKF_LOGIN_REQUIRED  }
  GNUTLS_PKCS11_TOKEN_LOGIN_REQUIRED = 1 shl 3;  
{ CKF_PROTECTED_AUTHENTICATION_PATH  }
  GNUTLS_PKCS11_TOKEN_PROTECTED_AUTHENTICATION_PATH = 1 shl 4;  
{ CKF_TOKEN_INITIALIZED  }
  GNUTLS_PKCS11_TOKEN_INITIALIZED = 1 shl 5;  
{ CKF_USER_PIN_COUNT_LOW  }
  GNUTLS_PKCS11_TOKEN_USER_PIN_COUNT_LOW = 1 shl 6;  
{ CKF_USER_PIN_FINAL_TRY  }
  GNUTLS_PKCS11_TOKEN_USER_PIN_FINAL_TRY = 1 shl 7;  
{ CKF_USER_PIN_LOCKED  }
  GNUTLS_PKCS11_TOKEN_USER_PIN_LOCKED = 1 shl 8;  
{ CKF_SO_PIN_COUNT_LOW  }
  GNUTLS_PKCS11_TOKEN_SO_PIN_COUNT_LOW = 1 shl 9;  
{ CKF_SO_PIN_FINAL_TRY  }
  GNUTLS_PKCS11_TOKEN_SO_PIN_FINAL_TRY = 1 shl 10;  
{ CKF_SO_PIN_LOCKED  }
  GNUTLS_PKCS11_TOKEN_SO_PIN_LOCKED = 1 shl 11;  
{ CKF_USER_PIN_INITIALIZED  }
  GNUTLS_PKCS11_TOKEN_USER_PIN_INITIALIZED = 1 shl 12;  
{ CKF_ERROR_STATE  }
  GNUTLS_PKCS11_TOKEN_ERROR_STATE = 1 shl 13;  
(* Const before type ignored *)

function gnutls_pkcs11_token_get_flags(url:Pchar; flags:Pdword):longint;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_obj_list_import_url(p_list,n_list,url,attrs,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_obj_list_import_url2(p_list,n_list,url,attrs,flags : longint) : longint;

(* Const before declarator ignored *)
(* Const before type ignored *)
{ GNUTLS_PKCS11_OBJ_FLAG_*  }
function gnutls_pkcs11_obj_list_import_url3(p_list:Pgnutls_pkcs11_obj_t; n_list:Pdword; url:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
{ GNUTLS_PKCS11_OBJ_FLAG_*  }
function gnutls_pkcs11_obj_list_import_url4(p_list:PPgnutls_pkcs11_obj_t; n_list:Pdword; url:Pchar; flags:dword):longint;cdecl;external;
function gnutls_x509_crt_import_pkcs11(crt:Tgnutls_x509_crt_t; pkcs11_crt:Tgnutls_pkcs11_obj_t):longint;cdecl;external;
function gnutls_pkcs11_obj_get_type(obj:Tgnutls_pkcs11_obj_t):Tgnutls_pkcs11_obj_type_t;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_type_get_name(_type:Tgnutls_pkcs11_obj_type_t):Pchar;cdecl;external;
function gnutls_pkcs11_obj_get_exts(obj:Tgnutls_pkcs11_obj_t; exts:PPgnutls_x509_ext_st; exts_size:Pdword; flags:dword):longint;cdecl;external;
function gnutls_pkcs11_obj_get_flags(obj:Tgnutls_pkcs11_obj_t; oflags:Pdword):longint;cdecl;external;
function gnutls_pkcs11_obj_flags_get_str(flags:dword):Pchar;cdecl;external;
(* Const before declarator ignored *)
{ must be zero  }function gnutls_x509_crt_list_import_pkcs11(certs:Pgnutls_x509_crt_t; cert_max:dword; objs:Pgnutls_pkcs11_obj_t; flags:dword):longint;cdecl;external;
{ private key functions... }
function gnutls_pkcs11_privkey_init(key:Pgnutls_pkcs11_privkey_t):longint;cdecl;external;
function gnutls_pkcs11_privkey_cpy(dst:Tgnutls_pkcs11_privkey_t; src:Tgnutls_pkcs11_privkey_t):longint;cdecl;external;
procedure gnutls_pkcs11_privkey_set_pin_function(key:Tgnutls_pkcs11_privkey_t; fn:Tgnutls_pin_callback_t; userdata:pointer);cdecl;external;
procedure gnutls_pkcs11_privkey_deinit(key:Tgnutls_pkcs11_privkey_t);cdecl;external;
function gnutls_pkcs11_privkey_get_pk_algorithm(key:Tgnutls_pkcs11_privkey_t; bits:Pdword):longint;cdecl;external;
function gnutls_pkcs11_privkey_get_info(pkey:Tgnutls_pkcs11_privkey_t; itype:Tgnutls_pkcs11_obj_info_t; output:pointer; output_size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_privkey_import_url(pkey:Tgnutls_pkcs11_privkey_t; url:Pchar; flags:dword):longint;cdecl;external;
function gnutls_pkcs11_privkey_export_url(key:Tgnutls_pkcs11_privkey_t; detailed:Tgnutls_pkcs11_url_type_t; url:PPchar):longint;cdecl;external;
function gnutls_pkcs11_privkey_status(key:Tgnutls_pkcs11_privkey_t):dword;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_privkey_generate(url,pk,bits,_label,flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_privkey_generate2(url,pk,bits,_label,fmt,pubkey,flags : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pkcs11_privkey_generate3(url:Pchar; pk:Tgnutls_pk_algorithm_t; bits:dword; _label:Pchar; cid:Pgnutls_datum_t; 
           fmt:Tgnutls_x509_crt_fmt_t; pubkey:Pgnutls_datum_t; key_usage:dword; flags:dword):longint;cdecl;external;
function gnutls_pkcs11_privkey_export_pubkey(pkey:Tgnutls_pkcs11_privkey_t; fmt:Tgnutls_x509_crt_fmt_t; pubkey:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs11_token_get_random(token_url:Pchar; data:pointer; len:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_pkcs11_copy_attached_extension(token_url:Pchar; crt:Tgnutls_x509_crt_t; data:Pgnutls_datum_t; _label:Pchar; flags:dword):longint;cdecl;external;
const
  gnutls_x509_crt_import_pkcs11_url = gnutls_x509_crt_import_url;  
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_PKCS11_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_copy_x509_crt(url,crt,_label,flags : longint) : longint;
begin
  gnutls_pkcs11_copy_x509_crt:=gnutls_pkcs11_copy_x509_crt2(url,crt,_label,NULL,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_copy_x509_privkey(url,key,_label,usage,flags : longint) : longint;
begin
  gnutls_pkcs11_copy_x509_privkey:=gnutls_pkcs11_copy_x509_privkey2(url,key,_label,NULL,usage,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_obj_list_import_url(p_list,n_list,url,attrs,flags : longint) : longint;
begin
  gnutls_pkcs11_obj_list_import_url:=gnutls_pkcs11_obj_list_import_url3(p_list,n_list,url,attrs or flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_obj_list_import_url2(p_list,n_list,url,attrs,flags : longint) : longint;
begin
  gnutls_pkcs11_obj_list_import_url2:=gnutls_pkcs11_obj_list_import_url4(p_list,n_list,url,attrs or flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_privkey_generate(url,pk,bits,_label,flags : longint) : longint;
begin
  gnutls_pkcs11_privkey_generate:=gnutls_pkcs11_privkey_generate3(url,pk,bits,_label,NULL,0,NULL,0,flags);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gnutls_pkcs11_privkey_generate2(url,pk,bits,_label,fmt,pubkey,flags : longint) : longint;
begin
  gnutls_pkcs11_privkey_generate2:=gnutls_pkcs11_privkey_generate3(url,pk,bits,_label,NULL,fmt,pubkey,0,flags);
end;


end.
