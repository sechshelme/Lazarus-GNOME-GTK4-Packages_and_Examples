{$IFDEF read_interface}



type
  TCdInterpLinearClass = record
    parent_class: TCdInterpClass;
  end;
  PCdInterpLinearClass = ^TCdInterpLinearClass;

  TCdInterpLinear = record
    parent_instance: TCdInterp;
  end;
  PCdInterpLinear = ^TCdInterpLinear;

function cd_interp_linear_get_type: TGType; cdecl; external libcolord;
function cd_interp_linear_new: PCdInterp; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:32 ===

function CD_TYPE_INTERP_LINEAR: TGType;
function CD_INTERP_LINEAR(obj: Pointer): PCdInterpLinear;
function CD_IS_INTERP_LINEAR(obj: Pointer): Tgboolean;
function CD_INTERP_LINEAR_CLASS(klass: Pointer): PCdInterpLinearClass;
function CD_IS_INTERP_LINEAR_CLASS(klass: Pointer): Tgboolean;
function CD_INTERP_LINEAR_GET_CLASS(obj: Pointer): PCdInterpLinearClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function CD_TYPE_INTERP_LINEAR: TGType;
begin
  Result := cd_interp_linear_get_type;
end;

function CD_INTERP_LINEAR(obj: Pointer): PCdInterpLinear;
begin
  Result := PCdInterpLinear(g_type_check_instance_cast(obj, CD_TYPE_INTERP_LINEAR));
end;

function CD_IS_INTERP_LINEAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_INTERP_LINEAR);
end;

function CD_INTERP_LINEAR_CLASS(klass: Pointer): PCdInterpLinearClass;
begin
  Result := PCdInterpLinearClass(g_type_check_class_cast(klass, CD_TYPE_INTERP_LINEAR));
end;

function CD_IS_INTERP_LINEAR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_INTERP_LINEAR);
end;

function CD_INTERP_LINEAR_GET_CLASS(obj: Pointer): PCdInterpLinearClass;
begin
  Result := PCdInterpLinearClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
