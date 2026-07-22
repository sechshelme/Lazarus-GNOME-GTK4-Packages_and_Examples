unit gstvp8rangedecoder;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGstVp8RangeDecoder = ^TGstVp8RangeDecoder;
  TGstVp8RangeDecoder = record
    buf: Pguchar;
    buf_size: Tguint;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  PGstVp8RangeDecoderState = ^TGstVp8RangeDecoderState;
  TGstVp8RangeDecoderState = record
    range: Tguint8;
    value: Tguint8;
    count: Tguint8;
  end;

function gst_vp8_range_decoder_init(rd: PGstVp8RangeDecoder; buf: Pguchar; buf_size: Tguint): Tgboolean; cdecl; external libgstcodecparsers;
function gst_vp8_range_decoder_read(rd: PGstVp8RangeDecoder; prob: Tguint8): Tgint; cdecl; external libgstcodecparsers;
function gst_vp8_range_decoder_read_literal(rd: PGstVp8RangeDecoder; bits: Tgint): Tgint; cdecl; external libgstcodecparsers;
function gst_vp8_range_decoder_get_pos(rd: PGstVp8RangeDecoder): Tguint; cdecl; external libgstcodecparsers;
procedure gst_vp8_range_decoder_get_state(rd: PGstVp8RangeDecoder; state: PGstVp8RangeDecoderState); cdecl; external libgstcodecparsers;

// === Konventiert am: 21-7-26 17:00:51 ===


implementation



end.
