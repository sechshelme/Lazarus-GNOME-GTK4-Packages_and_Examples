/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   15:21                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstByteWriter = record
    parent: TGstByteReader;
    alloc_size: Tguint;
    fixed: Tgboolean;
    owned: Tgboolean;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstByteWriter = ^TGstByteWriter;

function gst_byte_writer_new: PGstByteWriter; cdecl; external libgstbase;
function gst_byte_writer_new_with_size(size: Tguint; fixed: Tgboolean): PGstByteWriter; cdecl; external libgstbase;
function gst_byte_writer_new_with_data(Data: Pguint8; size: Tguint; initialized: Tgboolean): PGstByteWriter; cdecl; external libgstbase;
procedure gst_byte_writer_init(writer: PGstByteWriter); cdecl; external libgstbase;
procedure gst_byte_writer_init_with_size(writer: PGstByteWriter; size: Tguint; fixed: Tgboolean); cdecl; external libgstbase;
procedure gst_byte_writer_init_with_data(writer: PGstByteWriter; Data: Pguint8; size: Tguint; initialized: Tgboolean); cdecl; external libgstbase;
procedure gst_byte_writer_free(writer: PGstByteWriter); cdecl; external libgstbase;
function gst_byte_writer_free_and_get_data(writer: PGstByteWriter): Pguint8; cdecl; external libgstbase;
function gst_byte_writer_free_and_get_buffer(writer: PGstByteWriter): PGstBuffer; cdecl; external libgstbase;
procedure gst_byte_writer_reset(writer: PGstByteWriter); cdecl; external libgstbase;
function gst_byte_writer_reset_and_get_data(writer: PGstByteWriter): Pguint8; cdecl; external libgstbase;
function gst_byte_writer_reset_and_get_buffer(writer: PGstByteWriter): PGstBuffer; cdecl; external libgstbase;
function gst_byte_writer_get_remaining(writer: PGstByteWriter): Tguint; cdecl; external libgstbase;
function gst_byte_writer_ensure_free_space(writer: PGstByteWriter; size: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint8(writer: PGstByteWriter; val: Tguint8): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int8(writer: PGstByteWriter; val: Tgint8): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint16_be(writer: PGstByteWriter; val: Tguint16): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint16_le(writer: PGstByteWriter; val: Tguint16): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int16_be(writer: PGstByteWriter; val: Tgint16): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int16_le(writer: PGstByteWriter; val: Tgint16): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint24_be(writer: PGstByteWriter; val: Tguint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint24_le(writer: PGstByteWriter; val: Tguint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int24_be(writer: PGstByteWriter; val: Tgint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int24_le(writer: PGstByteWriter; val: Tgint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint32_be(writer: PGstByteWriter; val: Tguint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint32_le(writer: PGstByteWriter; val: Tguint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int32_be(writer: PGstByteWriter; val: Tgint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int32_le(writer: PGstByteWriter; val: Tgint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint64_be(writer: PGstByteWriter; val: Tguint64): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_uint64_le(writer: PGstByteWriter; val: Tguint64): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int64_be(writer: PGstByteWriter; val: Tgint64): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_int64_le(writer: PGstByteWriter; val: Tgint64): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_float32_be(writer: PGstByteWriter; val: Tgfloat): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_float32_le(writer: PGstByteWriter; val: Tgfloat): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_float64_be(writer: PGstByteWriter; val: Tgdouble): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_float64_le(writer: PGstByteWriter; val: Tgdouble): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_data(writer: PGstByteWriter; Data: Pguint8; size: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_fill(writer: PGstByteWriter; Value: Tguint8; size: Tguint): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_string_utf8(writer: PGstByteWriter; Data: Pgchar): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_string_utf16(writer: PGstByteWriter; Data: Pguint16): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_string_utf32(writer: PGstByteWriter; Data: Pguint32): Tgboolean; cdecl; external libgstbase;
function gst_byte_writer_put_buffer(writer: PGstByteWriter; buffer: PGstBuffer; offset: Tgsize; size: Tgssize): Tgboolean; cdecl; external libgstbase;


function gst_byte_writer_put_string(writer: PGstByteWriter; Data: Pgchar): Tgboolean;
function GST_BYTE_WRITER(writer: Pointer): PGstByteWriter;


// === Konventiert am: 28-9-24 13:18:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_BYTE_WRITER(writer: Pointer): PGstByteWriter;
begin
  GST_BYTE_WRITER := PGstByteWriter(writer);
end;

function gst_byte_writer_put_string(writer: PGstByteWriter; Data: Pgchar): Tgboolean;
begin
  gst_byte_writer_put_string := gst_byte_writer_put_string_utf8(writer, Data);
end;


{$ENDIF read_implementation}
