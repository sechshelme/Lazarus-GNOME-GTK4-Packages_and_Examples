unit nm_setting_macsec;

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
{$ifndef __NM_SETTING_MACSEC_H__}
{$define __NM_SETTING_MACSEC_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_MACSEC_SETTING_NAME = 'macsec';  
  NM_SETTING_MACSEC_PARENT = 'parent';  
  NM_SETTING_MACSEC_MODE = 'mode';  
  NM_SETTING_MACSEC_ENCRYPT = 'encrypt';  
  NM_SETTING_MACSEC_MKA_CAK = 'mka-cak';  
  NM_SETTING_MACSEC_MKA_CAK_FLAGS = 'mka-cak-flags';  
  NM_SETTING_MACSEC_MKA_CKN = 'mka-ckn';  
  NM_SETTING_MACSEC_PORT = 'port';  
  NM_SETTING_MACSEC_VALIDATION = 'validation';  
  NM_SETTING_MACSEC_SEND_SCI = 'send-sci';  
  NM_SETTING_MACSEC_OFFLOAD = 'offload';  
type
{*
 * NMSettingMacsecMode:
 * @NM_SETTING_MACSEC_MODE_PSK: The CAK is pre-shared
 * @NM_SETTING_MACSEC_MODE_EAP: The CAK is the result of participation in EAP
 *
 * #NMSettingMacsecMode controls how the CAK (Connectivity Association Key) used
 * in MKA (MACsec Key Agreement) is obtained.
 *
 * Since: 1.6
  }

  PNMSettingMacsecMode = ^TNMSettingMacsecMode;
  TNMSettingMacsecMode =  Longint;
  Const
    NM_SETTING_MACSEC_MODE_PSK = 0;
    NM_SETTING_MACSEC_MODE_EAP = 1;
;
{*
 * NMSettingMacsecValidation:
 * @NM_SETTING_MACSEC_VALIDATION_DISABLE: All incoming frames are accepted if
 *   possible
 * @NM_SETTING_MACSEC_VALIDATION_CHECK: Non protected, invalid, or impossible to
 *   verify frames are accepted and counted as "invalid"
 * @NM_SETTING_MACSEC_VALIDATION_STRICT: Non protected, invalid, or impossible to
 *   verify frames are dropped
 *
 * #NMSettingMacsecValidation specifies a validation mode for incoming frames.
 *
 * Since: 1.6
  }
type
  PNMSettingMacsecValidation = ^TNMSettingMacsecValidation;
  TNMSettingMacsecValidation =  Longint;
  Const
    NM_SETTING_MACSEC_VALIDATION_DISABLE = 0;
    NM_SETTING_MACSEC_VALIDATION_CHECK = 1;
    NM_SETTING_MACSEC_VALIDATION_STRICT = 2;
;
  NM_SETTING_MACSEC_MKA_CAK_LENGTH = 32;  
{ Deprecated. The CKN can be between 2 and 64 characters.  }
  NM_SETTING_MACSEC_MKA_CKN_LENGTH = 64;  
{*
 * NMSettingMacsecOffload:
 * @NM_SETTING_MACSEC_OFFLOAD_DEFAULT: use the global default; disable if not defined
 * @NM_SETTING_MACSEC_OFFLOAD_OFF: disable offload
 * @NM_SETTING_MACSEC_OFFLOAD_PHY: request offload to the PHY
 * @NM_SETTING_MACSEC_OFFLOAD_MAC: request offload to the MAC
 *
 * These flags control the MACsec offload mode.
 *
 * Since: 1.46
 * }
type
  PNMSettingMacsecOffload = ^TNMSettingMacsecOffload;
  TNMSettingMacsecOffload =  Longint;
  Const
    NM_SETTING_MACSEC_OFFLOAD_DEFAULT = -(1);
    NM_SETTING_MACSEC_OFFLOAD_OFF = 0;
    NM_SETTING_MACSEC_OFFLOAD_PHY = 1;
    NM_SETTING_MACSEC_OFFLOAD_MAC = 2;
;

function nm_setting_macsec_get_type:TGType;cdecl;external libnm;
function nm_setting_macsec_new:PNMSetting;cdecl;external libnm;
function nm_setting_macsec_get_parent(setting:PNMSettingMacsec):Pchar;cdecl;external libnm;
function nm_setting_macsec_get_mode(setting:PNMSettingMacsec):TNMSettingMacsecMode;cdecl;external libnm;
function nm_setting_macsec_get_encrypt(setting:PNMSettingMacsec):Tgboolean;cdecl;external libnm;
function nm_setting_macsec_get_mka_cak(setting:PNMSettingMacsec):Pchar;cdecl;external libnm;
function nm_setting_macsec_get_mka_cak_flags(setting:PNMSettingMacsec):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_macsec_get_mka_ckn(setting:PNMSettingMacsec):Pchar;cdecl;external libnm;
function nm_setting_macsec_get_port(setting:PNMSettingMacsec):longint;cdecl;external libnm;
function nm_setting_macsec_get_validation(setting:PNMSettingMacsec):TNMSettingMacsecValidation;cdecl;external libnm;
function nm_setting_macsec_get_send_sci(setting:PNMSettingMacsec):Tgboolean;cdecl;external libnm;
function nm_setting_macsec_get_offload(setting:PNMSettingMacsec):TNMSettingMacsecOffload;cdecl;external libnm;
{$endif}
{ __NM_SETTING_MACSEC_H__  }

// === Konventiert am: 19-4-26 19:26:17 ===

function NM_TYPE_SETTING_MACSEC : TGType;
function NM_SETTING_MACSEC(obj : Pointer) : PNMSettingMacsec;
function NM_SETTING_MACSEC_CLASS(klass : Pointer) : PNMSettingMacsecClass;
function NM_IS_SETTING_MACSEC(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_MACSEC_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_MACSEC_GET_CLASS(obj : Pointer) : PNMSettingMacsecClass;

implementation

function NM_TYPE_SETTING_MACSEC : TGType;
  begin
    NM_TYPE_SETTING_MACSEC:=nm_setting_macsec_get_type;
  end;

function NM_SETTING_MACSEC(obj : Pointer) : PNMSettingMacsec;
begin
  Result := PNMSettingMacsec(g_type_check_instance_cast(obj, NM_TYPE_SETTING_MACSEC));
end;

function NM_SETTING_MACSEC_CLASS(klass : Pointer) : PNMSettingMacsecClass;
begin
  Result := PNMSettingMacsecClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_MACSEC));
end;

function NM_IS_SETTING_MACSEC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_MACSEC);
end;

function NM_IS_SETTING_MACSEC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_MACSEC);
end;

function NM_SETTING_MACSEC_GET_CLASS(obj : Pointer) : PNMSettingMacsecClass;
begin
  Result := PNMSettingMacsecClass(PGTypeInstance(obj)^.g_class);
end;



end.
