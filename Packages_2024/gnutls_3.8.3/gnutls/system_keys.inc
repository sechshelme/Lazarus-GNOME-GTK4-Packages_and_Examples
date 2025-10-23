{$IFDEF read_interface}


type
  Tsystem_key_iter_st = record
  end;
  Tgnutls_system_key_iter_t = ^Tsystem_key_iter_st;
  Pgnutls_system_key_iter_t = ^Tgnutls_system_key_iter_t;

procedure gnutls_system_key_iter_deinit(iter: Tgnutls_system_key_iter_t); cdecl; external libgnutls;
function gnutls_system_key_iter_get_info(iter: Pgnutls_system_key_iter_t; cert_type: dword; cert_url: PPchar; key_url: PPchar; _label: PPchar;
  der: Pgnutls_datum_t; flags: dword): longint; cdecl; external libgnutls;
function gnutls_system_key_delete(cert_url: pchar; key_url: pchar): longint; cdecl; external libgnutls;
function gnutls_system_key_add_x509(crt: Tgnutls_x509_crt_t; privkey: Tgnutls_x509_privkey_t; _label: pchar; cert_url: PPchar; key_url: PPchar): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:40:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
