unit nm_device_modem;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 - 2012 Red Hat, Inc.
 * Copyright (C) 2008 Novell, Inc.
  }
{$ifndef __NM_DEVICE_MODEM_H__}
{$define __NM_DEVICE_MODEM_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_MODEM_MODEM_CAPABILITIES = 'modem-capabilities';  
  NM_DEVICE_MODEM_CURRENT_CAPABILITIES = 'current-capabilities';  
  NM_DEVICE_MODEM_DEVICE_ID = 'device-id';  
  NM_DEVICE_MODEM_OPERATOR_CODE = 'operator-code';  
  NM_DEVICE_MODEM_APN = 'apn';  
{*
 * NMDeviceModem:
  }
type

function nm_device_modem_get_type:TGType;cdecl;external libnm;
function nm_device_modem_get_modem_capabilities(self:PNMDeviceModem):TNMDeviceModemCapabilities;cdecl;external libnm;
function nm_device_modem_get_current_capabilities(self:PNMDeviceModem):TNMDeviceModemCapabilities;cdecl;external libnm;
function nm_device_modem_get_device_id(self:PNMDeviceModem):Pchar;cdecl;external libnm;
function nm_device_modem_get_operator_code(self:PNMDeviceModem):Pchar;cdecl;external libnm;
function nm_device_modem_get_apn(self:PNMDeviceModem):Pchar;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_MODEM_H__  }

// === Konventiert am: 19-4-26 19:30:42 ===

function NM_TYPE_DEVICE_MODEM : TGType;
function NM_DEVICE_MODEM(obj : Pointer) : PNMDeviceModem;
function NM_DEVICE_MODEM_CLASS(klass : Pointer) : PNMDeviceModemClass;
function NM_IS_DEVICE_MODEM(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_MODEM_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_MODEM_GET_CLASS(obj : Pointer) : PNMDeviceModemClass;

implementation

function NM_TYPE_DEVICE_MODEM : TGType;
  begin
    NM_TYPE_DEVICE_MODEM:=nm_device_modem_get_type;
  end;

function NM_DEVICE_MODEM(obj : Pointer) : PNMDeviceModem;
begin
  Result := PNMDeviceModem(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_MODEM));
end;

function NM_DEVICE_MODEM_CLASS(klass : Pointer) : PNMDeviceModemClass;
begin
  Result := PNMDeviceModemClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_MODEM));
end;

function NM_IS_DEVICE_MODEM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_MODEM);
end;

function NM_IS_DEVICE_MODEM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_MODEM);
end;

function NM_DEVICE_MODEM_GET_CLASS(obj : Pointer) : PNMDeviceModemClass;
begin
  Result := PNMDeviceModemClass(PGTypeInstance(obj)^.g_class);
end;



end.
