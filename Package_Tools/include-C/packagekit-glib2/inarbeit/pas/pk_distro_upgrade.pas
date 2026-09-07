unit pk_distro_upgrade;

interface

uses
  fp_glib2, fp_packagekit, pk_source, pk_enum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPkDistroUpgradePrivate = type Pointer;

  PPkDistroUpgrade = ^TPkDistroUpgrade;
  TPkDistroUpgrade = record
    parent: TPkSource;
    priv: PPkDistroUpgradePrivate;
  end;

  PPkDistroUpgradeClass = ^TPkDistroUpgradeClass;
  TPkDistroUpgradeClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_distro_upgrade_get_type: TGType; cdecl; external libpackagekit;
function pk_distro_upgrade_new: PPkDistroUpgrade; cdecl; external libpackagekit;

function pk_distro_upgrade_get_id(distro_upgrade: PPkDistroUpgrade): Pgchar; cdecl; external libpackagekit;
function pk_distro_upgrade_get_summary(distro_upgrade: PPkDistroUpgrade): Pgchar; cdecl; external libpackagekit;
function pk_distro_upgrade_get_state(distro_upgrade: PPkDistroUpgrade): TPkDistroUpgradeEnum; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:09:08 ===

function PK_TYPE_DISTRO_UPGRADE: TGType;
function PK_DISTRO_UPGRADE(obj: Pointer): PPkDistroUpgrade;
function PK_DISTRO_UPGRADE_CLASS(klass: Pointer): PPkDistroUpgradeClass;
function PK_IS_DISTRO_UPGRADE(obj: Pointer): Tgboolean;
function PK_IS_DISTRO_UPGRADE_CLASS(klass: Pointer): Tgboolean;
function PK_DISTRO_UPGRADE_GET_CLASS(obj: Pointer): PPkDistroUpgradeClass;

implementation

function PK_TYPE_DISTRO_UPGRADE: TGType;
begin
  PK_TYPE_DISTRO_UPGRADE := pk_distro_upgrade_get_type;
end;

function PK_DISTRO_UPGRADE(obj: Pointer): PPkDistroUpgrade;
begin
  Result := PPkDistroUpgrade(g_type_check_instance_cast(obj, PK_TYPE_DISTRO_UPGRADE));
end;

function PK_DISTRO_UPGRADE_CLASS(klass: Pointer): PPkDistroUpgradeClass;
begin
  Result := PPkDistroUpgradeClass(g_type_check_class_cast(klass, PK_TYPE_DISTRO_UPGRADE));
end;

function PK_IS_DISTRO_UPGRADE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_DISTRO_UPGRADE);
end;

function PK_IS_DISTRO_UPGRADE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_DISTRO_UPGRADE);
end;

function PK_DISTRO_UPGRADE_GET_CLASS(obj: Pointer): PPkDistroUpgradeClass;
begin
  Result := PPkDistroUpgradeClass(PGTypeInstance(obj)^.g_class);
end;



end.
