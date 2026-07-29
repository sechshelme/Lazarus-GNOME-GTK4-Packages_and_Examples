

  {$IFDEF read_struct}
type
  PGESSourceClipClass = ^TGESSourceClipClass;
  TGESSourceClipClass = record
    parent_class: TGESClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_source_clip_get_type: TGType; cdecl; external libges;

// === Konventiert am: 28-7-26 13:05:36 ===

function GES_TYPE_SOURCE_CLIP: TGType;
function GES_SOURCE_CLIP(obj: Pointer): PGESSourceClip;
function GES_IS_SOURCE_CLIP(obj: Pointer): Tgboolean;
function GES_SOURCE_CLIP_CLASS(klass: Pointer): PGESSourceClipClass;
function GES_IS_SOURCE_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_SOURCE_CLIP_GET_CLASS(obj: Pointer): PGESSourceClipClass;
{$ENDIF read_function}


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
