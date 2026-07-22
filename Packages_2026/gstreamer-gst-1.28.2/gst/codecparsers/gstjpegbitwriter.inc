{$IFDEF read_interface}


type
  PGstJpegBitWriterResult = ^TGstJpegBitWriterResult;
  TGstJpegBitWriterResult = longint;
const
  GST_JPEG_BIT_WRITER_OK = 0;
  GST_JPEG_BIT_WRITER_INVALID_DATA = 1;
  GST_JPEG_BIT_WRITER_NO_MORE_SPACE = 2;
  GST_JPEG_BIT_WRITER_ERROR = 3;

function gst_jpeg_bit_writer_frame_header(frame_hdr: PGstJpegFrameHdr; marker: TGstJpegMarker; data: Pguint8; size: Pguint): TGstJpegBitWriterResult; cdecl; external libgstcodecparsers;
function gst_jpeg_bit_writer_scan_header(scan_hdr: PGstJpegScanHdr; data: Pguint8; size: Pguint): TGstJpegBitWriterResult; cdecl; external libgstcodecparsers;
function gst_jpeg_bit_writer_huffman_table(huff_tables: PGstJpegHuffmanTables; data: Pguint8; size: Pguint): TGstJpegBitWriterResult; cdecl; external libgstcodecparsers;
function gst_jpeg_bit_writer_quantization_table(quant_tables: PGstJpegQuantTables; data: Pguint8; size: Pguint): TGstJpegBitWriterResult; cdecl; external libgstcodecparsers;
function gst_jpeg_bit_writer_restart_interval(interval: Tguint16; data: Pguint8; size: Pguint): TGstJpegBitWriterResult; cdecl; external libgstcodecparsers;
function gst_jpeg_bit_writer_segment_with_data(marker: TGstJpegMarker; seg_data: Pguint8; seg_size: Tguint; data: Pguint8; size: Pguint): TGstJpegBitWriterResult; cdecl; external libgstcodecparsers;

// === Konventiert am: 21-7-26 17:01:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
