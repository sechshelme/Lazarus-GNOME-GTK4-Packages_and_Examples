{$IFDEF read_interface}


type
  TGMimeStreamFile = record
    parent_object: TGMimeStream;
    owner: Tgboolean;
    fp: PFILE;
  end;
  PGMimeStreamFile = ^TGMimeStreamFile;

  TGMimeStreamFileClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamFileClass = ^TGMimeStreamFileClass;

function g_mime_stream_file_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_file_new(fp: PFILE): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_file_new_with_bounds(fp: PFILE; start: Tgint64; end_: Tgint64): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_file_open(path: pchar; mode: pchar; err: PPGError): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_file_get_owner(stream: PGMimeStreamFile): Tgboolean; cdecl; external libgmime3;
procedure g_mime_stream_file_set_owner(stream: PGMimeStreamFile; owner: Tgboolean); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:52 ===

function GMIME_TYPE_STREAM_FILE: TGType;
function GMIME_STREAM_FILE(obj: Pointer): PGMimeStreamFile;
function GMIME_STREAM_FILE_CLASS(klass: Pointer): PGMimeStreamFileClass;
function GMIME_IS_STREAM_FILE(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_FILE_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_FILE_GET_CLASS(obj: Pointer): PGMimeStreamFileClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_STREAM_FILE: TGType;
begin
  GMIME_TYPE_STREAM_FILE := g_mime_stream_file_get_type;
end;

function GMIME_STREAM_FILE(obj: Pointer): PGMimeStreamFile;
begin
  Result := PGMimeStreamFile(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_FILE));
end;

function GMIME_STREAM_FILE_CLASS(klass: Pointer): PGMimeStreamFileClass;
begin
  Result := PGMimeStreamFileClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_FILE));
end;

function GMIME_IS_STREAM_FILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_FILE);
end;

function GMIME_IS_STREAM_FILE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_FILE);
end;

function GMIME_STREAM_FILE_GET_CLASS(obj: Pointer): PGMimeStreamFileClass;
begin
  Result := PGMimeStreamFileClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
