{$IFDEF read_interface}


type
  TGMimeStreamPipe = record
    parent_object: TGMimeStream;
    owner: Tgboolean;
    eos: Tgboolean;
    fd: longint;
  end;
  PGMimeStreamPipe = ^TGMimeStreamPipe;

  TGMimeStreamPipeClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamPipeClass = ^TGMimeStreamPipeClass;

function g_mime_stream_pipe_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_pipe_new(fd: longint): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_pipe_get_owner(stream: PGMimeStreamPipe): Tgboolean; cdecl; external libgmime3;
procedure g_mime_stream_pipe_set_owner(stream: PGMimeStreamPipe; owner: Tgboolean); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:34:22 ===

function GMIME_TYPE_STREAM_PIPE: TGType;
function GMIME_STREAM_PIPE(obj: Pointer): PGMimeStreamPipe;
function GMIME_STREAM_PIPE_CLASS(klass: Pointer): PGMimeStreamPipeClass;
function GMIME_IS_STREAM_PIPE(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_PIPE_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_PIPE_GET_CLASS(obj: Pointer): PGMimeStreamPipeClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_STREAM_PIPE: TGType;
begin
  GMIME_TYPE_STREAM_PIPE := g_mime_stream_pipe_get_type;
end;

function GMIME_STREAM_PIPE(obj: Pointer): PGMimeStreamPipe;
begin
  Result := PGMimeStreamPipe(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_PIPE));
end;

function GMIME_STREAM_PIPE_CLASS(klass: Pointer): PGMimeStreamPipeClass;
begin
  Result := PGMimeStreamPipeClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_PIPE));
end;

function GMIME_IS_STREAM_PIPE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_PIPE);
end;

function GMIME_IS_STREAM_PIPE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_PIPE);
end;

function GMIME_STREAM_PIPE_GET_CLASS(obj: Pointer): PGMimeStreamPipeClass;
begin
  Result := PGMimeStreamPipeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
