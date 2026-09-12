{$IFDEF read_interface}


function apr_wait_for_io_or_timeout(f: Papr_file_t; s: Papr_socket_t; for_read: longint): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
