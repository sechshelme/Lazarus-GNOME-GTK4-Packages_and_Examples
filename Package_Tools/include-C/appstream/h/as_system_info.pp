
unit as_system_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_system_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_system_info.h
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
PAsChassisKind  = ^AsChassisKind;
PAsCheckResult  = ^AsCheckResult;
PAsSystemInfo  = ^AsSystemInfo;
PAsSystemInfoClass  = ^AsSystemInfoClass;
PAsSystemInfoError  = ^AsSystemInfoError;
Pgchar  = ^gchar;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
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

{ was #define dname def_expr }
function AS_TYPE_SYSTEM_INFO : longint; { return type might be wrong }

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
(* Const before type ignored *)

function as_chassis_kind_to_string(kind:TAsChassisKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_chassis_kind_from_string(kind_str:Pgchar):TAsChassisKind;cdecl;external;
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

function as_system_info_error_quark:TGQuark;cdecl;external;
function as_system_info_new:PAsSystemInfo;cdecl;external;
function as_system_info_new_template_for_chassis(chassis:TAsChassisKind; error:PPGError):PAsSystemInfo;cdecl;external;
(* Const before type ignored *)
function as_system_info_get_os_id(sysinfo:PAsSystemInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_system_info_get_os_cid(sysinfo:PAsSystemInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_system_info_get_os_name(sysinfo:PAsSystemInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_system_info_get_os_version(sysinfo:PAsSystemInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_system_info_get_os_homepage(sysinfo:PAsSystemInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_system_info_get_kernel_name(sysinfo:PAsSystemInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_system_info_get_kernel_version(sysinfo:PAsSystemInfo):Pgchar;cdecl;external;
function as_system_info_get_memory_total(sysinfo:PAsSystemInfo):Tgulong;cdecl;external;
function as_system_info_get_modaliases(sysinfo:PAsSystemInfo):PGPtrArray;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_system_info_modalias_to_syspath(sysinfo:PAsSystemInfo; modalias:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_system_info_has_device_matching_modalias(sysinfo:PAsSystemInfo; modalias_glob:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_system_info_get_device_name_for_modalias(sysinfo:PAsSystemInfo; modalias:Pgchar; allow_fallback:Tgboolean; error:PPGError):Pgchar;cdecl;external;
function as_system_info_has_input_control(sysinfo:PAsSystemInfo; kind:TAsControlKind; error:PPGError):TAsCheckResult;cdecl;external;
procedure as_system_info_set_input_control(sysinfo:PAsSystemInfo; kind:TAsControlKind; found:Tgboolean);cdecl;external;
function as_system_info_get_gui_available(sysinfo:PAsSystemInfo):Tgboolean;cdecl;external;
procedure as_system_info_set_gui_available(sysinfo:PAsSystemInfo; available:Tgboolean);cdecl;external;
function as_system_info_get_display_length(sysinfo:PAsSystemInfo; side:TAsDisplaySideKind):Tgulong;cdecl;external;
procedure as_system_info_set_display_length(sysinfo:PAsSystemInfo; side:TAsDisplaySideKind; value_dip:Tgulong);cdecl;external;
function as_get_current_distro_component_id:Pgchar;cdecl;external;
{$endif}
{ __AS_SYSTEM_INFO_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_SYSTEM_INFO : longint; { return type might be wrong }
  begin
    AS_TYPE_SYSTEM_INFO:=as_system_info_get_type;
  end;

{ was #define dname def_expr }
function AS_SYSTEM_INFO_ERROR : longint; { return type might be wrong }
  begin
    AS_SYSTEM_INFO_ERROR:=as_system_info_error_quark;
  end;


end.
