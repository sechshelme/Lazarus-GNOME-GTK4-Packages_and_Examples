{$IFDEF read_interface}


type
  PEeze_Disk_Type = ^TEeze_Disk_Type;
  TEeze_Disk_Type = longint;

const
  EEZE_DISK_TYPE_UNKNOWN = 0;
  EEZE_DISK_TYPE_INTERNAL = 1 shl 0;
  EEZE_DISK_TYPE_CDROM = 1 shl 1;
  EEZE_DISK_TYPE_USB = 1 shl 2;
  EEZE_DISK_TYPE_FLASH = 1 shl 3;

type
  PEeze_Mount_Opts = ^TEeze_Mount_Opts;
  TEeze_Mount_Opts = longint;

const
  EEZE_DISK_MOUNTOPT_LOOP = 1 shl 1;
  EEZE_DISK_MOUNTOPT_UTF8 = 1 shl 2;
  EEZE_DISK_MOUNTOPT_NOEXEC = 1 shl 3;
  EEZE_DISK_MOUNTOPT_NOSUID = 1 shl 4;
  EEZE_DISK_MOUNTOPT_REMOUNT = 1 shl 5;
  EEZE_DISK_MOUNTOPT_UID = 1 shl 6;
  EEZE_DISK_MOUNTOPT_NODEV = 1 shl 7;
  EEZE_DISK_MOUNTOPT_DEFAULTS = (EEZE_DISK_MOUNTOPT_UTF8 or EEZE_DISK_MOUNTOPT_NOEXEC) or EEZE_DISK_MOUNTOPT_NOSUID;

var
  EEZE_EVENT_DISK_MOUNT: longint; cvar;external libeeze;
  EEZE_EVENT_DISK_UNMOUNT: longint; cvar;external libeeze;
  EEZE_EVENT_DISK_EJECT: longint; cvar;external libeeze;
  EEZE_EVENT_DISK_ERROR: longint; cvar;external libeeze;

type
  TEeze_Disk = record
  end;
  PEeze_Disk = ^TEeze_Disk;

  TEeze_Event_Disk = record
    disk: PEeze_Disk;
  end;
  PEeze_Event_Disk = ^TEeze_Event_Disk;

  TEeze_Event_Disk_Mount = TEeze_Event_Disk;
  TEeze_Event_Disk_Unmount = TEeze_Event_Disk;
  TEeze_Event_Disk_Eject = TEeze_Event_Disk;

  TEeze_Event_Disk_Error = record
    disk: PEeze_Disk;
    message: pchar;
  end;
  PEeze_Event_Disk_Error = ^TEeze_Event_Disk_Error;


procedure eeze_disk_function; cdecl; external libeeze;
function eeze_disk_can_mount: TEina_Bool; cdecl; external libeeze;
function eeze_disk_can_unmount: TEina_Bool; cdecl; external libeeze;
function eeze_disk_can_eject: TEina_Bool; cdecl; external libeeze;
function eeze_disk_new(path: pchar): PEeze_Disk; cdecl; external libeeze;
function eeze_disk_new_from_mount(mount_point: pchar): PEeze_Disk; cdecl; external libeeze;
procedure eeze_disk_free(disk: PEeze_Disk); cdecl; external libeeze;
procedure eeze_disk_scan(disk: PEeze_Disk); cdecl; external libeeze;
procedure eeze_disk_data_set(disk: PEeze_Disk; data: pointer); cdecl; external libeeze;
function eeze_disk_data_get(disk: PEeze_Disk): pointer; cdecl; external libeeze;
function eeze_disk_syspath_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_devpath_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_fstype_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_vendor_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_model_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_serial_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_uuid_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_label_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_type_get(disk: PEeze_Disk): TEeze_Disk_Type; cdecl; external libeeze;
function eeze_disk_removable_get(disk: PEeze_Disk): TEina_Bool; cdecl; external libeeze;
function eeze_disk_mounted_get(disk: PEeze_Disk): TEina_Bool; cdecl; external libeeze;
function eeze_disk_mount_wrapper_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_mount_wrapper_set(disk: PEeze_Disk; wrapper: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_disk_mount(disk: PEeze_Disk): TEina_Bool; cdecl; external libeeze;
function eeze_disk_unmount(disk: PEeze_Disk): TEina_Bool; cdecl; external libeeze;
function eeze_disk_eject(disk: PEeze_Disk): TEina_Bool; cdecl; external libeeze;
procedure eeze_disk_cancel(disk: PEeze_Disk); cdecl; external libeeze;
function eeze_disk_mount_point_get(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_mount_point_set(disk: PEeze_Disk; mount_point: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_disk_mountopts_set(disk: PEeze_Disk; opts: dword): TEina_Bool; cdecl; external libeeze;
function eeze_disk_mountopts_get(disk: PEeze_Disk): dword; cdecl; external libeeze;
function eeze_mount_tabs_watch: TEina_Bool; cdecl; external libeeze;
procedure eeze_mount_tabs_unwatch; cdecl; external libeeze;
function eeze_mount_mtab_scan: TEina_Bool; cdecl; external libeeze;
function eeze_mount_fstab_scan: TEina_Bool; cdecl; external libeeze;
function eeze_disk_udev_get_property(disk: PEeze_Disk; _property: pchar): pchar; cdecl; external libeeze;
function eeze_disk_udev_get_sysattr(disk: PEeze_Disk; sysattr: pchar): pchar; cdecl; external libeeze;
function eeze_disk_udev_get_parent(disk: PEeze_Disk): pchar; cdecl; external libeeze;
function eeze_disk_udev_walk_check_sysattr(disk: PEeze_Disk; sysattr: pchar; value: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_disk_udev_walk_get_sysattr(disk: PEeze_Disk; sysattr: pchar): pchar; cdecl; external libeeze;

// === Konventiert am: 12-6-25 17:32:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
