unit as_suggested;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsSuggestedKind = ^TAsSuggestedKind;
  TAsSuggestedKind = longint;
const
  AS_SUGGESTED_KIND_UNKNOWN = 0;
  AS_SUGGESTED_KIND_UPSTREAM = 1;
  AS_SUGGESTED_KIND_HEURISTIC = 2;
  AS_SUGGESTED_KIND_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsSuggested = record
    parent_instance: TGObject;
  end;
  PAsSuggested = ^TAsSuggested;

  PAsSuggestedClass = ^TAsSuggestedClass;
  TAsSuggestedClass = record
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
function as_suggested_get_type: TGType; cdecl; external libappstream;
function as_suggested_kind_from_string(kind_str: Pgchar): TAsSuggestedKind; cdecl; external libappstream;
function as_suggested_kind_to_string(kind: TAsSuggestedKind): Pgchar; cdecl; external libappstream;
function as_suggested_new: PAsSuggested; cdecl; external libappstream;
function as_suggested_get_kind(suggested: PAsSuggested): TAsSuggestedKind; cdecl; external libappstream;
procedure as_suggested_set_kind(suggested: PAsSuggested; kind: TAsSuggestedKind); cdecl; external libappstream;
function as_suggested_get_ids(suggested: PAsSuggested): PGPtrArray; cdecl; external libappstream;
procedure as_suggested_add_id(suggested: PAsSuggested; cid: Pgchar); cdecl; external libappstream;
function as_suggested_is_valid(suggested: PAsSuggested): Tgboolean; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:46 ===

function AS_TYPE_SUGGESTED: TGType;
function AS_SUGGESTED(obj: Pointer): PAsSuggested;
function AS_IS_SUGGESTED(obj: Pointer): Tgboolean;
function AS_SUGGESTED_CLASS(klass: Pointer): PAsSuggestedClass;
function AS_IS_SUGGESTED_CLASS(klass: Pointer): Tgboolean;
function AS_SUGGESTED_GET_CLASS(obj: Pointer): PAsSuggestedClass;
{$ENDIF read_function}

implementation

function AS_TYPE_SUGGESTED: TGType;
begin
  Result := as_suggested_get_type;
end;

function AS_SUGGESTED(obj: Pointer): PAsSuggested;
begin
  Result := PAsSuggested(g_type_check_instance_cast(obj, AS_TYPE_SUGGESTED));
end;

function AS_IS_SUGGESTED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_SUGGESTED);
end;

function AS_SUGGESTED_CLASS(klass: Pointer): PAsSuggestedClass;
begin
  Result := PAsSuggestedClass(g_type_check_class_cast(klass, AS_TYPE_SUGGESTED));
end;

function AS_IS_SUGGESTED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_SUGGESTED);
end;

function AS_SUGGESTED_GET_CLASS(obj: Pointer): PAsSuggestedClass;
begin
  Result := PAsSuggestedClass(PGTypeInstance(obj)^.g_class);
end;

end.
