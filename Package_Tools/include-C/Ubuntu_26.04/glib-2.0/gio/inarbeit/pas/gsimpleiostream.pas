unit gsimpleiostream;

interface

uses
  fp_glib2, giotypes, ginputstream, goutputstream, giostream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_simple_io_stream_get_type: TGType; cdecl; external libgio2;
function g_simple_io_stream_new(input_stream: PGInputStream; output_stream: PGOutputStream): PGIOStream; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:51:48 ===

function G_TYPE_SIMPLE_IO_STREAM: TGType;
function G_SIMPLE_IO_STREAM(obj: Pointer): PGSimpleIOStream;
function G_IS_SIMPLE_IO_STREAM(obj: Pointer): Tgboolean;

implementation

function G_TYPE_SIMPLE_IO_STREAM: TGType;
begin
  G_TYPE_SIMPLE_IO_STREAM := g_simple_io_stream_get_type;
end;

function G_SIMPLE_IO_STREAM(obj: Pointer): PGSimpleIOStream;
begin
  Result := PGSimpleIOStream(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_IO_STREAM));
end;

function G_IS_SIMPLE_IO_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_IO_STREAM);
end;



end.
