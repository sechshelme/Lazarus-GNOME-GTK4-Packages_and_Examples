/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 11-10-2024   14:43                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_NET_TIME_PACKET_SIZE = 16;

type
  TGstNetTimePacket = record
    local_time: TGstClockTime;
    remote_time: TGstClockTime;
  end;
  PGstNetTimePacket = ^TGstNetTimePacket;

function gst_net_time_packet_get_type: TGType; cdecl; external libgstnet;
function gst_net_time_packet_new(buffer: Pguint8): PGstNetTimePacket; cdecl; external libgstnet;
function gst_net_time_packet_copy(packet: PGstNetTimePacket): PGstNetTimePacket; cdecl; external libgstnet;
procedure gst_net_time_packet_free(packet: PGstNetTimePacket); cdecl; external libgstnet;
function gst_net_time_packet_serialize(packet: PGstNetTimePacket): Pguint8; cdecl; external libgstnet;
function gst_net_time_packet_receive(socket: PGSocket; src_address: PPGSocketAddress; error: PPGError): PGstNetTimePacket; cdecl; external libgstnet;
function gst_net_time_packet_send(packet: PGstNetTimePacket; socket: PGSocket; dest_address: PGSocketAddress; error: PPGError): Tgboolean; cdecl; external libgstnet;

// === Konventiert am: 11-10-24 14:28:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
