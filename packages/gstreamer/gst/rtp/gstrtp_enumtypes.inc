
{$IFDEF read_interface}

function gst_rtcp_type_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTCP_TYPE: TGType;

function gst_rtcpfb_type_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTCPFB_TYPE: TGType;

function gst_rtcpsdes_type_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTCPSDES_TYPE: TGType;

function gst_rtcpxr_type_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTCPXR_TYPE: TGType;

function gst_rtp_buffer_flags_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTP_BUFFER_FLAGS: TGType;

function gst_rtp_buffer_map_flags_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTP_BUFFER_MAP_FLAGS: TGType;

function gst_rtp_profile_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTP_PROFILE: TGType;

function gst_rtp_header_extension_flags_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTP_HEADER_EXTENSION_FLAGS: TGType;

function gst_rtp_header_extension_direction_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTP_HEADER_EXTENSION_DIRECTION: TGType;

function gst_rtp_payload_get_type: TGType; cdecl; external libgstrtp;
function GST_TYPE_RTP_PAYLOAD: TGType;

// === Konventiert am: 7-10-24 16:09:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_RTCP_TYPE: TGType;
begin
  GST_TYPE_RTCP_TYPE := gst_rtcp_type_get_type;
end;

function GST_TYPE_RTCPFB_TYPE: TGType;
begin
  GST_TYPE_RTCPFB_TYPE := gst_rtcpfb_type_get_type;
end;

function GST_TYPE_RTCPSDES_TYPE: TGType;
begin
  GST_TYPE_RTCPSDES_TYPE := gst_rtcpsdes_type_get_type;
end;

function GST_TYPE_RTCPXR_TYPE: TGType;
begin
  GST_TYPE_RTCPXR_TYPE := gst_rtcpxr_type_get_type;
end;

function GST_TYPE_RTP_BUFFER_FLAGS: TGType;
begin
  GST_TYPE_RTP_BUFFER_FLAGS := gst_rtp_buffer_flags_get_type;
end;

function GST_TYPE_RTP_BUFFER_MAP_FLAGS: TGType;
begin
  GST_TYPE_RTP_BUFFER_MAP_FLAGS := gst_rtp_buffer_map_flags_get_type;
end;

function GST_TYPE_RTP_PROFILE: TGType;
begin
  GST_TYPE_RTP_PROFILE := gst_rtp_profile_get_type;
end;

function GST_TYPE_RTP_HEADER_EXTENSION_FLAGS: TGType;
begin
  GST_TYPE_RTP_HEADER_EXTENSION_FLAGS := gst_rtp_header_extension_flags_get_type;
end;

function GST_TYPE_RTP_HEADER_EXTENSION_DIRECTION: TGType;
begin
  GST_TYPE_RTP_HEADER_EXTENSION_DIRECTION := gst_rtp_header_extension_direction_get_type;
end;

function GST_TYPE_RTP_PAYLOAD: TGType;
begin
  GST_TYPE_RTP_PAYLOAD := gst_rtp_payload_get_type;
end;


{$ENDIF read_implementation}
