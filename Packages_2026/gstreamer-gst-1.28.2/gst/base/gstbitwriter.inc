{$IFDEF read_interface}


type
  PGstBitWriter = ^TGstBitWriter;
  TGstBitWriter = record
    data: Pguint8;
    bit_size: Tguint;
    bit_capacity: Tguint;
    auto_grow: Tgboolean;
    owned: Tgboolean;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_bit_writer_new: PGstBitWriter; cdecl; external libgstbase;
function gst_bit_writer_new_with_size(size: Tguint32; fixed: Tgboolean): PGstBitWriter; cdecl; external libgstbase;
function gst_bit_writer_new_with_data(data: Pguint8; size: Tguint; initialized: Tgboolean): PGstBitWriter; cdecl; external libgstbase;
procedure gst_bit_writer_free(bitwriter: PGstBitWriter); cdecl; external libgstbase;
function gst_bit_writer_free_and_get_data(bitwriter: PGstBitWriter): Pguint8; cdecl; external libgstbase;
function gst_bit_writer_free_and_get_buffer(bitwriter: PGstBitWriter): PGstBuffer; cdecl; external libgstbase;
procedure gst_bit_writer_init(bitwriter: PGstBitWriter); cdecl; external libgstbase;
procedure gst_bit_writer_init_with_size(bitwriter: PGstBitWriter; size: Tguint32; fixed: Tgboolean); cdecl; external libgstbase;
procedure gst_bit_writer_init_with_data(bitwriter: PGstBitWriter; data: Pguint8; size: Tguint; initialized: Tgboolean); cdecl; external libgstbase;
procedure gst_bit_writer_reset(bitwriter: PGstBitWriter); cdecl; external libgstbase;
function gst_bit_writer_reset_and_get_data(bitwriter: PGstBitWriter): Pguint8; cdecl; external libgstbase;
function gst_bit_writer_reset_and_get_buffer(bitwriter: PGstBitWriter): PGstBuffer; cdecl; external libgstbase;
function gst_bit_writer_get_size(bitwriter: PGstBitWriter): Tguint; cdecl; external libgstbase;
function gst_bit_writer_get_data(bitwriter: PGstBitWriter): Pguint8; cdecl; external libgstbase;
function gst_bit_writer_set_pos(bitwriter: PGstBitWriter; pos: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_writer_get_remaining(bitwriter: PGstBitWriter): Tguint; cdecl; external libgstbase;
function gst_bit_writer_put_bits_uint8(bitwriter: PGstBitWriter; value: Tguint8; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_writer_put_bits_uint16(bitwriter: PGstBitWriter; value: Tguint16; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_writer_put_bits_uint32(bitwriter: PGstBitWriter; value: Tguint32; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_writer_put_bits_uint64(bitwriter: PGstBitWriter; value: Tguint64; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_writer_put_bytes(bitwriter: PGstBitWriter; data: Pguint8; nbytes: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_writer_align_bytes(bitwriter: PGstBitWriter; trailing_bit: Tguint8): Tgboolean; cdecl; external libgstbase;

// === Konventiert am: 13-7-26 19:24:46 ===

function GST_BIT_WRITER_DATA(writer: PGstBitWriter): Pguint8;
function GST_BIT_WRITER_BIT_SIZE(writer: PGstBitWriter): Tguint;
function GST_BIT_WRITER(writer: Pointer): PGstBitWriter;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_BIT_WRITER_DATA(writer: PGstBitWriter): Pguint8;
begin
  GST_BIT_WRITER_DATA := writer^.Data;
end;

function GST_BIT_WRITER_BIT_SIZE(writer: PGstBitWriter): Tguint;
begin
  GST_BIT_WRITER_BIT_SIZE := writer^.bit_size;
end;

function GST_BIT_WRITER(writer: Pointer): PGstBitWriter;
begin
  GST_BIT_WRITER := PGstBitWriter(writer);
end;

{$ENDIF read_implementation}
