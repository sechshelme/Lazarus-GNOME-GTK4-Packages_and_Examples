
unit pkcs12;
interface

{
  Automatically converted by H2Pas 1.0.0 from pkcs12.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pkcs12.h
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
Pgnutls_pkcs12_bag_int  = ^gnutls_pkcs12_bag_int;
Pgnutls_pkcs12_bag_t  = ^gnutls_pkcs12_bag_t;
Pgnutls_pkcs12_bag_type_t  = ^gnutls_pkcs12_bag_type_t;
Pgnutls_pkcs12_int  = ^gnutls_pkcs12_int;
Pgnutls_pkcs12_t  = ^gnutls_pkcs12_t;
Pgnutls_x509_crl_t  = ^gnutls_x509_crl_t;
Pgnutls_x509_crt_t  = ^gnutls_x509_crt_t;
Pgnutls_x509_privkey_t  = ^gnutls_x509_privkey_t;
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
{$ifndef GNUTLS_PKCS12_H}
{$define GNUTLS_PKCS12_H}
{$include <gnutls/x509.h>}
{ C++ extern C conditionnal removed }
{ PKCS12 structures handling
	  }
type
  Pgnutls_pkcs12_int = ^Tgnutls_pkcs12_int;
  Tgnutls_pkcs12_int = record
      {undefined structure}
    end;


  Pgnutls_pkcs12_t = ^Tgnutls_pkcs12_t;
  Tgnutls_pkcs12_t = Pgnutls_pkcs12_int;
  Pgnutls_pkcs12_bag_int = ^Tgnutls_pkcs12_bag_int;
  Tgnutls_pkcs12_bag_int = record
      {undefined structure}
    end;


  Pgnutls_pkcs12_bag_t = ^Tgnutls_pkcs12_bag_t;
  Tgnutls_pkcs12_bag_t = Pgnutls_pkcs12_bag_int;

function gnutls_pkcs12_init(pkcs12:Pgnutls_pkcs12_t):longint;cdecl;external;
procedure gnutls_pkcs12_deinit(pkcs12:Tgnutls_pkcs12_t);cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_import(pkcs12:Tgnutls_pkcs12_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t; flags:dword):longint;cdecl;external;
function gnutls_pkcs12_export(pkcs12:Tgnutls_pkcs12_t; format:Tgnutls_x509_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external;
function gnutls_pkcs12_export2(pkcs12:Tgnutls_pkcs12_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_pkcs12_get_bag(pkcs12:Tgnutls_pkcs12_t; indx:longint; bag:Tgnutls_pkcs12_bag_t):longint;cdecl;external;
function gnutls_pkcs12_set_bag(pkcs12:Tgnutls_pkcs12_t; bag:Tgnutls_pkcs12_bag_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_generate_mac(pkcs12:Tgnutls_pkcs12_t; pass:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_generate_mac2(pkcs12:Tgnutls_pkcs12_t; mac:Tgnutls_mac_algorithm_t; pass:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_verify_mac(pkcs12:Tgnutls_pkcs12_t; pass:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_bag_decrypt(bag:Tgnutls_pkcs12_bag_t; pass:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_bag_encrypt(bag:Tgnutls_pkcs12_bag_t; pass:Pchar; flags:dword):longint;cdecl;external;
function gnutls_pkcs12_bag_enc_info(bag:Tgnutls_pkcs12_bag_t; schema:Pdword; cipher:Pdword; salt:pointer; salt_size:Pdword; 
           iter_count:Pdword; oid:PPchar):longint;cdecl;external;
function gnutls_pkcs12_mac_info(pkcs12:Tgnutls_pkcs12_t; mac:Pdword; salt:pointer; salt_size:Pdword; iter_count:Pdword; 
           oid:PPchar):longint;cdecl;external;
const
  GNUTLS_PKCS12_SP_INCLUDE_SELF_SIGNED = 1;  
(* Const before type ignored *)

function gnutls_pkcs12_simple_parse(p12:Tgnutls_pkcs12_t; password:Pchar; key:Pgnutls_x509_privkey_t; chain:PPgnutls_x509_crt_t; chain_len:Pdword; 
           extra_certs:PPgnutls_x509_crt_t; extra_certs_len:Pdword; crl:Pgnutls_x509_crl_t; flags:dword):longint;cdecl;external;
{*
 * gnutls_pkcs12_bag_type_t:
 * @GNUTLS_BAG_EMPTY: Empty PKCS-12 bag.
 * @GNUTLS_BAG_PKCS8_ENCRYPTED_KEY: PKCS-12 bag with PKCS-8 encrypted key.
 * @GNUTLS_BAG_PKCS8_KEY: PKCS-12 bag with PKCS-8 key.
 * @GNUTLS_BAG_CERTIFICATE: PKCS-12 bag with certificate.
 * @GNUTLS_BAG_CRL: PKCS-12 bag with CRL.
 * @GNUTLS_BAG_SECRET: PKCS-12 bag with secret PKCS-9 keys.
 * @GNUTLS_BAG_ENCRYPTED: Encrypted PKCS-12 bag.
 * @GNUTLS_BAG_UNKNOWN: Unknown PKCS-12 bag.
 *
 * Enumeration of different PKCS 12 bag types.
  }
{ Secret data. Underspecified in pkcs-12,
				 * gnutls extension. We use the PKCS-9
				 * random nonce ID 1.2.840.113549.1.9.25.3
				 * to store randomly generated keys.
				  }
type
  Pgnutls_pkcs12_bag_type_t = ^Tgnutls_pkcs12_bag_type_t;
  Tgnutls_pkcs12_bag_type_t =  Longint;
  Const
    GNUTLS_BAG_EMPTY = 0;
    GNUTLS_BAG_PKCS8_ENCRYPTED_KEY = 1;
    GNUTLS_BAG_PKCS8_KEY = 2;
    GNUTLS_BAG_CERTIFICATE = 3;
    GNUTLS_BAG_CRL = 4;
    GNUTLS_BAG_SECRET = 5;
    GNUTLS_BAG_ENCRYPTED = 10;
    GNUTLS_BAG_UNKNOWN = 20;
;

function gnutls_pkcs12_bag_get_type(bag:Tgnutls_pkcs12_bag_t; indx:dword):longint;cdecl;external;
function gnutls_pkcs12_bag_get_data(bag:Tgnutls_pkcs12_bag_t; indx:dword; data:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_bag_set_data(bag:Tgnutls_pkcs12_bag_t; _type:Tgnutls_pkcs12_bag_type_t; data:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_pkcs12_bag_set_crl(bag:Tgnutls_pkcs12_bag_t; crl:Tgnutls_x509_crl_t):longint;cdecl;external;
function gnutls_pkcs12_bag_set_crt(bag:Tgnutls_pkcs12_bag_t; crt:Tgnutls_x509_crt_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_bag_set_privkey(bag:Tgnutls_pkcs12_bag_t; privkey:Tgnutls_x509_privkey_t; password:Pchar; flags:dword):longint;cdecl;external;
function gnutls_pkcs12_bag_init(bag:Pgnutls_pkcs12_bag_t):longint;cdecl;external;
procedure gnutls_pkcs12_bag_deinit(bag:Tgnutls_pkcs12_bag_t);cdecl;external;
function gnutls_pkcs12_bag_get_count(bag:Tgnutls_pkcs12_bag_t):longint;cdecl;external;
function gnutls_pkcs12_bag_get_key_id(bag:Tgnutls_pkcs12_bag_t; indx:dword; id:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_bag_set_key_id(bag:Tgnutls_pkcs12_bag_t; indx:dword; id:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_pkcs12_bag_get_friendly_name(bag:Tgnutls_pkcs12_bag_t; indx:dword; name:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_pkcs12_bag_set_friendly_name(bag:Tgnutls_pkcs12_bag_t; indx:dword; name:Pchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_PKCS12_H  }

implementation


end.
