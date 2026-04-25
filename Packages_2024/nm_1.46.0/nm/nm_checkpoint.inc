
  {$IFDEF read_enum}
const
  NM_CHECKPOINT_DEVICES = 'devices';
  NM_CHECKPOINT_CREATED = 'created';
  NM_CHECKPOINT_ROLLBACK_TIMEOUT = 'rollback-timeout';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMCheckpoint = type Pointer;
  PNMCheckpointClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_checkpoint_get_type: TGType; cdecl; external libnm;
function nm_checkpoint_get_devices(checkpoint: PNMCheckpoint): PGPtrArray; cdecl; external libnm;
function nm_checkpoint_get_created(checkpoint: PNMCheckpoint): Tgint64; cdecl; external libnm;
function nm_checkpoint_get_rollback_timeout(checkpoint: PNMCheckpoint): Tguint32; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:34:32 ===

function NM_TYPE_CHECKPOINT: TGType;
function NM_CHECKPOINT(obj: Pointer): PNMCheckpoint;
function NM_CHECKPOINT_CLASS(klass: Pointer): PNMCheckpointClass;
function NM_IS_CHECKPOINT(obj: Pointer): Tgboolean;
function NM_IS_CHECKPOINT_CLASS(klass: Pointer): Tgboolean;
function NM_CHECKPOINT_GET_CLASS(obj: Pointer): PNMCheckpointClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_CHECKPOINT: TGType;
begin
  NM_TYPE_CHECKPOINT := nm_checkpoint_get_type;
end;

function NM_CHECKPOINT(obj: Pointer): PNMCheckpoint;
begin
  Result := PNMCheckpoint(g_type_check_instance_cast(obj, NM_TYPE_CHECKPOINT));
end;

function NM_CHECKPOINT_CLASS(klass: Pointer): PNMCheckpointClass;
begin
  Result := PNMCheckpointClass(g_type_check_class_cast(klass, NM_TYPE_CHECKPOINT));
end;

function NM_IS_CHECKPOINT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_CHECKPOINT);
end;

function NM_IS_CHECKPOINT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_CHECKPOINT);
end;

function NM_CHECKPOINT_GET_CLASS(obj: Pointer): PNMCheckpointClass;
begin
  Result := PNMCheckpointClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
