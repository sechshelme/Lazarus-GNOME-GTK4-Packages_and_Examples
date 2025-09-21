{$IFDEF read_interface}


type
  TGMimeStreamMmap = record
    parent_object: TGMimeStream;
    owner: Tgboolean;
    eos: Tgboolean;
    fd: longint;
    map: pchar;
    maplen: Tsize_t;
  end;
  PGMimeStreamMmap = ^TGMimeStreamMmap;

  TGMimeStreamMmapClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamMmapClass = ^TGMimeStreamMmapClass;

function g_mime_stream_mmap_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_mmap_new(fd: longint; prot: longint; flags: longint): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_mmap_new_with_bounds(fd: longint; prot: longint; flags: longint; start: Tgint64; end_: Tgint64): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_mmap_get_owner(stream: PGMimeStreamMmap): Tgboolean; cdecl; external libgmime3;
procedure g_mime_stream_mmap_set_owner(stream: PGMimeStreamMmap; owner: Tgboolean); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:34:14 ===

function GMIME_TYPE_STREAM_MMAP: TGType;
function GMIME_STREAM_MMAP(obj: Pointer): PGMimeStreamMmap;
function GMIME_STREAM_MMAP_CLASS(klass: Pointer): PGMimeStreamMmapClass;
function GMIME_IS_STREAM_MMAP(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_MMAP_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_MMAP_GET_CLASS(obj: Pointer): PGMimeStreamMmapClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_STREAM_MMAP: TGType;
begin
  GMIME_TYPE_STREAM_MMAP := g_mime_stream_mmap_get_type;
end;

function GMIME_STREAM_MMAP(obj: Pointer): PGMimeStreamMmap;
begin
  Result := PGMimeStreamMmap(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_MMAP));
end;

function GMIME_STREAM_MMAP_CLASS(klass: Pointer): PGMimeStreamMmapClass;
begin
  Result := PGMimeStreamMmapClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_MMAP));
end;

function GMIME_IS_STREAM_MMAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_MMAP);
end;

function GMIME_IS_STREAM_MMAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_MMAP);
end;

function GMIME_STREAM_MMAP_GET_CLASS(obj: Pointer): PGMimeStreamMmapClass;
begin
  Result := PGMimeStreamMmapClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
