
unit adap_breakpoint;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_breakpoint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_breakpoint.h
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
PAdapBreakpoint  = ^AdapBreakpoint;
PAdapBreakpointCondition  = ^AdapBreakpointCondition;
PAdapBreakpointConditionLengthType  = ^AdapBreakpointConditionLengthType;
PAdapBreakpointConditionRatioType  = ^AdapBreakpointConditionRatioType;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-length-unit.h"}

{ was #define dname def_expr }
function ADAP_TYPE_BREAKPOINT_CONDITION : longint; { return type might be wrong }

type
  PAdapBreakpointConditionLengthType = ^TAdapBreakpointConditionLengthType;
  TAdapBreakpointConditionLengthType =  Longint;
  Const
    ADAP_BREAKPOINT_CONDITION_MIN_WIDTH = 0;
    ADAP_BREAKPOINT_CONDITION_MAX_WIDTH = 1;
    ADAP_BREAKPOINT_CONDITION_MIN_HEIGHT = 2;
    ADAP_BREAKPOINT_CONDITION_MAX_HEIGHT = 3;
;
type
  PAdapBreakpointConditionRatioType = ^TAdapBreakpointConditionRatioType;
  TAdapBreakpointConditionRatioType =  Longint;
  Const
    ADAP_BREAKPOINT_CONDITION_MIN_ASPECT_RATIO = 0;
    ADAP_BREAKPOINT_CONDITION_MAX_ASPECT_RATIO = 1;
;
type

function adap_breakpoint_condition_get_type:TGType;cdecl;external;
function adap_breakpoint_condition_new_length(_type:TAdapBreakpointConditionLengthType; value:Tdouble; unit:TAdapLengthUnit):PAdapBreakpointCondition;cdecl;external;
function adap_breakpoint_condition_new_ratio(_type:TAdapBreakpointConditionRatioType; width:longint; height:longint):PAdapBreakpointCondition;cdecl;external;
function adap_breakpoint_condition_new_and(condition_1:PAdapBreakpointCondition; condition_2:PAdapBreakpointCondition):PAdapBreakpointCondition;cdecl;external;
function adap_breakpoint_condition_new_or(condition_1:PAdapBreakpointCondition; condition_2:PAdapBreakpointCondition):PAdapBreakpointCondition;cdecl;external;
function adap_breakpoint_condition_copy(self:PAdapBreakpointCondition):PAdapBreakpointCondition;cdecl;external;
procedure adap_breakpoint_condition_free(self:PAdapBreakpointCondition);cdecl;external;
(* Const before type ignored *)
function adap_breakpoint_condition_parse(str:Pchar):PAdapBreakpointCondition;cdecl;external;
function adap_breakpoint_condition_to_string(self:PAdapBreakpointCondition):Pchar;cdecl;external;
{ was #define dname def_expr }
function ADAP_TYPE_BREAKPOINT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapBreakpoint, adap_breakpoint, ADAP, BREAKPOINT, GObject) }
function adap_breakpoint_new(condition:PAdapBreakpointCondition):PAdapBreakpoint;cdecl;external;
function adap_breakpoint_get_condition(self:PAdapBreakpoint):PAdapBreakpointCondition;cdecl;external;
procedure adap_breakpoint_set_condition(self:PAdapBreakpoint; condition:PAdapBreakpointCondition);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_breakpoint_add_setter(self:PAdapBreakpoint; object:PGObject; _property:Pchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure adap_breakpoint_add_setters(self:PAdapBreakpoint; first_object:PGObject; first_property:Pchar; args:array of const);cdecl;external;
procedure adap_breakpoint_add_setters(self:PAdapBreakpoint; first_object:PGObject; first_property:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_breakpoint_add_settersv(self:PAdapBreakpoint; n_setters:longint; objects:PPGObject; names:PPchar; values:PPGValue);cdecl;external;
(* Const before type ignored *)
procedure adap_breakpoint_add_setters_valist(self:PAdapBreakpoint; first_object:PGObject; first_property:Pchar; args:Tva_list);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_BREAKPOINT_CONDITION : longint; { return type might be wrong }
  begin
    ADAP_TYPE_BREAKPOINT_CONDITION:=adap_breakpoint_condition_get_type;
  end;

{ was #define dname def_expr }
function ADAP_TYPE_BREAKPOINT : longint; { return type might be wrong }
  begin
    ADAP_TYPE_BREAKPOINT:=adap_breakpoint_get_type;
  end;


end.
