
unit nm-device-wifi;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-wifi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-wifi.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PGVariant  = ^GVariant;
PNMAccessPoint  = ^NMAccessPoint;
PNMDeviceWifi  = ^NMDeviceWifi;
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

{ was #define dname def_expr }
function NM_TYPE_DEVICE_WIFI : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIFI(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIFI_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_GET_CLASS(obj : longint) : longint;

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

function nm_device_wifi_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_wifi_get_hw_address(device:PNMDeviceWifi):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_wifi_get_permanent_hw_address(device:PNMDeviceWifi):Pchar;cdecl;external;
function nm_device_wifi_get_mode(device:PNMDeviceWifi):TNM80211Mode;cdecl;external;
function nm_device_wifi_get_bitrate(device:PNMDeviceWifi):Tguint32;cdecl;external;
function nm_device_wifi_get_capabilities(device:PNMDeviceWifi):TNMDeviceWifiCapabilities;cdecl;external;
function nm_device_wifi_get_active_access_point(device:PNMDeviceWifi):PNMAccessPoint;cdecl;external;
(* Const before type ignored *)
function nm_device_wifi_get_access_point_by_path(device:PNMDeviceWifi; path:Pchar):PNMAccessPoint;cdecl;external;
(* Const before type ignored *)
function nm_device_wifi_get_access_points(device:PNMDeviceWifi):PGPtrArray;cdecl;external;
function nm_device_wifi_get_last_scan(device:PNMDeviceWifi):Tgint64;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_device_wifi_request_scan(device:PNMDeviceWifi; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_device_wifi_request_scan_options(device:PNMDeviceWifi; options:PGVariant; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_device_wifi_request_scan_async(device:PNMDeviceWifi; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure nm_device_wifi_request_scan_options_async(device:PNMDeviceWifi; options:PGVariant; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_device_wifi_request_scan_finish(device:PNMDeviceWifi; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __NM_DEVICE_WIFI_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_WIFI : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_WIFI:=nm_device_wifi_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI(obj : longint) : longint;
begin
  NM_DEVICE_WIFI:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_WIFI,NMDeviceWifi);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_WIFI_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_WIFI,NMDeviceWifiClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIFI(obj : longint) : longint;
begin
  NM_IS_DEVICE_WIFI:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_WIFI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIFI_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_WIFI_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_WIFI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_WIFI_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_WIFI,NMDeviceWifiClass);
end;


end.
