unit fp_libudev;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libudev = 'libudev';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

type
  Tva_list = Pointer;
  Tdev_t = longint;
  Tsize_t = SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pudev = type Pointer;

function udev_ref(udev: Pudev): Pudev; cdecl; external libudev;
function udev_unref(udev: Pudev): Pudev; cdecl; external libudev;
function udev_new: Pudev; cdecl; external libudev;

type
  TLogFn = procedure(udev: Pudev; priority: integer; file_: pansichar; line: integer; fn: pansichar; format: pansichar; args: Tva_list); cdecl; deprecated;

procedure udev_set_log_fn(udev: Pudev; log_fn: TLogFn); cdecl; external libudev; deprecated;
function udev_get_log_priority(udev: Pudev): longint; cdecl; external libudev; deprecated;
procedure udev_set_log_priority(udev: Pudev; priority: longint); cdecl; external libudev; deprecated;
function udev_get_userdata(udev: Pudev): pointer; cdecl; external libudev;
procedure udev_set_userdata(udev: Pudev; userdata: pointer); cdecl; external libudev;

type
  Pudev_list_entry = type Pointer;

function udev_list_entry_get_next(list_entry: Pudev_list_entry): Pudev_list_entry; cdecl; external libudev;
function udev_list_entry_get_by_name(list_entry: Pudev_list_entry; name: pchar): Pudev_list_entry; cdecl; external libudev;
function udev_list_entry_get_name(list_entry: Pudev_list_entry): pchar; cdecl; external libudev;
function udev_list_entry_get_value(list_entry: Pudev_list_entry): pchar; cdecl; external libudev;

type
  Pudev_device = type Pointer;

function udev_device_ref(udev_device: Pudev_device): Pudev_device; cdecl; external libudev;
function udev_device_unref(udev_device: Pudev_device): Pudev_device; cdecl; external libudev;
function udev_device_get_udev(udev_device: Pudev_device): Pudev; cdecl; external libudev;
function udev_device_new_from_syspath(udev: Pudev; syspath: pchar): Pudev_device; cdecl; external libudev;
function udev_device_new_from_devnum(udev: Pudev; _type: char; devnum: Tdev_t): Pudev_device; cdecl; external libudev;
function udev_device_new_from_subsystem_sysname(udev: Pudev; subsystem: pchar; sysname: pchar): Pudev_device; cdecl; external libudev;
function udev_device_new_from_device_id(udev: Pudev; id: pchar): Pudev_device; cdecl; external libudev;
function udev_device_new_from_environment(udev: Pudev): Pudev_device; cdecl; external libudev;
function udev_device_get_parent(udev_device: Pudev_device): Pudev_device; cdecl; external libudev;
function udev_device_get_parent_with_subsystem_devtype(udev_device: Pudev_device; subsystem: pchar; devtype: pchar): Pudev_device; cdecl; external libudev;
function udev_device_get_devpath(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_subsystem(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_devtype(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_syspath(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_sysname(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_sysnum(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_devnode(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_is_initialized(udev_device: Pudev_device): longint; cdecl; external libudev;
function udev_device_get_devlinks_list_entry(udev_device: Pudev_device): Pudev_list_entry; cdecl; external libudev;
function udev_device_get_properties_list_entry(udev_device: Pudev_device): Pudev_list_entry; cdecl; external libudev;
function udev_device_get_tags_list_entry(udev_device: Pudev_device): Pudev_list_entry; cdecl; external libudev;
function udev_device_get_current_tags_list_entry(udev_device: Pudev_device): Pudev_list_entry; cdecl; external libudev;
function udev_device_get_sysattr_list_entry(udev_device: Pudev_device): Pudev_list_entry; cdecl; external libudev;
function udev_device_get_property_value(udev_device: Pudev_device; key: pchar): pchar; cdecl; external libudev;
function udev_device_get_driver(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_devnum(udev_device: Pudev_device): Tdev_t; cdecl; external libudev;
function udev_device_get_action(udev_device: Pudev_device): pchar; cdecl; external libudev;
function udev_device_get_seqnum(udev_device: Pudev_device): qword; cdecl; external libudev;
function udev_device_get_usec_since_initialized(udev_device: Pudev_device): qword; cdecl; external libudev;
function udev_device_get_sysattr_value(udev_device: Pudev_device; sysattr: pchar): pchar; cdecl; external libudev;
function udev_device_set_sysattr_value(udev_device: Pudev_device; sysattr: pchar; value: pchar): longint; cdecl; external libudev;
function udev_device_has_tag(udev_device: Pudev_device; tag: pchar): longint; cdecl; external libudev;
function udev_device_has_current_tag(udev_device: Pudev_device; tag: pchar): longint; cdecl; external libudev;

type
  Pudev_monitor = type Pointer;

function udev_monitor_ref(udev_monitor: Pudev_monitor): Pudev_monitor; cdecl; external libudev;
function udev_monitor_unref(udev_monitor: Pudev_monitor): Pudev_monitor; cdecl; external libudev;
function udev_monitor_get_udev(udev_monitor: Pudev_monitor): Pudev; cdecl; external libudev;
function udev_monitor_new_from_netlink(udev: Pudev; name: pchar): Pudev_monitor; cdecl; external libudev;
function udev_monitor_enable_receiving(udev_monitor: Pudev_monitor): longint; cdecl; external libudev;
function udev_monitor_set_receive_buffer_size(udev_monitor: Pudev_monitor; size: longint): longint; cdecl; external libudev;
function udev_monitor_get_fd(udev_monitor: Pudev_monitor): longint; cdecl; external libudev;
function udev_monitor_receive_device(udev_monitor: Pudev_monitor): Pudev_device; cdecl; external libudev;
function udev_monitor_filter_add_match_subsystem_devtype(udev_monitor: Pudev_monitor; subsystem: pchar; devtype: pchar): longint; cdecl; external libudev;
function udev_monitor_filter_add_match_tag(udev_monitor: Pudev_monitor; tag: pchar): longint; cdecl; external libudev;
function udev_monitor_filter_update(udev_monitor: Pudev_monitor): longint; cdecl; external libudev;
function udev_monitor_filter_remove(udev_monitor: Pudev_monitor): longint; cdecl; external libudev;

type
  Pudev_enumerate = type Pointer;

function udev_enumerate_ref(udev_enumerate: Pudev_enumerate): Pudev_enumerate; cdecl; external libudev;
function udev_enumerate_unref(udev_enumerate: Pudev_enumerate): Pudev_enumerate; cdecl; external libudev;
function udev_enumerate_get_udev(udev_enumerate: Pudev_enumerate): Pudev; cdecl; external libudev;
function udev_enumerate_new(udev: Pudev): Pudev_enumerate; cdecl; external libudev;
function udev_enumerate_add_match_subsystem(udev_enumerate: Pudev_enumerate; subsystem: pchar): longint; cdecl; external libudev;
function udev_enumerate_add_nomatch_subsystem(udev_enumerate: Pudev_enumerate; subsystem: pchar): longint; cdecl; external libudev;
function udev_enumerate_add_match_sysattr(udev_enumerate: Pudev_enumerate; sysattr: pchar; value: pchar): longint; cdecl; external libudev;
function udev_enumerate_add_nomatch_sysattr(udev_enumerate: Pudev_enumerate; sysattr: pchar; value: pchar): longint; cdecl; external libudev;
function udev_enumerate_add_match_property(udev_enumerate: Pudev_enumerate; _property: pchar; value: pchar): longint; cdecl; external libudev;
function udev_enumerate_add_match_sysname(udev_enumerate: Pudev_enumerate; sysname: pchar): longint; cdecl; external libudev;
function udev_enumerate_add_match_tag(udev_enumerate: Pudev_enumerate; tag: pchar): longint; cdecl; external libudev;
function udev_enumerate_add_match_parent(udev_enumerate: Pudev_enumerate; parent: Pudev_device): longint; cdecl; external libudev;
function udev_enumerate_add_match_is_initialized(udev_enumerate: Pudev_enumerate): longint; cdecl; external libudev;
function udev_enumerate_add_syspath(udev_enumerate: Pudev_enumerate; syspath: pchar): longint; cdecl; external libudev;
function udev_enumerate_scan_devices(udev_enumerate: Pudev_enumerate): longint; cdecl; external libudev;
function udev_enumerate_scan_subsystems(udev_enumerate: Pudev_enumerate): longint; cdecl; external libudev;
function udev_enumerate_get_list_entry(udev_enumerate: Pudev_enumerate): Pudev_list_entry; cdecl; external libudev;

type
  Pudev_queue = type Pointer;

function udev_queue_ref(udev_queue: Pudev_queue): Pudev_queue; cdecl; external libudev;
function udev_queue_unref(udev_queue: Pudev_queue): Pudev_queue; cdecl; external libudev;
function udev_queue_get_udev(udev_queue: Pudev_queue): Pudev; cdecl; external libudev;
function udev_queue_new(udev: Pudev): Pudev_queue; cdecl; external libudev;
function udev_queue_get_kernel_seqnum(udev_queue: Pudev_queue): qword; cdecl; external libudev; deprecated;
function udev_queue_get_udev_seqnum(udev_queue: Pudev_queue): qword; cdecl; external libudev; deprecated;
function udev_queue_get_udev_is_active(udev_queue: Pudev_queue): longint; cdecl; external libudev;
function udev_queue_get_queue_is_empty(udev_queue: Pudev_queue): longint; cdecl; external libudev;
function udev_queue_get_seqnum_is_finished(udev_queue: Pudev_queue; seqnum: qword): longint; cdecl; external libudev; deprecated;
function udev_queue_get_seqnum_sequence_is_finished(udev_queue: Pudev_queue; start: qword; end_: qword): longint; cdecl; external libudev; deprecated;
function udev_queue_get_fd(udev_queue: Pudev_queue): longint; cdecl; external libudev;
function udev_queue_flush(udev_queue: Pudev_queue): longint; cdecl; external libudev;
function udev_queue_get_queued_list_entry(udev_queue: Pudev_queue): Pudev_list_entry; cdecl; external libudev; deprecated;

type
  Pudev_hwdb = type Pointer;

function udev_hwdb_new(udev: Pudev): Pudev_hwdb; cdecl; external libudev;
function udev_hwdb_ref(hwdb: Pudev_hwdb): Pudev_hwdb; cdecl; external libudev;
function udev_hwdb_unref(hwdb: Pudev_hwdb): Pudev_hwdb; cdecl; external libudev;
function udev_hwdb_get_properties_list_entry(hwdb: Pudev_hwdb; modalias: pchar; flags: dword): Pudev_list_entry; cdecl; external libudev;
function udev_util_encode_string(str: pchar; str_enc: pchar; len: Tsize_t): longint; cdecl; external libudev;

// === Konventiert am: 2-8-25 15:14:16 ===


implementation

end.
