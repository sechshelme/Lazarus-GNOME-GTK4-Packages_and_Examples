
{$IFDEF read_interface}

const
  GST_RTP_SOURCE_META_MAX_CSRC_COUNT = 15;

type
  TGstRTPSourceMeta = record
    meta: TGstMeta;
    ssrc: Tguint32;
    ssrc_valid: Tgboolean;
    csrc: array[0..(GST_RTP_SOURCE_META_MAX_CSRC_COUNT) - 1] of Tguint32;
    csrc_count: Tguint;
  end;
  PGstRTPSourceMeta = ^TGstRTPSourceMeta;

function gst_rtp_source_meta_api_get_type: TGType; cdecl; external libgstrtp;
function gst_buffer_add_rtp_source_meta(buffer: PGstBuffer; ssrc: Pguint32; csrc: Pguint32; csrc_count: Tguint): PGstRTPSourceMeta; cdecl; external libgstrtp;
function gst_buffer_get_rtp_source_meta(buffer: PGstBuffer): PGstRTPSourceMeta; cdecl; external libgstrtp;
function gst_rtp_source_meta_get_source_count(meta: PGstRTPSourceMeta): Tguint; cdecl; external libgstrtp;
function gst_rtp_source_meta_set_ssrc(meta: PGstRTPSourceMeta; ssrc: Pguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_source_meta_append_csrc(meta: PGstRTPSourceMeta; csrc: Pguint32; csrc_count: Tguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_source_meta_get_info: PGstMetaInfo; cdecl; external libgstrtp;

function GST_RTP_SOURCE_META_INFO: PGstMetaInfo;

// === Konventiert am: 7-10-24 16:10:11 ===

function GST_RTP_SOURCE_META_API_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_RTP_SOURCE_META_API_TYPE: TGType;
begin
  GST_RTP_SOURCE_META_API_TYPE := gst_rtp_source_meta_api_get_type;
end;

function GST_RTP_SOURCE_META_INFO: PGstMetaInfo;
begin
  GST_RTP_SOURCE_META_INFO := gst_rtp_source_meta_get_info;
end;


{$ENDIF read_implementation}
