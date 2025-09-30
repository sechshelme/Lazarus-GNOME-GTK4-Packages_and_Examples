unit soup_multipart_input_stream;

interface

uses
  fp_glib2, fp_soup, soup_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TSoupMultipartInputStream = record
  end;
  PSoupMultipartInputStream = ^TSoupMultipartInputStream;

  TSoupMultipartInputStreamClass = record
    parent_class: TGFilterInputStreamClass;
  end;
  PSoupMultipartInputStreamClass = ^TSoupMultipartInputStreamClass;

function soup_multipart_input_stream_get_type: TGType; cdecl; external libsoup;
function soup_multipart_input_stream_new(msg: PSoupMessage; base_stream: PGInputStream): PSoupMultipartInputStream; cdecl; external libsoup;
function soup_multipart_input_stream_next_part(multipart: PSoupMultipartInputStream; cancellable: PGCancellable; error: PPGError): PGInputStream; cdecl; external libsoup;
procedure soup_multipart_input_stream_next_part_async(multipart: PSoupMultipartInputStream; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libsoup;
function soup_multipart_input_stream_next_part_finish(multipart: PSoupMultipartInputStream; result: PGAsyncResult; error: PPGError): PGInputStream; cdecl; external libsoup;
function soup_multipart_input_stream_get_headers(multipart: PSoupMultipartInputStream): PSoupMessageHeaders; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:15 ===

function SOUP_TYPE_MULTIPART_INPUT_STREAM: TGType;
function SOUP_MULTIPART_INPUT_STREAM(obj: Pointer): PSoupMultipartInputStream;
function SOUP_IS_MULTIPART_INPUT_STREAM(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_MULTIPART_INPUT_STREAM: TGType;
begin
  Result := soup_multipart_input_stream_get_type;
end;

function SOUP_MULTIPART_INPUT_STREAM(obj: Pointer): PSoupMultipartInputStream;
begin
  Result := PSoupMultipartInputStream(g_type_check_instance_cast(obj, SOUP_TYPE_MULTIPART_INPUT_STREAM));
end;

function SOUP_IS_MULTIPART_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_MULTIPART_INPUT_STREAM);
end;



end.
