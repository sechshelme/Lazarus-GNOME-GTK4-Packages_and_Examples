{$IFDEF read_interface}


const
  GST_RTSP_DEFAULT_PORT = 554;

type
  PPGstRTSPUrl = ^PGstRTSPUrl;
  PGstRTSPUrl = ^TGstRTSPUrl;
  TGstRTSPUrl = record
    transports: TGstRTSPLowerTrans;
    family: TGstRTSPFamily;
    user: Pgchar;
    passwd: Pgchar;
    host: Pgchar;
    port: Tguint16;
    abspath: Pgchar;
    query: Pgchar;
  end;

function gst_rtsp_url_get_type: TGType; cdecl; external libgstrtp;
function gst_rtsp_url_parse(urlstr: Pgchar; url: PPGstRTSPUrl): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_url_copy(url: PGstRTSPUrl): PGstRTSPUrl; cdecl; external libgstrtp;
procedure gst_rtsp_url_free(url: PGstRTSPUrl); cdecl; external libgstrtp;
function gst_rtsp_url_get_request_uri(url: PGstRTSPUrl): Pgchar; cdecl; external libgstrtp;
function gst_rtsp_url_get_request_uri_with_control(url: PGstRTSPUrl; control_path: Pgchar): Pgchar; cdecl; external libgstrtp;
function gst_rtsp_url_decode_path_components(url: PGstRTSPUrl): PPgchar; cdecl; external libgstrtp;
function gst_rtsp_url_set_port(url: PGstRTSPUrl; port: Tguint16): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_url_get_port(url: PGstRTSPUrl; port: Pguint16): TGstRTSPResult; cdecl; external libgstrtp;

// === Konventiert am: 19-7-26 19:30:51 ===

function GST_TYPE_RTSP_URL: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_URL: TGType;
begin
  GST_TYPE_RTSP_URL := gst_rtsp_url_get_type;
end;

{$ENDIF read_implementation}
