unit mongoc_ssl;

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tmongoc_ssl_opt_t = record
    pem_file: pchar;
    pem_pwd: pchar;
    ca_file: pchar;
    ca_dir: pchar;
    crl_file: pchar;
    weak_cert_validation: Tbool;
    allow_invalid_hostname: Tbool;
    internal: pointer;
    padding: array[0..5] of pointer;
  end;
  Pmongoc_ssl_opt_t = ^Tmongoc_ssl_opt_t;

function mongoc_ssl_opt_get_default: Pmongoc_ssl_opt_t; cdecl; external libmongoc;

// === Konventiert am: 15-5-26 15:14:48 ===


implementation



end.
