{$IFDEF read_interface}


type
  PPkRepoSignatureRequiredPrivate = type Pointer;

  PPkRepoSignatureRequired = ^TPkRepoSignatureRequired;
  TPkRepoSignatureRequired = record
    parent: TPkSource;
    priv: PPkRepoSignatureRequiredPrivate;
  end;

  PPkRepoSignatureRequiredClass = ^TPkRepoSignatureRequiredClass;
  TPkRepoSignatureRequiredClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_repo_signature_required_get_type: TGType; cdecl; external libpackagekit;
function pk_repo_signature_required_new: PPkRepoSignatureRequired; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:10:26 ===

function PK_TYPE_REPO_SIGNATURE_REQUIRED: TGType;
function PK_REPO_SIGNATURE_REQUIRED(obj: Pointer): PPkRepoSignatureRequired;
function PK_REPO_SIGNATURE_REQUIRED_CLASS(klass: Pointer): PPkRepoSignatureRequiredClass;
function PK_IS_REPO_SIGNATURE_REQUIRED(obj: Pointer): Tgboolean;
function PK_IS_REPO_SIGNATURE_REQUIRED_CLASS(klass: Pointer): Tgboolean;
function PK_REPO_SIGNATURE_REQUIRED_GET_CLASS(obj: Pointer): PPkRepoSignatureRequiredClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_REPO_SIGNATURE_REQUIRED: TGType;
begin
  PK_TYPE_REPO_SIGNATURE_REQUIRED := pk_repo_signature_required_get_type;
end;

function PK_REPO_SIGNATURE_REQUIRED(obj: Pointer): PPkRepoSignatureRequired;
begin
  Result := PPkRepoSignatureRequired(g_type_check_instance_cast(obj, PK_TYPE_REPO_SIGNATURE_REQUIRED));
end;

function PK_REPO_SIGNATURE_REQUIRED_CLASS(klass: Pointer): PPkRepoSignatureRequiredClass;
begin
  Result := PPkRepoSignatureRequiredClass(g_type_check_class_cast(klass, PK_TYPE_REPO_SIGNATURE_REQUIRED));
end;

function PK_IS_REPO_SIGNATURE_REQUIRED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_REPO_SIGNATURE_REQUIRED);
end;

function PK_IS_REPO_SIGNATURE_REQUIRED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_REPO_SIGNATURE_REQUIRED);
end;

function PK_REPO_SIGNATURE_REQUIRED_GET_CLASS(obj: Pointer): PPkRepoSignatureRequiredClass;
begin
  Result := PPkRepoSignatureRequiredClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
