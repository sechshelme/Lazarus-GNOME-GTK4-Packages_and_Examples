unit gnativevolumemonitor;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gvolumemonitor;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  G_NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = 'gio-native-volume-monitor';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGNativeVolumeMonitor = ^TGNativeVolumeMonitor;
  TGNativeVolumeMonitor = record
    parent_instance: TGVolumeMonitor;
  end;

  PGNativeVolumeMonitorClass = ^TGNativeVolumeMonitorClass;
  TGNativeVolumeMonitorClass = record
    parent_class: TGVolumeMonitorClass;
    get_mount_for_mount_path: function(mount_path: pchar; cancellable: PGCancellable): PGMount; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_native_volume_monitor_get_type: TGType; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:44:21 ===

function G_TYPE_NATIVE_VOLUME_MONITOR: TGType;
function G_NATIVE_VOLUME_MONITOR(obj: Pointer): PGNativeVolumeMonitor;
function G_NATIVE_VOLUME_MONITOR_CLASS(klass: Pointer): PGNativeVolumeMonitorClass;
function G_IS_NATIVE_VOLUME_MONITOR(obj: Pointer): Tgboolean;
function G_IS_NATIVE_VOLUME_MONITOR_CLASS(klass: Pointer): Tgboolean;
{$ENDIF read_struct}

implementation

function G_TYPE_NATIVE_VOLUME_MONITOR: TGType;
begin
  G_TYPE_NATIVE_VOLUME_MONITOR := g_native_volume_monitor_get_type;
end;

function G_NATIVE_VOLUME_MONITOR(obj: Pointer): PGNativeVolumeMonitor;
begin
  Result := PGNativeVolumeMonitor(g_type_check_instance_cast(obj, G_TYPE_NATIVE_VOLUME_MONITOR));
end;

function G_NATIVE_VOLUME_MONITOR_CLASS(klass: Pointer): PGNativeVolumeMonitorClass;
begin
  Result := PGNativeVolumeMonitorClass(g_type_check_class_cast(klass, G_TYPE_NATIVE_VOLUME_MONITOR));
end;

function G_IS_NATIVE_VOLUME_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_NATIVE_VOLUME_MONITOR);
end;

function G_IS_NATIVE_VOLUME_MONITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_NATIVE_VOLUME_MONITOR);
end;



end.
