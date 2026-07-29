

{$IFDEF read_struct}
type
  PGESOperationClipClass = ^TGESOperationClipClass;
  TGESOperationClipClass = record
      parent_class : TGESClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;
  {$ENDIF read_struct}

  {$IFDEF read_function}
  function ges_operation_clip_get_type: TGType; cdecl; external libges;

// === Konventiert am: 28-7-26 13:06:08 ===

function GES_TYPE_OPERATION_CLIP: TGType;
function GES_OPERATION_CLIP(obj: Pointer): PGESOperationClip;
function GES_IS_OPERATION_CLIP(obj: Pointer): Tgboolean;
function GES_OPERATION_CLIP_CLASS(klass: Pointer): PGESOperationClipClass;
function GES_IS_OPERATION_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_OPERATION_CLIP_GET_CLASS(obj: Pointer): PGESOperationClipClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GES_TYPE_OPERATION_CLIP: TGType;
begin
  Result := ges_operation_clip_get_type;
end;

function GES_OPERATION_CLIP(obj: Pointer): PGESOperationClip;
begin
  Result := PGESOperationClip(g_type_check_instance_cast(obj, GES_TYPE_OPERATION_CLIP));
end;

function GES_IS_OPERATION_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_OPERATION_CLIP);
end;

function GES_OPERATION_CLIP_CLASS(klass: Pointer): PGESOperationClipClass;
begin
  Result := PGESOperationClipClass(g_type_check_class_cast(klass, GES_TYPE_OPERATION_CLIP));
end;

function GES_IS_OPERATION_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_OPERATION_CLIP);
end;

function GES_OPERATION_CLIP_GET_CLASS(obj: Pointer): PGESOperationClipClass;
begin
  Result := PGESOperationClipClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
