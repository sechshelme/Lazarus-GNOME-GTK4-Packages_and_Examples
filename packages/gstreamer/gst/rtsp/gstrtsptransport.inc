
{$IFDEF read_interface}

type
  PGstRTSPTransMode = ^TGstRTSPTransMode;
  TGstRTSPTransMode = longint;

const
  GST_RTSP_TRANS_UNKNOWN = 0;
  GST_RTSP_TRANS_RTP = 1 shl 0;
  GST_RTSP_TRANS_RDT = 1 shl 1;

type
  PGstRTSPProfile = ^TGstRTSPProfile;
  TGstRTSPProfile = longint;

const
  GST_RTSP_PROFILE_UNKNOWN = 0;
  GST_RTSP_PROFILE_AVP = 1 shl 0;
  GST_RTSP_PROFILE_SAVP = 1 shl 1;
  GST_RTSP_PROFILE_AVPF = 1 shl 2;
  GST_RTSP_PROFILE_SAVPF = 1 shl 3;

type
  PGstRTSPLowerTrans = ^TGstRTSPLowerTrans;
  TGstRTSPLowerTrans = longint;

const
  GST_RTSP_LOWER_TRANS_UNKNOWN = 0;
  GST_RTSP_LOWER_TRANS_UDP = 1 shl 0;
  GST_RTSP_LOWER_TRANS_UDP_MCAST = 1 shl 1;
  GST_RTSP_LOWER_TRANS_TCP = 1 shl 2;
  GST_RTSP_LOWER_TRANS_HTTP = 1 shl 4;
  GST_RTSP_LOWER_TRANS_TLS = 1 shl 5;

type
  TGstRTSPRange = record
    min: Tgint;
    max: Tgint;
  end;
  PGstRTSPRange = ^TGstRTSPRange;

  TGstRTSPTransport = record
    trans: TGstRTSPTransMode;
    profile: TGstRTSPProfile;
    lower_transport: TGstRTSPLowerTrans;
    destination: Pgchar;
    Source: Pgchar;
    layers: Tguint;
    mode_play: Tgboolean;
    mode_record: Tgboolean;
    append: Tgboolean;
    interleaved: TGstRTSPRange;
    ttl: Tguint;
    port: TGstRTSPRange;
    client_port: TGstRTSPRange;
    server_port: TGstRTSPRange;
    ssrc: Tguint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstRTSPTransport = ^TGstRTSPTransport;
  PPGstRTSPTransport = ^PGstRTSPTransport;


function gst_rtsp_transport_new(transport: PPGstRTSPTransport): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_transport_init(transport: PGstRTSPTransport): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_transport_parse(str: Pgchar; transport: PGstRTSPTransport): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_transport_as_text(transport: PGstRTSPTransport): Pgchar; cdecl; external libgstrtsp;
function gst_rtsp_transport_get_mime(trans: TGstRTSPTransMode; mime: PPgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_transport_get_manager(trans: TGstRTSPTransMode; manager: PPgchar; option: Tguint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_transport_get_media_type(transport: PGstRTSPTransport; media_type: PPgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_transport_free(transport: PGstRTSPTransport): TGstRTSPResult; cdecl; external libgstrtsp;

// === Konventiert am: 8-10-24 11:22:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
