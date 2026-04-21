
unit fwupd_security_attr;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_security_attr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_security_attr.h
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
PFwupdSecurityAttr  = ^FwupdSecurityAttr;
PFwupdSecurityAttrClass  = ^FwupdSecurityAttrClass;
PFwupdSecurityAttrFlags  = ^FwupdSecurityAttrFlags;
PFwupdSecurityAttrLevel  = ^FwupdSecurityAttrLevel;
PFwupdSecurityAttrResult  = ^FwupdSecurityAttrResult;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "fwupd-build.h"}
{$include "fwupd-enums.h"}

{ was #define dname def_expr }
function FWUPD_TYPE_SECURITY_ATTR : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE(FwupdSecurityAttr, fwupd_security_attr, FWUPD, SECURITY_ATTR, GObject) }
{< private > }
type
  PFwupdSecurityAttrClass = ^TFwupdSecurityAttrClass;
  TFwupdSecurityAttrClass = record
      parent_class : TGObjectClass;
      _fwupd_reserved1 : procedure ;cdecl;
      _fwupd_reserved2 : procedure ;cdecl;
      _fwupd_reserved3 : procedure ;cdecl;
      _fwupd_reserved4 : procedure ;cdecl;
      _fwupd_reserved5 : procedure ;cdecl;
      _fwupd_reserved6 : procedure ;cdecl;
      _fwupd_reserved7 : procedure ;cdecl;
    end;

{*
 * FwupdSecurityAttrFlags:
 * @FWUPD_SECURITY_ATTR_FLAG_NONE:			No flags set
 * @FWUPD_SECURITY_ATTR_FLAG_SUCCESS:			Success
 * @FWUPD_SECURITY_ATTR_FLAG_OBSOLETED:			Obsoleted by another attribute
 * @FWUPD_SECURITY_ATTR_FLAG_MISSING_DATA:		Missing data
 * @FWUPD_SECURITY_ATTR_FLAG_RUNTIME_UPDATES:		Suffix `U`
 * @FWUPD_SECURITY_ATTR_FLAG_RUNTIME_ATTESTATION:	Suffix `A`
 * @FWUPD_SECURITY_ATTR_FLAG_RUNTIME_ISSUE:		Suffix `!`
 * @FWUPD_SECURITY_ATTR_FLAG_ACTION_CONTACT_OEM:	Contact the firmware vendor for a update
 * @FWUPD_SECURITY_ATTR_FLAG_ACTION_CONFIG_FW:		Failure may be fixed by changing FW config
 * @FWUPD_SECURITY_ATTR_FLAG_ACTION_CONFIG_OS:		Failure may be fixed by changing OS config
 * @FWUPD_SECURITY_ATTR_FLAG_CAN_FIX:			The failure can be automatically fixed
 * @FWUPD_SECURITY_ATTR_FLAG_CAN_UNDO:			The fix can be automatically reverted
 *
 * The flags available for HSI attributes.
 * }

  PFwupdSecurityAttrFlags = ^TFwupdSecurityAttrFlags;
  TFwupdSecurityAttrFlags =  Longint;
  Const
    FWUPD_SECURITY_ATTR_FLAG_NONE = 0;
    FWUPD_SECURITY_ATTR_FLAG_SUCCESS = 1 shl 0;
    FWUPD_SECURITY_ATTR_FLAG_OBSOLETED = 1 shl 1;
    FWUPD_SECURITY_ATTR_FLAG_MISSING_DATA = 1 shl 2;
    FWUPD_SECURITY_ATTR_FLAG_RUNTIME_UPDATES = 1 shl 8;
    FWUPD_SECURITY_ATTR_FLAG_RUNTIME_ATTESTATION = 1 shl 9;
    FWUPD_SECURITY_ATTR_FLAG_RUNTIME_ISSUE = 1 shl 10;
    FWUPD_SECURITY_ATTR_FLAG_ACTION_CONTACT_OEM = 1 shl 11;
    FWUPD_SECURITY_ATTR_FLAG_ACTION_CONFIG_FW = 1 shl 12;
    FWUPD_SECURITY_ATTR_FLAG_ACTION_CONFIG_OS = 1 shl 13;
    FWUPD_SECURITY_ATTR_FLAG_CAN_FIX = 1 shl 14;
    FWUPD_SECURITY_ATTR_FLAG_CAN_UNDO = 1 shl 15;
;
{*
 * FwupdSecurityAttrLevel:
 * @FWUPD_SECURITY_ATTR_LEVEL_NONE:			Very few detected firmware protections
 * @FWUPD_SECURITY_ATTR_LEVEL_CRITICAL:			The most basic of security protections
 * @FWUPD_SECURITY_ATTR_LEVEL_IMPORTANT:		Firmware security issues considered
 *important
 * @FWUPD_SECURITY_ATTR_LEVEL_THEORETICAL:		Firmware security issues that pose a
 *theoretical concern
 * @FWUPD_SECURITY_ATTR_LEVEL_SYSTEM_PROTECTION:	Out-of-band protection of the system
 *firmware
 * @FWUPD_SECURITY_ATTR_LEVEL_SYSTEM_ATTESTATION:	Out-of-band attestation of the system
 *firmware
 *
 * The HSI level.
 * }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{< private > }
{ perhaps increased in the future  }
type
  PFwupdSecurityAttrLevel = ^TFwupdSecurityAttrLevel;
  TFwupdSecurityAttrLevel =  Longint;
  Const
    FWUPD_SECURITY_ATTR_LEVEL_NONE = 0;
    FWUPD_SECURITY_ATTR_LEVEL_CRITICAL = 1;
    FWUPD_SECURITY_ATTR_LEVEL_IMPORTANT = 2;
    FWUPD_SECURITY_ATTR_LEVEL_THEORETICAL = 3;
    FWUPD_SECURITY_ATTR_LEVEL_SYSTEM_PROTECTION = 4;
    FWUPD_SECURITY_ATTR_LEVEL_SYSTEM_ATTESTATION = 5;
    FWUPD_SECURITY_ATTR_LEVEL_LAST = 6;
;
{*
 * FwupdSecurityAttrResult:
 * @FWUPD_SECURITY_ATTR_RESULT_UNKNOWN:			Not known
 * @FWUPD_SECURITY_ATTR_RESULT_ENABLED:			Enabled
 * @FWUPD_SECURITY_ATTR_RESULT_NOT_ENABLED:		Not enabled
 * @FWUPD_SECURITY_ATTR_RESULT_VALID:			Valid
 * @FWUPD_SECURITY_ATTR_RESULT_NOT_VALID:		Not valid
 * @FWUPD_SECURITY_ATTR_RESULT_LOCKED:			Locked
 * @FWUPD_SECURITY_ATTR_RESULT_NOT_LOCKED:		Not locked
 * @FWUPD_SECURITY_ATTR_RESULT_ENCRYPTED:		Encrypted
 * @FWUPD_SECURITY_ATTR_RESULT_NOT_ENCRYPTED:		Not encrypted
 * @FWUPD_SECURITY_ATTR_RESULT_TAINTED:			Tainted
 * @FWUPD_SECURITY_ATTR_RESULT_NOT_TAINTED:		Not tainted
 * @FWUPD_SECURITY_ATTR_RESULT_FOUND:			Found
 * @FWUPD_SECURITY_ATTR_RESULT_NOT_FOUND:		NOt found
 * @FWUPD_SECURITY_ATTR_RESULT_SUPPORTED:		Supported
 * @FWUPD_SECURITY_ATTR_RESULT_NOT_SUPPORTED:		Not supported
 *
 * The HSI result.
 * }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{ Since: 1.5.0  }
{< private > }
type
  PFwupdSecurityAttrResult = ^TFwupdSecurityAttrResult;
  TFwupdSecurityAttrResult =  Longint;
  Const
    FWUPD_SECURITY_ATTR_RESULT_UNKNOWN = 0;
    FWUPD_SECURITY_ATTR_RESULT_ENABLED = 1;
    FWUPD_SECURITY_ATTR_RESULT_NOT_ENABLED = 2;
    FWUPD_SECURITY_ATTR_RESULT_VALID = 3;
    FWUPD_SECURITY_ATTR_RESULT_NOT_VALID = 4;
    FWUPD_SECURITY_ATTR_RESULT_LOCKED = 5;
    FWUPD_SECURITY_ATTR_RESULT_NOT_LOCKED = 6;
    FWUPD_SECURITY_ATTR_RESULT_ENCRYPTED = 7;
    FWUPD_SECURITY_ATTR_RESULT_NOT_ENCRYPTED = 8;
    FWUPD_SECURITY_ATTR_RESULT_TAINTED = 9;
    FWUPD_SECURITY_ATTR_RESULT_NOT_TAINTED = 10;
    FWUPD_SECURITY_ATTR_RESULT_FOUND = 11;
    FWUPD_SECURITY_ATTR_RESULT_NOT_FOUND = 12;
    FWUPD_SECURITY_ATTR_RESULT_SUPPORTED = 13;
    FWUPD_SECURITY_ATTR_RESULT_NOT_SUPPORTED = 14;
    FWUPD_SECURITY_ATTR_RESULT_LAST = 15;
;
(* Const before type ignored *)

function fwupd_security_attr_new(appstream_id:Pgchar):PFwupdSecurityAttr;cdecl;external;
function fwupd_security_attr_to_string(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_bios_setting_id(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_bios_setting_id(self:PFwupdSecurityAttr; id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_bios_setting_target_value(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_bios_setting_target_value(self:PFwupdSecurityAttr; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_bios_setting_current_value(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_bios_setting_current_value(self:PFwupdSecurityAttr; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_kernel_current_value(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_kernel_current_value(self:PFwupdSecurityAttr; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_kernel_target_value(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_kernel_target_value(self:PFwupdSecurityAttr; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_appstream_id(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_appstream_id(self:PFwupdSecurityAttr; appstream_id:Pgchar);cdecl;external;
function fwupd_security_attr_get_level(self:PFwupdSecurityAttr):TFwupdSecurityAttrLevel;cdecl;external;
procedure fwupd_security_attr_set_level(self:PFwupdSecurityAttr; level:TFwupdSecurityAttrLevel);cdecl;external;
function fwupd_security_attr_get_result(self:PFwupdSecurityAttr):TFwupdSecurityAttrResult;cdecl;external;
procedure fwupd_security_attr_set_result(self:PFwupdSecurityAttr; result:TFwupdSecurityAttrResult);cdecl;external;
function fwupd_security_attr_get_result_fallback(self:PFwupdSecurityAttr):TFwupdSecurityAttrResult;cdecl;external;
procedure fwupd_security_attr_set_result_fallback(self:PFwupdSecurityAttr; result:TFwupdSecurityAttrResult);cdecl;external;
function fwupd_security_attr_get_result_success(self:PFwupdSecurityAttr):TFwupdSecurityAttrResult;cdecl;external;
procedure fwupd_security_attr_set_result_success(self:PFwupdSecurityAttr; result:TFwupdSecurityAttrResult);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_name(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_name(self:PFwupdSecurityAttr; name:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_title(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_title(self:PFwupdSecurityAttr; title:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_description(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_description(self:PFwupdSecurityAttr; description:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_plugin(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_plugin(self:PFwupdSecurityAttr; plugin:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_get_url(self:PFwupdSecurityAttr):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_set_url(self:PFwupdSecurityAttr; url:Pgchar);cdecl;external;
function fwupd_security_attr_get_created(self:PFwupdSecurityAttr):Tguint64;cdecl;external;
procedure fwupd_security_attr_set_created(self:PFwupdSecurityAttr; created:Tguint64);cdecl;external;
function fwupd_security_attr_get_obsoletes(self:PFwupdSecurityAttr):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_add_obsolete(self:PFwupdSecurityAttr; appstream_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_has_obsolete(self:PFwupdSecurityAttr; appstream_id:Pgchar):Tgboolean;cdecl;external;
function fwupd_security_attr_get_guids(self:PFwupdSecurityAttr):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_security_attr_add_guid(self:PFwupdSecurityAttr; guid:Pgchar);cdecl;external;
procedure fwupd_security_attr_add_guids(self:PFwupdSecurityAttr; guids:PGPtrArray);cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_has_guid(self:PFwupdSecurityAttr; guid:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fwupd_security_attr_get_metadata(self:PFwupdSecurityAttr; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_security_attr_add_metadata(self:PFwupdSecurityAttr; key:Pgchar; value:Pgchar);cdecl;external;
function fwupd_security_attr_get_flags(self:PFwupdSecurityAttr):TFwupdSecurityAttrFlags;cdecl;external;
procedure fwupd_security_attr_set_flags(self:PFwupdSecurityAttr; flags:TFwupdSecurityAttrFlags);cdecl;external;
procedure fwupd_security_attr_add_flag(self:PFwupdSecurityAttr; flag:TFwupdSecurityAttrFlags);cdecl;external;
procedure fwupd_security_attr_remove_flag(self:PFwupdSecurityAttr; flag:TFwupdSecurityAttrFlags);cdecl;external;
function fwupd_security_attr_has_flag(self:PFwupdSecurityAttr; flag:TFwupdSecurityAttrFlags):Tgboolean;cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_flag_to_string(flag:TFwupdSecurityAttrFlags):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_flag_from_string(flag:Pgchar):TFwupdSecurityAttrFlags;cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_flag_to_suffix(flag:TFwupdSecurityAttrFlags):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_result_to_string(result:TFwupdSecurityAttrResult):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_security_attr_result_from_string(result:Pgchar):TFwupdSecurityAttrResult;cdecl;external;
function fwupd_security_attr_from_variant(value:PGVariant):PFwupdSecurityAttr;cdecl;external;
function fwupd_security_attr_array_from_variant(value:PGVariant):PGPtrArray;cdecl;external;

implementation

{ was #define dname def_expr }
function FWUPD_TYPE_SECURITY_ATTR : longint; { return type might be wrong }
  begin
    FWUPD_TYPE_SECURITY_ATTR:=fwupd_security_attr_get_type;
  end;


end.
