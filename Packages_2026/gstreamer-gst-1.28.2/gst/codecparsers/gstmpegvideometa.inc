{$IFDEF read_interface}


type
  PGstMpegVideoMeta = ^TGstMpegVideoMeta;
  TGstMpegVideoMeta = record
    meta: TGstMeta;
    sequencehdr: PGstMpegVideoSequenceHdr;
    sequenceext: PGstMpegVideoSequenceExt;
    sequencedispext: PGstMpegVideoSequenceDisplayExt;
    pichdr: PGstMpegVideoPictureHdr;
    picext: PGstMpegVideoPictureExt;
    quantext: PGstMpegVideoQuantMatrixExt;
    num_slices: Tguint;
    slice_offset: Tgsize;
  end;

function gst_mpeg_video_meta_api_get_type: TGType; cdecl; external libgstcodecparsers;
function gst_mpeg_video_meta_get_info: PGstMetaInfo; cdecl; external libgstcodecparsers;
function gst_buffer_add_mpeg_video_meta(buffer: PGstBuffer; seq_hdr: PGstMpegVideoSequenceHdr; seq_ext: PGstMpegVideoSequenceExt; disp_ext: PGstMpegVideoSequenceDisplayExt; pic_hdr: PGstMpegVideoPictureHdr;
  pic_ext: PGstMpegVideoPictureExt; quant_ext: PGstMpegVideoQuantMatrixExt): PGstMpegVideoMeta; cdecl; external libgstcodecparsers;

// === Konventiert am: 21-7-26 17:01:15 ===

function gst_buffer_get_mpeg_video_meta(b: PGstBuffer): PGstMpegVideoMeta;
function GST_MPEG_VIDEO_META_API_TYPE: TGType;
function GST_MPEG_VIDEO_META_INFO: PGstMetaInfo;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_MPEG_VIDEO_META_API_TYPE: TGType;
begin
  GST_MPEG_VIDEO_META_API_TYPE := gst_mpeg_video_meta_api_get_type;
end;

function GST_MPEG_VIDEO_META_INFO: PGstMetaInfo;
begin
  GST_MPEG_VIDEO_META_INFO := gst_mpeg_video_meta_get_info;
end;

function gst_buffer_get_mpeg_video_meta(b: PGstBuffer): PGstMpegVideoMeta;
begin
  gst_buffer_get_mpeg_video_meta := PGstMpegVideoMeta(gst_buffer_get_meta(b, GST_MPEG_VIDEO_META_API_TYPE));
end;


{$ENDIF read_implementation}
