{$IFDEF read_interface}


type
  PPkDetailsPrivate = type Pointer;

  PPkDetails = ^TPkDetails;
  TPkDetails = record
    parent: TPkSource;
    priv: PPkDetailsPrivate;
  end;

  PPkDetailsClass = ^TPkDetailsClass;
  TPkDetailsClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_details_get_type: TGType; cdecl; external libpackagekit;
function pk_details_new: PPkDetails; cdecl; external libpackagekit;
function pk_details_get_package_id(details: PPkDetails): Pgchar; cdecl; external libpackagekit;
function pk_details_get_license(details: PPkDetails): Pgchar; cdecl; external libpackagekit;
function pk_details_get_group(details: PPkDetails): TPkGroupEnum; cdecl; external libpackagekit;
function pk_details_get_description(details: PPkDetails): Pgchar; cdecl; external libpackagekit;
function pk_details_get_url(details: PPkDetails): Pgchar; cdecl; external libpackagekit;
function pk_details_get_size(details: PPkDetails): Tguint64; cdecl; external libpackagekit;
function pk_details_get_summary(details: PPkDetails): Pgchar; cdecl; external libpackagekit;
function pk_details_get_download_size(details: PPkDetails): Tguint64; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:03:20 ===

function PK_TYPE_DETAILS: TGType;
function PK_DETAILS(obj: Pointer): PPkDetails;
function PK_DETAILS_CLASS(klass: Pointer): PPkDetailsClass;
function PK_IS_DETAILS(obj: Pointer): Tgboolean;
function PK_IS_DETAILS_CLASS(klass: Pointer): Tgboolean;
function PK_DETAILS_GET_CLASS(obj: Pointer): PPkDetailsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_DETAILS: TGType;
begin
  PK_TYPE_DETAILS := pk_details_get_type;
end;

function PK_DETAILS(obj: Pointer): PPkDetails;
begin
  Result := PPkDetails(g_type_check_instance_cast(obj, PK_TYPE_DETAILS));
end;

function PK_DETAILS_CLASS(klass: Pointer): PPkDetailsClass;
begin
  Result := PPkDetailsClass(g_type_check_class_cast(klass, PK_TYPE_DETAILS));
end;

function PK_IS_DETAILS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_DETAILS);
end;

function PK_IS_DETAILS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_DETAILS);
end;

function PK_DETAILS_GET_CLASS(obj: Pointer): PPkDetailsClass;
begin
  Result := PPkDetailsClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
