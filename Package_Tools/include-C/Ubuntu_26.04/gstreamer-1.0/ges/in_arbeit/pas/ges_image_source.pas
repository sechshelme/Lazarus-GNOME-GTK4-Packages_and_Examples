unit ges_image_source;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_types, ges_enums,ges_video_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESImageSourceClass = ^TGESImageSourceClass;
  TGESImageSourceClass = record
    parent_class: TGESVideoSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_image_source_get_type: TGType; cdecl; external libges;

// === Konventiert am: 27-7-26 20:01:14 ===

function GES_TYPE_IMAGE_SOURCE: TGType;
function GES_IMAGE_SOURCE(obj: Pointer): PGESImageSource;
function GES_IS_IMAGE_SOURCE(obj: Pointer): Tgboolean;
function GES_IMAGE_SOURCE_CLASS(klass: Pointer): PGESImageSourceClass;
function GES_IS_IMAGE_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_IMAGE_SOURCE_GET_CLASS(obj: Pointer): PGESImageSourceClass;
{$ENDIF read_function}

implementation

function GES_TYPE_IMAGE_SOURCE: TGType;
begin
  Result := ges_image_source_get_type;
end;

function GES_IMAGE_SOURCE(obj: Pointer): PGESImageSource;
begin
  Result := PGESImageSource(g_type_check_instance_cast(obj, GES_TYPE_IMAGE_SOURCE));
end;

function GES_IS_IMAGE_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_IMAGE_SOURCE);
end;

function GES_IMAGE_SOURCE_CLASS(klass: Pointer): PGESImageSourceClass;
begin
  Result := PGESImageSourceClass(g_type_check_class_cast(klass, GES_TYPE_IMAGE_SOURCE));
end;

function GES_IS_IMAGE_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_IMAGE_SOURCE);
end;

function GES_IMAGE_SOURCE_GET_CLASS(obj: Pointer): PGESImageSourceClass;
begin
  Result := PGESImageSourceClass(PGTypeInstance(obj)^.g_class);
end;

end.
