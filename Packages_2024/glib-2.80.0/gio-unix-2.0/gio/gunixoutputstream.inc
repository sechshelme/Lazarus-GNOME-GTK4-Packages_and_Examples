
{$IFDEF read_interface}

type
  TGUnixOutputStreamPrivate = record
  end;
  PGUnixOutputStreamPrivate = ^TGUnixOutputStreamPrivate;

  TGUnixOutputStream = record
    parent_instance: TGOutputStream;
    priv: PGUnixOutputStreamPrivate;
  end;
  PGUnixOutputStream = ^TGUnixOutputStream;

  TGUnixOutputStreamClass = record
    parent_class: TGOutputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  PGUnixOutputStreamClass = ^TGUnixOutputStreamClass;


function g_unix_output_stream_get_type: TGType; cdecl; external libgio2;
function g_unix_output_stream_new(fd: Tgint; close_fd: Tgboolean): PGOutputStream; cdecl; external libgio2;
procedure g_unix_output_stream_set_close_fd(stream: PGUnixOutputStream; close_fd: Tgboolean); cdecl; external libgio2;
function g_unix_output_stream_get_close_fd(stream: PGUnixOutputStream): Tgboolean; cdecl; external libgio2;
function g_unix_output_stream_get_fd(stream: PGUnixOutputStream): Tgint; cdecl; external libgio2;

// === Konventiert am: 20-11-24 15:20:14 ===

function G_TYPE_UNIX_OUTPUT_STREAM: TGType;
function G_UNIX_OUTPUT_STREAM(obj: Pointer): PGUnixOutputStream;
function G_UNIX_OUTPUT_STREAM_CLASS(klass: Pointer): PGUnixOutputStreamClass;
function G_IS_UNIX_OUTPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_UNIX_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_UNIX_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGUnixOutputStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_UNIX_OUTPUT_STREAM: TGType;
begin
  G_TYPE_UNIX_OUTPUT_STREAM := g_unix_output_stream_get_type;
end;

function G_UNIX_OUTPUT_STREAM(obj: Pointer): PGUnixOutputStream;
begin
  Result := PGUnixOutputStream(g_type_check_instance_cast(obj, G_TYPE_UNIX_OUTPUT_STREAM));
end;

function G_UNIX_OUTPUT_STREAM_CLASS(klass: Pointer): PGUnixOutputStreamClass;
begin
  Result := PGUnixOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_UNIX_OUTPUT_STREAM));
end;

function G_IS_UNIX_OUTPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_UNIX_OUTPUT_STREAM);
end;

function G_IS_UNIX_OUTPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_UNIX_OUTPUT_STREAM);
end;

function G_UNIX_OUTPUT_STREAM_GET_CLASS(obj: Pointer): PGUnixOutputStreamClass;
begin
  Result := PGUnixOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
