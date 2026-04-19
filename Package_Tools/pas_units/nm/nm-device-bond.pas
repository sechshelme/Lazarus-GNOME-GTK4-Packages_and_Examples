unit nm_device_bond;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2012 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_BOND_H__}
{$define __NM_DEVICE_BOND_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_BOND_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_BOND_CARRIER = 'carrier';  
  NM_DEVICE_BOND_SLAVES = 'slaves';  
{*
 * NMDeviceBond:
  }
type

function nm_device_bond_get_type:TGType;cdecl;external libnm;
{xxxxxxNM_DEPRECATED_IN_1_24_FOR(nm_device_get_hw_address) }
function nm_device_bond_get_hw_address(device:PNMDeviceBond):Pchar;cdecl;external libnm;
function nm_device_bond_get_carrier(device:PNMDeviceBond):Tgboolean;cdecl;external libnm;
{xxxxxxNM_DEPRECATED_IN_1_34_FOR(nm_device_get_ports) }
function nm_device_bond_get_slaves(device:PNMDeviceBond):PGPtrArray;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_BOND_H__  }

// === Konventiert am: 19-4-26 19:31:19 ===

function NM_TYPE_DEVICE_BOND : TGType;
function NM_DEVICE_BOND(obj : Pointer) : PNMDeviceBond;
function NM_DEVICE_BOND_CLASS(klass : Pointer) : PNMDeviceBondClass;
function NM_IS_DEVICE_BOND(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_BOND_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_BOND_GET_CLASS(obj : Pointer) : PNMDeviceBondClass;

implementation

function NM_TYPE_DEVICE_BOND : TGType;
  begin
    NM_TYPE_DEVICE_BOND:=nm_device_bond_get_type;
  end;

function NM_DEVICE_BOND(obj : Pointer) : PNMDeviceBond;
begin
  Result := PNMDeviceBond(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_BOND));
end;

function NM_DEVICE_BOND_CLASS(klass : Pointer) : PNMDeviceBondClass;
begin
  Result := PNMDeviceBondClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_BOND));
end;

function NM_IS_DEVICE_BOND(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_BOND);
end;

function NM_IS_DEVICE_BOND_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_BOND);
end;

function NM_DEVICE_BOND_GET_CLASS(obj : Pointer) : PNMDeviceBondClass;
begin
  Result := PNMDeviceBondClass(PGTypeInstance(obj)^.g_class);
end;



end.
