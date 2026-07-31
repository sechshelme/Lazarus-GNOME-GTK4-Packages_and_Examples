

  {$IFDEF read_enum}
type
  PAsAgreementKind = ^TAsAgreementKind;
  TAsAgreementKind = longint;
const
  AS_AGREEMENT_KIND_UNKNOWN = 0;
  AS_AGREEMENT_KIND_GENERIC = 1;
  AS_AGREEMENT_KIND_EULA = 2;
  AS_AGREEMENT_KIND_PRIVACY = 3;
  AS_AGREEMENT_KIND_LAST = 4;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsAgreement = record
    parent_instance: TGObject;
  end;
  PAsAgreement = ^TAsAgreement;

  PAsAgreementClass = ^TAsAgreementClass;
  TAsAgreementClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
    _as_reserved7: procedure; cdecl;
    _as_reserved8: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_agreement_get_type: TGType; cdecl; external libappstream;
function as_agreement_new: PAsAgreement; cdecl; external libappstream;
function as_agreement_kind_to_string(value: TAsAgreementKind): Pgchar; cdecl; external libappstream;
function as_agreement_kind_from_string(value: Pgchar): TAsAgreementKind; cdecl; external libappstream;
function as_agreement_get_kind(agreement: PAsAgreement): TAsAgreementKind; cdecl; external libappstream;
procedure as_agreement_set_kind(agreement: PAsAgreement; kind: TAsAgreementKind); cdecl; external libappstream;
function as_agreement_get_version_id(agreement: PAsAgreement): Pgchar; cdecl; external libappstream;
procedure as_agreement_set_version_id(agreement: PAsAgreement; version_id: Pgchar); cdecl; external libappstream;
function as_agreement_get_section_default(agreement: PAsAgreement): PAsAgreementSection; cdecl; external libappstream;
function as_agreement_get_sections(agreement: PAsAgreement): PGPtrArray; cdecl; external libappstream;
procedure as_agreement_add_section(agreement: PAsAgreement; agreement_section: PAsAgreementSection); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:37:03 ===

function AS_TYPE_AGREEMENT: TGType;
function AS_AGREEMENT(obj: Pointer): PAsAgreement;
function AS_IS_AGREEMENT(obj: Pointer): Tgboolean;
function AS_AGREEMENT_CLASS(klass: Pointer): PAsAgreementClass;
function AS_IS_AGREEMENT_CLASS(klass: Pointer): Tgboolean;
function AS_AGREEMENT_GET_CLASS(obj: Pointer): PAsAgreementClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_AGREEMENT: TGType;
begin
  Result := as_agreement_get_type;
end;

function AS_AGREEMENT(obj: Pointer): PAsAgreement;
begin
  Result := PAsAgreement(g_type_check_instance_cast(obj, AS_TYPE_AGREEMENT));
end;

function AS_IS_AGREEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_AGREEMENT);
end;

function AS_AGREEMENT_CLASS(klass: Pointer): PAsAgreementClass;
begin
  Result := PAsAgreementClass(g_type_check_class_cast(klass, AS_TYPE_AGREEMENT));
end;

function AS_IS_AGREEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_AGREEMENT);
end;

function AS_AGREEMENT_GET_CLASS(obj: Pointer): PAsAgreementClass;
begin
  Result := PAsAgreementClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
