

  {$IFDEF read_struct}
type
  PGstSDPInfo = ^TGstSDPInfo;
  TGstSDPInfo = record
    is_ipv6: Tgboolean;
    server_ip: Pgchar;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_sdp_from_media(sdp: PGstSDPMessage; info: PGstSDPInfo; media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_sdp_from_stream(sdp: PGstSDPMessage; info: PGstSDPInfo; stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_sdp_make_media(sdp: PGstSDPMessage; info: PGstSDPInfo; stream: PGstRTSPStream; caps: PGstCaps; profile: TGstRTSPProfile): Tgboolean; cdecl; external libgstrtsp;
{$ENDIF read_function}

// === Konventiert am: 20-7-26 13:46:28 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
