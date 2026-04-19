
unit nm-setting-match;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-match.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-match.h
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
Pguint  = ^guint;
PNMSetting  = ^NMSetting;
PNMSettingMatch  = ^NMSettingMatch;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Red Hat, Inc.
  }
{$ifndef NM_SETTING_MATCH_H}
{$define NM_SETTING_MATCH_H}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_MATCH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MATCH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MATCH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_MATCH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_MATCH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MATCH_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_MATCH_SETTING_NAME = 'match';  
  NM_SETTING_MATCH_INTERFACE_NAME = 'interface-name';  
  NM_SETTING_MATCH_KERNEL_COMMAND_LINE = 'kernel-command-line';  
  NM_SETTING_MATCH_DRIVER = 'driver';  
  NM_SETTING_MATCH_PATH = 'path';  
type

function nm_setting_match_get_type:TGType;cdecl;external;
function nm_setting_match_new:PNMSetting;cdecl;external;
function nm_setting_match_get_num_interface_names(setting:PNMSettingMatch):Tguint;cdecl;external;
(* Const before type ignored *)
function nm_setting_match_get_interface_name(setting:PNMSettingMatch; idx:longint):Pchar;cdecl;external;
procedure nm_setting_match_remove_interface_name(setting:PNMSettingMatch; idx:longint);cdecl;external;
(* Const before type ignored *)
function nm_setting_match_remove_interface_name_by_value(setting:PNMSettingMatch; interface_name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure nm_setting_match_add_interface_name(setting:PNMSettingMatch; interface_name:Pchar);cdecl;external;
procedure nm_setting_match_clear_interface_names(setting:PNMSettingMatch);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_match_get_interface_names(setting:PNMSettingMatch; length:Pguint):^Pchar;cdecl;external;
function nm_setting_match_get_num_kernel_command_lines(setting:PNMSettingMatch):Tguint;cdecl;external;
(* Const before type ignored *)
function nm_setting_match_get_kernel_command_line(setting:PNMSettingMatch; idx:Tguint):Pchar;cdecl;external;
procedure nm_setting_match_remove_kernel_command_line(setting:PNMSettingMatch; idx:Tguint);cdecl;external;
(* Const before type ignored *)
function nm_setting_match_remove_kernel_command_line_by_value(setting:PNMSettingMatch; kernel_command_line:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure nm_setting_match_add_kernel_command_line(setting:PNMSettingMatch; kernel_command_line:Pchar);cdecl;external;
procedure nm_setting_match_clear_kernel_command_lines(setting:PNMSettingMatch);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_match_get_kernel_command_lines(setting:PNMSettingMatch; length:Pguint):^Pchar;cdecl;external;
function nm_setting_match_get_num_drivers(setting:PNMSettingMatch):Tguint;cdecl;external;
(* Const before type ignored *)
function nm_setting_match_get_driver(setting:PNMSettingMatch; idx:Tguint):Pchar;cdecl;external;
procedure nm_setting_match_remove_driver(setting:PNMSettingMatch; idx:Tguint);cdecl;external;
(* Const before type ignored *)
function nm_setting_match_remove_driver_by_value(setting:PNMSettingMatch; driver:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure nm_setting_match_add_driver(setting:PNMSettingMatch; driver:Pchar);cdecl;external;
procedure nm_setting_match_clear_drivers(setting:PNMSettingMatch);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_match_get_drivers(setting:PNMSettingMatch; length:Pguint):^Pchar;cdecl;external;
function nm_setting_match_get_num_paths(setting:PNMSettingMatch):Tguint;cdecl;external;
(* Const before type ignored *)
function nm_setting_match_get_path(setting:PNMSettingMatch; idx:Tguint):Pchar;cdecl;external;
procedure nm_setting_match_remove_path(setting:PNMSettingMatch; idx:Tguint);cdecl;external;
(* Const before type ignored *)
function nm_setting_match_remove_path_by_value(setting:PNMSettingMatch; path:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure nm_setting_match_add_path(setting:PNMSettingMatch; path:Pchar);cdecl;external;
procedure nm_setting_match_clear_paths(setting:PNMSettingMatch);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_match_get_paths(setting:PNMSettingMatch; length:Pguint):^Pchar;cdecl;external;
{$endif}
{ NM_SETTING_MATCH_H  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_MATCH : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_MATCH:=nm_setting_match_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MATCH(obj : longint) : longint;
begin
  NM_SETTING_MATCH:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_MATCH,NMSettingMatch);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MATCH_CLASS(klass : longint) : longint;
begin
  NM_SETTING_MATCH_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_MATCH,NMSettingMatchClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_MATCH(obj : longint) : longint;
begin
  NM_IS_SETTING_MATCH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_MATCH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_MATCH_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_MATCH_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_MATCH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MATCH_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_MATCH_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_MATCH,NMSettingMatchClass);
end;


end.
