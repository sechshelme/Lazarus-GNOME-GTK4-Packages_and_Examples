unit ges_video_test_source;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_video_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESVideoTestSourceClass = ^TGESVideoTestSourceClass;
  TGESVideoTestSourceClass = record
    parent_class: TGESVideoSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_video_test_source_get_type: TGType; cdecl; external libges;
procedure ges_video_test_source_set_pattern(self: PGESVideoTestSource; pattern: TGESVideoTestPattern); cdecl; external libges;
function ges_video_test_source_get_pattern(source: PGESVideoTestSource): TGESVideoTestPattern; cdecl; external libges;

// === Konventiert am: 28-7-26 13:21:37 ===

function GES_TYPE_VIDEO_TEST_SOURCE: TGType;
function GES_VIDEO_TEST_SOURCE(obj: Pointer): PGESVideoTestSource;
function GES_IS_VIDEO_TEST_SOURCE(obj: Pointer): Tgboolean;
function GES_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): PGESVideoTestSourceClass;
function GES_IS_VIDEO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESVideoTestSourceClass;
{$ENDIF read_function}

implementation

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

end.
