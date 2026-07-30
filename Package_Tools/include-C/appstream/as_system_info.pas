unit as_system_info;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2022-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_SYSTEM_INFO_H}
{$define __AS_SYSTEM_INFO_H}
{$include <glib-object.h>}
{$include "as-relation.h"}

{G_DECLARE_DERIVABLE_TYPE (AsSystemInfo, as_system_info, AS, SYSTEM_INFO, GObject) }
{< private > }
type
  PAsSystemInfoClass = ^TAsSystemInfoClass;
  TAsSystemInfoClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsCheckResult:
 * @AS_CHECK_RESULT_ERROR:		The check failed.
 * @AS_CHECK_RESULT_UNKNOWN:		The outcome could not be determined.
 * @AS_CHECK_RESULT_FALSE:		False/No
 * @AS_CHECK_RESULT_TRUE:		True/Yes
 *
 * Result of a check operation.
 * }
{< private > }

  PAsCheckResult = ^TAsCheckResult;
  TAsCheckResult =  Longint;
  Const
    AS_CHECK_RESULT_ERROR = 0;
    AS_CHECK_RESULT_UNKNOWN = 1;
    AS_CHECK_RESULT_FALSE = 2;
    AS_CHECK_RESULT_TRUE = 3;
    AS_CHECK_RESULT_LAST = 4;
;
{*
 * AsChassisKind:
 * @AS_CHASSIS_KIND_UNKNOWN:	Unknown chassis.
 * @AS_CHASSIS_KIND_DESKTOP:	A desktop/workstation
 * @AS_CHASSIS_KIND_LAPTOP:	A mobile computer with a bigger screen / laptop
 * @AS_CHASSIS_KIND_SERVER:	A server, often without GUI
 * @AS_CHASSIS_KIND_TABLET:	A tablet with touch as primary input method
 * @AS_CHASSIS_KIND_HANDSET:	A smaller touch-input device, like a smartphone
 *
 * The type of chassis a computing device is built into.
 * }
{< private > }
type
  PAsChassisKind = ^TAsChassisKind;
  TAsChassisKind =  Longint;
  Const
    AS_CHASSIS_KIND_UNKNOWN = 0;
    AS_CHASSIS_KIND_DESKTOP = 1;
    AS_CHASSIS_KIND_LAPTOP = 2;
    AS_CHASSIS_KIND_SERVER = 3;
    AS_CHASSIS_KIND_TABLET = 4;
    AS_CHASSIS_KIND_HANDSET = 5;
    AS_CHASSIS_KIND_LAST = 6;
;

function as_chassis_kind_to_string(kind:TAsChassisKind):Pgchar;cdecl;external libappstream;
function as_chassis_kind_from_string(kind_str:Pgchar):TAsChassisKind;cdecl;external libappstream;
{*
 * AsSystemInfoError:
 * @AS_SYSTEM_INFO_ERROR_FAILED:		Generic failure
 * @AS_SYSTEM_INFO_ERROR_NOT_FOUND:		Information was not found.
 *
 * The error type.
 * }
{< private > }
type
  PAsSystemInfoError = ^TAsSystemInfoError;
  TAsSystemInfoError =  Longint;
  Const
    AS_SYSTEM_INFO_ERROR_FAILED = 0;
    AS_SYSTEM_INFO_ERROR_NOT_FOUND = 1;
    AS_SYSTEM_INFO_ERROR_LAST = 2;
;

{ was #define dname def_expr }
function AS_SYSTEM_INFO_ERROR : longint; { return type might be wrong }

function as_system_info_error_quark:TGQuark;cdecl;external libappstream;
function as_system_info_new:PAsSystemInfo;cdecl;external libappstream;
function as_system_info_new_template_for_chassis(chassis:TAsChassisKind; error:PPGError):PAsSystemInfo;cdecl;external libappstream;
function as_system_info_get_os_id(sysinfo:PAsSystemInfo):Pgchar;cdecl;external libappstream;
function as_system_info_get_os_cid(sysinfo:PAsSystemInfo):Pgchar;cdecl;external libappstream;
function as_system_info_get_os_name(sysinfo:PAsSystemInfo):Pgchar;cdecl;external libappstream;
function as_system_info_get_os_version(sysinfo:PAsSystemInfo):Pgchar;cdecl;external libappstream;
function as_system_info_get_os_homepage(sysinfo:PAsSystemInfo):Pgchar;cdecl;external libappstream;
function as_system_info_get_kernel_name(sysinfo:PAsSystemInfo):Pgchar;cdecl;external libappstream;
function as_system_info_get_kernel_version(sysinfo:PAsSystemInfo):Pgchar;cdecl;external libappstream;
function as_system_info_get_memory_total(sysinfo:PAsSystemInfo):Tgulong;cdecl;external libappstream;
function as_system_info_get_modaliases(sysinfo:PAsSystemInfo):PGPtrArray;cdecl;external libappstream;
function as_system_info_modalias_to_syspath(sysinfo:PAsSystemInfo; modalias:Pgchar):Pgchar;cdecl;external libappstream;
function as_system_info_has_device_matching_modalias(sysinfo:PAsSystemInfo; modalias_glob:Pgchar):Tgboolean;cdecl;external libappstream;
function as_system_info_get_device_name_for_modalias(sysinfo:PAsSystemInfo; modalias:Pgchar; allow_fallback:Tgboolean; error:PPGError):Pgchar;cdecl;external libappstream;
function as_system_info_has_input_control(sysinfo:PAsSystemInfo; kind:TAsControlKind; error:PPGError):TAsCheckResult;cdecl;external libappstream;
procedure as_system_info_set_input_control(sysinfo:PAsSystemInfo; kind:TAsControlKind; found:Tgboolean);cdecl;external libappstream;
function as_system_info_get_gui_available(sysinfo:PAsSystemInfo):Tgboolean;cdecl;external libappstream;
procedure as_system_info_set_gui_available(sysinfo:PAsSystemInfo; available:Tgboolean);cdecl;external libappstream;
function as_system_info_get_display_length(sysinfo:PAsSystemInfo; side:TAsDisplaySideKind):Tgulong;cdecl;external libappstream;
procedure as_system_info_set_display_length(sysinfo:PAsSystemInfo; side:TAsDisplaySideKind; value_dip:Tgulong);cdecl;external libappstream;
function as_get_current_distro_component_id:Pgchar;cdecl;external libappstream;
{$endif}
{ __AS_SYSTEM_INFO_H  }

// === Konventiert am: 30-7-26 19:34:41 ===

function AS_TYPE_SYSTEM_INFO: TGType;
function AS_SYSTEM_INFO(obj: Pointer): PAsSystemInfo;
function AS_IS_SYSTEM_INFO(obj: Pointer): Tgboolean;
function AS_SYSTEM_INFO_CLASS(klass: Pointer): PAsSystemInfoClass;
function AS_IS_SYSTEM_INFO_CLASS(klass: Pointer): Tgboolean;
function AS_SYSTEM_INFO_GET_CLASS(obj: Pointer): PAsSystemInfoClass;

implementation

function AS_TYPE_SYSTEM_INFO: TGType;
begin
  Result := as_system_info_get_type;
end;

function AS_SYSTEM_INFO(obj: Pointer): PAsSystemInfo;
begin
  Result := PAsSystemInfo(g_type_check_instance_cast(obj, AS_TYPE_SYSTEM_INFO));
end;

function AS_IS_SYSTEM_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_SYSTEM_INFO);
end;

function AS_SYSTEM_INFO_CLASS(klass: Pointer): PAsSystemInfoClass;
begin
  Result := PAsSystemInfoClass(g_type_check_class_cast(klass, AS_TYPE_SYSTEM_INFO));
end;

function AS_IS_SYSTEM_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_SYSTEM_INFO);
end;

function AS_SYSTEM_INFO_GET_CLASS(obj: Pointer): PAsSystemInfoClass;
begin
  Result := PAsSystemInfoClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsSystemInfo = record
    parent_instance: TGObject;
  end;
  PAsSystemInfo = ^TAsSystemInfo;

  PAsSystemInfoClass = type Pointer;

function as_system_info_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function AS_SYSTEM_INFO_ERROR : longint; { return type might be wrong }
  begin
    AS_SYSTEM_INFO_ERROR:=as_system_info_error_quark;
  end;


end.
