unit ges_video_uri_source;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_video_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESVideoUriSourceClass = ^TGESVideoUriSourceClass;
  TGESVideoUriSourceClass = record
    parent_class: TGESVideoSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_video_uri_source_get_type: TGType; cdecl; external libges;

// === Konventiert am: 28-7-26 13:21:48 ===

function GES_TYPE_VIDEO_URI_SOURCE: TGType;
function GES_VIDEO_URI_SOURCE(obj: Pointer): PGESVideoUriSource;
function GES_IS_VIDEO_URI_SOURCE(obj: Pointer): Tgboolean;
function GES_VIDEO_URI_SOURCE_CLASS(klass: Pointer): PGESVideoUriSourceClass;
function GES_IS_VIDEO_URI_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_URI_SOURCE_GET_CLASS(obj: Pointer): PGESVideoUriSourceClass;
{$ENDIF read_function}

implementation

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

end.
