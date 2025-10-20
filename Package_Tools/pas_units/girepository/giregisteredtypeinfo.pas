unit giregisteredtypeinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_IS_REGISTERED_TYPE_INFO(info: PGIBaseInfo): boolean; inline;

function g_registered_type_info_get_type_name(info: PGIRegisteredTypeInfo): Pgchar; cdecl; external libgirepository;
function g_registered_type_info_get_type_init(info: PGIRegisteredTypeInfo): Pgchar; cdecl; external libgirepository;
function g_registered_type_info_get_g_type(info: PGIRegisteredTypeInfo): TGType; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:08 ===


implementation

function GI_IS_REGISTERED_TYPE_INFO(info: PGIBaseInfo): boolean;
var
  t: TGIInfoType;
begin
  t := g_base_info_get_type(info);
  Result :=
    (t = GI_INFO_TYPE_BOXED) or
    (t = GI_INFO_TYPE_ENUM) or
    (t = GI_INFO_TYPE_FLAGS) or
    (t = GI_INFO_TYPE_INTERFACE) or
    (t = GI_INFO_TYPE_OBJECT) or
    (t = GI_INFO_TYPE_STRUCT) or
    (t = GI_INFO_TYPE_UNION) or
    (t = GI_INFO_TYPE_BOXED);
end;


end.
