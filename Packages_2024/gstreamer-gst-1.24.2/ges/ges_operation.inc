{$IFDEF read_interface}

  {GES_DECLARE_TYPE (Operation, operation, OPERATION); }
type
  TGESOperationPrivate = record
  end;
  PGESOperationPrivate = ^TGESOperationPrivate;

  TGESOperation = record
    parent: TGESTrackElement;
    priv: PGESOperationPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESOperation = ^TGESOperation;

  TGESOperationClass = record
    parent_class: TGESTrackElementClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESOperationClass = ^TGESOperationClass;

function ges_operation_get_type: TGType; cdecl; external libges;

// === Konventiert am: 12-12-24 19:33:31 ===

function GES_TYPE_OPERATION: TGType;
function GES_OPERATION(obj: Pointer): PGESOperation;
function GES_IS_OPERATION(obj: Pointer): Tgboolean;
function GES_OPERATION_CLASS(klass: Pointer): PGESOperationClass;
function GES_IS_OPERATION_CLASS(klass: Pointer): Tgboolean;
function GES_OPERATION_GET_CLASS(obj: Pointer): PGESOperationClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_OPERATION: TGType;
begin
  Result := ges_operation_get_type;
end;

function GES_OPERATION(obj: Pointer): PGESOperation;
begin
  Result := PGESOperation(g_type_check_instance_cast(obj, GES_TYPE_OPERATION));
end;

function GES_IS_OPERATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_OPERATION);
end;

function GES_OPERATION_CLASS(klass: Pointer): PGESOperationClass;
begin
  Result := PGESOperationClass(g_type_check_class_cast(klass, GES_TYPE_OPERATION));
end;

function GES_IS_OPERATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_OPERATION);
end;

function GES_OPERATION_GET_CLASS(obj: Pointer): PGESOperationClass;
begin
  Result := PGESOperationClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
