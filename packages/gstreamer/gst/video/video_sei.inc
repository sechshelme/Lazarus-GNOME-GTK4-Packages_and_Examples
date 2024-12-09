
{$IFDEF read_interface}

const
  H264_MISP_MICROSECTIME: array[0..15] of Tguint8 = (
    $4D, $49, $53, $50, $6D, $69, $63, $72,
    $6F, $73, $65, $63, $74, $69, $6D, $65);

  H265_MISP_MICROSECONDS: array[0..15] of Tguint8 = (
    $A8, $68, $7D, $D4, $D7, $59, $37, $58,
    $A5, $CE, $F0, $33, $8B, $65, $45, $F1);

  H265_MISP_NANOSECONDS: array[0..15] of Tguint8 = (
    $CF, $84, $82, $78, $EE, $23, $30, $6C,
    $92, $65, $E8, $FE, $F2, $2F, $B8, $B8);

type
  TGstVideoSEIUserDataUnregisteredMeta = record
    meta: TGstMeta;
    uuid: array[0..15] of Tguint8;
    Data: Pguint8;
    size: Tgsize;
  end;
  PGstVideoSEIUserDataUnregisteredMeta = ^TGstVideoSEIUserDataUnregisteredMeta;

function gst_video_sei_user_data_unregistered_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_sei_user_data_unregistered_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;
function gst_buffer_add_video_sei_user_data_unregistered_meta(buffer: PGstBuffer; uuid: Tguintarr16; Data: Pguint8; size: Tgsize): PGstVideoSEIUserDataUnregisteredMeta; cdecl; external libgstvideo;
function gst_video_sei_user_data_unregistered_parse_precision_time_stamp(user_data: PGstVideoSEIUserDataUnregisteredMeta; status: Pguint8; precision_time_stamp: Pguint64): Tgboolean; cdecl; external libgstvideo;

function GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE: TGType;
function GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_INFO: PGstMetaInfo;

function gst_buffer_get_video_sei_user_data_unregistered_meta(b: PGstBuffer): PGstVideoSEIUserDataUnregisteredMeta;


// === Konventiert am: 30-9-24 19:16:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE: TGType;
begin
  GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE := gst_video_sei_user_data_unregistered_meta_api_get_type;
end;

function GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_INFO := gst_video_sei_user_data_unregistered_meta_get_info;
end;

function gst_buffer_get_video_sei_user_data_unregistered_meta(b: PGstBuffer): PGstVideoSEIUserDataUnregisteredMeta;
begin
  gst_buffer_get_video_sei_user_data_unregistered_meta := PGstVideoSEIUserDataUnregisteredMeta(gst_buffer_get_meta(b, GST_VIDEO_SEI_USER_DATA_UNREGISTERED_META_API_TYPE));
end;


{$ENDIF read_implementation}
