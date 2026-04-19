unit nm_device_wpan;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Lubomir Rintel <lkundrak@v3.sk>
  }
{$ifndef __NM_DEVICE_WPAN_H__}
{$define __NM_DEVICE_WPAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_WPAN_HW_ADDRESS = 'hw-address';  
{*
 * NMDeviceWpan:
 *
 * Since: 1.14
  }
type

function nm_device_wpan_get_type:TGType;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_WPAN_H__  }

// === Konventiert am: 19-4-26 19:29:45 ===

function NM_TYPE_DEVICE_WPAN : TGType;
function NM_DEVICE_WPAN(obj : Pointer) : PNMDeviceWpan;
function NM_DEVICE_WPAN_CLASS(klass : Pointer) : PNMDeviceWpanClass;
function NM_IS_DEVICE_WPAN(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_WPAN_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_WPAN_GET_CLASS(obj : Pointer) : PNMDeviceWpanClass;

implementation

function NM_TYPE_DEVICE_WPAN : TGType;
  begin
    NM_TYPE_DEVICE_WPAN:=nm_device_wpan_get_type;
  end;

function NM_DEVICE_WPAN(obj : Pointer) : PNMDeviceWpan;
begin
  Result := PNMDeviceWpan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_WPAN));
end;

function NM_DEVICE_WPAN_CLASS(klass : Pointer) : PNMDeviceWpanClass;
begin
  Result := PNMDeviceWpanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_WPAN));
end;

function NM_IS_DEVICE_WPAN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_WPAN);
end;

function NM_IS_DEVICE_WPAN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_WPAN);
end;

function NM_DEVICE_WPAN_GET_CLASS(obj : Pointer) : PNMDeviceWpanClass;
begin
  Result := PNMDeviceWpanClass(PGTypeInstance(obj)^.g_class);
end;



end.
