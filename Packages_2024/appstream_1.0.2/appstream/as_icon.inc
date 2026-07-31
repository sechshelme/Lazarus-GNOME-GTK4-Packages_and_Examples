

  {$IFDEF read_enum}
type
  PAsIconKind = ^TAsIconKind;
  TAsIconKind = longint;
const
  AS_ICON_KIND_UNKNOWN = 0;
  AS_ICON_KIND_STOCK = 1;
  AS_ICON_KIND_CACHED = 2;
  AS_ICON_KIND_LOCAL = 3;
  AS_ICON_KIND_REMOTE = 4;
  AS_ICON_KIND_LAST = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsIcon = record
    parent_instance: TGObject;
  end;
  PAsIcon = ^TAsIcon;

  PAsIconClass = ^TAsIconClass;
  TAsIconClass = record
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
function as_icon_get_type: TGType; cdecl; external libappstream;
function as_icon_kind_from_string(kind_str: Pgchar): TAsIconKind; cdecl; external libappstream;
function as_icon_kind_to_string(kind: TAsIconKind): Pgchar; cdecl; external libappstream;
function as_icon_new: PAsIcon; cdecl; external libappstream;
function as_icon_get_kind(icon: PAsIcon): TAsIconKind; cdecl; external libappstream;
procedure as_icon_set_kind(icon: PAsIcon; kind: TAsIconKind); cdecl; external libappstream;
function as_icon_get_name(icon: PAsIcon): Pgchar; cdecl; external libappstream;
procedure as_icon_set_name(icon: PAsIcon; name: Pgchar); cdecl; external libappstream;
function as_icon_get_url(icon: PAsIcon): Pgchar; cdecl; external libappstream;
procedure as_icon_set_url(icon: PAsIcon; url: Pgchar); cdecl; external libappstream;
function as_icon_get_filename(icon: PAsIcon): Pgchar; cdecl; external libappstream;
procedure as_icon_set_filename(icon: PAsIcon; filename: Pgchar); cdecl; external libappstream;
function as_icon_get_width(icon: PAsIcon): Tguint; cdecl; external libappstream;
procedure as_icon_set_width(icon: PAsIcon; width: Tguint); cdecl; external libappstream;
function as_icon_get_height(icon: PAsIcon): Tguint; cdecl; external libappstream;
procedure as_icon_set_height(icon: PAsIcon; height: Tguint); cdecl; external libappstream;
function as_icon_get_scale(icon: PAsIcon): Tguint; cdecl; external libappstream;
procedure as_icon_set_scale(icon: PAsIcon; scale: Tguint); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:00 ===

function AS_TYPE_ICON: TGType;
function AS_ICON(obj: Pointer): PAsIcon;
function AS_IS_ICON(obj: Pointer): Tgboolean;
function AS_ICON_CLASS(klass: Pointer): PAsIconClass;
function AS_IS_ICON_CLASS(klass: Pointer): Tgboolean;
function AS_ICON_GET_CLASS(obj: Pointer): PAsIconClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_ICON: TGType;
begin
  Result := as_icon_get_type;
end;

function AS_ICON(obj: Pointer): PAsIcon;
begin
  Result := PAsIcon(g_type_check_instance_cast(obj, AS_TYPE_ICON));
end;

function AS_IS_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_ICON);
end;

function AS_ICON_CLASS(klass: Pointer): PAsIconClass;
begin
  Result := PAsIconClass(g_type_check_class_cast(klass, AS_TYPE_ICON));
end;

function AS_IS_ICON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_ICON);
end;

function AS_ICON_GET_CLASS(obj: Pointer): PAsIconClass;
begin
  Result := PAsIconClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
