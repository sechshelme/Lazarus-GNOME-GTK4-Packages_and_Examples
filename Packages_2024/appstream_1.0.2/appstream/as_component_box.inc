

  {$IFDEF read_enum}
type
  PAsComponentBoxFlags = ^TAsComponentBoxFlags;
  TAsComponentBoxFlags = longint;
const
  AS_COMPONENT_BOX_FLAG_NONE = 0;
  AS_COMPONENT_BOX_FLAG_NO_CHECKS = 1 shl 0;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PAsComponentBox = ^TAsComponentBox;
  TAsComponentBox = record
    parent_instance: TGObject;
    cpts: PGPtrArray;
  end;

  PAsComponentBoxClass = ^TAsComponentBoxClass;
  TAsComponentBoxClass = record
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
function as_component_box_get_type: TGType; cdecl; external libappstream;

function as_component_box_new(flags: TAsComponentBoxFlags): PAsComponentBox; cdecl; external libappstream;
function as_component_box_new_simple: PAsComponentBox; cdecl; external libappstream;

function as_component_box_as_array(cbox: PAsComponentBox): PGPtrArray; cdecl; external libappstream;
function as_component_box_get_flags(cbox: PAsComponentBox): TAsComponentBoxFlags; cdecl; external libappstream;
function as_component_box_get_size(cbox: PAsComponentBox): Tguint; cdecl; external libappstream;
function as_component_box_index_safe(cbox: PAsComponentBox; index: Tguint): PAsComponent; cdecl; external libappstream;
function as_component_box_is_empty(cbox: PAsComponentBox): Tgboolean; cdecl; external libappstream;
function as_component_box_add(cbox: PAsComponentBox; cpt: PAsComponent; error: PPGError): Tgboolean; cdecl; external libappstream;
procedure as_component_box_clear(cbox: PAsComponentBox); cdecl; external libappstream;
procedure as_component_box_remove_at(cbox: PAsComponentBox; index: Tguint); cdecl; external libappstream;
procedure as_component_box_sort(cbox: PAsComponentBox); cdecl; external libappstream;
procedure as_component_box_sort_by_score(cbox: PAsComponentBox); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:24 ===

function AS_TYPE_COMPONENT_BOX: TGType;
function AS_COMPONENT_BOX(obj: Pointer): PAsComponentBox;

function as_component_box_index(cbox: PAsComponentBox; index_: Tgint): PAsComponent;
function as_component_box_len(cbox: PAsComponentBox): Tgint;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_COMPONENT_BOX: TGType;
begin
  AS_TYPE_COMPONENT_BOX := as_component_box_get_type;
end;

function AS_COMPONENT_BOX(obj: Pointer): PAsComponentBox;
begin
  Result := PAsComponentBox(g_type_check_instance_cast(obj, AS_TYPE_COMPONENT_BOX));
end;


function as_component_box_index(cbox: PAsComponentBox; index_: Tgint): PAsComponent;
begin
  as_component_box_index := PAsComponent(g_ptr_array_index(cbox^.cpts, index_));
end;

function as_component_box_len(cbox: PAsComponentBox): Tgint;
begin
  as_component_box_len := cbox^.cpts^.len;
end;

{$ENDIF read_implementation}
