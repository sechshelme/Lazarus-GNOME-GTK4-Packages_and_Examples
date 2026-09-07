unit pk_eula_required;

interface

uses
  fp_glib2, fp_packagekit, pk_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPkEulaRequiredPrivate = type Pointer;

  PPkEulaRequired = ^TPkEulaRequired;
  TPkEulaRequired = record
    parent: TPkSource;
    priv: PPkEulaRequiredPrivate;
  end;

  PPkEulaRequiredClass = ^TPkEulaRequiredClass;
  TPkEulaRequiredClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_eula_required_get_type: TGType; cdecl; external libpackagekit;
function pk_eula_required_new: PPkEulaRequired; cdecl; external libpackagekit;
function pk_eula_required_get_eula_id(eula_required: PPkEulaRequired): Pgchar; cdecl; external libpackagekit;
function pk_eula_required_get_package_id(eula_required: PPkEulaRequired): Pgchar; cdecl; external libpackagekit;
function pk_eula_required_get_vendor_name(eula_required: PPkEulaRequired): Pgchar; cdecl; external libpackagekit;
function pk_eula_required_get_license_agreement(eula_required: PPkEulaRequired): Pgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:08:37 ===

function PK_TYPE_EULA_REQUIRED: TGType;
function PK_EULA_REQUIRED(obj: Pointer): PPkEulaRequired;
function PK_EULA_REQUIRED_CLASS(klass: Pointer): PPkEulaRequiredClass;
function PK_IS_EULA_REQUIRED(obj: Pointer): Tgboolean;
function PK_IS_EULA_REQUIRED_CLASS(klass: Pointer): Tgboolean;
function PK_EULA_REQUIRED_GET_CLASS(obj: Pointer): PPkEulaRequiredClass;

implementation

function PK_TYPE_EULA_REQUIRED: TGType;
begin
  PK_TYPE_EULA_REQUIRED := pk_eula_required_get_type;
end;

function PK_EULA_REQUIRED(obj: Pointer): PPkEulaRequired;
begin
  Result := PPkEulaRequired(g_type_check_instance_cast(obj, PK_TYPE_EULA_REQUIRED));
end;

function PK_EULA_REQUIRED_CLASS(klass: Pointer): PPkEulaRequiredClass;
begin
  Result := PPkEulaRequiredClass(g_type_check_class_cast(klass, PK_TYPE_EULA_REQUIRED));
end;

function PK_IS_EULA_REQUIRED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_EULA_REQUIRED);
end;

function PK_IS_EULA_REQUIRED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_EULA_REQUIRED);
end;

function PK_EULA_REQUIRED_GET_CLASS(obj: Pointer): PPkEulaRequiredClass;
begin
  Result := PPkEulaRequiredClass(PGTypeInstance(obj)^.g_class);
end;



end.
