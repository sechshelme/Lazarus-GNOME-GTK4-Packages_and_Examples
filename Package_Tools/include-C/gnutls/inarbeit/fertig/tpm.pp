
unit tpm;
interface

{
  Automatically converted by H2Pas 1.0.0 from tpm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tpm.h
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
Pgnutls_datum_t  = ^gnutls_datum_t;
Pgnutls_tpm_key_list_t  = ^gnutls_tpm_key_list_t;
Pgnutls_tpmkey_fmt_t  = ^gnutls_tpmkey_fmt_t;
Ptpm_key_list_st  = ^tpm_key_list_st;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2010-2012 Free Software Foundation, Inc.
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
{$ifndef GNUTLS_TPM_H}
{$define GNUTLS_TPM_H}
{$include <gnutls/gnutls.h>}
{$include <gnutls/x509.h>}
{ C++ extern C conditionnal removed }
type
  Ptpm_key_list_st = ^Ttpm_key_list_st;
  Ttpm_key_list_st = record
      {undefined structure}
    end;


  Pgnutls_tpm_key_list_t = ^Tgnutls_tpm_key_list_t;
  Tgnutls_tpm_key_list_t = Ptpm_key_list_st;

const
  GNUTLS_TPM_KEY_SIGNING = 1 shl 1;  
  GNUTLS_TPM_REGISTER_KEY = 1 shl 2;  
  GNUTLS_TPM_KEY_USER = 1 shl 3;  
{*
 * gnutls_tpmkey_fmt_t:
 * @GNUTLS_TPMKEY_FMT_RAW: The portable data format.
 * @GNUTLS_TPMKEY_FMT_DER: An alias for the raw format.
 * @GNUTLS_TPMKEY_FMT_CTK_PEM: A custom data format used by some TPM tools.
 *
 * Enumeration of different certificate encoding formats.
  }
type
  Pgnutls_tpmkey_fmt_t = ^Tgnutls_tpmkey_fmt_t;
  Tgnutls_tpmkey_fmt_t =  Longint;
  Const
    GNUTLS_TPMKEY_FMT_RAW = 0;
    GNUTLS_TPMKEY_FMT_DER = GNUTLS_TPMKEY_FMT_RAW;
    GNUTLS_TPMKEY_FMT_CTK_PEM = 1;
;
(* Const before type ignored *)
(* Const before type ignored *)

function gnutls_tpm_privkey_generate(pk:Tgnutls_pk_algorithm_t; bits:dword; srk_password:Pchar; key_password:Pchar; format:Tgnutls_tpmkey_fmt_t; 
           pub_format:Tgnutls_x509_crt_fmt_t; privkey:Pgnutls_datum_t; pubkey:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
procedure gnutls_tpm_key_list_deinit(list:Tgnutls_tpm_key_list_t);cdecl;external;
function gnutls_tpm_key_list_get_url(list:Tgnutls_tpm_key_list_t; idx:dword; url:PPchar; flags:dword):longint;cdecl;external;
function gnutls_tpm_get_registered(list:Pgnutls_tpm_key_list_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_tpm_privkey_delete(url:Pchar; srk_password:Pchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_TPM_H  }

implementation


end.
