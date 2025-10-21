unit giarginfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gi_arg_info_get_direction(info: PGIArgInfo): TGIDirection; cdecl; external libgirepository2;
function gi_arg_info_is_return_value(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository2;
function gi_arg_info_is_optional(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository2;
function gi_arg_info_is_caller_allocates(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository2;
function gi_arg_info_may_be_null(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository2;
function gi_arg_info_is_skip(info: PGIArgInfo): Tgboolean; cdecl; external libgirepository2;
function gi_arg_info_get_ownership_transfer(info: PGIArgInfo): TGITransfer; cdecl; external libgirepository2;
function gi_arg_info_get_scope(info: PGIArgInfo): TGIScopeType; cdecl; external libgirepository2;
function gi_arg_info_get_closure_index(info: PGIArgInfo; out_closure_index: Pdword): Tgboolean; cdecl; external libgirepository2;
function gi_arg_info_get_destroy_index(info: PGIArgInfo; out_destroy_index: Pdword): Tgboolean; cdecl; external libgirepository2;
function gi_arg_info_get_type_info(info: PGIArgInfo): PGITypeInfo; cdecl; external libgirepository2;
procedure gi_arg_info_load_type_info(info: PGIArgInfo; _type: PGITypeInfo); cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:34:22 ===

function GI_TYPE_ARG_INFO: TGType;
function GI_ARG_INFO(obj: Pointer): PGIArgInfo;
function GI_IS_ARG_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_ARG_INFO: TGType;
begin
  GI_TYPE_ARG_INFO := gi_arg_info_get_type;
end;

function GI_ARG_INFO(obj: Pointer): PGIArgInfo;
begin
  Result := PGIArgInfo(g_type_check_instance_cast(obj, GI_TYPE_ARG_INFO));
end;

function GI_IS_ARG_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_ARG_INFO);
end;



end.
