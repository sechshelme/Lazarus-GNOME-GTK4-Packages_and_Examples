{$IFDEF read_interface}


function pk_control_get_properties(control: PPkControl; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_control_get_transaction_list(control: PPkControl; cancellable: PGCancellable; error: PPGError): PPgchar; cdecl; external libpackagekit;
function pk_control_suggest_daemon_quit(control: PPkControl; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_control_set_proxy(control: PPkControl; proxy_http: Pgchar; proxy_ftp: Pgchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_control_set_proxy2(control: PPkControl; proxy_http: Pgchar; proxy_https: Pgchar; proxy_ftp: Pgchar; proxy_socks: Pgchar;
  no_proxy: Pgchar; pac: Pgchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:03:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
