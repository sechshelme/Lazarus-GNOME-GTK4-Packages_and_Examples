unit giunioninfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_IS_UNION_INFO(info: Pointer): boolean;

function g_union_info_get_n_fields(info: PGIUnionInfo): Tgint; cdecl; external libgirepository;
function g_union_info_get_field(info: PGIUnionInfo; n: Tgint): PGIFieldInfo; cdecl; external libgirepository;
function g_union_info_get_n_methods(info: PGIUnionInfo): Tgint; cdecl; external libgirepository;
function g_union_info_get_method(info: PGIUnionInfo; n: Tgint): PGIFunctionInfo; cdecl; external libgirepository;
function g_union_info_is_discriminated(info: PGIUnionInfo): Tgboolean; cdecl; external libgirepository;
function g_union_info_get_discriminator_offset(info: PGIUnionInfo): Tgint; cdecl; external libgirepository;
function g_union_info_get_discriminator_type(info: PGIUnionInfo): PGITypeInfo; cdecl; external libgirepository;
function g_union_info_get_discriminator(info: PGIUnionInfo; n: Tgint): PGIConstantInfo; cdecl; external libgirepository;
function g_union_info_find_method(info: PGIUnionInfo; name: Pgchar): PGIFunctionInfo; cdecl; external libgirepository;
function g_union_info_get_size(info: PGIUnionInfo): Tgsize; cdecl; external libgirepository;
function g_union_info_get_alignment(info: PGIUnionInfo): Tgsize; cdecl; external libgirepository;
function g_union_info_get_copy_function(info: PGIUnionInfo): pchar; cdecl; external libgirepository;
function g_union_info_get_free_function(info: PGIUnionInfo): pchar; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:29 ===


implementation


function GI_IS_UNION_INFO(info: Pointer): boolean;
begin
  GI_IS_UNION_INFO := (g_base_info_get_type(PGIBaseInfo(info))) = GI_INFO_TYPE_UNION;
end;


end.
