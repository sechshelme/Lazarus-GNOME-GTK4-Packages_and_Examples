unit gibaseinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gitypelib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGIAttributeIter = record
    data: Tgpointer;
    data2: Tgpointer;
    data3: Tgpointer;
    data4: Tgpointer;
  end;
  PGIAttributeIter = ^TGIAttributeIter;

function g_base_info_gtype_get_type: TGType; cdecl; external libgirepository;
function g_base_info_ref(info: PGIBaseInfo): PGIBaseInfo; cdecl; external libgirepository;
procedure g_base_info_unref(info: PGIBaseInfo); cdecl; external libgirepository;
function g_base_info_get_type(info: PGIBaseInfo): TGIInfoType; cdecl; external libgirepository;
function g_base_info_get_name(info: PGIBaseInfo): Pgchar; cdecl; external libgirepository;
function g_base_info_get_namespace(info: PGIBaseInfo): Pgchar; cdecl; external libgirepository;
function g_base_info_is_deprecated(info: PGIBaseInfo): Tgboolean; cdecl; external libgirepository;
function g_base_info_get_attribute(info: PGIBaseInfo; name: Pgchar): Pgchar; cdecl; external libgirepository;
function g_base_info_iterate_attributes(info: PGIBaseInfo; iterator: PGIAttributeIter; name: PPchar; value: PPchar): Tgboolean; cdecl; external libgirepository;
function g_base_info_get_container(info: PGIBaseInfo): PGIBaseInfo; cdecl; external libgirepository;
function g_base_info_get_typelib(info: PGIBaseInfo): PGITypelib; cdecl; external libgirepository;
function g_base_info_equal(info1: PGIBaseInfo; info2: PGIBaseInfo): Tgboolean; cdecl; external libgirepository;
function g_info_new(_type: TGIInfoType; container: PGIBaseInfo; typelib: PGITypelib; offset: Tguint32): PGIBaseInfo; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:14:36 ===

function GI_TYPE_BASE_INFO: TGType;

implementation

function GI_TYPE_BASE_INFO: TGType;
begin
  GI_TYPE_BASE_INFO := g_base_info_gtype_get_type;
end;



end.
