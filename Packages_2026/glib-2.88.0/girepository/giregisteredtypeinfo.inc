{$IFDEF read_interface}


function gi_registered_type_info_get_type_name(info: PGIRegisteredTypeInfo): pchar; cdecl; external libgirepository2;
function gi_registered_type_info_get_type_init_function_name(info: PGIRegisteredTypeInfo): pchar; cdecl; external libgirepository2;
function gi_registered_type_info_get_g_type(info: PGIRegisteredTypeInfo): TGType; cdecl; external libgirepository2;
function gi_registered_type_info_is_boxed(info: PGIRegisteredTypeInfo): Tgboolean; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:35:43 ===

function GI_TYPE_REGISTERED_TYPE_INFO: TGType;
function GI_REGISTERED_TYPE_INFO(obj: Pointer): PGIRegisteredTypeInfo;
function GI_IS_REGISTERED_TYPE_INFO(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_REGISTERED_TYPE_INFO: TGType;
begin
  GI_TYPE_REGISTERED_TYPE_INFO := gi_registered_type_info_get_type;
end;

function GI_REGISTERED_TYPE_INFO(obj: Pointer): PGIRegisteredTypeInfo;
begin
  Result := PGIRegisteredTypeInfo(g_type_check_instance_cast(obj, GI_TYPE_REGISTERED_TYPE_INFO));
end;

function GI_IS_REGISTERED_TYPE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_REGISTERED_TYPE_INFO);
end;



{$ENDIF read_implementation}
