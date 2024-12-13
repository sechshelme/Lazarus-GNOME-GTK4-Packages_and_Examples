{$IFDEF read_interface}

  {GES_DECLARE_TYPE (VideoSource, video_source, VIDEO_SOURCE); }
type
  TGESVideoSourcePrivate = record
  end;
  PGESVideoSourcePrivate = ^TGESVideoSourcePrivate;

  TGESVideoSource = record
    parent: TGESSource;
    priv: PGESVideoSourcePrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESVideoSource = ^TGESVideoSource;

  TGESVideoSourceClass = record
    parent_class: TGESSourceClass;
    create_source: function(obj: PGESTrackElement): PGstElement; cdecl;
    ABI: record
      case longint of
        0: (_ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer);
        1: (abi: record
            disable_scale_in_compositor: Tgboolean;
            needs_converters: function(self: PGESVideoSource): Tgboolean; cdecl;
            get_natural_size: function(self: PGESVideoSource; Width: Pgint; Height: Pgint): Tgboolean; cdecl;
            create_filters: function(self: PGESVideoSource; filters: PGPtrArray; needs_converters: Tgboolean): Tgboolean; cdecl;
            end);
      end;
  end;
  PGESVideoSourceClass = ^TGESVideoSourceClass;

function ges_video_source_get_type: TGType; cdecl; external libges;
function ges_video_source_get_natural_size(self: PGESVideoSource; Width: Pgint; Height: Pgint): Tgboolean; cdecl; external libges;

// === Konventiert am: 13-12-24 15:23:12 ===

function GES_TYPE_VIDEO_SOURCE: TGType;
function GES_VIDEO_SOURCE(obj: Pointer): PGESVideoSource;
function GES_IS_VIDEO_SOURCE(obj: Pointer): Tgboolean;
function GES_VIDEO_SOURCE_CLASS(klass: Pointer): PGESVideoSourceClass;
function GES_IS_VIDEO_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_SOURCE_GET_CLASS(obj: Pointer): PGESVideoSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_VIDEO_SOURCE: TGType;
begin
  Result := ges_video_source_get_type;
end;

function GES_VIDEO_SOURCE(obj: Pointer): PGESVideoSource;
begin
  Result := PGESVideoSource(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_SOURCE));
end;

function GES_IS_VIDEO_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_SOURCE);
end;

function GES_VIDEO_SOURCE_CLASS(klass: Pointer): PGESVideoSourceClass;
begin
  Result := PGESVideoSourceClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_SOURCE));
end;

function GES_IS_VIDEO_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_SOURCE);
end;

function GES_VIDEO_SOURCE_GET_CLASS(obj: Pointer): PGESVideoSourceClass;
begin
  Result := PGESVideoSourceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
