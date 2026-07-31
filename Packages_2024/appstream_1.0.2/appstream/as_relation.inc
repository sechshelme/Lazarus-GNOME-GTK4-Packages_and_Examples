

  {$IFDEF read_enum}
type
  PAsRelationKind = ^TAsRelationKind;
  TAsRelationKind = longint;
const
  AS_RELATION_KIND_UNKNOWN = 0;
  AS_RELATION_KIND_REQUIRES = 1;
  AS_RELATION_KIND_RECOMMENDS = 2;
  AS_RELATION_KIND_SUPPORTS = 3;
  AS_RELATION_KIND_LAST = 4;

type
  PAsRelationItemKind = ^TAsRelationItemKind;
  TAsRelationItemKind = longint;
const
  AS_RELATION_ITEM_KIND_UNKNOWN = 0;
  AS_RELATION_ITEM_KIND_ID = 1;
  AS_RELATION_ITEM_KIND_MODALIAS = 2;
  AS_RELATION_ITEM_KIND_KERNEL = 3;
  AS_RELATION_ITEM_KIND_MEMORY = 4;
  AS_RELATION_ITEM_KIND_FIRMWARE = 5;
  AS_RELATION_ITEM_KIND_CONTROL = 6;
  AS_RELATION_ITEM_KIND_DISPLAY_LENGTH = 7;
  AS_RELATION_ITEM_KIND_HARDWARE = 8;
  AS_RELATION_ITEM_KIND_INTERNET = 9;
  AS_RELATION_ITEM_KIND_LAST = 10;

type
  PAsRelationCompare = ^TAsRelationCompare;
  TAsRelationCompare = longint;
const
  AS_RELATION_COMPARE_UNKNOWN = 0;
  AS_RELATION_COMPARE_EQ = 1;
  AS_RELATION_COMPARE_NE = 2;
  AS_RELATION_COMPARE_LT = 3;
  AS_RELATION_COMPARE_GT = 4;
  AS_RELATION_COMPARE_LE = 5;
  AS_RELATION_COMPARE_GE = 6;
  AS_RELATION_COMPARE_LAST = 7;

type
  PAsControlKind = ^TAsControlKind;
  TAsControlKind = longint;
const
  AS_CONTROL_KIND_UNKNOWN = 0;
  AS_CONTROL_KIND_POINTING = 1;
  AS_CONTROL_KIND_KEYBOARD = 2;
  AS_CONTROL_KIND_CONSOLE = 3;
  AS_CONTROL_KIND_TOUCH = 4;
  AS_CONTROL_KIND_GAMEPAD = 5;
  AS_CONTROL_KIND_VOICE = 6;
  AS_CONTROL_KIND_VISION = 7;
  AS_CONTROL_KIND_TV_REMOTE = 8;
  AS_CONTROL_KIND_TABLET = 9;
  AS_CONTROL_KIND_LAST = 10;

type
  PAsDisplaySideKind = ^TAsDisplaySideKind;
  TAsDisplaySideKind = longint;
const
  AS_DISPLAY_SIDE_KIND_UNKNOWN = 0;
  AS_DISPLAY_SIDE_KIND_SHORTEST = 1;
  AS_DISPLAY_SIDE_KIND_LONGEST = 2;
  AS_DISPLAY_SIDE_KIND_LAST = 3;

type
  PAsInternetKind = ^TAsInternetKind;
  TAsInternetKind = longint;
const
  AS_INTERNET_KIND_UNKNOWN = 0;
  AS_INTERNET_KIND_ALWAYS = 1;
  AS_INTERNET_KIND_OFFLINE_ONLY = 2;
  AS_INTERNET_KIND_FIRST_RUN = 3;
  AS_INTERNET_KIND_LAST = 4;

type
  PAsRelationError = ^TAsRelationError;
  TAsRelationError = longint;
const
  AS_RELATION_ERROR_FAILED = 0;
  AS_RELATION_ERROR_BAD_VALUE = 1;
  AS_RELATION_ERROR_NOT_IMPLEMENTED = 2;
  AS_RELATION_ERROR_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsRelation = record
    parent_instance: TGObject;
  end;
  PAsRelation = ^TAsRelation;

  PAsRelationClass = ^TAsRelationClass;
  TAsRelationClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_relation_get_type: TGType; cdecl; external libappstream;
function as_relation_error_quark: TGQuark; cdecl; external libappstream;
function as_relation_kind_to_string(kind: TAsRelationKind): Pgchar; cdecl; external libappstream;
function as_relation_kind_from_string(kind_str: Pgchar): TAsRelationKind; cdecl; external libappstream;
function as_relation_item_kind_to_string(kind: TAsRelationItemKind): Pgchar; cdecl; external libappstream;
function as_relation_item_kind_from_string(kind_str: Pgchar): TAsRelationItemKind; cdecl; external libappstream;
function as_relation_compare_from_string(compare_str: Pgchar): TAsRelationCompare; cdecl; external libappstream;
function as_relation_compare_to_string(compare: TAsRelationCompare): Pgchar; cdecl; external libappstream;
function as_relation_compare_to_symbols_string(compare: TAsRelationCompare): Pgchar; cdecl; external libappstream;
function as_control_kind_to_string(kind: TAsControlKind): Pgchar; cdecl; external libappstream;
function as_control_kind_from_string(kind_str: Pgchar): TAsControlKind; cdecl; external libappstream;
function as_display_side_kind_to_string(kind: TAsDisplaySideKind): Pgchar; cdecl; external libappstream;
function as_display_side_kind_from_string(kind_str: Pgchar): TAsDisplaySideKind; cdecl; external libappstream;
function as_internet_kind_to_string(kind: TAsInternetKind): Pgchar; cdecl; external libappstream;
function as_internet_kind_from_string(kind_str: Pgchar): TAsInternetKind; cdecl; external libappstream;
function as_relation_new: PAsRelation; cdecl; external libappstream;
function as_relation_get_kind(relation: PAsRelation): TAsRelationKind; cdecl; external libappstream;
procedure as_relation_set_kind(relation: PAsRelation; kind: TAsRelationKind); cdecl; external libappstream;
function as_relation_get_item_kind(relation: PAsRelation): TAsRelationItemKind; cdecl; external libappstream;
procedure as_relation_set_item_kind(relation: PAsRelation; kind: TAsRelationItemKind); cdecl; external libappstream;
function as_relation_get_compare(relation: PAsRelation): TAsRelationCompare; cdecl; external libappstream;
procedure as_relation_set_compare(relation: PAsRelation; compare: TAsRelationCompare); cdecl; external libappstream;
function as_relation_get_version(relation: PAsRelation): Pgchar; cdecl; external libappstream;
procedure as_relation_set_version(relation: PAsRelation; version: Pgchar); cdecl; external libappstream;
function as_relation_get_value_str(relation: PAsRelation): Pgchar; cdecl; external libappstream;
procedure as_relation_set_value_str(relation: PAsRelation; value: Pgchar); cdecl; external libappstream;
function as_relation_get_value_int(relation: PAsRelation): Tgint; cdecl; external libappstream;
procedure as_relation_set_value_int(relation: PAsRelation; value: Tgint); cdecl; external libappstream;
function as_relation_get_value_control_kind(relation: PAsRelation): TAsControlKind; cdecl; external libappstream;
procedure as_relation_set_value_control_kind(relation: PAsRelation; kind: TAsControlKind); cdecl; external libappstream;
function as_relation_get_display_side_kind(relation: PAsRelation): TAsDisplaySideKind; cdecl; external libappstream;
procedure as_relation_set_display_side_kind(relation: PAsRelation; kind: TAsDisplaySideKind); cdecl; external libappstream;
function as_relation_get_value_px(relation: PAsRelation): Tgint; cdecl; external libappstream;
procedure as_relation_set_value_px(relation: PAsRelation; logical_px: Tgint); cdecl; external libappstream;
function as_relation_get_value_internet_kind(relation: PAsRelation): TAsInternetKind; cdecl; external libappstream;
procedure as_relation_set_value_internet_kind(relation: PAsRelation; kind: TAsInternetKind); cdecl; external libappstream;
function as_relation_get_value_internet_bandwidth(relation: PAsRelation): Tguint; cdecl; external libappstream;
procedure as_relation_set_value_internet_bandwidth(relation: PAsRelation; bandwidth_mbitps: Tguint); cdecl; external libappstream;
function as_relation_version_compare(relation: PAsRelation; version: Pgchar; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_relation_is_satisfied(relation: PAsRelation; system_info: PAsSystemInfo; pool: PAsPool; error: PPGError): PAsRelationCheckResult; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:33 ===

function AS_TYPE_RELATION: TGType;
function AS_RELATION(obj: Pointer): PAsRelation;
function AS_IS_RELATION(obj: Pointer): Tgboolean;
function AS_RELATION_CLASS(klass: Pointer): PAsRelationClass;
function AS_IS_RELATION_CLASS(klass: Pointer): Tgboolean;
function AS_RELATION_GET_CLASS(obj: Pointer): PAsRelationClass;

function AS_RELATION_ERROR: TGQuark;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_RELATION: TGType;
begin
  Result := as_relation_get_type;
end;

function AS_RELATION(obj: Pointer): PAsRelation;
begin
  Result := PAsRelation(g_type_check_instance_cast(obj, AS_TYPE_RELATION));
end;

function AS_IS_RELATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_RELATION);
end;

function AS_RELATION_CLASS(klass: Pointer): PAsRelationClass;
begin
  Result := PAsRelationClass(g_type_check_class_cast(klass, AS_TYPE_RELATION));
end;

function AS_IS_RELATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_RELATION);
end;

function AS_RELATION_GET_CLASS(obj: Pointer): PAsRelationClass;
begin
  Result := PAsRelationClass(PGTypeInstance(obj)^.g_class);
end;


function AS_RELATION_ERROR: TGQuark;
begin
  AS_RELATION_ERROR := as_relation_error_quark;
end;

{$ENDIF read_implementation}
