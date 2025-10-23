{$IFDEF read_interface}



function GI_IS_TYPE_INFO(info: Pointer): boolean;
function G_TYPE_TAG_IS_BASIC(tag: TGITypeTag): boolean;
function GI_TYPE_TAG_IS_BASIC(tag: TGITypeTag): boolean;
function GI_TYPE_TAG_IS_NUMERIC(tag: TGITypeTag): boolean;
function GI_TYPE_TAG_IS_CONTAINER(tag: TGITypeTag): boolean;

function g_type_tag_to_string(_type: TGITypeTag): Pgchar; cdecl; external libgirepository;
function g_info_type_to_string(_type: TGIInfoType): Pgchar; cdecl; external libgirepository;
function g_type_info_is_pointer(info: PGITypeInfo): Tgboolean; cdecl; external libgirepository;
function g_type_info_get_tag(info: PGITypeInfo): TGITypeTag; cdecl; external libgirepository;
function g_type_info_get_param_type(info: PGITypeInfo; n: Tgint): PGITypeInfo; cdecl; external libgirepository;
function g_type_info_get_interface(info: PGITypeInfo): PGIBaseInfo; cdecl; external libgirepository;
function g_type_info_get_array_length(info: PGITypeInfo): Tgint; cdecl; external libgirepository;
function g_type_info_get_array_fixed_size(info: PGITypeInfo): Tgint; cdecl; external libgirepository;
function g_type_info_is_zero_terminated(info: PGITypeInfo): Tgboolean; cdecl; external libgirepository;
function g_type_info_get_array_type(info: PGITypeInfo): TGIArrayType; cdecl; external libgirepository;
function g_type_info_get_storage_type(info: PGITypeInfo): TGITypeTag; cdecl; external libgirepository;
procedure g_type_info_argument_from_hash_pointer(info: PGITypeInfo; hash_pointer: Tgpointer; arg: PGIArgument); cdecl; external libgirepository;
function g_type_info_hash_pointer_from_argument(info: PGITypeInfo; arg: PGIArgument): Tgpointer; cdecl; external libgirepository;
procedure gi_type_tag_argument_from_hash_pointer(storage_type: TGITypeTag; hash_pointer: Tgpointer; arg: PGIArgument); cdecl; external libgirepository;
function gi_type_tag_hash_pointer_from_argument(storage_type: TGITypeTag; arg: PGIArgument): Tgpointer; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GI_IS_TYPE_INFO(info: Pointer): boolean;
begin
  GI_IS_TYPE_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_TYPE;
end;

function G_TYPE_TAG_IS_BASIC(tag: TGITypeTag): boolean;
begin
  G_TYPE_TAG_IS_BASIC := GI_TYPE_TAG_IS_BASIC(tag);
end;

function GI_TYPE_TAG_IS_BASIC(tag: TGITypeTag): boolean;
begin
  Result := (Ord(tag) < Ord(GI_TYPE_TAG_ARRAY)) or (tag = GI_TYPE_TAG_UNICHAR);
end;

function GI_TYPE_TAG_IS_NUMERIC(tag: TGITypeTag): boolean;
begin
  GI_TYPE_TAG_IS_NUMERIC := (tag >= GI_TYPE_TAG_INT8) and (tag <= GI_TYPE_TAG_DOUBLE);
end;

function GI_TYPE_TAG_IS_CONTAINER(tag: TGITypeTag): boolean;
begin
  Result :=
    (tag = GI_TYPE_TAG_ARRAY) or
    ((Ord(tag) >= Ord(GI_TYPE_TAG_GLIST)) and (Ord(tag) <= Ord(GI_TYPE_TAG_GHASH)));
end;

{$ENDIF read_implementation}
