unit gistructinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gi_struct_info_get_n_fields(info: PGIStructInfo): dword; cdecl; external libgirepository2;
function gi_struct_info_get_field(info: PGIStructInfo; n: dword): PGIFieldInfo; cdecl; external libgirepository2;
function gi_struct_info_find_field(info: PGIStructInfo; name: pchar): PGIFieldInfo; cdecl; external libgirepository2;
function gi_struct_info_get_n_methods(info: PGIStructInfo): dword; cdecl; external libgirepository2;
function gi_struct_info_get_method(info: PGIStructInfo; n: dword): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_struct_info_find_method(info: PGIStructInfo; name: pchar): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_struct_info_get_size(info: PGIStructInfo): Tsize_t; cdecl; external libgirepository2;
function gi_struct_info_get_alignment(info: PGIStructInfo): Tsize_t; cdecl; external libgirepository2;
function gi_struct_info_is_gtype_struct(info: PGIStructInfo): Tgboolean; cdecl; external libgirepository2;
function gi_struct_info_is_foreign(info: PGIStructInfo): Tgboolean; cdecl; external libgirepository2;
function gi_struct_info_get_copy_function_name(info: PGIStructInfo): pchar; cdecl; external libgirepository2;
function gi_struct_info_get_free_function_name(info: PGIStructInfo): pchar; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:36:32 ===

function GI_TYPE_STRUCT_INFO: TGType;
function GI_STRUCT_INFO(obj: Pointer): PGIStructInfo;
function GI_IS_STRUCT_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_STRUCT_INFO: TGType;
begin
  GI_TYPE_STRUCT_INFO := gi_struct_info_get_type;
end;

function GI_STRUCT_INFO(obj: Pointer): PGIStructInfo;
begin
  Result := PGIStructInfo(g_type_check_instance_cast(obj, GI_TYPE_STRUCT_INFO));
end;

function GI_IS_STRUCT_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_STRUCT_INFO);
end;



end.
