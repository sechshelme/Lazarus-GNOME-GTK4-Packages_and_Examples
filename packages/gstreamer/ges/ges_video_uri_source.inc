{$IFDEF read_interface}

  {GES_DECLARE_TYPE (VideoUriSource, video_uri_source, VIDEO_URI_SOURCE); }
type
  TGESVideoUriSourcePrivate = record
  end;
  PGESVideoUriSourcePrivate = ^TGESVideoUriSourcePrivate;

  TGESVideoUriSource = record
    parent: TGESVideoSource;
    uri: Pgchar;
    priv: PGESUriSource;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESVideoUriSource = ^TGESVideoUriSource;

  TGESVideoUriSourceClass = record
    parent_class: TGESVideoSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESVideoUriSourceClass = ^TGESVideoUriSourceClass;

function ges_video_uri_source_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 15:43:21 ===

function GES_TYPE_VIDEO_URI_SOURCE: TGType;
function GES_VIDEO_URI_SOURCE(obj: Pointer): PGESVideoUriSource;
function GES_IS_VIDEO_URI_SOURCE(obj: Pointer): Tgboolean;
function GES_VIDEO_URI_SOURCE_CLASS(klass: Pointer): PGESVideoUriSourceClass;
function GES_IS_VIDEO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESVideoUriSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_VIDEO_URI_SOURCE: TGType;
begin
  Result := ges_video_uri_source_get_type;
end;

function GES_VIDEO_URI_SOURCE(obj: Pointer): PGESVideoUriSource;
begin
  Result := PGESVideoUriSource(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_URI_SOURCE));
end;

function GES_IS_VIDEO_URI_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_URI_SOURCE);
end;

function GES_VIDEO_URI_SOURCE_CLASS(klass: Pointer): PGESVideoUriSourceClass;
begin
  Result := PGESVideoUriSourceClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_URI_SOURCE));
end;

function GES_IS_VIDEO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_URI_SOURCE);
end;

function GES_VIDEO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESVideoUriSourceClass;
begin
  Result := PGESVideoUriSourceClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
