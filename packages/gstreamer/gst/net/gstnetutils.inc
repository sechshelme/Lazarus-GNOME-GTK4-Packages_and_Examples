
{$IFDEF read_interface}

function gst_net_utils_set_socket_tos(socket: PGSocket; qos_dscp: Tgint): Tgboolean; cdecl; external libgstnet;

// === Konventiert am: 11-10-24 14:28:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
