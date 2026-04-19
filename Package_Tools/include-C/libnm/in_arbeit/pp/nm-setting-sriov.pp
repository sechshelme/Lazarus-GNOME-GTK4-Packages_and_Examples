
unit nm-setting-sriov;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-sriov.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-sriov.h
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
Pchar  = ^char;
Pgboolean  = ^gboolean;
PGError  = ^GError;
Pguint  = ^guint;
PGVariant  = ^GVariant;
PNMSetting  = ^NMSetting;
PNMSettingSriov  = ^NMSettingSriov;
PNMSriovEswitchEncapMode  = ^NMSriovEswitchEncapMode;
PNMSriovEswitchInlineMode  = ^NMSriovEswitchInlineMode;
PNMSriovEswitchMode  = ^NMSriovEswitchMode;
PNMSriovVF  = ^NMSriovVF;
PNMSriovVFVlanProtocol  = ^NMSriovVFVlanProtocol;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Red Hat, Inc.
  }
{$ifndef NM_SETTING_SRIOV_H}
{$define NM_SETTING_SRIOV_H}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_SRIOV : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SRIOV(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SRIOV_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_SRIOV(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_SRIOV_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SRIOV_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_SRIOV_SETTING_NAME = 'sriov';  
  NM_SETTING_SRIOV_TOTAL_VFS = 'total-vfs';  
  NM_SETTING_SRIOV_VFS = 'vfs';  
  NM_SETTING_SRIOV_AUTOPROBE_DRIVERS = 'autoprobe-drivers';  
  NM_SETTING_SRIOV_ESWITCH_MODE = 'eswitch-mode';  
  NM_SETTING_SRIOV_ESWITCH_INLINE_MODE = 'eswitch-inline-mode';  
  NM_SETTING_SRIOV_ESWITCH_ENCAP_MODE = 'eswitch-encap-mode';  
  NM_SRIOV_VF_ATTRIBUTE_MAC = 'mac';  
  NM_SRIOV_VF_ATTRIBUTE_SPOOF_CHECK = 'spoof-check';  
  NM_SRIOV_VF_ATTRIBUTE_TRUST = 'trust';  
  NM_SRIOV_VF_ATTRIBUTE_MIN_TX_RATE = 'min-tx-rate';  
  NM_SRIOV_VF_ATTRIBUTE_MAX_TX_RATE = 'max-tx-rate';  
type
{*
 * NMSriovVFVlanProtocol:
 * @NM_SRIOV_VF_VLAN_PROTOCOL_802_1Q:  use 802.1Q
 * @NM_SRIOV_VF_VLAN_PROTOCOL_802_1AD: use 802.1ad
 *
 * #NMSriovVFVlanProtocol indicates the VLAN protocol to use.
 *
 * Since: 1.14
  }

  PNMSriovVFVlanProtocol = ^TNMSriovVFVlanProtocol;
  TNMSriovVFVlanProtocol =  Longint;
  Const
    NM_SRIOV_VF_VLAN_PROTOCOL_802_1Q = 0;
    NM_SRIOV_VF_VLAN_PROTOCOL_802_1AD = 1;
;
{*
 * NMSriovEswitchMode:
 * @NM_SRIOV_ESWITCH_MODE_PRESERVE:  don't modify current eswitch mode
 * @NM_SRIOV_ESWITCH_MODE_LEGACY:    use legacy SRIOV
 * @NM_SRIOV_ESWITCH_MODE_SWITCHDEV: use switchdev mode
 *
 * Since: 1.46
  }
{< skip > }
type
  PNMSriovEswitchMode = ^TNMSriovEswitchMode;
  TNMSriovEswitchMode =  Longint;
  Const
    NM_SRIOV_ESWITCH_MODE_PRESERVE = -(1);
    NM_SRIOV_ESWITCH_MODE_UNKNOWN = -(1);
    NM_SRIOV_ESWITCH_MODE_LEGACY = 0;
    NM_SRIOV_ESWITCH_MODE_SWITCHDEV = 1;
;
{*
 * NMSriovEswitchInlineMode:
 * @NM_SRIOV_ESWITCH_INLINE_MODE_PRESERVE:  don't modify current inline-mode
 * @NM_SRIOV_ESWITCH_INLINE_MODE_NONE:      don't use inline mode
 * @NM_SRIOV_ESWITCH_INLINE_MODE_LINK:      L2 mode
 * @NM_SRIOV_ESWITCH_INLINE_MODE_NETWORK:   L3 mode
 * @NM_SRIOV_ESWITCH_INLINE_MODE_TRANSPORT: L4 mode
 *
 * Since: 1.46
  }
{< skip > }
type
  PNMSriovEswitchInlineMode = ^TNMSriovEswitchInlineMode;
  TNMSriovEswitchInlineMode =  Longint;
  Const
    NM_SRIOV_ESWITCH_INLINE_MODE_PRESERVE = -(1);
    NM_SRIOV_ESWITCH_INLINE_MODE_UNKNOWN = -(1);
    NM_SRIOV_ESWITCH_INLINE_MODE_NONE = 0;
    NM_SRIOV_ESWITCH_INLINE_MODE_LINK = 1;
    NM_SRIOV_ESWITCH_INLINE_MODE_NETWORK = 2;
    NM_SRIOV_ESWITCH_INLINE_MODE_TRANSPORT = 3;
;
{*
 * NMSriovEswitchEncapMode:
 * @NM_SRIOV_ESWITCH_ENCAP_MODE_PRESERVE: don't modify current encap-mode
 * @NM_SRIOV_ESWITCH_ENCAP_MODE_NONE: disable encapsulation mode
 * @NM_SRIOV_ESWITCH_ENCAP_MODE_BASIC: enable encapsulation mode
 *
 * Since: 1.46
  }
{< skip > }
type
  PNMSriovEswitchEncapMode = ^TNMSriovEswitchEncapMode;
  TNMSriovEswitchEncapMode =  Longint;
  Const
    NM_SRIOV_ESWITCH_ENCAP_MODE_PRESERVE = -(1);
    NM_SRIOV_ESWITCH_ENCAP_MODE_UNKNOWN = -(1);
    NM_SRIOV_ESWITCH_ENCAP_MODE_NONE = 0;
    NM_SRIOV_ESWITCH_ENCAP_MODE_BASIC = 1;
;

function nm_setting_sriov_get_type:TGType;cdecl;external;
function nm_setting_sriov_new:PNMSetting;cdecl;external;
function nm_setting_sriov_get_total_vfs(setting:PNMSettingSriov):Tguint;cdecl;external;
function nm_setting_sriov_get_num_vfs(setting:PNMSettingSriov):Tguint;cdecl;external;
function nm_setting_sriov_get_vf(setting:PNMSettingSriov; idx:Tguint):PNMSriovVF;cdecl;external;
procedure nm_setting_sriov_add_vf(setting:PNMSettingSriov; vf:PNMSriovVF);cdecl;external;
procedure nm_setting_sriov_remove_vf(setting:PNMSettingSriov; idx:Tguint);cdecl;external;
function nm_setting_sriov_remove_vf_by_index(setting:PNMSettingSriov; index:Tguint):Tgboolean;cdecl;external;
procedure nm_setting_sriov_clear_vfs(setting:PNMSettingSriov);cdecl;external;
function nm_setting_sriov_get_autoprobe_drivers(setting:PNMSettingSriov):TNMTernary;cdecl;external;
function nm_setting_sriov_get_eswitch_mode(setting:PNMSettingSriov):TNMSriovEswitchMode;cdecl;external;
function nm_setting_sriov_get_eswitch_inline_mode(setting:PNMSettingSriov):TNMSriovEswitchInlineMode;cdecl;external;
function nm_setting_sriov_get_eswitch_encap_mode(setting:PNMSettingSriov):TNMSriovEswitchEncapMode;cdecl;external;
function nm_sriov_vf_add_vlan(vf:PNMSriovVF; vlan_id:Tguint):Tgboolean;cdecl;external;
function nm_sriov_vf_remove_vlan(vf:PNMSriovVF; vlan_id:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_sriov_vf_get_vlan_ids(vf:PNMSriovVF; length:Pguint):Pguint;cdecl;external;
procedure nm_sriov_vf_set_vlan_qos(vf:PNMSriovVF; vlan_id:Tguint; qos:Tguint32);cdecl;external;
procedure nm_sriov_vf_set_vlan_protocol(vf:PNMSriovVF; vlan_id:Tguint; protocol:TNMSriovVFVlanProtocol);cdecl;external;
(* Const before type ignored *)
function nm_sriov_vf_get_vlan_qos(vf:PNMSriovVF; vlan_id:Tguint):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_sriov_vf_get_vlan_protocol(vf:PNMSriovVF; vlan_id:Tguint):TNMSriovVFVlanProtocol;cdecl;external;
function nm_sriov_vf_get_type:TGType;cdecl;external;
function nm_sriov_vf_new(index:Tguint):PNMSriovVF;cdecl;external;
procedure nm_sriov_vf_ref(vf:PNMSriovVF);cdecl;external;
procedure nm_sriov_vf_unref(vf:PNMSriovVF);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_sriov_vf_equal(vf:PNMSriovVF; other:PNMSriovVF):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_sriov_vf_dup(vf:PNMSriovVF):PNMSriovVF;cdecl;external;
(* Const before type ignored *)
function nm_sriov_vf_get_index(vf:PNMSriovVF):Tguint;cdecl;external;
(* Const before type ignored *)
procedure nm_sriov_vf_set_attribute(vf:PNMSriovVF; name:Pchar; value:PGVariant);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_sriov_vf_get_attribute_names(vf:PNMSriovVF):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_sriov_vf_get_attribute(vf:PNMSriovVF; name:Pchar):PGVariant;cdecl;external;
(* Const before type ignored *)
function nm_sriov_vf_attribute_validate(name:Pchar; value:PGVariant; known:Pgboolean; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ NM_SETTING_SRIOV_H  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_SRIOV : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_SRIOV:=nm_setting_sriov_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SRIOV(obj : longint) : longint;
begin
  NM_SETTING_SRIOV:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_SRIOV,NMSettingSriov);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SRIOV_CLASS(klass : longint) : longint;
begin
  NM_SETTING_SRIOV_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_SRIOV,NMSettingSriovClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_SRIOV(obj : longint) : longint;
begin
  NM_IS_SETTING_SRIOV:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_SRIOV);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_SRIOV_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_SRIOV_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_SRIOV);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_SRIOV_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_SRIOV_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_SRIOV,NMSettingSriovClass);
end;


end.
