
unit adw_breakpoint;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_breakpoint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_breakpoint.h
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
PAdwBreakpoint  = ^AdwBreakpoint;
PAdwBreakpointCondition  = ^AdwBreakpointCondition;
PAdwBreakpointConditionLengthType  = ^AdwBreakpointConditionLengthType;
PAdwBreakpointConditionRatioType  = ^AdwBreakpointConditionRatioType;
Pchar  = ^char;
PGObject  = ^GObject;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022-2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-length-unit.h"}

{ was #define dname def_expr }
function ADW_TYPE_BREAKPOINT_CONDITION : longint; { return type might be wrong }

type
  PAdwBreakpointConditionLengthType = ^TAdwBreakpointConditionLengthType;
  TAdwBreakpointConditionLengthType =  Longint;
  Const
    ADW_BREAKPOINT_CONDITION_MIN_WIDTH = 0;
    ADW_BREAKPOINT_CONDITION_MAX_WIDTH = 1;
    ADW_BREAKPOINT_CONDITION_MIN_HEIGHT = 2;
    ADW_BREAKPOINT_CONDITION_MAX_HEIGHT = 3;
;
type
  PAdwBreakpointConditionRatioType = ^TAdwBreakpointConditionRatioType;
  TAdwBreakpointConditionRatioType =  Longint;
  Const
    ADW_BREAKPOINT_CONDITION_MIN_ASPECT_RATIO = 0;
    ADW_BREAKPOINT_CONDITION_MAX_ASPECT_RATIO = 1;
;
type

function adw_breakpoint_condition_get_type:TGType;cdecl;external;
function adw_breakpoint_condition_new_length(_type:TAdwBreakpointConditionLengthType; value:Tdouble; unit:TAdwLengthUnit):PAdwBreakpointCondition;cdecl;external;
function adw_breakpoint_condition_new_ratio(_type:TAdwBreakpointConditionRatioType; width:longint; height:longint):PAdwBreakpointCondition;cdecl;external;
function adw_breakpoint_condition_new_and(condition_1:PAdwBreakpointCondition; condition_2:PAdwBreakpointCondition):PAdwBreakpointCondition;cdecl;external;
function adw_breakpoint_condition_new_or(condition_1:PAdwBreakpointCondition; condition_2:PAdwBreakpointCondition):PAdwBreakpointCondition;cdecl;external;
function adw_breakpoint_condition_copy(self:PAdwBreakpointCondition):PAdwBreakpointCondition;cdecl;external;
procedure adw_breakpoint_condition_free(self:PAdwBreakpointCondition);cdecl;external;
(* Const before type ignored *)
function adw_breakpoint_condition_parse(str:Pchar):PAdwBreakpointCondition;cdecl;external;
function adw_breakpoint_condition_to_string(self:PAdwBreakpointCondition):Pchar;cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (AdwBreakpointCondition, adw_breakpoint_condition_free) }
{ was #define dname def_expr }
function ADW_TYPE_BREAKPOINT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwBreakpoint, adw_breakpoint, ADW, BREAKPOINT, GObject) }
function adw_breakpoint_new(condition:PAdwBreakpointCondition):PAdwBreakpoint;cdecl;external;
function adw_breakpoint_get_condition(self:PAdwBreakpoint):PAdwBreakpointCondition;cdecl;external;
procedure adw_breakpoint_set_condition(self:PAdwBreakpoint; condition:PAdwBreakpointCondition);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_breakpoint_add_setter(self:PAdwBreakpoint; object:PGObject; _property:Pchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure adw_breakpoint_add_setters(self:PAdwBreakpoint; first_object:PGObject; first_property:Pchar; args:array of const);cdecl;external;
procedure adw_breakpoint_add_setters(self:PAdwBreakpoint; first_object:PGObject; first_property:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_breakpoint_add_settersv(self:PAdwBreakpoint; n_setters:longint; objects:PPGObject; names:PPchar; values:PPGValue);cdecl;external;
(* Const before type ignored *)
procedure adw_breakpoint_add_setters_valist(self:PAdwBreakpoint; first_object:PGObject; first_property:Pchar; args:Tva_list);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_BREAKPOINT_CONDITION : longint; { return type might be wrong }
  begin
    ADW_TYPE_BREAKPOINT_CONDITION:=adw_breakpoint_condition_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_BREAKPOINT : longint; { return type might be wrong }
  begin
    ADW_TYPE_BREAKPOINT:=adw_breakpoint_get_type;
  end;


end.
