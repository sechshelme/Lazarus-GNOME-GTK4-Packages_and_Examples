unit giconstantinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_IS_CONSTANT_INFO(info: Pointer): boolean;

function g_constant_info_get_type(info: PGIConstantInfo): PGITypeInfo; cdecl; external libgirepository;
procedure g_constant_info_free_value(info: PGIConstantInfo; value: PGIArgument); cdecl; external libgirepository;
function g_constant_info_get_value(info: PGIConstantInfo; value: PGIArgument): Tgint; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:01:49 ===


implementation


function GI_IS_CONSTANT_INFO(info: Pointer): boolean;
begin
  GI_IS_CONSTANT_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_CONSTANT;
end;


end.
