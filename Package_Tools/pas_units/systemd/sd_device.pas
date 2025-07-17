unit sd_device;

interface

uses
  fp_systemd, sd_id128, sd_bus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Psd_device_action_t = ^Tsd_device_action_t;
  Tsd_device_action_t = int64;

const
  SD_DEVICE_ADD = 0;
  SD_DEVICE_REMOVE = 1;
  SD_DEVICE_CHANGE = 2;
  SD_DEVICE_MOVE = 3;
  SD_DEVICE_ONLINE = 4;
  SD_DEVICE_OFFLINE = 5;
  SD_DEVICE_BIND = 6;
  SD_DEVICE_UNBIND = 7;
  _SD_DEVICE_ACTION_MAX = 8;
  _SD_DEVICE_ACTION_INVALID = -22; // -EINVAL

type
  Psd_device = type Pointer;
  PPsd_device = ^Psd_device;
  Psd_device_enumerator = type Pointer;
  PPsd_device_enumerator = ^Psd_device_enumerator;
  Psd_device_monitor = type Pointer;
  PPsd_device_monitor = ^Psd_device_monitor;

  Tsd_device_monitor_handler_t = function(m: Psd_device_monitor; device: Psd_device; userdata: pointer): longint; cdecl;

function sd_device_ref(device: Psd_device): Psd_device; cdecl; external libsystemd;
function sd_device_unref(device: Psd_device): Psd_device; cdecl; external libsystemd;
function sd_device_new_from_syspath(ret: PPsd_device; syspath: pchar): longint; cdecl; external libsystemd;
function sd_device_new_from_devnum(ret: PPsd_device; _type: char; devnum: Tdev_t): longint; cdecl; external libsystemd;
function sd_device_new_from_subsystem_sysname(ret: PPsd_device; subsystem: pchar; sysname: pchar): longint; cdecl; external libsystemd;
function sd_device_new_from_device_id(ret: PPsd_device; id: pchar): longint; cdecl; external libsystemd;
function sd_device_new_from_stat_rdev(ret: PPsd_device; st: Pstat): longint; cdecl; external libsystemd;
function sd_device_new_from_devname(ret: PPsd_device; devname: pchar): longint; cdecl; external libsystemd;
function sd_device_new_from_path(ret: PPsd_device; path: pchar): longint; cdecl; external libsystemd;
function sd_device_new_from_ifname(ret: PPsd_device; ifname: pchar): longint; cdecl; external libsystemd;
function sd_device_new_from_ifindex(ret: PPsd_device; ifindex: longint): longint; cdecl; external libsystemd;
function sd_device_new_child(ret: PPsd_device; device: Psd_device; suffix: pchar): longint; cdecl; external libsystemd;
function sd_device_get_parent(child: Psd_device; ret: PPsd_device): longint; cdecl; external libsystemd;
function sd_device_get_parent_with_subsystem_devtype(child: Psd_device; subsystem: pchar; devtype: pchar; ret: PPsd_device): longint; cdecl; external libsystemd;
function sd_device_get_syspath(device: Psd_device; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_subsystem(device: Psd_device; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_devtype(device: Psd_device; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_devnum(device: Psd_device; devnum: Pdev_t): longint; cdecl; external libsystemd;
function sd_device_get_ifindex(device: Psd_device; ifindex: Plongint): longint; cdecl; external libsystemd;
function sd_device_get_driver(device: Psd_device; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_devpath(device: Psd_device; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_devname(device: Psd_device; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_sysname(device: Psd_device; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_sysnum(device: Psd_device; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_action(device: Psd_device; ret: Psd_device_action_t): longint; cdecl; external libsystemd;
function sd_device_get_seqnum(device: Psd_device; ret: Puint64): longint; cdecl; external libsystemd;
function sd_device_get_diskseq(device: Psd_device; ret: Puint64): longint; cdecl; external libsystemd;
function sd_device_get_is_initialized(device: Psd_device): longint; cdecl; external libsystemd;
function sd_device_get_usec_initialized(device: Psd_device; ret: Puint64): longint; cdecl; external libsystemd;
function sd_device_get_usec_since_initialized(device: Psd_device; ret: Puint64): longint; cdecl; external libsystemd;
function sd_device_get_tag_first(device: Psd_device): pchar; cdecl; external libsystemd;
function sd_device_get_tag_next(device: Psd_device): pchar; cdecl; external libsystemd;
function sd_device_get_current_tag_first(device: Psd_device): pchar; cdecl; external libsystemd;
function sd_device_get_current_tag_next(device: Psd_device): pchar; cdecl; external libsystemd;
function sd_device_get_devlink_first(device: Psd_device): pchar; cdecl; external libsystemd;
function sd_device_get_devlink_next(device: Psd_device): pchar; cdecl; external libsystemd;
function sd_device_get_property_first(device: Psd_device; value: PPchar): pchar; cdecl; external libsystemd;
function sd_device_get_property_next(device: Psd_device; value: PPchar): pchar; cdecl; external libsystemd;
function sd_device_get_sysattr_first(device: Psd_device): pchar; cdecl; external libsystemd;
function sd_device_get_sysattr_next(device: Psd_device): pchar; cdecl; external libsystemd;
function sd_device_get_child_first(device: Psd_device; ret_suffix: PPchar): Psd_device; cdecl; external libsystemd;
function sd_device_get_child_next(device: Psd_device; ret_suffix: PPchar): Psd_device; cdecl; external libsystemd;
function sd_device_has_tag(device: Psd_device; tag: pchar): longint; cdecl; external libsystemd;
function sd_device_has_current_tag(device: Psd_device; tag: pchar): longint; cdecl; external libsystemd;
function sd_device_get_property_value(device: Psd_device; key: pchar; value: PPchar): longint; cdecl; external libsystemd;
function sd_device_get_trigger_uuid(device: Psd_device; ret: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_device_get_sysattr_value(device: Psd_device; sysattr: pchar; _value: PPchar): longint; cdecl; external libsystemd;
function sd_device_set_sysattr_value(device: Psd_device; sysattr: pchar; value: pchar): longint; cdecl; external libsystemd;
function sd_device_set_sysattr_valuef(device: Psd_device; sysattr: pchar; format: pchar; args: array of const): longint; cdecl; external libsystemd;
function sd_device_set_sysattr_valuef(device: Psd_device; sysattr: pchar; format: pchar): longint; cdecl; external libsystemd;
function sd_device_trigger(device: Psd_device; action: Tsd_device_action_t): longint; cdecl; external libsystemd;
function sd_device_trigger_with_uuid(device: Psd_device; action: Tsd_device_action_t; ret_uuid: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_device_open(device: Psd_device; flags: longint): longint; cdecl; external libsystemd;
function sd_device_enumerator_new(ret: PPsd_device_enumerator): longint; cdecl; external libsystemd;
function sd_device_enumerator_ref(enumerator: Psd_device_enumerator): Psd_device_enumerator; cdecl; external libsystemd;
function sd_device_enumerator_unref(enumerator: Psd_device_enumerator): Psd_device_enumerator; cdecl; external libsystemd;
function sd_device_enumerator_get_device_first(enumerator: Psd_device_enumerator): Psd_device; cdecl; external libsystemd;
function sd_device_enumerator_get_device_next(enumerator: Psd_device_enumerator): Psd_device; cdecl; external libsystemd;
function sd_device_enumerator_get_subsystem_first(enumerator: Psd_device_enumerator): Psd_device; cdecl; external libsystemd;
function sd_device_enumerator_get_subsystem_next(enumerator: Psd_device_enumerator): Psd_device; cdecl; external libsystemd;
function sd_device_enumerator_add_match_subsystem(enumerator: Psd_device_enumerator; subsystem: pchar; match: longint): longint; cdecl; external libsystemd;
function sd_device_enumerator_add_match_sysattr(enumerator: Psd_device_enumerator; sysattr: pchar; value: pchar; match: longint): longint; cdecl; external libsystemd;
function sd_device_enumerator_add_match_property(enumerator: Psd_device_enumerator; _property: pchar; value: pchar): longint; cdecl; external libsystemd;
function sd_device_enumerator_add_match_property_required(enumerator: Psd_device_enumerator; _property: pchar; value: pchar): longint; cdecl; external libsystemd;
function sd_device_enumerator_add_match_sysname(enumerator: Psd_device_enumerator; sysname: pchar): longint; cdecl; external libsystemd;
function sd_device_enumerator_add_nomatch_sysname(enumerator: Psd_device_enumerator; sysname: pchar): longint; cdecl; external libsystemd;
function sd_device_enumerator_add_match_tag(enumerator: Psd_device_enumerator; tag: pchar): longint; cdecl; external libsystemd;
function sd_device_enumerator_add_match_parent(enumerator: Psd_device_enumerator; parent: Psd_device): longint; cdecl; external libsystemd;
function sd_device_enumerator_allow_uninitialized(enumerator: Psd_device_enumerator): longint; cdecl; external libsystemd;
function sd_device_monitor_new(ret: PPsd_device_monitor): longint; cdecl; external libsystemd;
function sd_device_monitor_ref(m: Psd_device_monitor): Psd_device_monitor; cdecl; external libsystemd;
function sd_device_monitor_unref(m: Psd_device_monitor): Psd_device_monitor; cdecl; external libsystemd;
function sd_device_monitor_set_receive_buffer_size(m: Psd_device_monitor; size: Tsize_t): longint; cdecl; external libsystemd;
function sd_device_monitor_attach_event(m: Psd_device_monitor; event: Psd_event): longint; cdecl; external libsystemd;
function sd_device_monitor_detach_event(m: Psd_device_monitor): longint; cdecl; external libsystemd;
function sd_device_monitor_get_event(m: Psd_device_monitor): Psd_event; cdecl; external libsystemd;
function sd_device_monitor_get_event_source(m: Psd_device_monitor): Psd_event_source; cdecl; external libsystemd;
function sd_device_monitor_set_description(m: Psd_device_monitor; description: pchar): longint; cdecl; external libsystemd;
function sd_device_monitor_get_description(m: Psd_device_monitor; ret: PPchar): longint; cdecl; external libsystemd;
function sd_device_monitor_start(m: Psd_device_monitor; callback: Tsd_device_monitor_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_device_monitor_stop(m: Psd_device_monitor): longint; cdecl; external libsystemd;
function sd_device_monitor_filter_add_match_subsystem_devtype(m: Psd_device_monitor; subsystem: pchar; devtype: pchar): longint; cdecl; external libsystemd;
function sd_device_monitor_filter_add_match_tag(m: Psd_device_monitor; tag: pchar): longint; cdecl; external libsystemd;
function sd_device_monitor_filter_add_match_sysattr(m: Psd_device_monitor; sysattr: pchar; value: pchar; match: longint): longint; cdecl; external libsystemd;
function sd_device_monitor_filter_add_match_parent(m: Psd_device_monitor; device: Psd_device; match: longint): longint; cdecl; external libsystemd;
function sd_device_monitor_filter_update(m: Psd_device_monitor): longint; cdecl; external libsystemd;
function sd_device_monitor_filter_remove(m: Psd_device_monitor): longint; cdecl; external libsystemd;

// === Konventiert am: 16-7-25 19:03:56 ===


implementation



end.
