unit gdataoutputstream;

interface

uses
  fp_glib2, giotypes, gioenums, gfilteroutputstream, goutputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGDataOutputStreamPrivate = type Pointer;

  PGDataOutputStream = ^TGDataOutputStream;
  TGDataOutputStream = record
    parent_instance: TGFilterOutputStream;
    priv: PGDataOutputStreamPrivate;
  end;

  PGDataOutputStreamClass = ^TGDataOutputStreamClass;
  TGDataOutputStreamClass = record
    parent_class: TGFilterOutputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;

function g_data_output_stream_get_type: TGType; cdecl; external libgio2;
function g_data_output_stream_new(base_stream: PGOutputStream): PGDataOutputStream; cdecl; external libgio2;
procedure g_data_output_stream_set_byte_order(stream: PGDataOutputStream; order: TGDataStreamByteOrder); cdecl; external libgio2;
function g_data_output_stream_get_byte_order(stream: PGDataOutputStream): TGDataStreamByteOrder; cdecl; external libgio2;
function g_data_output_stream_put_byte(stream: PGDataOutputStream; data: Tguchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_int16(stream: PGDataOutputStream; data: Tgint16; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_uint16(stream: PGDataOutputStream; data: Tguint16; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_int32(stream: PGDataOutputStream; data: Tgint32; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_uint32(stream: PGDataOutputStream; data: Tguint32; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_int64(stream: PGDataOutputStream; data: Tgint64; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_uint64(stream: PGDataOutputStream; data: Tguint64; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_data_output_stream_put_string(stream: PGDataOutputStream; str: pchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 16:43:57 ===

function G_TYPE_DATA_OUTPUT_STREAM: TGType;
function G_DATA_OUTPUT_STREAM(obj: Pointer): PGDataOutputStream;
function G_DATA_OUTPUT_STREAM_CLASS(klass: Pointer): PGDataOutputStreamClass;
function G_IS_DATA_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_DATA_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_DATA_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGDataOutputStreamClass;

implementation

function G_TYPE_DATA_OUTPUT_STREAM: TGType;
begin
  G_TYPE_DATA_OUTPUT_STREAM := g_data_output_stream_get_type;
end;

function G_DATA_OUTPUT_STREAM(obj: Pointer): PGDataOutputStream;
begin
  Result := PGDataOutputStream(g_type_check_instance_cast(obj, G_TYPE_DATA_OUTPUT_STREAM));
end;

function G_DATA_OUTPUT_STREAM_CLASS(klass: Pointer): PGDataOutputStreamClass;
begin
  Result := PGDataOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_DATA_OUTPUT_STREAM));
end;

function G_IS_DATA_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DATA_OUTPUT_STREAM);
end;

function G_IS_DATA_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DATA_OUTPUT_STREAM);
end;

function G_DATA_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGDataOutputStreamClass;
begin
  Result := PGDataOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;

end.
