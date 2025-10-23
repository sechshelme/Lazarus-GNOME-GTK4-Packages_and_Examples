{$IFDEF read_interface}


type
  Tgnutls_privkey_import_url_func = function(pkey: Tgnutls_privkey_t; url: pchar; flags: dword): longint; cdecl;
  Tgnutls_x509_crt_import_url_func = function(pkey: Tgnutls_x509_crt_t; url: pchar; flags: dword): longint; cdecl;
  Tgnutls_pubkey_import_url_func = function(pkey: Tgnutls_pubkey_t; url: pchar; flags: dword): longint; cdecl;
  Tgnutls_get_raw_issuer_func = function(url: pchar; crt: Tgnutls_x509_crt_t; issuer_der: Pgnutls_datum_t; flags: dword): longint; cdecl;

  Tgnutls_custom_url_st = record
    name: pchar;
    name_size: dword;
    import_key: Tgnutls_privkey_import_url_func;
    import_crt: Tgnutls_x509_crt_import_url_func;
    import_pubkey: Tgnutls_pubkey_import_url_func;
    get_issuer: Tgnutls_get_raw_issuer_func;
    future1: pointer;
    future2: pointer;
  end;
  Pgnutls_custom_url_st = ^Tgnutls_custom_url_st;

function gnutls_register_custom_url(st: Pgnutls_custom_url_st): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:40:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
