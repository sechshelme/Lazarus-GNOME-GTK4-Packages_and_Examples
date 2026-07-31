

  {$IFDEF read_enum}
type
  PAsProvidedKind = ^TAsProvidedKind;
  TAsProvidedKind = longint;
const
  AS_PROVIDED_KIND_UNKNOWN = 0;
  AS_PROVIDED_KIND_LIBRARY = 1;
  AS_PROVIDED_KIND_BINARY = 2;
  AS_PROVIDED_KIND_MEDIATYPE = 3;
  AS_PROVIDED_KIND_FONT = 4;
  AS_PROVIDED_KIND_MODALIAS = 5;
  AS_PROVIDED_KIND_PYTHON = 6;
  AS_PROVIDED_KIND_DBUS_SYSTEM = 7;
  AS_PROVIDED_KIND_DBUS_USER = 8;
  AS_PROVIDED_KIND_FIRMWARE_RUNTIME = 9;
  AS_PROVIDED_KIND_FIRMWARE_FLASHED = 10;
  AS_PROVIDED_KIND_ID = 11;
  AS_PROVIDED_KIND_LAST = 12;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsProvided = record
    parent_instance: TGObject;
  end;
  PAsProvided = ^TAsProvided;

  PAsProvidedClass = ^TAsProvidedClass;
  TAsProvidedClass = record
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
function as_provided_get_type: TGType; cdecl; external libappstream;
function as_provided_kind_to_string(kind: TAsProvidedKind): Pgchar; cdecl; external libappstream;
function as_provided_kind_from_string(kind_str: Pgchar): TAsProvidedKind; cdecl; external libappstream;
function as_provided_kind_to_l10n_string(kind: TAsProvidedKind): Pgchar; cdecl; external libappstream;
function as_provided_new: PAsProvided; cdecl; external libappstream;
function as_provided_get_kind(prov: PAsProvided): TAsProvidedKind; cdecl; external libappstream;
procedure as_provided_set_kind(prov: PAsProvided; kind: TAsProvidedKind); cdecl; external libappstream;
function as_provided_get_items(prov: PAsProvided): PGPtrArray; cdecl; external libappstream;
procedure as_provided_add_item(prov: PAsProvided; item: Pgchar); cdecl; external libappstream;
function as_provided_has_item(prov: PAsProvided; item: Pgchar): Tgboolean; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:40 ===

function AS_TYPE_PROVIDED: TGType;
function AS_PROVIDED(obj: Pointer): PAsProvided;
function AS_IS_PROVIDED(obj: Pointer): Tgboolean;
function AS_PROVIDED_CLASS(klass: Pointer): PAsProvidedClass;
function AS_IS_PROVIDED_CLASS(klass: Pointer): Tgboolean;
function AS_PROVIDED_GET_CLASS(obj: Pointer): PAsProvidedClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_PROVIDED: TGType;
begin
  Result := as_provided_get_type;
end;

function AS_PROVIDED(obj: Pointer): PAsProvided;
begin
  Result := PAsProvided(g_type_check_instance_cast(obj, AS_TYPE_PROVIDED));
end;

function AS_IS_PROVIDED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_PROVIDED);
end;

function AS_PROVIDED_CLASS(klass: Pointer): PAsProvidedClass;
begin
  Result := PAsProvidedClass(g_type_check_class_cast(klass, AS_TYPE_PROVIDED));
end;

function AS_IS_PROVIDED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_PROVIDED);
end;

function AS_PROVIDED_GET_CLASS(obj: Pointer): PAsProvidedClass;
begin
  Result := PAsProvidedClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
