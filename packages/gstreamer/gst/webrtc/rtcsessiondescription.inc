
{$IFDEF read_interface}

function gst_webrtc_sdp_type_to_string(_type: TGstWebRTCSDPType): Pgchar; cdecl; external libgstwebrtc;
function gst_webrtc_session_description_get_type: TGType; cdecl; external libgstwebrtc;

type
  TGstWebRTCSessionDescription = record
    _type: TGstWebRTCSDPType;
    sdp: PGstSDPMessage;
  end;
  PGstWebRTCSessionDescription = ^TGstWebRTCSessionDescription;

function gst_webrtc_session_description_new(_type: TGstWebRTCSDPType; sdp: PGstSDPMessage): PGstWebRTCSessionDescription; cdecl; external libgstwebrtc;
function gst_webrtc_session_description_copy(src: PGstWebRTCSessionDescription): PGstWebRTCSessionDescription; cdecl; external libgstwebrtc;
procedure gst_webrtc_session_description_free(desc: PGstWebRTCSessionDescription); cdecl; external libgstwebrtc;

// === Konventiert am: 5-10-24 17:13:12 ===

function GST_TYPE_WEBRTC_SESSION_DESCRIPTION: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_SESSION_DESCRIPTION: TGType;
begin
  GST_TYPE_WEBRTC_SESSION_DESCRIPTION := gst_webrtc_session_description_get_type;
end;



{$ENDIF read_implementation}
