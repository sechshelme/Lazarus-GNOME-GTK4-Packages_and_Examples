{$IFDEF read_interface}


type
  PPkRepoDetailPrivate = type Pointer;

  PPkRepoDetail = ^TPkRepoDetail;
  TPkRepoDetail = record
    parent: TPkSource;
    priv: PPkRepoDetailPrivate;
  end;

  PPkRepoDetailClass = ^TPkRepoDetailClass;
  TPkRepoDetailClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_repo_detail_get_type: TGType; cdecl; external libpackagekit;
function pk_repo_detail_new: PPkRepoDetail; cdecl; external libpackagekit;
function pk_repo_detail_get_id(repo_detail: PPkRepoDetail): Pgchar; cdecl; external libpackagekit;
function pk_repo_detail_get_description(repo_detail: PPkRepoDetail): Pgchar; cdecl; external libpackagekit;
function pk_repo_detail_get_enabled(repo_detail: PPkRepoDetail): Tgboolean; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:10:32 ===

function PK_TYPE_REPO_DETAIL: TGType;
function PK_REPO_DETAIL(obj: Pointer): PPkRepoDetail;
function PK_REPO_DETAIL_CLASS(klass: Pointer): PPkRepoDetailClass;
function PK_IS_REPO_DETAIL(obj: Pointer): Tgboolean;
function PK_IS_REPO_DETAIL_CLASS(klass: Pointer): Tgboolean;
function PK_REPO_DETAIL_GET_CLASS(obj: Pointer): PPkRepoDetailClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_REPO_DETAIL: TGType;
begin
  PK_TYPE_REPO_DETAIL := pk_repo_detail_get_type;
end;

function PK_REPO_DETAIL(obj: Pointer): PPkRepoDetail;
begin
  Result := PPkRepoDetail(g_type_check_instance_cast(obj, PK_TYPE_REPO_DETAIL));
end;

function PK_REPO_DETAIL_CLASS(klass: Pointer): PPkRepoDetailClass;
begin
  Result := PPkRepoDetailClass(g_type_check_class_cast(klass, PK_TYPE_REPO_DETAIL));
end;

function PK_IS_REPO_DETAIL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_REPO_DETAIL);
end;

function PK_IS_REPO_DETAIL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_REPO_DETAIL);
end;

function PK_REPO_DETAIL_GET_CLASS(obj: Pointer): PPkRepoDetailClass;
begin
  Result := PPkRepoDetailClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
