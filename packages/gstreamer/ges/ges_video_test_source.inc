{$IFDEF read_interface}

  {GES_DECLARE_TYPE (VideoTestSource, video_test_source, VIDEO_TEST_SOURCE); }
type
  TGESVideoTestSourcePrivate = record
  end;
  PGESVideoTestSourcePrivate = ^TGESVideoTestSourcePrivate;

  TGESVideoTestSource = record
    parent: TGESVideoSource;
    priv: PGESVideoTestSourcePrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESVideoTestSource = ^TGESVideoTestSource;

  TGESVideoTestSourceClass = record
    parent_class: TGESVideoSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESVideoTestSourceClass = ^TGESVideoTestSourceClass;

function ges_video_test_source_get_type: TGType; cdecl; external libges;
procedure ges_video_test_source_set_pattern(self: PGESVideoTestSource; pattern: TGESVideoTestPattern); cdecl; external libges;
function ges_video_test_source_get_pattern(Source: PGESVideoTestSource): TGESVideoTestPattern; cdecl; external libges;

// === Konventiert am: 13-12-24 15:43:09 ===

function GES_TYPE_VIDEO_TEST_SOURCE: TGType;
function GES_VIDEO_TEST_SOURCE(obj: Pointer): PGESVideoTestSource;
function GES_IS_VIDEO_TEST_SOURCE(obj: Pointer): Tgboolean;
function GES_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): PGESVideoTestSourceClass;
function GES_IS_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESVideoTestSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_VIDEO_TEST_SOURCE: TGType;
begin
  Result := ges_video_test_source_get_type;
end;

function GES_VIDEO_TEST_SOURCE(obj: Pointer): PGESVideoTestSource;
begin
  Result := PGESVideoTestSource(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_TEST_SOURCE));
end;

function GES_IS_VIDEO_TEST_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_TEST_SOURCE);
end;

function GES_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): PGESVideoTestSourceClass;
begin
  Result := PGESVideoTestSourceClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_TEST_SOURCE));
end;

function GES_IS_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_TEST_SOURCE);
end;

function GES_VIDEO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESVideoTestSourceClass;
begin
  Result := PGESVideoTestSourceClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
