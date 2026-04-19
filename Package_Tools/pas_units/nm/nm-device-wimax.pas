unit nm_device_wimax;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 - 2012 Red Hat, Inc.
 * Copyright (C) 2009 Novell, Inc.
  }
{$ifndef __NM_DEVICE_WIMAX_H__}
{$define __NM_DEVICE_WIMAX_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_WIMAX_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_WIMAX_ACTIVE_NSP = 'active-nsp';  
  NM_DEVICE_WIMAX_CENTER_FREQUENCY = 'center-frequency';  
  NM_DEVICE_WIMAX_RSSI = 'rssi';  
  NM_DEVICE_WIMAX_CINR = 'cinr';  
  NM_DEVICE_WIMAX_TX_POWER = 'tx-power';  
  NM_DEVICE_WIMAX_BSID = 'bsid';  
  NM_DEVICE_WIMAX_NSPS = 'nsps';  
{*
 * NMDeviceWimax:
 *
 * Deprecated: 1.22: WiMAX is no longer supported by NetworkManager since 1.2.0.
  }
type
{xxxx NM_DEPRECATED_IN__1_2 }

function nm_device_wimax_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_hw_address(wimax:PNMDeviceWimax):Pchar;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_active_nsp(wimax:PNMDeviceWimax):PNMWimaxNsp;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_nsp_by_path(wimax:PNMDeviceWimax; path:Pchar):PNMWimaxNsp;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_nsps(wimax:PNMDeviceWimax):PGPtrArray;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_center_frequency(self:PNMDeviceWimax):Tguint;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_rssi(self:PNMDeviceWimax):longint;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_cinr(self:PNMDeviceWimax):longint;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_tx_power(self:PNMDeviceWimax):longint;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_bsid(self:PNMDeviceWimax):Pchar;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_WIMAX_H__  }

// === Konventiert am: 19-4-26 19:29:52 ===

function NM_TYPE_DEVICE_WIMAX : TGType;
function NM_DEVICE_WIMAX(obj : Pointer) : PNMDeviceWimax;
function NM_DEVICE_WIMAX_CLASS(klass : Pointer) : PNMDeviceWimaxClass;
function NM_IS_DEVICE_WIMAX(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_WIMAX_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_WIMAX_GET_CLASS(obj : Pointer) : PNMDeviceWimaxClass;

implementation

function NM_TYPE_DEVICE_WIMAX : TGType;
  begin
    NM_TYPE_DEVICE_WIMAX:=nm_device_wimax_get_type;
  end;

function NM_DEVICE_WIMAX(obj : Pointer) : PNMDeviceWimax;
begin
  Result := PNMDeviceWimax(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_WIMAX));
end;

function NM_DEVICE_WIMAX_CLASS(klass : Pointer) : PNMDeviceWimaxClass;
begin
  Result := PNMDeviceWimaxClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_WIMAX));
end;

function NM_IS_DEVICE_WIMAX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_WIMAX);
end;

function NM_IS_DEVICE_WIMAX_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_WIMAX);
end;

function NM_DEVICE_WIMAX_GET_CLASS(obj : Pointer) : PNMDeviceWimaxClass;
begin
  Result := PNMDeviceWimaxClass(PGTypeInstance(obj)^.g_class);
end;



end.
