
unit x509_ext;
interface

{
  Automatically converted by H2Pas 1.0.0 from x509_ext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    x509_ext.h
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
Pgnutls_sign_algorithm_t  = ^gnutls_sign_algorithm_t;
Pgnutls_subject_alt_names_st  = ^gnutls_subject_alt_names_st;
Pgnutls_subject_alt_names_t  = ^gnutls_subject_alt_names_t;
Pgnutls_x509_aia_st  = ^gnutls_x509_aia_st;
Pgnutls_x509_aia_t  = ^gnutls_x509_aia_t;
Pgnutls_x509_aki_st  = ^gnutls_x509_aki_st;
Pgnutls_x509_aki_t  = ^gnutls_x509_aki_t;
Pgnutls_x509_crl_dist_points_st  = ^gnutls_x509_crl_dist_points_st;
Pgnutls_x509_crl_dist_points_t  = ^gnutls_x509_crl_dist_points_t;
Pgnutls_x509_ct_scts_st  = ^gnutls_x509_ct_scts_st;
Pgnutls_x509_ct_scts_t  = ^gnutls_x509_ct_scts_t;
Pgnutls_x509_key_purposes_st  = ^gnutls_x509_key_purposes_st;
Pgnutls_x509_key_purposes_t  = ^gnutls_x509_key_purposes_t;
Pgnutls_x509_policies_st  = ^gnutls_x509_policies_st;
Pgnutls_x509_policies_t  = ^gnutls_x509_policies_t;
Pgnutls_x509_policy_st  = ^gnutls_x509_policy_st;
Plongint  = ^longint;
Psize_t  = ^size_t;
Ptime_t  = ^time_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2014 Free Software Foundation, Inc.
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
{ Prototypes for direct handling of extension data  }
{$ifndef GNUTLS_X509_EXT_H}
{$define GNUTLS_X509_EXT_H}
{$include <gnutls/gnutls.h>}
{$include <gnutls/x509.h>}
{ C++ extern C conditionnal removed }
type
  Pgnutls_subject_alt_names_t = ^Tgnutls_subject_alt_names_t;
  Tgnutls_subject_alt_names_t = Pgnutls_subject_alt_names_st;

function gnutls_subject_alt_names_init(para1:Pgnutls_subject_alt_names_t):longint;cdecl;external;
procedure gnutls_subject_alt_names_deinit(sans:Tgnutls_subject_alt_names_t);cdecl;external;
function gnutls_subject_alt_names_get(sans:Tgnutls_subject_alt_names_t; seq:dword; san_type:Pdword; san:Pgnutls_datum_t; othername_oid:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_subject_alt_names_set(sans:Tgnutls_subject_alt_names_t; san_type:dword; san:Pgnutls_datum_t; othername_oid:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_subject_alt_names(ext:Pgnutls_datum_t; para2:Tgnutls_subject_alt_names_t; flags:dword):longint;cdecl;external;
function gnutls_x509_ext_export_subject_alt_names(para1:Tgnutls_subject_alt_names_t; ext:Pgnutls_datum_t):longint;cdecl;external;
{ They are exactly the same  }
const
  gnutls_x509_ext_import_issuer_alt_name = gnutls_x509_ext_import_subject_alt_name;  
  gnutls_x509_ext_export_issuer_alt_name = gnutls_x509_ext_export_subject_alt_name;  
type
  Pgnutls_x509_crl_dist_points_t = ^Tgnutls_x509_crl_dist_points_t;
  Tgnutls_x509_crl_dist_points_t = Pgnutls_x509_crl_dist_points_st;

function gnutls_x509_crl_dist_points_init(para1:Pgnutls_x509_crl_dist_points_t):longint;cdecl;external;
procedure gnutls_x509_crl_dist_points_deinit(para1:Tgnutls_x509_crl_dist_points_t);cdecl;external;
function gnutls_x509_crl_dist_points_get(para1:Tgnutls_x509_crl_dist_points_t; seq:dword; _type:Pdword; dist:Pgnutls_datum_t; reason_flags:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_crl_dist_points_set(para1:Tgnutls_x509_crl_dist_points_t; _type:Tgnutls_x509_subject_alt_name_t; dist:Pgnutls_datum_t; reason_flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_crl_dist_points(ext:Pgnutls_datum_t; dp:Tgnutls_x509_crl_dist_points_t; flags:dword):longint;cdecl;external;
function gnutls_x509_ext_export_crl_dist_points(dp:Tgnutls_x509_crl_dist_points_t; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_name_constraints(ext:Pgnutls_datum_t; nc:Tgnutls_x509_name_constraints_t; flags:dword):longint;cdecl;external;
function gnutls_x509_ext_export_name_constraints(nc:Tgnutls_x509_name_constraints_t; ext:Pgnutls_datum_t):longint;cdecl;external;
type
  Pgnutls_x509_aia_t = ^Tgnutls_x509_aia_t;
  Tgnutls_x509_aia_t = Pgnutls_x509_aia_st;

function gnutls_x509_aia_init(para1:Pgnutls_x509_aia_t):longint;cdecl;external;
procedure gnutls_x509_aia_deinit(para1:Tgnutls_x509_aia_t);cdecl;external;
function gnutls_x509_aia_get(aia:Tgnutls_x509_aia_t; seq:dword; oid:Pgnutls_datum_t; san_type:Pdword; san:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_aia_set(aia:Tgnutls_x509_aia_t; oid:Pchar; san_type:dword; san:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_aia(ext:Pgnutls_datum_t; para2:Tgnutls_x509_aia_t; flags:dword):longint;cdecl;external;
function gnutls_x509_ext_export_aia(aia:Tgnutls_x509_aia_t; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_subject_key_id(ext:Pgnutls_datum_t; id:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_export_subject_key_id(id:Pgnutls_datum_t; ext:Pgnutls_datum_t):longint;cdecl;external;
type
  Pgnutls_x509_aki_t = ^Tgnutls_x509_aki_t;
  Tgnutls_x509_aki_t = Pgnutls_x509_aki_st;

function gnutls_x509_ext_export_authority_key_id(para1:Tgnutls_x509_aki_t; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_authority_key_id(ext:Pgnutls_datum_t; para2:Tgnutls_x509_aki_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_othername_to_virtual(oid:Pchar; othername:Pgnutls_datum_t; virt_type:Pdword; virt:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_aki_init(para1:Pgnutls_x509_aki_t):longint;cdecl;external;
function gnutls_x509_aki_get_id(para1:Tgnutls_x509_aki_t; id:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_aki_get_cert_issuer(aki:Tgnutls_x509_aki_t; seq:dword; san_type:Pdword; san:Pgnutls_datum_t; othername_oid:Pgnutls_datum_t; 
           serial:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_aki_set_id(aki:Tgnutls_x509_aki_t; id:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_aki_set_cert_issuer(aki:Tgnutls_x509_aki_t; san_type:dword; san:Pgnutls_datum_t; othername_oid:Pchar; serial:Pgnutls_datum_t):longint;cdecl;external;
procedure gnutls_x509_aki_deinit(para1:Tgnutls_x509_aki_t);cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_private_key_usage_period(ext:Pgnutls_datum_t; activation:Ptime_t; expiration:Ptime_t):longint;cdecl;external;
function gnutls_x509_ext_export_private_key_usage_period(activation:Ttime_t; expiration:Ttime_t; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_basic_constraints(ext:Pgnutls_datum_t; ca:Pdword; pathlen:Plongint):longint;cdecl;external;
function gnutls_x509_ext_export_basic_constraints(ca:dword; pathlen:longint; ext:Pgnutls_datum_t):longint;cdecl;external;
type
  Pgnutls_x509_key_purposes_t = ^Tgnutls_x509_key_purposes_t;
  Tgnutls_x509_key_purposes_t = Pgnutls_x509_key_purposes_st;

function gnutls_x509_key_purpose_init(p:Pgnutls_x509_key_purposes_t):longint;cdecl;external;
procedure gnutls_x509_key_purpose_deinit(p:Tgnutls_x509_key_purposes_t);cdecl;external;
(* Const before type ignored *)
function gnutls_x509_key_purpose_set(p:Tgnutls_x509_key_purposes_t; oid:Pchar):longint;cdecl;external;
function gnutls_x509_key_purpose_get(p:Tgnutls_x509_key_purposes_t; idx:dword; oid:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_key_purposes(ext:Pgnutls_datum_t; para2:Tgnutls_x509_key_purposes_t; flags:dword):longint;cdecl;external;
function gnutls_x509_ext_export_key_purposes(para1:Tgnutls_x509_key_purposes_t; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_key_usage(ext:Pgnutls_datum_t; key_usage:Pdword):longint;cdecl;external;
function gnutls_x509_ext_export_key_usage(key_usage:dword; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_inhibit_anypolicy(ext:Pgnutls_datum_t; skipcerts:Pdword):longint;cdecl;external;
function gnutls_x509_ext_export_inhibit_anypolicy(skipcerts:dword; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_proxy(ext:Pgnutls_datum_t; pathlen:Plongint; policyLanguage:PPchar; policy:PPchar; sizeof_policy:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_x509_ext_export_proxy(pathLenConstraint:longint; policyLanguage:Pchar; policy:Pchar; sizeof_policy:Tsize_t; ext:Pgnutls_datum_t):longint;cdecl;external;
type
  Pgnutls_x509_policies_t = ^Tgnutls_x509_policies_t;
  Tgnutls_x509_policies_t = Pgnutls_x509_policies_st;

function gnutls_x509_policies_init(para1:Pgnutls_x509_policies_t):longint;cdecl;external;
procedure gnutls_x509_policies_deinit(para1:Tgnutls_x509_policies_t);cdecl;external;
function gnutls_x509_policies_get(policies:Tgnutls_x509_policies_t; seq:dword; policy:Pgnutls_x509_policy_st):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_policies_set(policies:Tgnutls_x509_policies_t; policy:Pgnutls_x509_policy_st):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_policies(ext:Pgnutls_datum_t; policies:Tgnutls_x509_policies_t; flags:dword):longint;cdecl;external;
function gnutls_x509_ext_export_policies(policies:Tgnutls_x509_policies_t; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_import_tlsfeatures(ext:Pgnutls_datum_t; para2:Tgnutls_x509_tlsfeatures_t; flags:dword):longint;cdecl;external;
function gnutls_x509_ext_export_tlsfeatures(f:Tgnutls_x509_tlsfeatures_t; ext:Pgnutls_datum_t):longint;cdecl;external;
function gnutls_x509_tlsfeatures_add(f:Tgnutls_x509_tlsfeatures_t; feature:dword):longint;cdecl;external;
type
  Pgnutls_x509_ct_scts_t = ^Tgnutls_x509_ct_scts_t;
  Tgnutls_x509_ct_scts_t = Pgnutls_x509_ct_scts_st;

function gnutls_x509_ext_ct_scts_init(scts:Pgnutls_x509_ct_scts_t):longint;cdecl;external;
procedure gnutls_x509_ext_ct_scts_deinit(scts:Tgnutls_x509_ct_scts_t);cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_ct_import_scts(ext:Pgnutls_datum_t; scts:Tgnutls_x509_ct_scts_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ext_ct_export_scts(scts:Tgnutls_x509_ct_scts_t; ext:Pgnutls_datum_t):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ct_sct_get_version(scts:Tgnutls_x509_ct_scts_t; idx:dword; version_out:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_x509_ct_sct_get(scts:Tgnutls_x509_ct_scts_t; idx:dword; timestamp:Ptime_t; logid:Pgnutls_datum_t; sigalg:Pgnutls_sign_algorithm_t; 
           signature:Pgnutls_datum_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_X509_EXT_H  }

implementation


end.
