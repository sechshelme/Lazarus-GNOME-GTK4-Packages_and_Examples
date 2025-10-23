{$IFDEF read_interface}



const
  GNUTLS_COOKIE_KEY_SIZE = 16;

procedure gnutls_dtls_set_timeouts(session: Tgnutls_session_t; retrans_timeout: dword; total_timeout: dword); cdecl; external libgnutls;
function gnutls_dtls_get_mtu(session: Tgnutls_session_t): dword; cdecl; external libgnutls;
function gnutls_dtls_get_data_mtu(session: Tgnutls_session_t): dword; cdecl; external libgnutls;
procedure gnutls_dtls_set_mtu(session: Tgnutls_session_t; mtu: dword); cdecl; external libgnutls;
function gnutls_dtls_set_data_mtu(session: Tgnutls_session_t; mtu: dword): longint; cdecl; external libgnutls;
function gnutls_dtls_get_timeout(session: Tgnutls_session_t): dword; cdecl; external libgnutls;

type
  Tgnutls_dtls_prestate_st = record
    record_seq: dword;
    hsk_read_seq: dword;
    hsk_write_seq: dword;
  end;
  Pgnutls_dtls_prestate_st = ^Tgnutls_dtls_prestate_st;

function gnutls_dtls_cookie_send(key: Pgnutls_datum_t; client_data: pointer; client_data_size: Tsize_t; prestate: Pgnutls_dtls_prestate_st; ptr: Tgnutls_transport_ptr_t;
  push_func: Tgnutls_push_func): longint; cdecl; external libgnutls;
function gnutls_dtls_cookie_verify(key: Pgnutls_datum_t; client_data: pointer; client_data_size: Tsize_t; _msg: pointer; msg_size: Tsize_t;
  prestate: Pgnutls_dtls_prestate_st): longint; cdecl; external libgnutls;
procedure gnutls_dtls_prestate_set(session: Tgnutls_session_t; prestate: Pgnutls_dtls_prestate_st); cdecl; external libgnutls;
function gnutls_record_get_discarded(session: Tgnutls_session_t): dword; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:39:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
