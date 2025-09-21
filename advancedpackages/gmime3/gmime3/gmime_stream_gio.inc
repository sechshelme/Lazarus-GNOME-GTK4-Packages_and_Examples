{$IFDEF read_interface}


type
  TGMimeStreamGIO = record
    parent_object: TGMimeStream;
    ostream: PGOutputStream;
    istream: PGInputStream;
    file_: PGFile;
    owner: Tgboolean;
    eos: Tgboolean;
  end;
  PGMimeStreamGIO = ^TGMimeStreamGIO;

  TGMimeStreamGIOClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamGIOClass = ^TGMimeStreamGIOClass;

function g_mime_stream_gio_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_gio_new(file_: PGFile): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_gio_new_with_bounds(file_: PGFile; start: Tgint64; end_: Tgint64): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_gio_get_owner(stream: PGMimeStreamGIO): Tgboolean; cdecl; external libgmime3;
procedure g_mime_stream_gio_set_owner(stream: PGMimeStreamGIO; owner: Tgboolean); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:34:05 ===

function GMIME_TYPE_STREAM_GIO: TGType;
function GMIME_STREAM_GIO(obj: Pointer): PGMimeStreamGIO;
function GMIME_STREAM_GIO_CLASS(klass: Pointer): PGMimeStreamGIOClass;
function GMIME_IS_STREAM_GIO(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_GIO_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_GIO_GET_CLASS(obj: Pointer): PGMimeStreamGIOClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_STREAM_GIO: TGType;
begin
  GMIME_TYPE_STREAM_GIO := g_mime_stream_gio_get_type;
end;

function GMIME_STREAM_GIO(obj: Pointer): PGMimeStreamGIO;
begin
  Result := PGMimeStreamGIO(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_GIO));
end;

function GMIME_STREAM_GIO_CLASS(klass: Pointer): PGMimeStreamGIOClass;
begin
  Result := PGMimeStreamGIOClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_GIO));
end;

function GMIME_IS_STREAM_GIO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_GIO);
end;

function GMIME_IS_STREAM_GIO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_GIO);
end;

function GMIME_STREAM_GIO_GET_CLASS(obj: Pointer): PGMimeStreamGIOClass;
begin
  Result := PGMimeStreamGIOClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
