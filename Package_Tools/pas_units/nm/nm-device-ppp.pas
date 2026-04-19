unit nm_device_ppp;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_PPP_H__}
{$define __NM_DEVICE_PPP_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}

{*
 * NMDevicePpp:
 *
 * Since: 1.10
  }
type

function nm_device_ppp_get_type:TGType;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_PPP_H__  }

// === Konventiert am: 19-4-26 19:30:26 ===

function NM_TYPE_DEVICE_PPP : TGType;
function NM_DEVICE_PPP(obj : Pointer) : PNMDevicePpp;
function NM_DEVICE_PPP_CLASS(klass : Pointer) : PNMDevicePppClass;
function NM_IS_DEVICE_PPP(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_PPP_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_PPP_GET_CLASS(obj : Pointer) : PNMDevicePppClass;

implementation

function NM_TYPE_DEVICE_PPP : TGType;
  begin
    NM_TYPE_DEVICE_PPP:=nm_device_ppp_get_type;
  end;

function NM_DEVICE_PPP(obj : Pointer) : PNMDevicePpp;
begin
  Result := PNMDevicePpp(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_PPP));
end;

function NM_DEVICE_PPP_CLASS(klass : Pointer) : PNMDevicePppClass;
begin
  Result := PNMDevicePppClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_PPP));
end;

function NM_IS_DEVICE_PPP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_PPP);
end;

function NM_IS_DEVICE_PPP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_PPP);
end;

function NM_DEVICE_PPP_GET_CLASS(obj : Pointer) : PNMDevicePppClass;
begin
  Result := PNMDevicePppClass(PGTypeInstance(obj)^.g_class);
end;



end.
