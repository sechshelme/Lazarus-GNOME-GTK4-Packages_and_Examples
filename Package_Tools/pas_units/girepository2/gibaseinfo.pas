unit gibaseinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gitypelib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGIBaseInfo = type Pointer;
  PGIBaseInfoClass = type Pointer;

  TGIAttributeIter = record
    data: pointer;
    _dummy: array[0..3] of pointer;
  end;
  PGIAttributeIter = ^TGIAttributeIter;

const
  GI_ATTRIBUTE_ITER_INIT: TGIAttributeIter = (data: nil; _dummy: (nil, nil, nil, nil));

function gi_base_info_get_type: TGType; cdecl; external libgirepository2;
function gi_base_info_ref(info: pointer): PGIBaseInfo; cdecl; external libgirepository2;
procedure gi_base_info_unref(info: pointer); cdecl; external libgirepository2;
procedure gi_base_info_clear(info: pointer); cdecl; external libgirepository2;
function gi_base_info_get_name(info: PGIBaseInfo): pchar; cdecl; external libgirepository2;
function gi_base_info_get_namespace(info: PGIBaseInfo): pchar; cdecl; external libgirepository2;
function gi_base_info_is_deprecated(info: PGIBaseInfo): Tgboolean; cdecl; external libgirepository2;
function gi_base_info_get_attribute(info: PGIBaseInfo; name: pchar): pchar; cdecl; external libgirepository2;
function gi_base_info_iterate_attributes(info: PGIBaseInfo; iterator: PGIAttributeIter; name: PPchar; value: PPchar): Tgboolean; cdecl; external libgirepository2;
function gi_base_info_get_container(info: PGIBaseInfo): PGIBaseInfo; cdecl; external libgirepository2;
function gi_base_info_get_typelib(info: PGIBaseInfo): PGITypelib; cdecl; external libgirepository2;
function gi_base_info_equal(info1: PGIBaseInfo; info2: PGIBaseInfo): Tgboolean; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:34:28 ===

function GI_TYPE_BASE_INFO: TGType;
function GI_BASE_INFO(obj: Pointer): PGIBaseInfo;
function GI_IS_BASE_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_BASE_INFO: TGType;
begin
  GI_TYPE_BASE_INFO := gi_base_info_get_type;
end;

function GI_BASE_INFO(obj: Pointer): PGIBaseInfo;
begin
  Result := PGIBaseInfo(g_type_check_instance_cast(obj, GI_TYPE_BASE_INFO));
end;

function GI_IS_BASE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_BASE_INFO);
end;



end.
