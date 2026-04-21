unit nm_device_ethernet;

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
{$ifndef __NM_DEVICE_ETHERNET_H__}
{$define __NM_DEVICE_ETHERNET_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_ETHERNET_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_ETHERNET_PERMANENT_HW_ADDRESS = 'perm-hw-address';  
  NM_DEVICE_ETHERNET_SPEED = 'speed';  
  NM_DEVICE_ETHERNET_CARRIER = 'carrier';  
  NM_DEVICE_ETHERNET_S390_SUBCHANNELS = 's390-subchannels';  
{*
 * NMDeviceEthernet:
  }
type

function nm_device_ethernet_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_ethernet_get_hw_address(device:PNMDeviceEthernet):Pchar;cdecl;external libnm;
function nm_device_ethernet_get_permanent_hw_address(device:PNMDeviceEthernet):Pchar;cdecl;external libnm;
function nm_device_ethernet_get_speed(device:PNMDeviceEthernet):Tguint32;cdecl;external libnm;
function nm_device_ethernet_get_carrier(device:PNMDeviceEthernet):Tgboolean;cdecl;external libnm;
function nm_device_ethernet_get_s390_subchannels(device:PNMDeviceEthernet):^Pchar;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_ETHERNET_H__  }

// === Konventiert am: 19-4-26 19:31:07 ===

function NM_TYPE_DEVICE_ETHERNET : TGType;
function NM_DEVICE_ETHERNET(obj : Pointer) : PNMDeviceEthernet;
function NM_DEVICE_ETHERNET_CLASS(klass : Pointer) : PNMDeviceEthernetClass;
function NM_IS_DEVICE_ETHERNET(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_ETHERNET_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_ETHERNET_GET_CLASS(obj : Pointer) : PNMDeviceEthernetClass;

implementation

function NM_TYPE_DEVICE_ETHERNET : TGType;
  begin
    NM_TYPE_DEVICE_ETHERNET:=nm_device_ethernet_get_type;
  end;

function NM_DEVICE_ETHERNET(obj : Pointer) : PNMDeviceEthernet;
begin
  Result := PNMDeviceEthernet(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_ETHERNET));
end;

function NM_DEVICE_ETHERNET_CLASS(klass : Pointer) : PNMDeviceEthernetClass;
begin
  Result := PNMDeviceEthernetClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_ETHERNET));
end;

function NM_IS_DEVICE_ETHERNET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_ETHERNET);
end;

function NM_IS_DEVICE_ETHERNET_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_ETHERNET);
end;

function NM_DEVICE_ETHERNET_GET_CLASS(obj : Pointer) : PNMDeviceEthernetClass;
begin
  Result := PNMDeviceEthernetClass(PGTypeInstance(obj)^.g_class);
end;



end.
