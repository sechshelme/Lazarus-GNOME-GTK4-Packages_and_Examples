

  {$IFDEF read_struct}
type
  TAsAgreementSection = record
    parent_instance: TGObject;
  end;
  PAsAgreementSection = ^TAsAgreementSection;

  PAsAgreementSectionClass = ^TAsAgreementSectionClass;
  TAsAgreementSectionClass = record
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
function as_agreement_section_get_type: TGType; cdecl; external libappstream;
function as_agreement_section_new: PAsAgreementSection; cdecl; external libappstream;
function as_agreement_section_get_context(agreement_section: PAsAgreementSection): PAsContext; cdecl; external libappstream;
procedure as_agreement_section_set_context(agreement_section: PAsAgreementSection; context: PAsContext); cdecl; external libappstream;
function as_agreement_section_get_kind(agreement_section: PAsAgreementSection): Pgchar; cdecl; external libappstream;
procedure as_agreement_section_set_kind(agreement_section: PAsAgreementSection; kind: Pgchar); cdecl; external libappstream;
function as_agreement_section_get_name(agreement_section: PAsAgreementSection): Pgchar; cdecl; external libappstream;
procedure as_agreement_section_set_name(agreement_section: PAsAgreementSection; name: Pgchar; locale: Pgchar); cdecl; external libappstream;
function as_agreement_section_get_description(agreement_section: PAsAgreementSection): Pgchar; cdecl; external libappstream;
procedure as_agreement_section_set_description(agreement_section: PAsAgreementSection; desc: Pgchar; locale: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:59 ===

function AS_TYPE_AGREEMENT_SECTION: TGType;
function AS_AGREEMENT_SECTION(obj: Pointer): PAsAgreementSection;
function AS_IS_AGREEMENT_SECTION(obj: Pointer): Tgboolean;
function AS_AGREEMENT_SECTION_CLASS(klass: Pointer): PAsAgreementSectionClass;
function AS_IS_AGREEMENT_SECTION_CLASS(klass: Pointer): Tgboolean;
function AS_AGREEMENT_SECTION_GET_CLASS(obj: Pointer): PAsAgreementSectionClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_AGREEMENT_SECTION: TGType;
begin
  Result := as_agreement_section_get_type;
end;

function AS_AGREEMENT_SECTION(obj: Pointer): PAsAgreementSection;
begin
  Result := PAsAgreementSection(g_type_check_instance_cast(obj, AS_TYPE_AGREEMENT_SECTION));
end;

function AS_IS_AGREEMENT_SECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_AGREEMENT_SECTION);
end;

function AS_AGREEMENT_SECTION_CLASS(klass: Pointer): PAsAgreementSectionClass;
begin
  Result := PAsAgreementSectionClass(g_type_check_class_cast(klass, AS_TYPE_AGREEMENT_SECTION));
end;

function AS_IS_AGREEMENT_SECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_AGREEMENT_SECTION);
end;

function AS_AGREEMENT_SECTION_GET_CLASS(obj: Pointer): PAsAgreementSectionClass;
begin
  Result := PAsAgreementSectionClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
