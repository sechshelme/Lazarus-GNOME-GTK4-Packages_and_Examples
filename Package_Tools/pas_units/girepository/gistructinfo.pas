unit gistructinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_IS_STRUCT_INFO(info: Pointer): boolean;

function g_struct_info_get_n_fields(info: PGIStructInfo): Tgint; cdecl; external libgirepository;
function g_struct_info_get_field(info: PGIStructInfo; n: Tgint): PGIFieldInfo; cdecl; external libgirepository;
function g_struct_info_find_field(info: PGIStructInfo; name: Pgchar): PGIFieldInfo; cdecl; external libgirepository;
function g_struct_info_get_n_methods(info: PGIStructInfo): Tgint; cdecl; external libgirepository;
function g_struct_info_get_method(info: PGIStructInfo; n: Tgint): PGIFunctionInfo; cdecl; external libgirepository;
function g_struct_info_find_method(info: PGIStructInfo; name: Pgchar): PGIFunctionInfo; cdecl; external libgirepository;
function g_struct_info_get_size(info: PGIStructInfo): Tgsize; cdecl; external libgirepository;
function g_struct_info_get_alignment(info: PGIStructInfo): Tgsize; cdecl; external libgirepository;
function g_struct_info_is_gtype_struct(info: PGIStructInfo): Tgboolean; cdecl; external libgirepository;
function g_struct_info_is_foreign(info: PGIStructInfo): Tgboolean; cdecl; external libgirepository;
function g_struct_info_get_copy_function(info: PGIStructInfo): pchar; cdecl; external libgirepository;
function g_struct_info_get_free_function(info: PGIStructInfo): pchar; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:18 ===


implementation


function GI_IS_STRUCT_INFO(info: Pointer): boolean;
begin
  GI_IS_STRUCT_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_STRUCT;
end;


end.
