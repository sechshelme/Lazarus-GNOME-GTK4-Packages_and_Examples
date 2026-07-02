{$IFDEF read_interface}


  // === Konventiert am: 21-10-25 13:37:18 ===

function GI_TYPE_UNRESOLVED_INFO: TGType;
function GI_UNRESOLVED_INFO(obj: Pointer): PGIUnresolvedInfo;
function GI_IS_UNRESOLVED_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_UNRESOLVED_INFO: TGType;
begin
  GI_TYPE_UNRESOLVED_INFO := gi_unresolved_info_get_type;
end;

function GI_UNRESOLVED_INFO(obj: Pointer): PGIUnresolvedInfo;
begin
  Result := PGIUnresolvedInfo(g_type_check_instance_cast(obj, GI_TYPE_UNRESOLVED_INFO));
end;

function GI_IS_UNRESOLVED_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_UNRESOLVED_INFO);
end;



{$ENDIF read_implementation}
