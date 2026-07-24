{$IFDEF read_interface}


const
  GST_NET_TIME_PACKET_SIZE = 16;

type
  PGstNetTimePacket = ^TGstNetTimePacket;
  TGstNetTimePacket = record
    local_time: TGstClockTime;
    remote_time: TGstClockTime;
  end;

function gst_net_time_packet_get_type: TGType; cdecl; external libgstnet;
function gst_net_time_packet_new(buffer: Pguint8): PGstNetTimePacket; cdecl; external libgstnet;
function gst_net_time_packet_copy(packet: PGstNetTimePacket): PGstNetTimePacket; cdecl; external libgstnet;
procedure gst_net_time_packet_free(packet: PGstNetTimePacket); cdecl; external libgstnet;
function gst_net_time_packet_serialize(packet: PGstNetTimePacket): Pguint8; cdecl; external libgstnet;
function gst_net_time_packet_receive(socket: PGSocket; src_address: PPGSocketAddress; error: PPGError): PGstNetTimePacket; cdecl; external libgstnet;
function gst_net_time_packet_send(packet: PGstNetTimePacket; socket: PGSocket; dest_address: PGSocketAddress; error: PPGError): Tgboolean; cdecl; external libgstnet;

// === Konventiert am: 24-7-26 14:45:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
