
unit dane;
interface

{
  Automatically converted by H2Pas 1.0.0 from dane.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dane.h
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
Pdane_cert_type_t  = ^dane_cert_type_t;
Pdane_cert_usage_t  = ^dane_cert_usage_t;
Pdane_match_type_t  = ^dane_match_type_t;
Pdane_query_st  = ^dane_query_st;
Pdane_query_status_t  = ^dane_query_status_t;
Pdane_query_t  = ^dane_query_t;
Pdane_state_flags_t  = ^dane_state_flags_t;
Pdane_state_st  = ^dane_state_st;
Pdane_state_t  = ^dane_state_t;
Pdane_verify_flags_t  = ^dane_verify_flags_t;
Pdane_verify_status_t  = ^dane_verify_status_t;
Pdword  = ^dword;
Pgnutls_datum_t  = ^gnutls_datum_t;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- c -*-
 * Copyright (C) 2012 KU Leuven
 *
 * Author: Nikos Mavrogiannopoulos
 *
 * This file is part of libdane.
 *
 * libdane is free software; you can redistribute it and/or
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
{$ifndef GNUTLS_DANE_H}
{$define GNUTLS_DANE_H}
{$include <gnutls/gnutls.h> /* for gnutls_datum_t */}
{*
 * dane_cert_usage_t:
 * @DANE_CERT_USAGE_CA: CA constraint. The certificate/key
 *   presented must have signed the verified key.
 * @DANE_CERT_USAGE_EE: The key or the certificate of the end
 *   entity.
 * @DANE_CERT_USAGE_LOCAL_CA: The remote CA is local and possibly
 *   untrusted by the verifier.
 * @DANE_CERT_USAGE_LOCAL_EE: The remote end-entity key is local
 *   and possibly untrusted by the verifier (not signed by a CA).
 *
 * Enumeration of different certificate usage types.
  }
type
  Pdane_cert_usage_t = ^Tdane_cert_usage_t;
  Tdane_cert_usage_t =  Longint;
  Const
    DANE_CERT_USAGE_CA = 0;
    DANE_CERT_USAGE_EE = 1;
    DANE_CERT_USAGE_LOCAL_CA = 2;
    DANE_CERT_USAGE_LOCAL_EE = 3;
;
{*
 * dane_cert_type_t:
 * @DANE_CERT_X509: An X.509 certificate.
 * @DANE_CERT_PK: A public key.
 *
 * Enumeration of different certificate types.
  }
type
  Pdane_cert_type_t = ^Tdane_cert_type_t;
  Tdane_cert_type_t =  Longint;
  Const
    DANE_CERT_X509 = 0;
    DANE_CERT_PK = 1;
;
{*
 * dane_match_type_t:
 * @DANE_MATCH_EXACT: The full content.
 * @DANE_MATCH_SHA2_256: A SHA-256 hash of the content.
 * @DANE_MATCH_SHA2_512: A SHA-512 hash of the content.
 *
 * Enumeration of different content matching types.
  }
type
  Pdane_match_type_t = ^Tdane_match_type_t;
  Tdane_match_type_t =  Longint;
  Const
    DANE_MATCH_EXACT = 0;
    DANE_MATCH_SHA2_256 = 1;
    DANE_MATCH_SHA2_512 = 2;
;
{*
 * dane_query_status_t:
 * @DANE_QUERY_UNKNOWN: There was no query.
 * @DANE_QUERY_DNSSEC_VERIFIED: The query was verified using DNSSEC.
 * @DANE_QUERY_BOGUS: The query has wrong DNSSEC signature.
 * @DANE_QUERY_NO_DNSSEC: The query has no DNSSEC data.
 *
 * Enumeration of different certificate types.
  }
type
  Pdane_query_status_t = ^Tdane_query_status_t;
  Tdane_query_status_t =  Longint;
  Const
    DANE_QUERY_UNKNOWN = 0;
    DANE_QUERY_DNSSEC_VERIFIED = 1;
    DANE_QUERY_BOGUS = 2;
    DANE_QUERY_NO_DNSSEC = 3;
;
type
  Pdane_state_t = ^Tdane_state_t;
  Tdane_state_t = Pdane_state_st;

  Pdane_query_t = ^Tdane_query_t;
  Tdane_query_t = Pdane_query_st;
{*
 * dane_state_flags_t:
 * @DANE_F_IGNORE_LOCAL_RESOLVER: Many systems are not DNSSEC-ready. In that case the local resolver is ignored, and a direct recursive resolve occurs.
 * @DANE_F_INSECURE: Ignore any DNSSEC signature verification errors.
 * @DANE_F_IGNORE_DNSSEC: Do not try to initialize DNSSEC as we will not use it (will then not try to load the DNSSEC root certificate).  Useful if the TLSA data does not come from DNS.
 *
 * Enumeration of different verification flags.
  }

  Pdane_state_flags_t = ^Tdane_state_flags_t;
  Tdane_state_flags_t =  Longint;
  Const
    DANE_F_IGNORE_LOCAL_RESOLVER = 1;
    DANE_F_INSECURE = 2;
    DANE_F_IGNORE_DNSSEC = 4;
;

function dane_state_init(s:Pdane_state_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function dane_state_set_dlv_file(s:Tdane_state_t; file:Pchar):longint;cdecl;external;
procedure dane_state_deinit(s:Tdane_state_t);cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
function dane_raw_tlsa(s:Tdane_state_t; r:Pdane_query_t; dane_data:PPchar; dane_data_len:Plongint; secure:longint; 
           bogus:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dane_query_tlsa(s:Tdane_state_t; r:Pdane_query_t; host:Pchar; proto:Pchar; port:dword):longint;cdecl;external;
function dane_query_status(q:Tdane_query_t):Tdane_query_status_t;cdecl;external;
function dane_query_entries(q:Tdane_query_t):dword;cdecl;external;
function dane_query_data(q:Tdane_query_t; idx:dword; usage:Pdword; _type:Pdword; match:Pdword; 
           data:Pgnutls_datum_t):longint;cdecl;external;
function dane_query_to_raw_tlsa(q:Tdane_query_t; data_entries:Pdword; dane_data:PPPchar; dane_data_len:PPlongint; secure:Plongint; 
           bogus:Plongint):longint;cdecl;external;
procedure dane_query_deinit(q:Tdane_query_t);cdecl;external;
(* Const before type ignored *)
function dane_cert_type_name(_type:Tdane_cert_type_t):Pchar;cdecl;external;
(* Const before type ignored *)
function dane_match_type_name(_type:Tdane_match_type_t):Pchar;cdecl;external;
(* Const before type ignored *)
function dane_cert_usage_name(usage:Tdane_cert_usage_t):Pchar;cdecl;external;
{*
 * dane_verify_flags_t:
 * @DANE_VFLAG_FAIL_IF_NOT_CHECKED: If irrelevant to this certificate DANE entries are received fail instead of succeeding.
 * @DANE_VFLAG_ONLY_CHECK_EE_USAGE: The provided certificates will be verified only against any EE field. Combine with %DANE_VFLAG_FAIL_IF_NOT_CHECKED to fail if EE entries are not present.
 * @DANE_VFLAG_ONLY_CHECK_CA_USAGE: The provided certificates will be verified only against any CA field. Combine with %DANE_VFLAG_FAIL_IF_NOT_CHECKED to fail if CA entries are not present.
 *
 * Enumeration of different verification status flags.
  }
type
  Pdane_verify_flags_t = ^Tdane_verify_flags_t;
  Tdane_verify_flags_t =  Longint;
  Const
    DANE_VFLAG_FAIL_IF_NOT_CHECKED = 1;
    DANE_VFLAG_ONLY_CHECK_EE_USAGE = 1 shl 1;
    DANE_VFLAG_ONLY_CHECK_CA_USAGE = 1 shl 2;
;
{*
 * dane_verify_status_t:
 * @DANE_VERIFY_CA_CONSTRAINTS_VIOLATED: The CA constraints were violated.
 * @DANE_VERIFY_CERT_DIFFERS: The certificate obtained via DNS differs.
 * @DANE_VERIFY_UNKNOWN_DANE_INFO: No known DANE data was found in the DNS record.
 *
 * Enumeration of different verification status flags.
  }
type
  Pdane_verify_status_t = ^Tdane_verify_status_t;
  Tdane_verify_status_t =  Longint;
  Const
    DANE_VERIFY_CA_CONSTRAINTS_VIOLATED = 1;
    DANE_VERIFY_CERT_DIFFERS = 1 shl 1;
    DANE_VERIFY_UNKNOWN_DANE_INFO = 1 shl 2;
;
  DANE_VERIFY_CA_CONSTRAINS_VIOLATED = DANE_VERIFY_CA_CONSTRAINTS_VIOLATED;  
  DANE_VERIFY_NO_DANE_INFO = DANE_VERIFY_UNKNOWN_DANE_INFO;  

function dane_verification_status_print(status:dword; out:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function dane_verify_crt_raw(s:Tdane_state_t; chain:Pgnutls_datum_t; chain_size:dword; chain_type:Tgnutls_certificate_type_t; r:Tdane_query_t; 
           sflags:dword; vflags:dword; verify:Pdword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function dane_verify_crt(s:Tdane_state_t; chain:Pgnutls_datum_t; chain_size:dword; chain_type:Tgnutls_certificate_type_t; hostname:Pchar; 
           proto:Pchar; port:dword; sflags:dword; vflags:dword; verify:Pdword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dane_verify_session_crt(s:Tdane_state_t; session:Tgnutls_session_t; hostname:Pchar; proto:Pchar; port:dword; 
           sflags:dword; vflags:dword; verify:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function dane_strerror(error:longint):Pchar;cdecl;external;
const
  DANE_E_SUCCESS = 0;  
  DANE_E_INITIALIZATION_ERROR = -(1);  
  DANE_E_RESOLVING_ERROR = -(2);  
  DANE_E_NO_DANE_DATA = -(3);  
  DANE_E_RECEIVED_CORRUPT_DATA = -(4);  
  DANE_E_INVALID_DNSSEC_SIG = -(5);  
  DANE_E_NO_DNSSEC_SIG = -(6);  
  DANE_E_MEMORY_ERROR = -(7);  
  DANE_E_REQUESTED_DATA_NOT_AVAILABLE = -(8);  
  DANE_E_INVALID_REQUEST = -(9);  
  DANE_E_PUBKEY_ERROR = -(10);  
  DANE_E_NO_CERT = -(11);  
  DANE_E_FILE_ERROR = -(12);  
  DANE_E_CERT_ERROR = -(13);  
  DANE_E_UNKNOWN_DANE_DATA = -(14);  
{$endif}
{ GNUTLS_DANE_H  }

implementation


end.
