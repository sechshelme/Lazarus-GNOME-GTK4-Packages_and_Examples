unit fwupd_bios_setting;

interface

uses
  fp_glib2, fp_fwupd;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 Mario Limonciello <mario.limonciello@amd.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "fwupd-build.h"}
{$include "fwupd-enums.h"}

{////G_DECLARE_DERIVABLE_TYPE(FwupdBiosSetting, fwupd_bios_setting, FWUPD, BIOS_SETTING, GObject) }
{< private > }
type
  PFwupdBiosSettingClass = ^TFwupdBiosSettingClass;
  TFwupdBiosSettingClass = record
      parent_class : TGObjectClass;
      write_value : function (self:PFwupdBiosSetting; value:Pgchar; error:PPGError):Tgboolean;cdecl;
      _fwupd_reserved2 : procedure ;cdecl;
      _fwupd_reserved3 : procedure ;cdecl;
      _fwupd_reserved4 : procedure ;cdecl;
      _fwupd_reserved5 : procedure ;cdecl;
      _fwupd_reserved6 : procedure ;cdecl;
      _fwupd_reserved7 : procedure ;cdecl;
    end;

{ special attributes  }

const
  FWUPD_BIOS_SETTING_PENDING_REBOOT = 'pending_reboot';  
  FWUPD_BIOS_SETTING_RESET_BIOS = 'reset_bios';  
  FWUPD_BIOS_SETTING_DEBUG_CMD = 'debug_cmd';  
{*
 * FwupdBiosSettingKind:
 * @FWUPD_BIOS_SETTING_KIND_UNKNOWN:		BIOS setting type is unknown
 * @FWUPD_BIOS_SETTING_KIND_ENUMERATION:		BIOS setting that has enumerated possible
 *values
 * @FWUPD_BIOS_SETTING_KIND_INTEGER:		BIOS setting that is an integer
 * @FWUPD_BIOS_SETTING_KIND_STRING:		BIOS setting that accepts a string
 *
 * The type of BIOS setting.
 * }
{ Since: 1.8.4  }
{ Since: 1.8.4  }
{ Since: 1.8.4  }
{ Since: 1.8.4  }
{< private > }
{ perhaps increased in the future  }
type
  PFwupdBiosSettingKind = ^TFwupdBiosSettingKind;
  TFwupdBiosSettingKind =  Longint;
  Const
    FWUPD_BIOS_SETTING_KIND_UNKNOWN = 0;
    FWUPD_BIOS_SETTING_KIND_ENUMERATION = 1;
    FWUPD_BIOS_SETTING_KIND_INTEGER = 2;
    FWUPD_BIOS_SETTING_KIND_STRING = 3;
    FWUPD_BIOS_SETTING_KIND_LAST = 4;
;

function fwupd_bios_setting_new(name:Pgchar; path:Pgchar):PFwupdBiosSetting;cdecl;external libfwupd;
function fwupd_bios_setting_to_string(self:PFwupdBiosSetting):Pgchar;cdecl;external libfwupd;
function fwupd_bios_setting_get_read_only(self:PFwupdBiosSetting):Tgboolean;cdecl;external libfwupd;
procedure fwupd_bios_setting_set_read_only(self:PFwupdBiosSetting; val:Tgboolean);cdecl;external libfwupd;
function fwupd_bios_setting_get_upper_bound(self:PFwupdBiosSetting):Tguint64;cdecl;external libfwupd;
function fwupd_bios_setting_get_lower_bound(self:PFwupdBiosSetting):Tguint64;cdecl;external libfwupd;
function fwupd_bios_setting_get_scalar_increment(self:PFwupdBiosSetting):Tguint64;cdecl;external libfwupd;
procedure fwupd_bios_setting_set_upper_bound(self:PFwupdBiosSetting; val:Tguint64);cdecl;external libfwupd;
procedure fwupd_bios_setting_set_lower_bound(self:PFwupdBiosSetting; val:Tguint64);cdecl;external libfwupd;
procedure fwupd_bios_setting_set_scalar_increment(self:PFwupdBiosSetting; val:Tguint64);cdecl;external libfwupd;
procedure fwupd_bios_setting_set_kind(self:PFwupdBiosSetting; _type:TFwupdBiosSettingKind);cdecl;external libfwupd;
procedure fwupd_bios_setting_set_name(self:PFwupdBiosSetting; name:Pgchar);cdecl;external libfwupd;
procedure fwupd_bios_setting_set_path(self:PFwupdBiosSetting; path:Pgchar);cdecl;external libfwupd;
procedure fwupd_bios_setting_set_description(self:PFwupdBiosSetting; description:Pgchar);cdecl;external libfwupd;
function fwupd_bios_setting_get_kind(self:PFwupdBiosSetting):TFwupdBiosSettingKind;cdecl;external libfwupd;
function fwupd_bios_setting_get_name(self:PFwupdBiosSetting):Pgchar;cdecl;external libfwupd;
function fwupd_bios_setting_get_path(self:PFwupdBiosSetting):Pgchar;cdecl;external libfwupd;
function fwupd_bios_setting_get_description(self:PFwupdBiosSetting):Pgchar;cdecl;external libfwupd;
function fwupd_bios_setting_map_possible_value(self:PFwupdBiosSetting; key:Pgchar; error:PPGError):Pgchar;cdecl;external libfwupd;
function fwupd_bios_setting_has_possible_value(self:PFwupdBiosSetting; val:Pgchar):Tgboolean;cdecl;external libfwupd;
procedure fwupd_bios_setting_add_possible_value(self:PFwupdBiosSetting; possible_value:Pgchar);cdecl;external libfwupd;
function fwupd_bios_setting_get_possible_values(self:PFwupdBiosSetting):PGPtrArray;cdecl;external libfwupd;
function fwupd_bios_setting_from_variant(value:PGVariant):PFwupdBiosSetting;cdecl;external libfwupd;
function fwupd_bios_setting_array_from_variant(value:PGVariant):PGPtrArray;cdecl;external libfwupd;
function fwupd_bios_setting_get_current_value(self:PFwupdBiosSetting):Pgchar;cdecl;external libfwupd;
procedure fwupd_bios_setting_set_current_value(self:PFwupdBiosSetting; value:Pgchar);cdecl;external libfwupd;
function fwupd_bios_setting_write_value(self:PFwupdBiosSetting; value:Pgchar; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_bios_setting_get_id(self:PFwupdBiosSetting):Pgchar;cdecl;external libfwupd;
procedure fwupd_bios_setting_set_id(self:PFwupdBiosSetting; id:Pgchar);cdecl;external libfwupd;

// === Konventiert am: 21-4-26 15:34:49 ===

function FWUPD_TYPE_BIOS_SETTING: TGType;
function FWUPD_BIOS_SETTING(obj: Pointer): PFwupdBiosSetting;
function FWUPD_IS_BIOS_SETTING(obj: Pointer): Tgboolean;
function FWUPD_BIOS_SETTING_CLASS(klass: Pointer): PFwupdBiosSettingClass;
function FWUPD_IS_BIOS_SETTING_CLASS(klass: Pointer): Tgboolean;
function FWUPD_BIOS_SETTING_GET_CLASS(obj: Pointer): PFwupdBiosSettingClass;

implementation

function FWUPD_TYPE_BIOS_SETTING: TGType;
begin
  Result := fwupd_bios_setting_get_type;
end;

function FWUPD_BIOS_SETTING(obj: Pointer): PFwupdBiosSetting;
begin
  Result := PFwupdBiosSetting(g_type_check_instance_cast(obj, FWUPD_TYPE_BIOS_SETTING));
end;

function FWUPD_IS_BIOS_SETTING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_BIOS_SETTING);
end;

function FWUPD_BIOS_SETTING_CLASS(klass: Pointer): PFwupdBiosSettingClass;
begin
  Result := PFwupdBiosSettingClass(g_type_check_class_cast(klass, FWUPD_TYPE_BIOS_SETTING));
end;

function FWUPD_IS_BIOS_SETTING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_BIOS_SETTING);
end;

function FWUPD_BIOS_SETTING_GET_CLASS(obj: Pointer): PFwupdBiosSettingClass;
begin
  Result := PFwupdBiosSettingClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TFwupdBiosSetting = record
    parent_instance: TGObject;
  end;
  PFwupdBiosSetting = ^TFwupdBiosSetting;

  TFwupdBiosSettingClass = record
  end;
  PFwupdBiosSettingClass = ^TFwupdBiosSettingClass;

function fwupd_bios_setting_get_type: TGType; cdecl; external libgxxxxxxx;



end.
