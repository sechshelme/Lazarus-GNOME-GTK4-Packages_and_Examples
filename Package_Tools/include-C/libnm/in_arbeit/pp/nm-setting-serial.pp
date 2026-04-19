
unit nm-setting-serial;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-serial.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-serial.h
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
PNMSetting  = ^NMSetting;
PNMSettingSerial  = ^NMSettingSerial;
PNMSettingSerialParity  = ^NMSettingSerialParity;
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

{ was #define dname def_expr }
function NM_TYPE_SETTING_SERIAL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SERIAL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SERIAL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_SERIAL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_SERIAL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SERIAL_GET_CLASS(obj : longint) : longint;

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

function nm_setting_serial_get_type:TGType;cdecl;external;
function nm_setting_serial_new:PNMSetting;cdecl;external;
function nm_setting_serial_get_baud(setting:PNMSettingSerial):Tguint;cdecl;external;
function nm_setting_serial_get_bits(setting:PNMSettingSerial):Tguint;cdecl;external;
function nm_setting_serial_get_parity(setting:PNMSettingSerial):TNMSettingSerialParity;cdecl;external;
function nm_setting_serial_get_stopbits(setting:PNMSettingSerial):Tguint;cdecl;external;
function nm_setting_serial_get_send_delay(setting:PNMSettingSerial):Tguint64;cdecl;external;
{$endif}
{ __NM_SETTING_SERIAL_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_SERIAL : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_SERIAL:=nm_setting_serial_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SERIAL(obj : longint) : longint;
begin
  NM_SETTING_SERIAL:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_SERIAL,NMSettingSerial);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SERIAL_CLASS(klass : longint) : longint;
begin
  NM_SETTING_SERIAL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_SERIAL,NMSettingSerialClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_SERIAL(obj : longint) : longint;
begin
  NM_IS_SETTING_SERIAL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_SERIAL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_SERIAL_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_SERIAL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_SERIAL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SERIAL_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_SERIAL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_SERIAL,NMSettingSerialClass);
end;


end.
