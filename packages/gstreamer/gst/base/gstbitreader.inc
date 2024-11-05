/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   15:21                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstBitReader = record
    Data: Pguint8;
    size: Tguint;
    byte: Tguint;
    bit: Tguint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstBitReader = ^TGstBitReader;

function gst_bit_reader_new(Data: Pguint8; size: Tguint): PGstBitReader; cdecl; external libgstbase;
procedure gst_bit_reader_free(reader: PGstBitReader); cdecl; external libgstbase;
procedure gst_bit_reader_init(reader: PGstBitReader; Data: Pguint8; size: Tguint); cdecl; external libgstbase;
function gst_bit_reader_set_pos(reader: PGstBitReader; pos: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_get_pos(reader: PGstBitReader): Tguint; cdecl; external libgstbase;
function gst_bit_reader_get_remaining(reader: PGstBitReader): Tguint; cdecl; external libgstbase;
function gst_bit_reader_get_size(reader: PGstBitReader): Tguint; cdecl; external libgstbase;
function gst_bit_reader_skip(reader: PGstBitReader; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_skip_to_byte(reader: PGstBitReader): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_get_bits_uint8(reader: PGstBitReader; val: Pguint8; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_get_bits_uint16(reader: PGstBitReader; val: Pguint16; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_get_bits_uint32(reader: PGstBitReader; val: Pguint32; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_get_bits_uint64(reader: PGstBitReader; val: Pguint64; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_peek_bits_uint8(reader: PGstBitReader; val: Pguint8; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_peek_bits_uint16(reader: PGstBitReader; val: Pguint16; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_peek_bits_uint32(reader: PGstBitReader; val: Pguint32; nbits: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_bit_reader_peek_bits_uint64(reader: PGstBitReader; val: Pguint64; nbits: Tguint): Tgboolean; cdecl; external libgstbase;

function GST_BIT_READER(reader: Pointer): PGstBitReader;


// === Konventiert am: 28-9-24 14:31:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_BIT_READER(reader: Pointer): PGstBitReader;
begin
  GST_BIT_READER := PGstBitReader(reader);
end;


{$ENDIF read_implementation}
