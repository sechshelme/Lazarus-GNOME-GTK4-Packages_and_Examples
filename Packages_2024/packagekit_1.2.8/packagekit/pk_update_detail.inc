{$IFDEF read_interface}


type
  PPkUpdateDetailPrivate = type Pointer;

  PPkUpdateDetail = ^TPkUpdateDetail;
  TPkUpdateDetail = record
    parent: TPkSource;
    priv: PPkUpdateDetailPrivate;
  end;

  PPkUpdateDetailClass = ^TPkUpdateDetailClass;
  TPkUpdateDetailClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_update_detail_get_type: TGType; cdecl; external libpackagekit;
function pk_update_detail_new: PPkUpdateDetail; cdecl; external libpackagekit;
function pk_update_detail_get_package_id(update_detail: PPkUpdateDetail): Pgchar; cdecl; external libpackagekit;
function pk_update_detail_get_updates(update_detail: PPkUpdateDetail): PPgchar; cdecl; external libpackagekit;
function pk_update_detail_get_obsoletes(update_detail: PPkUpdateDetail): PPgchar; cdecl; external libpackagekit;
function pk_update_detail_get_vendor_urls(update_detail: PPkUpdateDetail): PPgchar; cdecl; external libpackagekit;
function pk_update_detail_get_bugzilla_urls(update_detail: PPkUpdateDetail): PPgchar; cdecl; external libpackagekit;
function pk_update_detail_get_cve_urls(update_detail: PPkUpdateDetail): PPgchar; cdecl; external libpackagekit;
function pk_update_detail_get_restart(update_detail: PPkUpdateDetail): TPkRestartEnum; cdecl; external libpackagekit;
function pk_update_detail_get_update_text(update_detail: PPkUpdateDetail): Pgchar; cdecl; external libpackagekit;
function pk_update_detail_get_changelog(update_detail: PPkUpdateDetail): Pgchar; cdecl; external libpackagekit;
function pk_update_detail_get_state(update_detail: PPkUpdateDetail): TPkUpdateStateEnum; cdecl; external libpackagekit;
function pk_update_detail_get_issued(update_detail: PPkUpdateDetail): Pgchar; cdecl; external libpackagekit;
function pk_update_detail_get_updated(update_detail: PPkUpdateDetail): Pgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:13:17 ===

function PK_TYPE_UPDATE_DETAIL: TGType;
function PK_UPDATE_DETAIL(obj: Pointer): PPkUpdateDetail;
function PK_UPDATE_DETAIL_CLASS(klass: Pointer): PPkUpdateDetailClass;
function PK_IS_UPDATE_DETAIL(obj: Pointer): Tgboolean;
function PK_IS_UPDATE_DETAIL_CLASS(klass: Pointer): Tgboolean;
function PK_UPDATE_DETAIL_GET_CLASS(obj: Pointer): PPkUpdateDetailClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_UPDATE_DETAIL: TGType;
begin
  PK_TYPE_UPDATE_DETAIL := pk_update_detail_get_type;
end;

function PK_UPDATE_DETAIL(obj: Pointer): PPkUpdateDetail;
begin
  Result := PPkUpdateDetail(g_type_check_instance_cast(obj, PK_TYPE_UPDATE_DETAIL));
end;

function PK_UPDATE_DETAIL_CLASS(klass: Pointer): PPkUpdateDetailClass;
begin
  Result := PPkUpdateDetailClass(g_type_check_class_cast(klass, PK_TYPE_UPDATE_DETAIL));
end;

function PK_IS_UPDATE_DETAIL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_UPDATE_DETAIL);
end;

function PK_IS_UPDATE_DETAIL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_UPDATE_DETAIL);
end;

function PK_UPDATE_DETAIL_GET_CLASS(obj: Pointer): PPkUpdateDetailClass;
begin
  Result := PPkUpdateDetailClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
