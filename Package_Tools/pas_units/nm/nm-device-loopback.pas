unit nm_device_loopback;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2022 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_LOOPBACK_H__}
{$define __NM_DEVICE_LOOPBACK_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{*
 * NMDeviceLoopback:
 *
 * Since: 1.42
  }
type

function nm_device_loopback_get_type:TGType;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_LOOPBACK_H__  }

// === Konventiert am: 19-4-26 19:30:52 ===

function NM_TYPE_DEVICE_LOOPBACK : TGType;
function NM_DEVICE_LOOPBACK(obj : Pointer) : PNMDeviceLoopback;
function NM_DEVICE_LOOPBACK_CLASS(klass : Pointer) : PNMDeviceLoopbackClass;
function NM_IS_DEVICE_LOOPBACK(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_LOOPBACK_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_LOOPBACK_GET_CLASS(obj : Pointer) : PNMDeviceLoopbackClass;

implementation

function NM_TYPE_DEVICE_LOOPBACK : TGType;
  begin
    NM_TYPE_DEVICE_LOOPBACK:=nm_device_loopback_get_type;
  end;

function NM_DEVICE_LOOPBACK(obj : Pointer) : PNMDeviceLoopback;
begin
  Result := PNMDeviceLoopback(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_LOOPBACK));
end;

function NM_DEVICE_LOOPBACK_CLASS(klass : Pointer) : PNMDeviceLoopbackClass;
begin
  Result := PNMDeviceLoopbackClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_LOOPBACK));
end;

function NM_IS_DEVICE_LOOPBACK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_LOOPBACK);
end;

function NM_IS_DEVICE_LOOPBACK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_LOOPBACK);
end;

function NM_DEVICE_LOOPBACK_GET_CLASS(obj : Pointer) : PNMDeviceLoopbackClass;
begin
  Result := PNMDeviceLoopbackClass(PGTypeInstance(obj)^.g_class);
end;



end.
