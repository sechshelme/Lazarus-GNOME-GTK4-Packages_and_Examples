

  {$IFDEF read_enum}
type
  PAsReleaseListKind = ^TAsReleaseListKind;
  TAsReleaseListKind = longint;
const
  AS_RELEASE_LIST_KIND_UNKNOWN = 0;
  AS_RELEASE_LIST_KIND_EMBEDDED = 1;
  AS_RELEASE_LIST_KIND_EXTERNAL = 2;
  AS_RELEASE_LIST_KIND_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PAsReleaseList = ^TAsReleaseList;
  TAsReleaseList = record
    parent_instance: TGObject;
    entries: PGPtrArray;
  end;

  PAsReleaseListClass = ^TAsReleaseListClass;
  TAsReleaseListClass = record
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
function as_release_list_get_type: TGType; cdecl; external libappstream;
function as_release_list_kind_to_string(kind: TAsReleaseListKind): Pgchar; cdecl; external libappstream;
function as_release_list_kind_from_string(kind_str: Pgchar): TAsReleaseListKind; cdecl; external libappstream;
function as_release_list_new: PAsReleaseList; cdecl; external libappstream;

function as_release_list_get_entries(rels: PAsReleaseList): PGPtrArray; cdecl; external libappstream;
function as_release_list_get_size(rels: PAsReleaseList): Tguint; cdecl; external libappstream;
procedure as_release_list_set_size(rels: PAsReleaseList; size: Tguint); cdecl; external libappstream;
function as_release_list_index_safe(rels: PAsReleaseList; index: Tguint): PAsRelease; cdecl; external libappstream;
function as_release_list_is_empty(rels: PAsReleaseList): Tgboolean; cdecl; external libappstream;
procedure as_release_list_add(rels: PAsReleaseList; release: PAsRelease); cdecl; external libappstream;
procedure as_release_list_clear(rels: PAsReleaseList); cdecl; external libappstream;
procedure as_release_list_sort(rels: PAsReleaseList); cdecl; external libappstream;
function as_release_list_get_context(rels: PAsReleaseList): PAsContext; cdecl; external libappstream;
procedure as_release_list_set_context(rels: PAsReleaseList; context: PAsContext); cdecl; external libappstream;
function as_release_list_get_kind(rels: PAsReleaseList): TAsReleaseListKind; cdecl; external libappstream;
procedure as_release_list_set_kind(rels: PAsReleaseList; kind: TAsReleaseListKind); cdecl; external libappstream;
function as_release_list_get_url(rels: PAsReleaseList): Pgchar; cdecl; external libappstream;
procedure as_release_list_set_url(rels: PAsReleaseList; url: Pgchar); cdecl; external libappstream;
function as_release_list_load_from_bytes(rels: PAsReleaseList; context: PAsContext; bytes: PGBytes; error: PPGError): Tgboolean; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:09 ===

function AS_TYPE_RELEASE_LIST: TGType;
function AS_RELEASE_LIST(obj: Pointer): PAsReleaseList;

function as_release_list_index(rels: PAsReleaseList; index_: Tguint): PAsRelease;
function as_release_list_len(rels: PAsReleaseList): Tguint;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_RELEASE_LIST: TGType;
begin
  AS_TYPE_RELEASE_LIST := as_release_list_get_type;
end;

function AS_RELEASE_LIST(obj: Pointer): PAsReleaseList;
begin
  Result := PAsReleaseList(g_type_check_instance_cast(obj, AS_TYPE_RELEASE_LIST));
end;


function as_release_list_index(rels: PAsReleaseList; index_: Tguint): PAsRelease;
begin
  as_release_list_index := PAsRelease(g_ptr_array_index(rels^.entries, index_));
end;

function as_release_list_len(rels: PAsReleaseList): Tguint;
begin
  as_release_list_len := rels^.entries^.len;
end;

{$ENDIF read_implementation}
