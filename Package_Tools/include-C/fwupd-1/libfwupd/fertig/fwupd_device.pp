
unit fwupd_device;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_device.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_device.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PFwupdDevice  = ^FwupdDevice;
PFwupdDeviceClass  = ^FwupdDeviceClass;
PFwupdRelease  = ^FwupdRelease;
Pgchar  = ^gchar;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2015 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "fwupd-enums.h"}
{$include "fwupd-release.h"}
{$include "fwupd-request.h"}

{ was #define dname def_expr }
function FWUPD_TYPE_DEVICE : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE(FwupdDevice, fwupd_device, FWUPD, DEVICE, GObject) }
{< private > }
type
  PFwupdDeviceClass = ^TFwupdDeviceClass;
  TFwupdDeviceClass = record
      parent_class : TGObjectClass;
      _fwupd_reserved1 : procedure ;cdecl;
      _fwupd_reserved2 : procedure ;cdecl;
      _fwupd_reserved3 : procedure ;cdecl;
      _fwupd_reserved4 : procedure ;cdecl;
      _fwupd_reserved5 : procedure ;cdecl;
      _fwupd_reserved6 : procedure ;cdecl;
      _fwupd_reserved7 : procedure ;cdecl;
    end;


function fwupd_device_new:PFwupdDevice;cdecl;external;
function fwupd_device_to_string(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_id(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_id(self:PFwupdDevice; id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_parent_id(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_parent_id(self:PFwupdDevice; parent_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_composite_id(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_composite_id(self:PFwupdDevice; composite_id:Pgchar);cdecl;external;
function fwupd_device_get_root(self:PFwupdDevice):PFwupdDevice;cdecl;external;
function fwupd_device_get_parent(self:PFwupdDevice):PFwupdDevice;cdecl;external;
procedure fwupd_device_set_parent(self:PFwupdDevice; parent:PFwupdDevice);cdecl;external;
procedure fwupd_device_add_child(self:PFwupdDevice; child:PFwupdDevice);cdecl;external;
procedure fwupd_device_remove_child(self:PFwupdDevice; child:PFwupdDevice);cdecl;external;
function fwupd_device_get_children(self:PFwupdDevice):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_name(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_name(self:PFwupdDevice; name:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_serial(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_serial(self:PFwupdDevice; serial:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_summary(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_summary(self:PFwupdDevice; summary:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_branch(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_branch(self:PFwupdDevice; branch:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_description(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_description(self:PFwupdDevice; description:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_version(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_version(self:PFwupdDevice; version:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_version_lowest(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_version_lowest(self:PFwupdDevice; version_lowest:Pgchar);cdecl;external;
function fwupd_device_get_version_lowest_raw(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_version_lowest_raw(self:PFwupdDevice; version_lowest_raw:Tguint64);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_version_bootloader(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_version_bootloader(self:PFwupdDevice; version_bootloader:Pgchar);cdecl;external;
function fwupd_device_get_version_bootloader_raw(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_version_bootloader_raw(self:PFwupdDevice; version_bootloader_raw:Tguint64);cdecl;external;
function fwupd_device_get_version_raw(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_version_raw(self:PFwupdDevice; version_raw:Tguint64);cdecl;external;
function fwupd_device_get_version_build_date(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_version_build_date(self:PFwupdDevice; version_build_date:Tguint64);cdecl;external;
function fwupd_device_get_version_format(self:PFwupdDevice):TFwupdVersionFormat;cdecl;external;
procedure fwupd_device_set_version_format(self:PFwupdDevice; version_format:TFwupdVersionFormat);cdecl;external;
function fwupd_device_get_flashes_left(self:PFwupdDevice):Tguint32;cdecl;external;
procedure fwupd_device_set_flashes_left(self:PFwupdDevice; flashes_left:Tguint32);cdecl;external;
function fwupd_device_get_battery_level(self:PFwupdDevice):Tguint32;cdecl;external;
procedure fwupd_device_set_battery_level(self:PFwupdDevice; battery_level:Tguint32);cdecl;external;
function fwupd_device_get_battery_threshold(self:PFwupdDevice):Tguint32;cdecl;external;
procedure fwupd_device_set_battery_threshold(self:PFwupdDevice; battery_threshold:Tguint32);cdecl;external;
function fwupd_device_get_install_duration(self:PFwupdDevice):Tguint32;cdecl;external;
procedure fwupd_device_set_install_duration(self:PFwupdDevice; duration:Tguint32);cdecl;external;
function fwupd_device_get_flags(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_flags(self:PFwupdDevice; flags:Tguint64);cdecl;external;
procedure fwupd_device_add_flag(self:PFwupdDevice; flag:TFwupdDeviceFlags);cdecl;external;
procedure fwupd_device_remove_flag(self:PFwupdDevice; flag:TFwupdDeviceFlags);cdecl;external;
function fwupd_device_has_flag(self:PFwupdDevice; flag:TFwupdDeviceFlags):Tgboolean;cdecl;external;
function fwupd_device_get_problems(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_problems(self:PFwupdDevice; problems:Tguint64);cdecl;external;
procedure fwupd_device_add_problem(self:PFwupdDevice; problem:TFwupdDeviceProblem);cdecl;external;
procedure fwupd_device_remove_problem(self:PFwupdDevice; problem:TFwupdDeviceProblem);cdecl;external;
function fwupd_device_has_problem(self:PFwupdDevice; problem:TFwupdDeviceProblem):Tgboolean;cdecl;external;
function fwupd_device_get_request_flags(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_request_flags(self:PFwupdDevice; request_flags:Tguint64);cdecl;external;
procedure fwupd_device_add_request_flag(self:PFwupdDevice; request_flag:TFwupdRequestFlags);cdecl;external;
procedure fwupd_device_remove_request_flag(self:PFwupdDevice; request_flag:TFwupdRequestFlags);cdecl;external;
function fwupd_device_has_request_flag(self:PFwupdDevice; request_flag:TFwupdRequestFlags):Tgboolean;cdecl;external;
function fwupd_device_get_created(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_created(self:PFwupdDevice; created:Tguint64);cdecl;external;
function fwupd_device_get_modified(self:PFwupdDevice):Tguint64;cdecl;external;
procedure fwupd_device_set_modified(self:PFwupdDevice; modified:Tguint64);cdecl;external;
function fwupd_device_get_checksums(self:PFwupdDevice):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_add_checksum(self:PFwupdDevice; checksum:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_has_checksum(self:PFwupdDevice; checksum:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_plugin(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_plugin(self:PFwupdDevice; plugin:Pgchar);cdecl;external;
{//G_DEPRECATED_FOR(fwupd_device_get_protocols) }
(* Const before type ignored *)
function fwupd_device_get_protocol(self:PFwupdDevice):Pgchar;cdecl;external;
{//G_DEPRECATED_FOR(fwupd_device_add_protocol) }
(* Const before type ignored *)
procedure fwupd_device_set_protocol(self:PFwupdDevice; protocol:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_add_protocol(self:PFwupdDevice; protocol:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_has_protocol(self:PFwupdDevice; protocol:Pgchar):Tgboolean;cdecl;external;
function fwupd_device_get_protocols(self:PFwupdDevice):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_vendor(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_vendor(self:PFwupdDevice; vendor:Pgchar);cdecl;external;
{/G_DEPRECATED_FOR(fwupd_device_get_vendor_ids) }
(* Const before type ignored *)
function fwupd_device_get_vendor_id(self:PFwupdDevice):Pgchar;cdecl;external;
{/G_DEPRECATED_FOR(fwupd_device_add_vendor_id) }
(* Const before type ignored *)
procedure fwupd_device_set_vendor_id(self:PFwupdDevice; vendor_id:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_add_vendor_id(self:PFwupdDevice; vendor_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_has_vendor_id(self:PFwupdDevice; vendor_id:Pgchar):Tgboolean;cdecl;external;
function fwupd_device_get_vendor_ids(self:PFwupdDevice):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_add_guid(self:PFwupdDevice; guid:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_has_guid(self:PFwupdDevice; guid:Pgchar):Tgboolean;cdecl;external;
function fwupd_device_get_guids(self:PFwupdDevice):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_guid_default(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_add_instance_id(self:PFwupdDevice; instance_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_has_instance_id(self:PFwupdDevice; instance_id:Pgchar):Tgboolean;cdecl;external;
function fwupd_device_get_instance_ids(self:PFwupdDevice):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_add_icon(self:PFwupdDevice; icon:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_has_icon(self:PFwupdDevice; icon:Pgchar):Tgboolean;cdecl;external;
function fwupd_device_get_icons(self:PFwupdDevice):PGPtrArray;cdecl;external;
function fwupd_device_get_issues(self:PFwupdDevice):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_add_issue(self:PFwupdDevice; issue:Pgchar);cdecl;external;
function fwupd_device_get_update_state(self:PFwupdDevice):TFwupdUpdateState;cdecl;external;
procedure fwupd_device_set_update_state(self:PFwupdDevice; update_state:TFwupdUpdateState);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_update_error(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_update_error(self:PFwupdDevice; update_error:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_update_message(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_update_message(self:PFwupdDevice; update_message:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_device_get_update_image(self:PFwupdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_device_set_update_image(self:PFwupdDevice; update_image:Pgchar);cdecl;external;
function fwupd_device_get_status(self:PFwupdDevice):TFwupdStatus;cdecl;external;
procedure fwupd_device_set_status(self:PFwupdDevice; status:TFwupdStatus);cdecl;external;
function fwupd_device_get_percentage(self:PFwupdDevice):Tguint;cdecl;external;
procedure fwupd_device_set_percentage(self:PFwupdDevice; percentage:Tguint);cdecl;external;
procedure fwupd_device_add_release(self:PFwupdDevice; release:PFwupdRelease);cdecl;external;
function fwupd_device_get_releases(self:PFwupdDevice):PGPtrArray;cdecl;external;
function fwupd_device_get_release_default(self:PFwupdDevice):PFwupdRelease;cdecl;external;
function fwupd_device_compare(self1:PFwupdDevice; self2:PFwupdDevice):Tgint;cdecl;external;
function fwupd_device_match_flags(self:PFwupdDevice; include:TFwupdDeviceFlags; exclude:TFwupdDeviceFlags):Tgboolean;cdecl;external;
function fwupd_device_from_variant(value:PGVariant):PFwupdDevice;cdecl;external;
function fwupd_device_array_from_variant(value:PGVariant):PGPtrArray;cdecl;external;
procedure fwupd_device_array_ensure_parents(devices:PGPtrArray);cdecl;external;
function fwupd_device_array_filter_flags(devices:PGPtrArray; include:TFwupdDeviceFlags; exclude:TFwupdDeviceFlags; error:PPGError):PGPtrArray;cdecl;external;

implementation

{ was #define dname def_expr }
function FWUPD_TYPE_DEVICE : longint; { return type might be wrong }
  begin
    FWUPD_TYPE_DEVICE:=fwupd_device_get_type;
  end;


end.
