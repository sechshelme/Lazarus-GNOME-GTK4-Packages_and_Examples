unit nm_setting_bond_port;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm,nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_SETTING_BOND_PORT_SETTING_NAME = 'bond-port';
  NM_SETTING_BOND_PORT_QUEUE_ID = 'queue-id';
  NM_SETTING_BOND_PORT_PRIO = 'prio';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingBondPort = type Pointer;
  PNMSettingBondPortClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_bond_port_get_type: TGType; cdecl; external libnm;
function nm_setting_bond_port_new: PNMSetting; cdecl; external libnm;
function nm_setting_bond_port_get_queue_id(setting: PNMSettingBondPort): Tguint32; cdecl; external libnm;
function nm_setting_bond_port_get_prio(setting: PNMSettingBondPort): Tgint32; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:27:58 ===

function NM_TYPE_SETTING_BOND_PORT: TGType;
function NM_SETTING_BOND_PORT(obj: Pointer): PNMSettingBondPort;
function NM_SETTING_BOND_PORT_CLASS(klass: Pointer): PNMSettingBondPortClass;
function NM_IS_SETTING_BOND_PORT(obj: Pointer): Tgboolean;
function NM_IS_SETTING_BOND_PORT_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_BOND_PORT_GET_CLASS(obj: Pointer): PNMSettingBondPortClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_BOND_PORT: TGType;
begin
  NM_TYPE_SETTING_BOND_PORT := nm_setting_bond_port_get_type;
end;

function NM_SETTING_BOND_PORT(obj: Pointer): PNMSettingBondPort;
begin
  Result := PNMSettingBondPort(g_type_check_instance_cast(obj, NM_TYPE_SETTING_BOND_PORT));
end;

function NM_SETTING_BOND_PORT_CLASS(klass: Pointer): PNMSettingBondPortClass;
begin
  Result := PNMSettingBondPortClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_BOND_PORT));
end;

function NM_IS_SETTING_BOND_PORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_BOND_PORT);
end;

function NM_IS_SETTING_BOND_PORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_BOND_PORT);
end;

function NM_SETTING_BOND_PORT_GET_CLASS(obj: Pointer): PNMSettingBondPortClass;
begin
  Result := PNMSettingBondPortClass(PGTypeInstance(obj)^.g_class);
end;



end.
