{$IFDEF read_interface}


type
  TGMimeStreamFs = record
    parent_object: TGMimeStream;
    owner: Tgboolean;
    eos: Tgboolean;
    fd: longint;
  end;
  PGMimeStreamFs = ^TGMimeStreamFs;

  TGMimeStreamFsClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamFsClass = ^TGMimeStreamFsClass;

function g_mime_stream_fs_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_fs_new(fd: longint): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_fs_new_with_bounds(fd: longint; start: Tgint64; end_: Tgint64): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_fs_open(path: pchar; flags: longint; mode: longint; err: PPGError): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_fs_get_owner(stream: PGMimeStreamFs): Tgboolean; cdecl; external libgmime3;
procedure g_mime_stream_fs_set_owner(stream: PGMimeStreamFs; owner: Tgboolean); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:34:01 ===

function GMIME_TYPE_STREAM_FS: TGType;
function GMIME_STREAM_FS(obj: Pointer): PGMimeStreamFs;
function GMIME_STREAM_FS_CLASS(klass: Pointer): PGMimeStreamFsClass;
function GMIME_IS_STREAM_FS(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_FS_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_FS_GET_CLASS(obj: Pointer): PGMimeStreamFsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_STREAM_FS: TGType;
begin
  GMIME_TYPE_STREAM_FS := g_mime_stream_fs_get_type;
end;

function GMIME_STREAM_FS(obj: Pointer): PGMimeStreamFs;
begin
  Result := PGMimeStreamFs(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_FS));
end;

function GMIME_STREAM_FS_CLASS(klass: Pointer): PGMimeStreamFsClass;
begin
  Result := PGMimeStreamFsClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_FS));
end;

function GMIME_IS_STREAM_FS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_FS);
end;

function GMIME_IS_STREAM_FS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_FS);
end;

function GMIME_STREAM_FS_GET_CLASS(obj: Pointer): PGMimeStreamFsClass;
begin
  Result := PGMimeStreamFsClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
