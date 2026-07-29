unit ges_multi_file_source;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_video_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESMultiFileSourceClass = ^TGESMultiFileSourceClass;
  TGESMultiFileSourceClass = record
    parent_class: TGESVideoSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_multi_file_source_get_type: TGType; cdecl; external libges;
function ges_multi_file_source_new(uri: Pgchar): PGESMultiFileSource; cdecl; external libges;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  GES_MULTI_FILE_URI_PREFIX = 'multifile://';
  {$ENDIF read_enum}

  // === Konventiert am: 27-7-26 20:00:41 ===

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
