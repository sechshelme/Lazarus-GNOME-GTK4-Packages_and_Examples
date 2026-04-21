unit nm_device_wifi;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2012 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_WIFI_H__}
{$define __NM_DEVICE_WIFI_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_WIFI_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_WIFI_PERMANENT_HW_ADDRESS = 'perm-hw-address';  
  NM_DEVICE_WIFI_MODE = 'mode';  
  NM_DEVICE_WIFI_BITRATE = 'bitrate';  
  NM_DEVICE_WIFI_ACTIVE_ACCESS_POINT = 'active-access-point';  
  NM_DEVICE_WIFI_CAPABILITIES = 'wireless-capabilities';  
  NM_DEVICE_WIFI_ACCESS_POINTS = 'access-points';  
  NM_DEVICE_WIFI_LAST_SCAN = 'last-scan';  
{*
 * NMDeviceWifi:
  }
type

function nm_device_wifi_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_wifi_get_hw_address(device:PNMDeviceWifi):Pchar;cdecl;external libnm;
function nm_device_wifi_get_permanent_hw_address(device:PNMDeviceWifi):Pchar;cdecl;external libnm;
function nm_device_wifi_get_mode(device:PNMDeviceWifi):TNM80211Mode;cdecl;external libnm;
function nm_device_wifi_get_bitrate(device:PNMDeviceWifi):Tguint32;cdecl;external libnm;
function nm_device_wifi_get_capabilities(device:PNMDeviceWifi):TNMDeviceWifiCapabilities;cdecl;external libnm;
function nm_device_wifi_get_active_access_point(device:PNMDeviceWifi):PNMAccessPoint;cdecl;external libnm;
function nm_device_wifi_get_access_point_by_path(device:PNMDeviceWifi; path:Pchar):PNMAccessPoint;cdecl;external libnm;
function nm_device_wifi_get_access_points(device:PNMDeviceWifi):PGPtrArray;cdecl;external libnm;
function nm_device_wifi_get_last_scan(device:PNMDeviceWifi):Tgint64;cdecl;external libnm;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_device_wifi_request_scan(device:PNMDeviceWifi; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libnm;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_device_wifi_request_scan_options(device:PNMDeviceWifi; options:PGVariant; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libnm;
procedure nm_device_wifi_request_scan_async(device:PNMDeviceWifi; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libnm;
procedure nm_device_wifi_request_scan_options_async(device:PNMDeviceWifi; options:PGVariant; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libnm;
function nm_device_wifi_request_scan_finish(device:PNMDeviceWifi; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_WIFI_H__  }

// === Konventiert am: 19-4-26 19:30:00 ===

function NM_TYPE_DEVICE_WIFI : TGType;
function NM_DEVICE_WIFI(obj : Pointer) : PNMDeviceWifi;
function NM_DEVICE_WIFI_CLASS(klass : Pointer) : PNMDeviceWifiClass;
function NM_IS_DEVICE_WIFI(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_WIFI_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_WIFI_GET_CLASS(obj : Pointer) : PNMDeviceWifiClass;

implementation

function NM_TYPE_DEVICE_WIFI : TGType;
  begin
    NM_TYPE_DEVICE_WIFI:=nm_device_wifi_get_type;
  end;

function NM_DEVICE_WIFI(obj : Pointer) : PNMDeviceWifi;
begin
  Result := PNMDeviceWifi(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_WIFI));
end;

function NM_DEVICE_WIFI_CLASS(klass : Pointer) : PNMDeviceWifiClass;
begin
  Result := PNMDeviceWifiClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_WIFI));
end;

function NM_IS_DEVICE_WIFI(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_WIFI);
end;

function NM_IS_DEVICE_WIFI_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_WIFI);
end;

function NM_DEVICE_WIFI_GET_CLASS(obj : Pointer) : PNMDeviceWifiClass;
begin
  Result := PNMDeviceWifiClass(PGTypeInstance(obj)^.g_class);
end;



end.
