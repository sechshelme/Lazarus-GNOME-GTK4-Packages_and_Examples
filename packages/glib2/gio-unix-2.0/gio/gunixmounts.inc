/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 23-11-2024   13:43                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGUnixMountEntry = record
  end;
  PGUnixMountEntry = ^TGUnixMountEntry;

  TGUnixMountPoint = record
  end;
  PGUnixMountPoint = ^TGUnixMountPoint;

  TGUnixMountMonitor = record
  end;
  PGUnixMountMonitor = ^TGUnixMountMonitor;

  TGUnixMountMonitorClass = record
  end;
  PGUnixMountMonitorClass = ^TGUnixMountMonitorClass;

function g_unix_mount_entry_get_type: TGType; cdecl; external libgio2;
function g_unix_mount_point_get_type: TGType; cdecl; external libgio2;
procedure g_unix_mount_free(mount_entry: PGUnixMountEntry); cdecl; external libgio2;
function g_unix_mount_copy(mount_entry: PGUnixMountEntry): PGUnixMountEntry; cdecl; external libgio2;
procedure g_unix_mount_point_free(mount_point: PGUnixMountPoint); cdecl; external libgio2;
function g_unix_mount_point_copy(mount_point: PGUnixMountPoint): PGUnixMountPoint; cdecl; external libgio2;
function g_unix_mount_compare(mount1: PGUnixMountEntry; mount2: PGUnixMountEntry): Tgint; cdecl; external libgio2;
function g_unix_mount_get_mount_path(mount_entry: PGUnixMountEntry): pchar; cdecl; external libgio2;
function g_unix_mount_get_device_path(mount_entry: PGUnixMountEntry): pchar; cdecl; external libgio2;
function g_unix_mount_get_root_path(mount_entry: PGUnixMountEntry): pchar; cdecl; external libgio2;
function g_unix_mount_get_fs_type(mount_entry: PGUnixMountEntry): pchar; cdecl; external libgio2;
function g_unix_mount_get_options(mount_entry: PGUnixMountEntry): pchar; cdecl; external libgio2;
function g_unix_mount_is_readonly(mount_entry: PGUnixMountEntry): Tgboolean; cdecl; external libgio2;
function g_unix_mount_is_system_internal(mount_entry: PGUnixMountEntry): Tgboolean; cdecl; external libgio2;
function g_unix_mount_guess_can_eject(mount_entry: PGUnixMountEntry): Tgboolean; cdecl; external libgio2;
function g_unix_mount_guess_should_display(mount_entry: PGUnixMountEntry): Tgboolean; cdecl; external libgio2;
function g_unix_mount_guess_name(mount_entry: PGUnixMountEntry): pchar; cdecl; external libgio2;
function g_unix_mount_guess_icon(mount_entry: PGUnixMountEntry): PGIcon; cdecl; external libgio2;
function g_unix_mount_guess_symbolic_icon(mount_entry: PGUnixMountEntry): PGIcon; cdecl; external libgio2;
function g_unix_mount_point_compare(mount1: PGUnixMountPoint; mount2: PGUnixMountPoint): Tgint; cdecl; external libgio2;
function g_unix_mount_point_get_mount_path(mount_point: PGUnixMountPoint): pchar; cdecl; external libgio2;
function g_unix_mount_point_get_device_path(mount_point: PGUnixMountPoint): pchar; cdecl; external libgio2;
function g_unix_mount_point_get_fs_type(mount_point: PGUnixMountPoint): pchar; cdecl; external libgio2;
function g_unix_mount_point_get_options(mount_point: PGUnixMountPoint): pchar; cdecl; external libgio2;
function g_unix_mount_point_is_readonly(mount_point: PGUnixMountPoint): Tgboolean; cdecl; external libgio2;
function g_unix_mount_point_is_user_mountable(mount_point: PGUnixMountPoint): Tgboolean; cdecl; external libgio2;
function g_unix_mount_point_is_loopback(mount_point: PGUnixMountPoint): Tgboolean; cdecl; external libgio2;
function g_unix_mount_point_guess_can_eject(mount_point: PGUnixMountPoint): Tgboolean; cdecl; external libgio2;
function g_unix_mount_point_guess_name(mount_point: PGUnixMountPoint): pchar; cdecl; external libgio2;
function g_unix_mount_point_guess_icon(mount_point: PGUnixMountPoint): PGIcon; cdecl; external libgio2;
function g_unix_mount_point_guess_symbolic_icon(mount_point: PGUnixMountPoint): PGIcon; cdecl; external libgio2;
function g_unix_mount_points_get(time_read: Pguint64): PGList; cdecl; external libgio2;
function g_unix_mount_point_at(mount_path: pchar; time_read: Pguint64): PGUnixMountPoint; cdecl; external libgio2;
function g_unix_mounts_get(time_read: Pguint64): PGList; cdecl; external libgio2;
function g_unix_mount_at(mount_path: pchar; time_read: Pguint64): PGUnixMountEntry; cdecl; external libgio2;
function g_unix_mount_for(file_path: pchar; time_read: Pguint64): PGUnixMountEntry; cdecl; external libgio2;
function g_unix_mounts_changed_since(time: Tguint64): Tgboolean; cdecl; external libgio2;
function g_unix_mount_points_changed_since(time: Tguint64): Tgboolean; cdecl; external libgio2;
function g_unix_mount_monitor_get_type: TGType; cdecl; external libgio2;
function g_unix_mount_monitor_get: PGUnixMountMonitor; cdecl; external libgio2;
function g_unix_mount_monitor_new: PGUnixMountMonitor; cdecl; external libgio2;
procedure g_unix_mount_monitor_set_rate_limit(mount_monitor: PGUnixMountMonitor; limit_msec: longint); cdecl; external libgio2;
function g_unix_is_mount_path_system_internal(mount_path: pchar): Tgboolean; cdecl; external libgio2;
function g_unix_is_system_fs_type(fs_type: pchar): Tgboolean; cdecl; external libgio2;
function g_unix_is_system_device_path(device_path: pchar): Tgboolean; cdecl; external libgio2;

function G_TYPE_UNIX_MOUNT_ENTRY: TGType;
function G_TYPE_UNIX_MOUNT_POINT: TGType;


// === Konventiert am: 20-11-24 15:21:17 ===

function G_TYPE_UNIX_MOUNT_MONITOR: TGType;
function G_UNIX_MOUNT_MONITOR(obj: Pointer): PGUnixMountMonitor;
function G_UNIX_MOUNT_MONITOR_CLASS(klass: Pointer): PGUnixMountMonitorClass;
function G_IS_UNIX_MOUNT_MONITOR(obj: Pointer): Tgboolean;
function G_IS_UNIX_MOUNT_MONITOR_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_UNIX_MOUNT_MONITOR: TGType;
begin
  G_TYPE_UNIX_MOUNT_MONITOR := g_unix_mount_monitor_get_type;
end;

function G_UNIX_MOUNT_MONITOR(obj: Pointer): PGUnixMountMonitor;
begin
  Result := PGUnixMountMonitor(g_type_check_instance_cast(obj, G_TYPE_UNIX_MOUNT_MONITOR));
end;

function G_UNIX_MOUNT_MONITOR_CLASS(klass: Pointer): PGUnixMountMonitorClass;
begin
  Result := PGUnixMountMonitorClass(g_type_check_class_cast(klass, G_TYPE_UNIX_MOUNT_MONITOR));
end;

function G_IS_UNIX_MOUNT_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_UNIX_MOUNT_MONITOR);
end;

function G_IS_UNIX_MOUNT_MONITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_UNIX_MOUNT_MONITOR);
end;

// ====

function G_TYPE_UNIX_MOUNT_ENTRY: TGType;
begin
  G_TYPE_UNIX_MOUNT_ENTRY := g_unix_mount_entry_get_type;
end;

function G_TYPE_UNIX_MOUNT_POINT: TGType;
begin
  G_TYPE_UNIX_MOUNT_POINT := g_unix_mount_point_get_type;
end;


{$ENDIF read_implementation}
