unit as_bundle;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsBundleKind = ^TAsBundleKind;
  TAsBundleKind = longint;
const
  AS_BUNDLE_KIND_UNKNOWN = 0;
  AS_BUNDLE_KIND_PACKAGE = 1;
  AS_BUNDLE_KIND_LIMBA = 2;
  AS_BUNDLE_KIND_FLATPAK = 3;
  AS_BUNDLE_KIND_APPIMAGE = 4;
  AS_BUNDLE_KIND_SNAP = 5;
  AS_BUNDLE_KIND_TARBALL = 6;
  AS_BUNDLE_KIND_CABINET = 7;
  AS_BUNDLE_KIND_LINGLONG = 8;
  AS_BUNDLE_KIND_LAST = 9;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsBundle = record
    parent_instance: TGObject;
  end;
  PAsBundle = ^TAsBundle;

  PAsBundleClass = ^TAsBundleClass;
  TAsBundleClass = record
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
function as_bundle_get_type: TGType; cdecl; external libappstream;
function as_bundle_kind_to_string(kind: TAsBundleKind): Pgchar; cdecl; external libappstream;
function as_bundle_kind_from_string(bundle_str: Pgchar): TAsBundleKind; cdecl; external libappstream;
function as_bundle_new: PAsBundle; cdecl; external libappstream;
function as_bundle_get_kind(bundle: PAsBundle): TAsBundleKind; cdecl; external libappstream;
procedure as_bundle_set_kind(bundle: PAsBundle; kind: TAsBundleKind); cdecl; external libappstream;
function as_bundle_get_id(bundle: PAsBundle): Pgchar; cdecl; external libappstream;
procedure as_bundle_set_id(bundle: PAsBundle; id: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:46 ===

function AS_TYPE_BUNDLE: TGType;
function AS_BUNDLE(obj: Pointer): PAsBundle;
function AS_IS_BUNDLE(obj: Pointer): Tgboolean;
function AS_BUNDLE_CLASS(klass: Pointer): PAsBundleClass;
function AS_IS_BUNDLE_CLASS(klass: Pointer): Tgboolean;
function AS_BUNDLE_GET_CLASS(obj: Pointer): PAsBundleClass;
{$ENDIF read_function}

implementation

function AS_TYPE_BUNDLE: TGType;
begin
  Result := as_bundle_get_type;
end;

function AS_BUNDLE(obj: Pointer): PAsBundle;
begin
  Result := PAsBundle(g_type_check_instance_cast(obj, AS_TYPE_BUNDLE));
end;

function AS_IS_BUNDLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_BUNDLE);
end;

function AS_BUNDLE_CLASS(klass: Pointer): PAsBundleClass;
begin
  Result := PAsBundleClass(g_type_check_class_cast(klass, AS_TYPE_BUNDLE));
end;

function AS_IS_BUNDLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_BUNDLE);
end;

function AS_BUNDLE_GET_CLASS(obj: Pointer): PAsBundleClass;
begin
  Result := PAsBundleClass(PGTypeInstance(obj)^.g_class);
end;

end.
