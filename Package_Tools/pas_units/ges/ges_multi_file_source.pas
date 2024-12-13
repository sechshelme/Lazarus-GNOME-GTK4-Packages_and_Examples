unit ges_multi_file_source;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_video_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (MultiFileSource, multi_file_source, MULTI_FILE_SOURCE); }
type
  TGESMultiFileSourcePrivate = record
  end;
  PGESMultiFileSourcePrivate = ^TGESMultiFileSourcePrivate;

  TGESMultiFileSource = record
    parent: TGESVideoSource;
    uri: Pgchar;
    priv: PGESMultiFileSourcePrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESMultiFileSource = ^TGESMultiFileSource;

  TGESMultiFileSourceClass = record
    parent_class: TGESVideoSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESMultiFileSourceClass = ^TGESMultiFileSourceClass;

function ges_multi_file_source_get_type: TGType; cdecl; external libges;

function ges_multi_file_source_new(uri: Pgchar): PGESMultiFileSource; cdecl; external libges;

const
  GES_MULTI_FILE_URI_PREFIX = 'multifile://';

  // === Konventiert am: 13-12-24 16:54:57 ===

function GES_TYPE_MULTI_FILE_SOURCE: TGType;
function GES_MULTI_FILE_SOURCE(obj: Pointer): PGESMultiFileSource;
function GES_IS_MULTI_FILE_SOURCE(obj: Pointer): Tgboolean;
function GES_MULTI_FILE_SOURCE_CLASS(klass: Pointer): PGESMultiFileSourceClass;
function GES_IS_MULTI_FILE_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_MULTI_FILE_SOURCE_GET_CLASS(obj: Pointer): PGESMultiFileSourceClass;

implementation

function GES_TYPE_MULTI_FILE_SOURCE: TGType;
begin
  Result := ges_multi_file_source_get_type;
end;

function GES_MULTI_FILE_SOURCE(obj: Pointer): PGESMultiFileSource;
begin
  Result := PGESMultiFileSource(g_type_check_instance_cast(obj, GES_TYPE_MULTI_FILE_SOURCE));
end;

function GES_IS_MULTI_FILE_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_MULTI_FILE_SOURCE);
end;

function GES_MULTI_FILE_SOURCE_CLASS(klass: Pointer): PGESMultiFileSourceClass;
begin
  Result := PGESMultiFileSourceClass(g_type_check_class_cast(klass, GES_TYPE_MULTI_FILE_SOURCE));
end;

function GES_IS_MULTI_FILE_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_MULTI_FILE_SOURCE);
end;

function GES_MULTI_FILE_SOURCE_GET_CLASS(obj: Pointer): PGESMultiFileSourceClass;
begin
  Result := PGESMultiFileSourceClass(PGTypeInstance(obj)^.g_class);
end;




end.
