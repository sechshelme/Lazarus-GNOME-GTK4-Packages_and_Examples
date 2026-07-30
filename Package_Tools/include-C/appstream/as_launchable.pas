unit as_launchable;

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAsLaunchableKind = ^TAsLaunchableKind;
  TAsLaunchableKind = longint;
const
  AS_LAUNCHABLE_KIND_UNKNOWN = 0;
  AS_LAUNCHABLE_KIND_DESKTOP_ID = 1;
  AS_LAUNCHABLE_KIND_SERVICE = 2;
  AS_LAUNCHABLE_KIND_COCKPIT_MANIFEST = 3;
  AS_LAUNCHABLE_KIND_URL = 4;
  AS_LAUNCHABLE_KIND_LAST = 5;


type
  TAsLaunchable = record
    parent_instance: TGObject;
  end;
  PAsLaunchable = ^TAsLaunchable;

  PAsLaunchableClass = ^TAsLaunchableClass;
  TAsLaunchableClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;

function as_launchable_get_type: TGType; cdecl; external libappstream;
function as_launchable_kind_to_string(kind: TAsLaunchableKind): Pgchar; cdecl; external libappstream;
function as_launchable_kind_from_string(kind_str: Pgchar): TAsLaunchableKind; cdecl; external libappstream;
function as_launchable_new: PAsLaunchable; cdecl; external libappstream;
function as_launchable_get_kind(launch: PAsLaunchable): TAsLaunchableKind; cdecl; external libappstream;
procedure as_launchable_set_kind(launch: PAsLaunchable; kind: TAsLaunchableKind); cdecl; external libappstream;
function as_launchable_get_entries(launch: PAsLaunchable): PGPtrArray; cdecl; external libappstream;
procedure as_launchable_add_entry(launch: PAsLaunchable; entry: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:50 ===

function AS_TYPE_LAUNCHABLE: TGType;
function AS_LAUNCHABLE(obj: Pointer): PAsLaunchable;
function AS_IS_LAUNCHABLE(obj: Pointer): Tgboolean;
function AS_LAUNCHABLE_CLASS(klass: Pointer): PAsLaunchableClass;
function AS_IS_LAUNCHABLE_CLASS(klass: Pointer): Tgboolean;
function AS_LAUNCHABLE_GET_CLASS(obj: Pointer): PAsLaunchableClass;

implementation

function AS_TYPE_LAUNCHABLE: TGType;
begin
  Result := as_launchable_get_type;
end;

function AS_LAUNCHABLE(obj: Pointer): PAsLaunchable;
begin
  Result := PAsLaunchable(g_type_check_instance_cast(obj, AS_TYPE_LAUNCHABLE));
end;

function AS_IS_LAUNCHABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_LAUNCHABLE);
end;

function AS_LAUNCHABLE_CLASS(klass: Pointer): PAsLaunchableClass;
begin
  Result := PAsLaunchableClass(g_type_check_class_cast(klass, AS_TYPE_LAUNCHABLE));
end;

function AS_IS_LAUNCHABLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_LAUNCHABLE);
end;

function AS_LAUNCHABLE_GET_CLASS(obj: Pointer): PAsLaunchableClass;
begin
  Result := PAsLaunchableClass(PGTypeInstance(obj)^.g_class);
end;

end.
