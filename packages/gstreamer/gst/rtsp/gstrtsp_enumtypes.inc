/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   12:06                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_rtsp_result_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_RESULT: TGType;

function gst_rtsp_event_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_EVENT: TGType;

function gst_rtsp_family_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_FAMILY: TGType;

function gst_rtsp_state_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_STATE: TGType;

function gst_rtsp_version_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_VERSION: TGType;

function gst_rtsp_method_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_METHOD: TGType;

function gst_rtsp_auth_method_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_AUTH_METHOD: TGType;

function gst_rtsp_header_field_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_HEADER_FIELD: TGType;

function gst_rtsp_status_code_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_STATUS_CODE: TGType;

function gst_rtsp_msg_type_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_MSG_TYPE: TGType;

function gst_rtsp_range_unit_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_RANGE_UNIT: TGType;

function gst_rtsp_time_type_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_TIME_TYPE: TGType;

function gst_rtsp_trans_mode_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_TRANS_MODE: TGType;

function gst_rtsp_profile_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_PROFILE: TGType;

function gst_rtsp_lower_trans_get_type: TGType; cdecl; external libgstrtsp;
function GST_TYPE_RTSP_LOWER_TRANS: TGType;

// === Konventiert am: 8-10-24 11:21:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_RTSP_RESULT: TGType;
begin
  GST_TYPE_RTSP_RESULT := gst_rtsp_result_get_type;
end;

function GST_TYPE_RTSP_EVENT: TGType;
begin
  GST_TYPE_RTSP_EVENT := gst_rtsp_event_get_type;
end;

function GST_TYPE_RTSP_FAMILY: TGType;
begin
  GST_TYPE_RTSP_FAMILY := gst_rtsp_family_get_type;
end;

function GST_TYPE_RTSP_STATE: TGType;
begin
  GST_TYPE_RTSP_STATE := gst_rtsp_state_get_type;
end;

function GST_TYPE_RTSP_VERSION: TGType;
begin
  GST_TYPE_RTSP_VERSION := gst_rtsp_version_get_type;
end;

function GST_TYPE_RTSP_METHOD: TGType;
begin
  GST_TYPE_RTSP_METHOD := gst_rtsp_method_get_type;
end;

function GST_TYPE_RTSP_AUTH_METHOD: TGType;
begin
  GST_TYPE_RTSP_AUTH_METHOD := gst_rtsp_auth_method_get_type;
end;

function GST_TYPE_RTSP_HEADER_FIELD: TGType;
begin
  GST_TYPE_RTSP_HEADER_FIELD := gst_rtsp_header_field_get_type;
end;

function GST_TYPE_RTSP_STATUS_CODE: TGType;
begin
  GST_TYPE_RTSP_STATUS_CODE := gst_rtsp_status_code_get_type;
end;

function GST_TYPE_RTSP_MSG_TYPE: TGType;
begin
  GST_TYPE_RTSP_MSG_TYPE := gst_rtsp_msg_type_get_type;
end;

function GST_TYPE_RTSP_RANGE_UNIT: TGType;
begin
  GST_TYPE_RTSP_RANGE_UNIT := gst_rtsp_range_unit_get_type;
end;

function GST_TYPE_RTSP_TIME_TYPE: TGType;
begin
  GST_TYPE_RTSP_TIME_TYPE := gst_rtsp_time_type_get_type;
end;

function GST_TYPE_RTSP_TRANS_MODE: TGType;
begin
  GST_TYPE_RTSP_TRANS_MODE := gst_rtsp_trans_mode_get_type;
end;

function GST_TYPE_RTSP_PROFILE: TGType;
begin
  GST_TYPE_RTSP_PROFILE := gst_rtsp_profile_get_type;
end;

function GST_TYPE_RTSP_LOWER_TRANS: TGType;
begin
  GST_TYPE_RTSP_LOWER_TRANS := gst_rtsp_lower_trans_get_type;
end;


{$ENDIF read_implementation}
