unit gpowerprofilemonitor;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  G_POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME = 'gio-power-profile-monitor';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGPowerProfileMonitor = type Pointer;

  PGPowerProfileMonitorInterface = ^TGPowerProfileMonitorInterface;
  TGPowerProfileMonitorInterface = record
    g_iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_power_profile_monitor_get_type: TGType; cdecl; external libgio2;
function g_power_profile_monitor_dup_default: PGPowerProfileMonitor; cdecl; external libgio2;
function g_power_profile_monitor_get_power_saver_enabled(monitor: PGPowerProfileMonitor): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:48:39 ===

function g_TYPE_power_profile_monitor: TGType;
function g_power_profile_monitor(obj: Pointer): PGPowerProfileMonitor;
function g_IS_power_profile_monitor(obj: Pointer): Tgboolean;
function g_power_profile_monitor_GET_IFACE(obj: Pointer): PGPowerProfileMonitorInterface;
{$ENDIF read_function}

implementation

function g_TYPE_power_profile_monitor: TGType;
begin
  Result := g_power_profile_monitor_get_type;
end;

function g_power_profile_monitor(obj: Pointer): PGPowerProfileMonitor;
begin
  Result := PGPowerProfileMonitor(g_type_check_instance_cast(obj, g_TYPE_power_profile_monitor));
end;

function g_IS_power_profile_monitor(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, g_TYPE_power_profile_monitor);
end;

function g_power_profile_monitor_GET_IFACE(obj: Pointer): PGPowerProfileMonitorInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_power_profile_monitor);
end;

end.
