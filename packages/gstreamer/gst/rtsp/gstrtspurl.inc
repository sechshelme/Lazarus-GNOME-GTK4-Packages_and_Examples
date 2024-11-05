/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   12:06                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_RTSP_DEFAULT_PORT = 554;

type
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
  PGstRTSPUrl = ^TGstRTSPUrl;
  PPGstRTSPUrl = ^PGstRTSPUrl;


function gst_rtsp_url_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_url_parse(urlstr: Pgchar; url: PPGstRTSPUrl): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_url_copy(url: PGstRTSPUrl): PGstRTSPUrl; cdecl; external libgstrtsp;
procedure gst_rtsp_url_free(url: PGstRTSPUrl); cdecl; external libgstrtsp;
function gst_rtsp_url_get_request_uri(url: PGstRTSPUrl): Pgchar; cdecl; external libgstrtsp;
function gst_rtsp_url_get_request_uri_with_control(url: PGstRTSPUrl; control_path: Pgchar): Pgchar; cdecl; external libgstrtsp;
function gst_rtsp_url_decode_path_components(url: PGstRTSPUrl): PPgchar; cdecl; external libgstrtsp;
function gst_rtsp_url_set_port(url: PGstRTSPUrl; port: Tguint16): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_url_get_port(url: PGstRTSPUrl; port: Pguint16): TGstRTSPResult; cdecl; external libgstrtsp;

// === Konventiert am: 8-10-24 11:23:04 ===

function GST_TYPE_RTSP_URL: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_URL: TGType;
begin
  GST_TYPE_RTSP_URL := gst_rtsp_url_get_type;
end;



{$ENDIF read_implementation}
