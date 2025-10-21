unit giconstantinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gi_constant_info_get_type_info(info: PGIConstantInfo): PGITypeInfo; cdecl; external libgirepository2;
procedure gi_constant_info_free_value(info: PGIConstantInfo; value: PGIArgument); cdecl; external libgirepository2;
function gi_constant_info_get_value(info: PGIConstantInfo; value: PGIArgument): Tsize_t; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:34:51 ===

function GI_TYPE_CONSTANT_INFO: TGType;
function GI_CONSTANT_INFO(obj: Pointer): PGIConstantInfo;
function GI_IS_CONSTANT_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_CONSTANT_INFO: TGType;
begin
  GI_TYPE_CONSTANT_INFO := gi_constant_info_get_type;
end;

function GI_CONSTANT_INFO(obj: Pointer): PGIConstantInfo;
begin
  Result := PGIConstantInfo(g_type_check_instance_cast(obj, GI_TYPE_CONSTANT_INFO));
end;

function GI_IS_CONSTANT_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_CONSTANT_INFO);
end;



end.
