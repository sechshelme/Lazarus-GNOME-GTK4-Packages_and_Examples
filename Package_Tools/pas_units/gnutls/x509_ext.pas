unit x509_ext;

interface

uses
  fp_gnutls, gnutls, x509;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgnutls_subject_alt_names_st = record
  end;
  Tgnutls_subject_alt_names_t = ^Tgnutls_subject_alt_names_st;
  Pgnutls_subject_alt_names_t = ^Tgnutls_subject_alt_names_t;

function gnutls_subject_alt_names_init(para1: Pgnutls_subject_alt_names_t): longint; cdecl; external libgnutls;
procedure gnutls_subject_alt_names_deinit(sans: Tgnutls_subject_alt_names_t); cdecl; external libgnutls;
function gnutls_subject_alt_names_get(sans: Tgnutls_subject_alt_names_t; seq: dword; san_type: Pdword; san: Pgnutls_datum_t; othername_oid: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_subject_alt_names_set(sans: Tgnutls_subject_alt_names_t; san_type: dword; san: Pgnutls_datum_t; othername_oid: pchar): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_subject_alt_names(ext: Pgnutls_datum_t; para2: Tgnutls_subject_alt_names_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_subject_alt_names(para1: Tgnutls_subject_alt_names_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;

function gnutls_x509_ext_import_issuer_alt_names(ext: Pgnutls_datum_t; sans: Tgnutls_subject_alt_names_t; flags: DWord): longint; cdecl; external libgnutls name 'gnutls_x509_ext_import_issuer_alt_names';
function gnutls_x509_ext_export_issuer_alt_names(sans: Tgnutls_subject_alt_names_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls name 'gnutls_x509_ext_export_issuer_alt_names';

type
  Tgnutls_x509_crl_dist_points_st = record
  end;
  Tgnutls_x509_crl_dist_points_t = ^Tgnutls_x509_crl_dist_points_st;
  Pgnutls_x509_crl_dist_points_t = ^Tgnutls_x509_crl_dist_points_t;

function gnutls_x509_crl_dist_points_init(para1: Pgnutls_x509_crl_dist_points_t): longint; cdecl; external libgnutls;
procedure gnutls_x509_crl_dist_points_deinit(para1: Tgnutls_x509_crl_dist_points_t); cdecl; external libgnutls;
function gnutls_x509_crl_dist_points_get(para1: Tgnutls_x509_crl_dist_points_t; seq: dword; _type: Pdword; dist: Pgnutls_datum_t; reason_flags: Pdword): longint; cdecl; external libgnutls;
function gnutls_x509_crl_dist_points_set(para1: Tgnutls_x509_crl_dist_points_t; _type: Tgnutls_x509_subject_alt_name_t; dist: Pgnutls_datum_t; reason_flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_crl_dist_points(ext: Pgnutls_datum_t; dp: Tgnutls_x509_crl_dist_points_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_crl_dist_points(dp: Tgnutls_x509_crl_dist_points_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_name_constraints(ext: Pgnutls_datum_t; nc: Tgnutls_x509_name_constraints_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_name_constraints(nc: Tgnutls_x509_name_constraints_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;

type
  Tgnutls_x509_aia_st=record
  end;
  Tgnutls_x509_aia_t = ^Tgnutls_x509_aia_st;
  Pgnutls_x509_aia_t = ^Tgnutls_x509_aia_t;

function gnutls_x509_aia_init(para1: Pgnutls_x509_aia_t): longint; cdecl; external libgnutls;
procedure gnutls_x509_aia_deinit(para1: Tgnutls_x509_aia_t); cdecl; external libgnutls;
function gnutls_x509_aia_get(aia: Tgnutls_x509_aia_t; seq: dword; oid: Pgnutls_datum_t; san_type: Pdword; san: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_aia_set(aia: Tgnutls_x509_aia_t; oid: pchar; san_type: dword; san: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_aia(ext: Pgnutls_datum_t; para2: Tgnutls_x509_aia_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_aia(aia: Tgnutls_x509_aia_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_subject_key_id(ext: Pgnutls_datum_t; id: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_subject_key_id(id: Pgnutls_datum_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;

type
  Tgnutls_x509_aki_st=record
  end;
  Tgnutls_x509_aki_t = ^Tgnutls_x509_aki_st;
  Pgnutls_x509_aki_t = ^Tgnutls_x509_aki_t;

function gnutls_x509_ext_export_authority_key_id(para1: Tgnutls_x509_aki_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_authority_key_id(ext: Pgnutls_datum_t; para2: Tgnutls_x509_aki_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_othername_to_virtual(oid: pchar; othername: Pgnutls_datum_t; virt_type: Pdword; virt: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_aki_init(para1: Pgnutls_x509_aki_t): longint; cdecl; external libgnutls;
function gnutls_x509_aki_get_id(para1: Tgnutls_x509_aki_t; id: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_aki_get_cert_issuer(aki: Tgnutls_x509_aki_t; seq: dword; san_type: Pdword; san: Pgnutls_datum_t; othername_oid: Pgnutls_datum_t;
  serial: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_aki_set_id(aki: Tgnutls_x509_aki_t; id: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_aki_set_cert_issuer(aki: Tgnutls_x509_aki_t; san_type: dword; san: Pgnutls_datum_t; othername_oid: pchar; serial: Pgnutls_datum_t): longint; cdecl; external libgnutls;
procedure gnutls_x509_aki_deinit(para1: Tgnutls_x509_aki_t); cdecl; external libgnutls;
function gnutls_x509_ext_import_private_key_usage_period(ext: Pgnutls_datum_t; activation: Ptime_t; expiration: Ptime_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_private_key_usage_period(activation: Ttime_t; expiration: Ttime_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_basic_constraints(ext: Pgnutls_datum_t; ca: Pdword; pathlen: Plongint): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_basic_constraints(ca: dword; pathlen: longint; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;

type
  Tgnutls_x509_key_purposes_st=record
  end;
  Tgnutls_x509_key_purposes_t = ^Tgnutls_x509_key_purposes_st;
  Pgnutls_x509_key_purposes_t = ^Tgnutls_x509_key_purposes_t;

function gnutls_x509_key_purpose_init(p: Pgnutls_x509_key_purposes_t): longint; cdecl; external libgnutls;
procedure gnutls_x509_key_purpose_deinit(p: Tgnutls_x509_key_purposes_t); cdecl; external libgnutls;
function gnutls_x509_key_purpose_set(p: Tgnutls_x509_key_purposes_t; oid: pchar): longint; cdecl; external libgnutls;
function gnutls_x509_key_purpose_get(p: Tgnutls_x509_key_purposes_t; idx: dword; oid: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_key_purposes(ext: Pgnutls_datum_t; para2: Tgnutls_x509_key_purposes_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_key_purposes(para1: Tgnutls_x509_key_purposes_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_key_usage(ext: Pgnutls_datum_t; key_usage: Pdword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_key_usage(key_usage: dword; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_inhibit_anypolicy(ext: Pgnutls_datum_t; skipcerts: Pdword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_inhibit_anypolicy(skipcerts: dword; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_proxy(ext: Pgnutls_datum_t; pathlen: Plongint; policyLanguage: PPchar; policy: PPchar; sizeof_policy: Psize_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_proxy(pathLenConstraint: longint; policyLanguage: pchar; policy: pchar; sizeof_policy: Tsize_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;

type
  Tgnutls_x509_policies_st=record
  end;
  Tgnutls_x509_policies_t = ^Tgnutls_x509_policies_st;
  Pgnutls_x509_policies_t = ^Tgnutls_x509_policies_t;

function gnutls_x509_policies_init(para1: Pgnutls_x509_policies_t): longint; cdecl; external libgnutls;
procedure gnutls_x509_policies_deinit(para1: Tgnutls_x509_policies_t); cdecl; external libgnutls;
function gnutls_x509_policies_get(policies: Tgnutls_x509_policies_t; seq: dword; policy: Pgnutls_x509_policy_st): longint; cdecl; external libgnutls;
function gnutls_x509_policies_set(policies: Tgnutls_x509_policies_t; policy: Pgnutls_x509_policy_st): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_policies(ext: Pgnutls_datum_t; policies: Tgnutls_x509_policies_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_policies(policies: Tgnutls_x509_policies_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ext_import_tlsfeatures(ext: Pgnutls_datum_t; para2: Tgnutls_x509_tlsfeatures_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_export_tlsfeatures(f: Tgnutls_x509_tlsfeatures_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_tlsfeatures_add(f: Tgnutls_x509_tlsfeatures_t; feature: dword): longint; cdecl; external libgnutls;

type
  Tgnutls_x509_ct_scts_st=record
  end;
  Tgnutls_x509_ct_scts_t = ^Tgnutls_x509_ct_scts_st;
  Pgnutls_x509_ct_scts_t = ^Tgnutls_x509_ct_scts_t;

function gnutls_x509_ext_ct_scts_init(scts: Pgnutls_x509_ct_scts_t): longint; cdecl; external libgnutls;
procedure gnutls_x509_ext_ct_scts_deinit(scts: Tgnutls_x509_ct_scts_t); cdecl; external libgnutls;
function gnutls_x509_ext_ct_import_scts(ext: Pgnutls_datum_t; scts: Tgnutls_x509_ct_scts_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_x509_ext_ct_export_scts(scts: Tgnutls_x509_ct_scts_t; ext: Pgnutls_datum_t): longint; cdecl; external libgnutls;
function gnutls_x509_ct_sct_get_version(scts: Tgnutls_x509_ct_scts_t; idx: dword; version_out: Pdword): longint; cdecl; external libgnutls;
function gnutls_x509_ct_sct_get(scts: Tgnutls_x509_ct_scts_t; idx: dword; timestamp: Ptime_t; logid: Pgnutls_datum_t; sigalg: Pgnutls_sign_algorithm_t;
  signature: Pgnutls_datum_t): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:40:14 ===


implementation



end.
