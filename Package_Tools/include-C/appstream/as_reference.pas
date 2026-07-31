unit as_reference;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsReferenceKind = ^TAsReferenceKind;
  TAsReferenceKind = longint;
const
  AS_REFERENCE_KIND_UNKNOWN = 0;
  AS_REFERENCE_KIND_DOI = 1;
  AS_REFERENCE_KIND_CITATION_CFF = 2;
  AS_REFERENCE_KIND_REGISTRY = 3;
  AS_REFERENCE_KIND_LAST = 4;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsReference = record
    parent_instance: TGObject;
  end;
  PAsReference = ^TAsReference;

  PAsReferenceClass = ^TAsReferenceClass;
  TAsReferenceClass = record
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
function as_reference_get_type: TGType; cdecl; external libappstream;
function as_reference_kind_to_string(kind: TAsReferenceKind): Pgchar; cdecl; external libappstream;
function as_reference_kind_from_string(str: Pgchar): TAsReferenceKind; cdecl; external libappstream;
function as_reference_new: PAsReference; cdecl; external libappstream;
function as_reference_get_kind(reference: PAsReference): TAsReferenceKind; cdecl; external libappstream;
procedure as_reference_set_kind(reference: PAsReference; kind: TAsReferenceKind); cdecl; external libappstream;
function as_reference_get_value(reference: PAsReference): Pgchar; cdecl; external libappstream;
procedure as_reference_set_value(reference: PAsReference; value: Pgchar); cdecl; external libappstream;
function as_reference_get_registry_name(reference: PAsReference): Pgchar; cdecl; external libappstream;
procedure as_reference_set_registry_name(reference: PAsReference; name: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:36 ===

function AS_TYPE_REFERENCE: TGType;
function AS_REFERENCE(obj: Pointer): PAsReference;
function AS_IS_REFERENCE(obj: Pointer): Tgboolean;
function AS_REFERENCE_CLASS(klass: Pointer): PAsReferenceClass;
function AS_IS_REFERENCE_CLASS(klass: Pointer): Tgboolean;
function AS_REFERENCE_GET_CLASS(obj: Pointer): PAsReferenceClass;
{$ENDIF read_function}

implementation

function AS_TYPE_REFERENCE: TGType;
begin
  Result := as_reference_get_type;
end;

function AS_REFERENCE(obj: Pointer): PAsReference;
begin
  Result := PAsReference(g_type_check_instance_cast(obj, AS_TYPE_REFERENCE));
end;

function AS_IS_REFERENCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_REFERENCE);
end;

function AS_REFERENCE_CLASS(klass: Pointer): PAsReferenceClass;
begin
  Result := PAsReferenceClass(g_type_check_class_cast(klass, AS_TYPE_REFERENCE));
end;

function AS_IS_REFERENCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_REFERENCE);
end;

function AS_REFERENCE_GET_CLASS(obj: Pointer): PAsReferenceClass;
begin
  Result := PAsReferenceClass(PGTypeInstance(obj)^.g_class);
end;

end.
