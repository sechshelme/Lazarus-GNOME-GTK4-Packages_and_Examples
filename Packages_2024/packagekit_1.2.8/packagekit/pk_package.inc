{$IFDEF read_interface}


type
  PPkPackagePrivate = type Pointer;

  PPkPackage = ^TPkPackage;
  TPkPackage = record
    parent: TPkSource;
    priv: PPkPackagePrivate;
  end;

  PPkPackageClass = ^TPkPackageClass;
  TPkPackageClass = record
    parent_class: TPkSourceClass;
    changed: procedure(package: PPkPackage); cdecl;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_package_get_type: TGType; cdecl; external libpackagekit;
function pk_package_new: PPkPackage; cdecl; external libpackagekit;
function pk_package_set_id(package: PPkPackage; package_id: Pgchar; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_package_parse(package: PPkPackage; data: Pgchar; error: PPGError): Tgboolean; cdecl; external libpackagekit;
procedure pk_package_print(package: PPkPackage); cdecl; external libpackagekit;
function pk_package_equal(package1: PPkPackage; package2: PPkPackage): Tgboolean; cdecl; external libpackagekit;
function pk_package_equal_id(package1: PPkPackage; package2: PPkPackage): Tgboolean; cdecl; external libpackagekit;
function pk_package_get_id(package: PPkPackage): Pgchar; cdecl; external libpackagekit;
function pk_package_get_info(package: PPkPackage): TPkInfoEnum; cdecl; external libpackagekit;
procedure pk_package_set_info(package: PPkPackage; info: TPkInfoEnum); cdecl; external libpackagekit;
function pk_package_get_summary(package: PPkPackage): Pgchar; cdecl; external libpackagekit;
procedure pk_package_set_summary(package: PPkPackage; summary: Pgchar); cdecl; external libpackagekit;
function pk_package_get_name(package: PPkPackage): Pgchar; cdecl; external libpackagekit;
function pk_package_get_version(package: PPkPackage): Pgchar; cdecl; external libpackagekit;
function pk_package_get_arch(package: PPkPackage): Pgchar; cdecl; external libpackagekit;
function pk_package_get_data(package: PPkPackage): Pgchar; cdecl; external libpackagekit;
function pk_package_get_update_severity(package: PPkPackage): TPkInfoEnum; cdecl; external libpackagekit;
procedure pk_package_set_update_severity(package: PPkPackage; update_severity: TPkInfoEnum); cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:11:15 ===

function PK_TYPE_PACKAGE: TGType;
function PK_PACKAGE(obj: Pointer): PPkPackage;
function PK_PACKAGE_CLASS(klass: Pointer): PPkPackageClass;
function PK_IS_PACKAGE(obj: Pointer): Tgboolean;
function PK_IS_PACKAGE_CLASS(klass: Pointer): Tgboolean;
function PK_PACKAGE_GET_CLASS(obj: Pointer): PPkPackageClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_PACKAGE: TGType;
begin
  PK_TYPE_PACKAGE := pk_package_get_type;
end;

function PK_PACKAGE(obj: Pointer): PPkPackage;
begin
  Result := PPkPackage(g_type_check_instance_cast(obj, PK_TYPE_PACKAGE));
end;

function PK_PACKAGE_CLASS(klass: Pointer): PPkPackageClass;
begin
  Result := PPkPackageClass(g_type_check_class_cast(klass, PK_TYPE_PACKAGE));
end;

function PK_IS_PACKAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_PACKAGE);
end;

function PK_IS_PACKAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_PACKAGE);
end;

function PK_PACKAGE_GET_CLASS(obj: Pointer): PPkPackageClass;
begin
  Result := PPkPackageClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
