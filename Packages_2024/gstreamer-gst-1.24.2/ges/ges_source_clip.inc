{$IFDEF read_interface}

  {GES_DECLARE_TYPE (SourceClip, source_clip, SOURCE_CLIP); }
type
  TGESSourceClipPrivate = record
  end;
  PGESSourceClipPrivate = ^TGESSourceClipPrivate;

  TGESSourceClip = record
    parent: TGESClip;
    priv: PGESSourceClipPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESSourceClip = ^TGESSourceClip;

  TGESSourceClipClass = record
    parent_class: TGESClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESSourceClipClass = ^TGESSourceClipClass;

function ges_source_clip_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 15:15:11 ===

function GES_TYPE_SOURCE_CLIP: TGType;
function GES_SOURCE_CLIP(obj: Pointer): PGESSourceClip;
function GES_IS_SOURCE_CLIP(obj: Pointer): Tgboolean;
function GES_SOURCE_CLIP_CLASS(klass: Pointer): PGESSourceClipClass;
function GES_IS_SOURCE_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_SOURCE_CLIP_GET_CLASS(obj: Pointer): PGESSourceClipClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_SOURCE_CLIP: TGType;
begin
  Result := ges_source_clip_get_type;
end;

function GES_SOURCE_CLIP(obj: Pointer): PGESSourceClip;
begin
  Result := PGESSourceClip(g_type_check_instance_cast(obj, GES_TYPE_SOURCE_CLIP));
end;

function GES_IS_SOURCE_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_SOURCE_CLIP);
end;

function GES_SOURCE_CLIP_CLASS(klass: Pointer): PGESSourceClipClass;
begin
  Result := PGESSourceClipClass(g_type_check_class_cast(klass, GES_TYPE_SOURCE_CLIP));
end;

function GES_IS_SOURCE_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_SOURCE_CLIP);
end;

function GES_SOURCE_CLIP_GET_CLASS(obj: Pointer): PGESSourceClipClass;
begin
  Result := PGESSourceClipClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
