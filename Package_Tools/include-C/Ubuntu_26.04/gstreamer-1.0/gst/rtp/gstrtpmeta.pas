unit gstrtpmeta;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GST_RTP_SOURCE_META_MAX_CSRC_COUNT = 15;

type
  PGstRTPSourceMeta = ^TGstRTPSourceMeta;
  TGstRTPSourceMeta = record
    meta: TGstMeta;
    ssrc: Tguint32;
    ssrc_valid: Tgboolean;
    csrc: array[0..(GST_RTP_SOURCE_META_MAX_CSRC_COUNT) - 1] of Tguint32;
    csrc_count: Tguint;
  end;

function gst_rtp_source_meta_api_get_type: TGType; cdecl; external libgstrtp;
function gst_buffer_add_rtp_source_meta(buffer: PGstBuffer; ssrc: Pguint32; csrc: Pguint32; csrc_count: Tguint): PGstRTPSourceMeta; cdecl; external libgstrtp;
function gst_buffer_get_rtp_source_meta(buffer: PGstBuffer): PGstRTPSourceMeta; cdecl; external libgstrtp;
function gst_rtp_source_meta_get_source_count(meta: PGstRTPSourceMeta): Tguint; cdecl; external libgstrtp;
function gst_rtp_source_meta_set_ssrc(meta: PGstRTPSourceMeta; ssrc: Pguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_source_meta_append_csrc(meta: PGstRTPSourceMeta; csrc: Pguint32; csrc_count: Tguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_source_meta_get_info: PGstMetaInfo; cdecl; external libgstrtp;

// === Konventiert am: 21-7-26 12:01:56 ===

function GST_RTP_SOURCE_META_API_TYPE: TGType;
function GST_RTP_SOURCE_META_INFO: PGstMetaInfo;

implementation

function GST_RTP_SOURCE_META_API_TYPE: TGType;
begin
  GST_RTP_SOURCE_META_API_TYPE := gst_rtp_source_meta_api_get_type;
end;

function GST_RTP_SOURCE_META_INFO: PGstMetaInfo;
begin
  GST_RTP_SOURCE_META_INFO := gst_rtp_source_meta_get_info;
end;

end.
