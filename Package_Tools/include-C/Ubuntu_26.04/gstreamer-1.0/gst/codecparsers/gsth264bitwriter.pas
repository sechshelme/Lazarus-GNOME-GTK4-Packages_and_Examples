unit gsth264bitwriter;

interface

uses
  fp_glib2, fp_gst, gsth264parser;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGstH264BitWriterResult = ^TGstH264BitWriterResult;
  TGstH264BitWriterResult = longint;
const
  GST_H264_BIT_WRITER_OK = 0;
  GST_H264_BIT_WRITER_INVALID_DATA = 1;
  GST_H264_BIT_WRITER_NO_MORE_SPACE = 2;
  GST_H264_BIT_WRITER_ERROR = 3;

function gst_h264_bit_writer_sps(sps: PGstH264SPS; start_code: Tgboolean; data: Pguint8; size: Pguint): TGstH264BitWriterResult; cdecl; external libgstcodecparsers;
function gst_h264_bit_writer_pps(pps: PGstH264PPS; start_code: Tgboolean; data: Pguint8; size: Pguint): TGstH264BitWriterResult; cdecl; external libgstcodecparsers;
function gst_h264_bit_writer_slice_hdr(slice: PGstH264SliceHdr; start_code: Tgboolean; nal_type: TGstH264NalUnitType; is_ref: Tgboolean; data: Pguint8;
  size: Pguint; trail_bits_num: Pguint): TGstH264BitWriterResult; cdecl; external libgstcodecparsers;
function gst_h264_bit_writer_sei(sei_messages: PGArray; start_code: Tgboolean; data: Pguint8; size: Pguint): TGstH264BitWriterResult; cdecl; external libgstcodecparsers;
function gst_h264_bit_writer_aud(primary_pic_type: Tguint8; start_code: Tgboolean; data: Pguint8; size: Pguint): TGstH264BitWriterResult; cdecl; external libgstcodecparsers;
function gst_h264_bit_writer_filler(start_code: Tgboolean; num: Tguint; data: Pguint8; size: Pguint): TGstH264BitWriterResult; cdecl; external libgstcodecparsers;
function gst_h264_bit_writer_convert_to_nal(nal_prefix_size: Tguint; packetized: Tgboolean; has_startcode: Tgboolean; add_trailings: Tgboolean; raw_data: Pguint8;
  raw_size: Tgsize; nal_data: Pguint8; nal_size: Pguint): TGstH264BitWriterResult; cdecl; external libgstcodecparsers;

// === Konventiert am: 21-7-26 17:02:22 ===


implementation



end.
