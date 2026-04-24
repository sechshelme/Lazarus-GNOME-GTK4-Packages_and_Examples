unit nm_device_team;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_TEAM_HW_ADDRESS = 'hw-address';
  NM_DEVICE_TEAM_CARRIER = 'carrier';
  NM_DEVICE_TEAM_SLAVES = 'slaves';
  NM_DEVICE_TEAM_CONFIG = 'config';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceTeam = type Pointer;
  PNMDeviceTeamClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_team_get_type: TGType; cdecl; external libnm;
function nm_device_team_get_hw_address(device: PNMDeviceTeam): pchar; cdecl; external libnm; deprecated;
function nm_device_team_get_carrier(device: PNMDeviceTeam): Tgboolean; cdecl; external libnm;
function nm_device_team_get_slaves(device: PNMDeviceTeam): PGPtrArray; cdecl; external libnm; deprecated;
function nm_device_team_get_config(device: PNMDeviceTeam): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:21 ===

function NM_TYPE_DEVICE_TEAM: TGType;
function NM_DEVICE_TEAM(obj: Pointer): PNMDeviceTeam;
function NM_DEVICE_TEAM_CLASS(klass: Pointer): PNMDeviceTeamClass;
function NM_IS_DEVICE_TEAM(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_TEAM_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_TEAM_GET_CLASS(obj: Pointer): PNMDeviceTeamClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_TEAM: TGType;
begin
  NM_TYPE_DEVICE_TEAM := nm_device_team_get_type;
end;

function NM_DEVICE_TEAM(obj: Pointer): PNMDeviceTeam;
begin
  Result := PNMDeviceTeam(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_TEAM));
end;

function NM_DEVICE_TEAM_CLASS(klass: Pointer): PNMDeviceTeamClass;
begin
  Result := PNMDeviceTeamClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_TEAM));
end;

function NM_IS_DEVICE_TEAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_TEAM);
end;

function NM_IS_DEVICE_TEAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_TEAM);
end;

function NM_DEVICE_TEAM_GET_CLASS(obj: Pointer): PNMDeviceTeamClass;
begin
  Result := PNMDeviceTeamClass(PGTypeInstance(obj)^.g_class);
end;



end.
