{$IFDEF read_interface}


type
  PGstAV1BitWriterResult = ^TGstAV1BitWriterResult;
  TGstAV1BitWriterResult = longint;
const
  GST_AV1_BIT_WRITER_OK = 0;
  GST_AV1_BIT_WRITER_INVALID_DATA = 1;
  GST_AV1_BIT_WRITER_NO_MORE_SPACE = 2;
  GST_AV1_BIT_WRITER_ERROR = 3;

function gst_av1_bit_writer_sequence_header_obu(seq_hdr: PGstAV1SequenceHeaderOBU; size_field: Tgboolean; data: Pguint8; size: Pguint): TGstAV1BitWriterResult; cdecl; external libgstcodecparsers;
function gst_av1_bit_writer_frame_header_obu(frame_hdr: PGstAV1FrameHeaderOBU; seq_hdr: PGstAV1SequenceHeaderOBU; temporal_id: Tguint8; spatial_id: Tguint8; size_field: Tgboolean;
  data: Pguint8; size: Pguint): TGstAV1BitWriterResult; cdecl; external libgstcodecparsers;
function gst_av1_bit_writer_frame_header_obu_with_offsets(frame_hdr: PGstAV1FrameHeaderOBU; seq_hdr: PGstAV1SequenceHeaderOBU; temporal_id: Tguint8; spatial_id: Tguint8; size_field: Tgboolean;
  size_field_size: Tguint; qindex_offset: Pguint; segmentation_offset: Pguint; lf_offset: Pguint; cdef_offset: Pguint;
  cdef_size: Pguint; data: Pguint8; size: Pguint): TGstAV1BitWriterResult; cdecl; external libgstcodecparsers;
function gst_av1_bit_writer_temporal_delimiter_obu(size_field: Tgboolean; data: Pguint8; size: Pguint): TGstAV1BitWriterResult; cdecl; external libgstcodecparsers;
function gst_av1_bit_writer_metadata_obu(metadata: PGstAV1MetadataOBU; temporal_id: Tguint8; spatial_id: Tguint8; size_field: Tgboolean; data: Pguint8;
  size: Pguint): TGstAV1BitWriterResult; cdecl; external libgstcodecparsers;

// === Konventiert am: 21-7-26 17:02:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
