unit tpm;

interface

uses
  fp_gnutls, gnutls;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Ptpm_key_list_st = ^Ttpm_key_list_st;
  Ttpm_key_list_st = record
  end;

  Pgnutls_tpm_key_list_t = ^Tgnutls_tpm_key_list_t;
  Tgnutls_tpm_key_list_t = Ptpm_key_list_st;

const
  GNUTLS_TPM_KEY_SIGNING = 1 shl 1;
  GNUTLS_TPM_REGISTER_KEY = 1 shl 2;
  GNUTLS_TPM_KEY_USER = 1 shl 3;

type
  Pgnutls_tpmkey_fmt_t = ^Tgnutls_tpmkey_fmt_t;
  Tgnutls_tpmkey_fmt_t = longint;

const
  GNUTLS_TPMKEY_FMT_RAW = 0;
  GNUTLS_TPMKEY_FMT_DER = GNUTLS_TPMKEY_FMT_RAW;
  GNUTLS_TPMKEY_FMT_CTK_PEM = 1;

function gnutls_tpm_privkey_generate(pk: Tgnutls_pk_algorithm_t; bits: dword; srk_password: pchar; key_password: pchar; format: Tgnutls_tpmkey_fmt_t;
  pub_format: Tgnutls_x509_crt_fmt_t; privkey: Pgnutls_datum_t; pubkey: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
procedure gnutls_tpm_key_list_deinit(list: Tgnutls_tpm_key_list_t); cdecl; external libgnutls;
function gnutls_tpm_key_list_get_url(list: Tgnutls_tpm_key_list_t; idx: dword; url: PPchar; flags: dword): longint; cdecl; external libgnutls;
function gnutls_tpm_get_registered(list: Pgnutls_tpm_key_list_t): longint; cdecl; external libgnutls;
function gnutls_tpm_privkey_delete(url: pchar; srk_password: pchar): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:40:05 ===


implementation



end.
