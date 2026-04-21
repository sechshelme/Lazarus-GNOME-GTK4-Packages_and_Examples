unit nm_setting_serial;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_SERIAL_H__}
{$define __NM_SETTING_SERIAL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_SERIAL_SETTING_NAME = 'serial';  
{*
 * NMSettingSerialParity:
 * @NM_SETTING_SERIAL_PARITY_NONE: No parity bits (default)
 * @NM_SETTING_SERIAL_PARITY_EVEN: Even parity
 * @NM_SETTING_SERIAL_PARITY_ODD: Odd parity
 *
 * The parity setting of a serial port.
  }
type
  PNMSettingSerialParity = ^TNMSettingSerialParity;
  TNMSettingSerialParity =  Longint;
  Const
    NM_SETTING_SERIAL_PARITY_NONE = 0;
    NM_SETTING_SERIAL_PARITY_EVEN = 1;
    NM_SETTING_SERIAL_PARITY_ODD = 2;
;
  NM_SETTING_SERIAL_BAUD = 'baud';  
  NM_SETTING_SERIAL_BITS = 'bits';  
  NM_SETTING_SERIAL_PARITY = 'parity';  
  NM_SETTING_SERIAL_STOPBITS = 'stopbits';  
  NM_SETTING_SERIAL_SEND_DELAY = 'send-delay';  
type

function nm_setting_serial_get_type:TGType;cdecl;external libnm;
function nm_setting_serial_new:PNMSetting;cdecl;external libnm;
function nm_setting_serial_get_baud(setting:PNMSettingSerial):Tguint;cdecl;external libnm;
function nm_setting_serial_get_bits(setting:PNMSettingSerial):Tguint;cdecl;external libnm;
function nm_setting_serial_get_parity(setting:PNMSettingSerial):TNMSettingSerialParity;cdecl;external libnm;
function nm_setting_serial_get_stopbits(setting:PNMSettingSerial):Tguint;cdecl;external libnm;
function nm_setting_serial_get_send_delay(setting:PNMSettingSerial):Tguint64;cdecl;external libnm;
{$endif}
{ __NM_SETTING_SERIAL_H__  }

// === Konventiert am: 19-4-26 19:25:15 ===

function NM_TYPE_SETTING_SERIAL : TGType;
function NM_SETTING_SERIAL(obj : Pointer) : PNMSettingSerial;
function NM_SETTING_SERIAL_CLASS(klass : Pointer) : PNMSettingSerialClass;
function NM_IS_SETTING_SERIAL(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_SERIAL_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_SERIAL_GET_CLASS(obj : Pointer) : PNMSettingSerialClass;

implementation

function NM_TYPE_SETTING_SERIAL : TGType;
  begin
    NM_TYPE_SETTING_SERIAL:=nm_setting_serial_get_type;
  end;

function NM_SETTING_SERIAL(obj : Pointer) : PNMSettingSerial;
begin
  Result := PNMSettingSerial(g_type_check_instance_cast(obj, NM_TYPE_SETTING_SERIAL));
end;

function NM_SETTING_SERIAL_CLASS(klass : Pointer) : PNMSettingSerialClass;
begin
  Result := PNMSettingSerialClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_SERIAL));
end;

function NM_IS_SETTING_SERIAL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_SERIAL);
end;

function NM_IS_SETTING_SERIAL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_SERIAL);
end;

function NM_SETTING_SERIAL_GET_CLASS(obj : Pointer) : PNMSettingSerialClass;
begin
  Result := PNMSettingSerialClass(PGTypeInstance(obj)^.g_class);
end;



end.
