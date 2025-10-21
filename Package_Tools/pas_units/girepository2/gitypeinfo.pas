unit gitypeinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_TYPE_TAG_IS_BASIC(tag: TGITypeTag): boolean;
function GI_TYPE_TAG_IS_NUMERIC(tag: TGITypeTag): boolean;
function GI_TYPE_TAG_IS_CONTAINER(tag: TGITypeTag): boolean;

function gi_type_tag_to_string(_type: TGITypeTag): pchar; cdecl; external libgirepository2;
function gi_type_info_is_pointer(info: PGITypeInfo): Tgboolean; cdecl; external libgirepository2;
function gi_type_info_get_tag(info: PGITypeInfo): TGITypeTag; cdecl; external libgirepository2;
function gi_type_info_get_param_type(info: PGITypeInfo; n: dword): PGITypeInfo; cdecl; external libgirepository2;
function gi_type_info_get_interface(info: PGITypeInfo): PGIBaseInfo; cdecl; external libgirepository2;
function gi_type_info_get_array_length_index(info: PGITypeInfo; out_length_index: Pdword): Tgboolean; cdecl; external libgirepository2;
function gi_type_info_get_array_fixed_size(info: PGITypeInfo; out_size: Psize_t): Tgboolean; cdecl; external libgirepository2;
function gi_type_info_is_zero_terminated(info: PGITypeInfo): Tgboolean; cdecl; external libgirepository2;
function gi_type_info_get_array_type(info: PGITypeInfo): TGIArrayType; cdecl; external libgirepository2;
function gi_type_info_get_storage_type(info: PGITypeInfo): TGITypeTag; cdecl; external libgirepository2;
procedure gi_type_info_argument_from_hash_pointer(info: PGITypeInfo; hash_pointer: pointer; arg: PGIArgument); cdecl; external libgirepository2;
function gi_type_info_hash_pointer_from_argument(info: PGITypeInfo; arg: PGIArgument): pointer; cdecl; external libgirepository2;
procedure gi_type_tag_argument_from_hash_pointer(storage_type: TGITypeTag; hash_pointer: pointer; arg: PGIArgument); cdecl; external libgirepository2;
function gi_type_tag_hash_pointer_from_argument(storage_type: TGITypeTag; arg: PGIArgument): pointer; cdecl; external libgirepository2;


// === Konventiert am: 21-10-25 13:36:42 ===

function GI_TYPE_TYPE_INFO: TGType;
function GI_TYPE_INFO(obj: Pointer): PGITypeInfo;
function GI_IS_TYPE_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_TYPE_INFO: TGType;
begin
  GI_TYPE_TYPE_INFO := gi_type_info_get_type;
end;

function GI_TYPE_INFO(obj: Pointer): PGITypeInfo;
begin
  Result := PGITypeInfo(g_type_check_instance_cast(obj, GI_TYPE_TYPE_INFO));
end;

function GI_IS_TYPE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_TYPE_INFO);
end;

// ====

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


end.
