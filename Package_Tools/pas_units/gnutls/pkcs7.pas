unit pkcs7;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2003-2012 Free Software Foundation, Inc.
 * Copyright (C) 2015 Red Hat, Inc.
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
{ This file contains the types and prototypes for the X.509
 * certificate and CRL handling functions.
  }
{$ifndef GNUTLS_PKCS7_H}
{$define GNUTLS_PKCS7_H}
{$include <gnutls/gnutls.h>}
{$include <gnutls/x509.h>}
{ C++ extern C conditionnal removed }
{ PKCS7 structures handling
  }
type
  Pgnutls_pkcs7_int = ^Tgnutls_pkcs7_int;
  Tgnutls_pkcs7_int = record
      {undefined structure}
    end;


  Pgnutls_pkcs7_t = ^Tgnutls_pkcs7_t;
  Tgnutls_pkcs7_t = Pgnutls_pkcs7_int;

function gnutls_pkcs7_init(pkcs7:Pgnutls_pkcs7_t):longint;cdecl;external libgnutls;
procedure gnutls_pkcs7_deinit(pkcs7:Tgnutls_pkcs7_t);cdecl;external libgnutls;
function gnutls_pkcs7_import(pkcs7:Tgnutls_pkcs7_t; data:Pgnutls_datum_t; format:Tgnutls_x509_crt_fmt_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_export(pkcs7:Tgnutls_pkcs7_t; format:Tgnutls_x509_crt_fmt_t; output_data:pointer; output_data_size:Psize_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_export2(pkcs7:Tgnutls_pkcs7_t; format:Tgnutls_x509_crt_fmt_t; out:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_get_signature_count(pkcs7:Tgnutls_pkcs7_t):longint;cdecl;external libgnutls;
const
  GNUTLS_PKCS7_EDATA_GET_RAW = 1 shl 24;  

function gnutls_pkcs7_get_embedded_data(pkcs7:Tgnutls_pkcs7_t; flags:dword; data:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_get_embedded_data_oid(pkcs7:Tgnutls_pkcs7_t):Pchar;cdecl;external libgnutls;
function gnutls_pkcs7_get_crt_count(pkcs7:Tgnutls_pkcs7_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_get_crt_raw(pkcs7:Tgnutls_pkcs7_t; indx:dword; certificate:pointer; certificate_size:Psize_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_set_crt_raw(pkcs7:Tgnutls_pkcs7_t; crt:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_set_crt(pkcs7:Tgnutls_pkcs7_t; crt:Tgnutls_x509_crt_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_delete_crt(pkcs7:Tgnutls_pkcs7_t; indx:longint):longint;cdecl;external libgnutls;
function gnutls_pkcs7_get_crl_raw(pkcs7:Tgnutls_pkcs7_t; indx:dword; crl:pointer; crl_size:Psize_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_get_crl_count(pkcs7:Tgnutls_pkcs7_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_set_crl_raw(pkcs7:Tgnutls_pkcs7_t; crl:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_set_crl(pkcs7:Tgnutls_pkcs7_t; crl:Tgnutls_x509_crl_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_delete_crl(pkcs7:Tgnutls_pkcs7_t; indx:longint):longint;cdecl;external libgnutls;
type
  Pgnutls_pkcs7_attrs_t = ^Tgnutls_pkcs7_attrs_t;
  Tgnutls_pkcs7_attrs_t = Pgnutls_pkcs7_attrs_st;

  Pgnutls_pkcs7_signature_info_st = ^Tgnutls_pkcs7_signature_info_st;
  Tgnutls_pkcs7_signature_info_st = record
      algo : Tgnutls_sign_algorithm_t;
      sig : Tgnutls_datum_t;
      issuer_dn : Tgnutls_datum_t;
      signer_serial : Tgnutls_datum_t;
      issuer_keyid : Tgnutls_datum_t;
      signing_time : Ttime_t;
      signed_attrs : Tgnutls_pkcs7_attrs_t;
      unsigned_attrs : Tgnutls_pkcs7_attrs_t;
      pad : array[0..63] of char;
    end;

procedure gnutls_pkcs7_signature_info_deinit(info:Pgnutls_pkcs7_signature_info_st);cdecl;external libgnutls;
function gnutls_pkcs7_get_signature_info(pkcs7:Tgnutls_pkcs7_t; idx:dword; info:Pgnutls_pkcs7_signature_info_st):longint;cdecl;external libgnutls;
function gnutls_pkcs7_verify_direct(pkcs7:Tgnutls_pkcs7_t; signer:Tgnutls_x509_crt_t; idx:dword; data:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pkcs7_verify(pkcs7:Tgnutls_pkcs7_t; tl:Tgnutls_x509_trust_list_t; vdata:Pgnutls_typed_vdata_st; vdata_size:dword; idx:dword; 
           data:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
const
  GNUTLS_PKCS7_ATTR_ENCODE_OCTET_STRING = 1;  

function gnutls_pkcs7_add_attr(list:Pgnutls_pkcs7_attrs_t; oid:Pchar; data:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
procedure gnutls_pkcs7_attrs_deinit(list:Tgnutls_pkcs7_attrs_t);cdecl;external libgnutls;
function gnutls_pkcs7_get_attr(list:Tgnutls_pkcs7_attrs_t; idx:dword; oid:PPchar; data:Pgnutls_datum_t; flags:dword):longint;cdecl;external libgnutls;
{*
 * gnutls_pkcs7_sign_flags:
 * @GNUTLS_PKCS7_EMBED_DATA: The signed data will be embedded in the structure.
 * @GNUTLS_PKCS7_INCLUDE_TIME: The signing time will be included in the structure.
 * @GNUTLS_PKCS7_INCLUDE_CERT: The signer's certificate will be included in the cert list.
 * @GNUTLS_PKCS7_WRITE_SPKI: Use the signer's key identifier instead of name.
 *
 * Enumeration of the different PKCS #7 signature flags.
  }
type
  Pgnutls_pkcs7_sign_flags = ^Tgnutls_pkcs7_sign_flags;
  Tgnutls_pkcs7_sign_flags =  Longint;
  Const
    GNUTLS_PKCS7_EMBED_DATA = 1;
    GNUTLS_PKCS7_INCLUDE_TIME = 1 shl 1;
    GNUTLS_PKCS7_INCLUDE_CERT = 1 shl 2;
    GNUTLS_PKCS7_WRITE_SPKI = 1 shl 3;
;

function gnutls_pkcs7_sign(pkcs7:Tgnutls_pkcs7_t; signer:Tgnutls_x509_crt_t; signer_key:Tgnutls_privkey_t; data:Pgnutls_datum_t; signed_attrs:Tgnutls_pkcs7_attrs_t; 
           unsigned_attrs:Tgnutls_pkcs7_attrs_t; dig:Tgnutls_digest_algorithm_t; flags:dword):longint;cdecl;external libgnutls;
function gnutls_pkcs7_get_crt_raw2(pkcs7:Tgnutls_pkcs7_t; indx:dword; cert:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_get_crl_raw2(pkcs7:Tgnutls_pkcs7_t; indx:dword; crl:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_print(pkcs7:Tgnutls_pkcs7_t; format:Tgnutls_certificate_print_formats_t; out:Pgnutls_datum_t):longint;cdecl;external libgnutls;
function gnutls_pkcs7_print_signature_info(info:Pgnutls_pkcs7_signature_info_st; format:Tgnutls_certificate_print_formats_t; out:Pgnutls_datum_t):longint;cdecl;external libgnutls;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_PKCS7_H  }

// === Konventiert am: 9-7-25 13:39:47 ===


implementation



end.
