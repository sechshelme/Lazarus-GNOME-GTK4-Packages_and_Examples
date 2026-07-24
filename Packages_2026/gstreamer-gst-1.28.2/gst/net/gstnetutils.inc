{$IFDEF read_interface}


function gst_net_utils_set_socket_tos(socket: PGSocket; qos_dscp: Tgint): Tgboolean; cdecl; external libgstnet;

// === Konventiert am: 24-7-26 14:44:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
