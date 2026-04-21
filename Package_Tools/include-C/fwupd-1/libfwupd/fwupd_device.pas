unit fwupd_device;

interface

uses
  fp_glib2, fp_fwupd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TFwupdDevice = record
    parent_instance: TGObject;
  end;
  PFwupdDevice = ^TFwupdDevice;

  TFwupdDeviceClass = record
    parent_class: TGObjectClass;
    _fwupd_reserved1: procedure; cdecl;
    _fwupd_reserved2: procedure; cdecl;
    _fwupd_reserved3: procedure; cdecl;
    _fwupd_reserved4: procedure; cdecl;
    _fwupd_reserved5: procedure; cdecl;
    _fwupd_reserved6: procedure; cdecl;
    _fwupd_reserved7: procedure; cdecl;
  end;
  PFwupdDeviceClass = ^TFwupdDeviceClass;

function fwupd_device_get_type: TGType; cdecl; external libfwupd;
function fwupd_device_new: PFwupdDevice; cdecl; external libfwupd;
function fwupd_device_to_string(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
function fwupd_device_get_id(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_id(self: PFwupdDevice; id: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_parent_id(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_parent_id(self: PFwupdDevice; parent_id: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_composite_id(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_composite_id(self: PFwupdDevice; composite_id: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_root(self: PFwupdDevice): PFwupdDevice; cdecl; external libfwupd;
function fwupd_device_get_parent(self: PFwupdDevice): PFwupdDevice; cdecl; external libfwupd;
procedure fwupd_device_set_parent(self: PFwupdDevice; parent: PFwupdDevice); cdecl; external libfwupd;
procedure fwupd_device_add_child(self: PFwupdDevice; child: PFwupdDevice); cdecl; external libfwupd;
procedure fwupd_device_remove_child(self: PFwupdDevice; child: PFwupdDevice); cdecl; external libfwupd;
function fwupd_device_get_children(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
function fwupd_device_get_name(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_name(self: PFwupdDevice; name: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_serial(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_serial(self: PFwupdDevice; serial: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_summary(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_summary(self: PFwupdDevice; summary: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_branch(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_branch(self: PFwupdDevice; branch: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_description(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_description(self: PFwupdDevice; description: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_version(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_version(self: PFwupdDevice; version: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_version_lowest(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_version_lowest(self: PFwupdDevice; version_lowest: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_version_lowest_raw(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_version_lowest_raw(self: PFwupdDevice; version_lowest_raw: Tguint64); cdecl; external libfwupd;
function fwupd_device_get_version_bootloader(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_version_bootloader(self: PFwupdDevice; version_bootloader: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_version_bootloader_raw(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_version_bootloader_raw(self: PFwupdDevice; version_bootloader_raw: Tguint64); cdecl; external libfwupd;
function fwupd_device_get_version_raw(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_version_raw(self: PFwupdDevice; version_raw: Tguint64); cdecl; external libfwupd;
function fwupd_device_get_version_build_date(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_version_build_date(self: PFwupdDevice; version_build_date: Tguint64); cdecl; external libfwupd;
function fwupd_device_get_version_format(self: PFwupdDevice): TFwupdVersionFormat; cdecl; external libfwupd;
procedure fwupd_device_set_version_format(self: PFwupdDevice; version_format: TFwupdVersionFormat); cdecl; external libfwupd;
function fwupd_device_get_flashes_left(self: PFwupdDevice): Tguint32; cdecl; external libfwupd;
procedure fwupd_device_set_flashes_left(self: PFwupdDevice; flashes_left: Tguint32); cdecl; external libfwupd;
function fwupd_device_get_battery_level(self: PFwupdDevice): Tguint32; cdecl; external libfwupd;
procedure fwupd_device_set_battery_level(self: PFwupdDevice; battery_level: Tguint32); cdecl; external libfwupd;
function fwupd_device_get_battery_threshold(self: PFwupdDevice): Tguint32; cdecl; external libfwupd;
procedure fwupd_device_set_battery_threshold(self: PFwupdDevice; battery_threshold: Tguint32); cdecl; external libfwupd;
function fwupd_device_get_install_duration(self: PFwupdDevice): Tguint32; cdecl; external libfwupd;
procedure fwupd_device_set_install_duration(self: PFwupdDevice; duration: Tguint32); cdecl; external libfwupd;
function fwupd_device_get_flags(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_flags(self: PFwupdDevice; flags: Tguint64); cdecl; external libfwupd;
procedure fwupd_device_add_flag(self: PFwupdDevice; flag: TFwupdDeviceFlags); cdecl; external libfwupd;
procedure fwupd_device_remove_flag(self: PFwupdDevice; flag: TFwupdDeviceFlags); cdecl; external libfwupd;
function fwupd_device_has_flag(self: PFwupdDevice; flag: TFwupdDeviceFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_problems(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_problems(self: PFwupdDevice; problems: Tguint64); cdecl; external libfwupd;
procedure fwupd_device_add_problem(self: PFwupdDevice; problem: TFwupdDeviceProblem); cdecl; external libfwupd;
procedure fwupd_device_remove_problem(self: PFwupdDevice; problem: TFwupdDeviceProblem); cdecl; external libfwupd;
function fwupd_device_has_problem(self: PFwupdDevice; problem: TFwupdDeviceProblem): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_request_flags(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_request_flags(self: PFwupdDevice; request_flags: Tguint64); cdecl; external libfwupd;
procedure fwupd_device_add_request_flag(self: PFwupdDevice; request_flag: TFwupdRequestFlags); cdecl; external libfwupd;
procedure fwupd_device_remove_request_flag(self: PFwupdDevice; request_flag: TFwupdRequestFlags); cdecl; external libfwupd;
function fwupd_device_has_request_flag(self: PFwupdDevice; request_flag: TFwupdRequestFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_created(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_created(self: PFwupdDevice; created: Tguint64); cdecl; external libfwupd;
function fwupd_device_get_modified(self: PFwupdDevice): Tguint64; cdecl; external libfwupd;
procedure fwupd_device_set_modified(self: PFwupdDevice; modified: Tguint64); cdecl; external libfwupd;
function fwupd_device_get_checksums(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_device_add_checksum(self: PFwupdDevice; checksum: Pgchar); cdecl; external libfwupd;
function fwupd_device_has_checksum(self: PFwupdDevice; checksum: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_plugin(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_plugin(self: PFwupdDevice; plugin: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_protocol(self: PFwupdDevice): Pgchar; cdecl; external libfwupd; deprecated;
procedure fwupd_device_set_protocol(self: PFwupdDevice; protocol: Pgchar); cdecl; external libfwupd; deprecated;
procedure fwupd_device_add_protocol(self: PFwupdDevice; protocol: Pgchar); cdecl; external libfwupd;
function fwupd_device_has_protocol(self: PFwupdDevice; protocol: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_protocols(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
function fwupd_device_get_vendor(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_vendor(self: PFwupdDevice; vendor: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_vendor_id(self: PFwupdDevice): Pgchar; cdecl; external libfwupd; deprecated;
procedure fwupd_device_set_vendor_id(self: PFwupdDevice; vendor_id: Pgchar); cdecl; external libfwupd; deprecated;
procedure fwupd_device_add_vendor_id(self: PFwupdDevice; vendor_id: Pgchar); cdecl; external libfwupd;
function fwupd_device_has_vendor_id(self: PFwupdDevice; vendor_id: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_vendor_ids(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_device_add_guid(self: PFwupdDevice; guid: Pgchar); cdecl; external libfwupd;
function fwupd_device_has_guid(self: PFwupdDevice; guid: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_guids(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
function fwupd_device_get_guid_default(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_add_instance_id(self: PFwupdDevice; instance_id: Pgchar); cdecl; external libfwupd;
function fwupd_device_has_instance_id(self: PFwupdDevice; instance_id: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_instance_ids(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_device_add_icon(self: PFwupdDevice; icon: Pgchar); cdecl; external libfwupd;
function fwupd_device_has_icon(self: PFwupdDevice; icon: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_device_get_icons(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
function fwupd_device_get_issues(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_device_add_issue(self: PFwupdDevice; issue: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_update_state(self: PFwupdDevice): TFwupdUpdateState; cdecl; external libfwupd;
procedure fwupd_device_set_update_state(self: PFwupdDevice; update_state: TFwupdUpdateState); cdecl; external libfwupd;
function fwupd_device_get_update_error(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_update_error(self: PFwupdDevice; update_error: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_update_message(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_update_message(self: PFwupdDevice; update_message: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_update_image(self: PFwupdDevice): Pgchar; cdecl; external libfwupd;
procedure fwupd_device_set_update_image(self: PFwupdDevice; update_image: Pgchar); cdecl; external libfwupd;
function fwupd_device_get_status(self: PFwupdDevice): TFwupdStatus; cdecl; external libfwupd;
procedure fwupd_device_set_status(self: PFwupdDevice; status: TFwupdStatus); cdecl; external libfwupd;
function fwupd_device_get_percentage(self: PFwupdDevice): Tguint; cdecl; external libfwupd;
procedure fwupd_device_set_percentage(self: PFwupdDevice; percentage: Tguint); cdecl; external libfwupd;
procedure fwupd_device_add_release(self: PFwupdDevice; release: PFwupdRelease); cdecl; external libfwupd;
function fwupd_device_get_releases(self: PFwupdDevice): PGPtrArray; cdecl; external libfwupd;
function fwupd_device_get_release_default(self: PFwupdDevice): PFwupdRelease; cdecl; external libfwupd;
function fwupd_device_compare(self1: PFwupdDevice; self2: PFwupdDevice): Tgint; cdecl; external libfwupd;
function fwupd_device_match_flags(self: PFwupdDevice; include: TFwupdDeviceFlags; exclude: TFwupdDeviceFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_device_from_variant(value: PGVariant): PFwupdDevice; cdecl; external libfwupd;
function fwupd_device_array_from_variant(value: PGVariant): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_device_array_ensure_parents(devices: PGPtrArray); cdecl; external libfwupd;
function fwupd_device_array_filter_flags(devices: PGPtrArray; include: TFwupdDeviceFlags; exclude: TFwupdDeviceFlags; error: PPGError): PGPtrArray; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:35:23 ===

function FWUPD_TYPE_DEVICE: TGType;
function FWUPD_DEVICE(obj: Pointer): PFwupdDevice;
function FWUPD_IS_DEVICE(obj: Pointer): Tgboolean;
function FWUPD_DEVICE_CLASS(klass: Pointer): PFwupdDeviceClass;
function FWUPD_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
function FWUPD_DEVICE_GET_CLASS(obj: Pointer): PFwupdDeviceClass;

implementation

function FWUPD_TYPE_DEVICE: TGType;
begin
  Result := fwupd_device_get_type;
end;

function FWUPD_DEVICE(obj: Pointer): PFwupdDevice;
begin
  Result := PFwupdDevice(g_type_check_instance_cast(obj, FWUPD_TYPE_DEVICE));
end;

function FWUPD_IS_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_DEVICE);
end;

function FWUPD_DEVICE_CLASS(klass: Pointer): PFwupdDeviceClass;
begin
  Result := PFwupdDeviceClass(g_type_check_class_cast(klass, FWUPD_TYPE_DEVICE));
end;

function FWUPD_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_DEVICE);
end;

function FWUPD_DEVICE_GET_CLASS(obj: Pointer): PFwupdDeviceClass;
begin
  Result := PFwupdDeviceClass(PGTypeInstance(obj)^.g_class);
end;




end.
