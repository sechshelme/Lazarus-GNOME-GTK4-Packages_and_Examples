
{$IFDEF read_interface}

type
  TGstVp8RangeDecoder = record
    buf: Pguchar;
    buf_size: Tguint;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstVp8RangeDecoder = ^TGstVp8RangeDecoder;

  TGstVp8RangeDecoderState = record
    range: Tguint8;
    Value: Tguint8;
    Count: Tguint8;
  end;
  PGstVp8RangeDecoderState = ^TGstVp8RangeDecoderState;

function gst_vp8_range_decoder_init(rd: PGstVp8RangeDecoder; buf: Pguchar; buf_size: Tguint): Tgboolean; cdecl; external libgstcodecparsers;
function gst_vp8_range_decoder_read(rd: PGstVp8RangeDecoder; prob: Tguint8): Tgint; cdecl; external libgstcodecparsers;
function gst_vp8_range_decoder_read_literal(rd: PGstVp8RangeDecoder; bits: Tgint): Tgint; cdecl; external libgstcodecparsers;
function gst_vp8_range_decoder_get_pos(rd: PGstVp8RangeDecoder): Tguint; cdecl; external libgstcodecparsers;
procedure gst_vp8_range_decoder_get_state(rd: PGstVp8RangeDecoder; state: PGstVp8RangeDecoderState); cdecl; external libgstcodecparsers;

// === Konventiert am: 7-10-24 11:30:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
