unit nm_device_6lowpan;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_6LOWPAN_H__}
{$define __NM_DEVICE_6LOWPAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_6LOWPAN_PARENT = 'parent';  
  NM_DEVICE_6LOWPAN_HW_ADDRESS = 'hw-address';  
{*
 * NMDevice6Lowpan:
 *
 * Since: 1.14
  }
type

function nm_device_6lowpan_get_type:TGType;cdecl;external libnm;
function nm_device_6lowpan_get_parent(device:PNMDevice6Lowpan):PNMDevice;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_6LOWPAN_H__  }

// === Konventiert am: 19-4-26 19:31:25 ===

function NM_TYPE_DEVICE_6LOWPAN : TGType;
function NM_DEVICE_6LOWPAN(obj : Pointer) : PNMDevice6Lowpan;
function NM_DEVICE_6LOWPAN_CLASS(klass : Pointer) : PNMDevice6LowpanClass;
function NM_IS_DEVICE_6LOWPAN(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_6LOWPAN_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_6LOWPAN_GET_CLASS(obj : Pointer) : PNMDevice6LowpanClass;

implementation

function NM_TYPE_DEVICE_6LOWPAN : TGType;
  begin
    NM_TYPE_DEVICE_6LOWPAN:=nm_device_6lowpan_get_type;
  end;

function NM_DEVICE_6LOWPAN(obj : Pointer) : PNMDevice6Lowpan;
begin
  Result := PNMDevice6Lowpan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_6LOWPAN));
end;

function NM_DEVICE_6LOWPAN_CLASS(klass : Pointer) : PNMDevice6LowpanClass;
begin
  Result := PNMDevice6LowpanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_6LOWPAN));
end;

function NM_IS_DEVICE_6LOWPAN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_6LOWPAN);
end;

function NM_IS_DEVICE_6LOWPAN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_6LOWPAN);
end;

function NM_DEVICE_6LOWPAN_GET_CLASS(obj : Pointer) : PNMDevice6LowpanClass;
begin
  Result := PNMDevice6LowpanClass(PGTypeInstance(obj)^.g_class);
end;



end.
