
unit urls;
interface

{
  Automatically converted by H2Pas 1.0.0 from urls.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    urls.h
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
Pgnutls_custom_url_st  = ^gnutls_custom_url_st;
Pgnutls_datum_t  = ^gnutls_datum_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2014 Red Hat, Inc.
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
{$ifndef GNUTLS_URLS_H}
{$define GNUTLS_URLS_H}
{$include <gnutls/gnutls.h>}
{$include <gnutls/x509.h>}
{$include <gnutls/abstract.h>}
{ This API allows to register application specific URLs for
 * keys and certificates.
  }
{ C++ extern C conditionnal removed }
(* Const before type ignored *)
type

  Tgnutls_privkey_import_url_func = function (pkey:Tgnutls_privkey_t; url:Pchar; flags:dword):longint;cdecl;
(* Const before type ignored *)

  Tgnutls_x509_crt_import_url_func = function (pkey:Tgnutls_x509_crt_t; url:Pchar; flags:dword):longint;cdecl;
{ The following callbacks are optional  }
{ This is to enable gnutls_pubkey_import_url()  }
(* Const before type ignored *)

  Tgnutls_pubkey_import_url_func = function (pkey:Tgnutls_pubkey_t; url:Pchar; flags:dword):longint;cdecl;
{ This is to allow constructing a certificate chain. It will be provided
 * the initial certificate URL and the certificate to find its issuer, and must
 * return zero and the DER encoding of the issuer's certificate. If not available,
 * it should return GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE.  }
(* Const before type ignored *)

  Tgnutls_get_raw_issuer_func = function (url:Pchar; crt:Tgnutls_x509_crt_t; issuer_der:Pgnutls_datum_t; flags:dword):longint;cdecl;
(* Const before type ignored *)
{ replace in a future extension  }
{ replace in a future extension  }

  Pgnutls_custom_url_st = ^Tgnutls_custom_url_st;
  Tgnutls_custom_url_st = record
      name : Pchar;
      name_size : dword;
      import_key : Tgnutls_privkey_import_url_func;
      import_crt : Tgnutls_x509_crt_import_url_func;
      import_pubkey : Tgnutls_pubkey_import_url_func;
      get_issuer : Tgnutls_get_raw_issuer_func;
      future1 : pointer;
      future2 : pointer;
    end;
(* Const before type ignored *)

function gnutls_register_custom_url(st:Pgnutls_custom_url_st):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_URLS_H  }

implementation


end.
