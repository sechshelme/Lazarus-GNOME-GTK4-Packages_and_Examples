unit xb_machine;

interface

uses
  fp_glib2, fp_xmlb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "xb-opcode.h"}
{$include "xb-stack.h"}
{$include "xb-value-bindings.h"}

{G_DECLARE_DERIVABLE_TYPE(XbMachine, xb_machine, XB, MACHINE, GObject) }
{< private > }
type
  PXbMachineClass = ^TXbMachineClass;
  TXbMachineClass = record
      parent_class : TGObjectClass;
      _xb_reserved1 : procedure ;cdecl;
      _xb_reserved2 : procedure ;cdecl;
      _xb_reserved3 : procedure ;cdecl;
      _xb_reserved4 : procedure ;cdecl;
      _xb_reserved5 : procedure ;cdecl;
      _xb_reserved6 : procedure ;cdecl;
      _xb_reserved7 : procedure ;cdecl;
    end;

{*
 * XbMachineDebugFlags:
 * @XB_MACHINE_DEBUG_FLAG_NONE:			No debug flags to use
 * @XB_MACHINE_DEBUG_FLAG_SHOW_STACK:		Show the stack addition and removal
 * @XB_MACHINE_DEBUG_FLAG_SHOW_PARSING:		Show the XPath predicate parsing
 * @XB_MACHINE_DEBUG_FLAG_SHOW_OPTIMIZER:	Show the optimizer operation
 * @XB_MACHINE_DEBUG_FLAG_SHOW_SLOW_PATH:	Show the query slow paths
 *
 * The flags to control the amount of debugging is generated.
 * }
{< private > }

  PXbMachineDebugFlags = ^TXbMachineDebugFlags;
  TXbMachineDebugFlags =  Longint;
  Const
    XB_MACHINE_DEBUG_FLAG_NONE = 0;
    XB_MACHINE_DEBUG_FLAG_SHOW_STACK = 1 shl 0;
    XB_MACHINE_DEBUG_FLAG_SHOW_PARSING = 1 shl 1;
    XB_MACHINE_DEBUG_FLAG_SHOW_OPTIMIZER = 1 shl 2;
    XB_MACHINE_DEBUG_FLAG_SHOW_SLOW_PATH = 1 shl 3;
    XB_MACHINE_DEBUG_FLAG_LAST = (1 shl 3)+1;
;
{*
 * XbMachineParseFlags:
 * @XB_MACHINE_PARSE_FLAG_NONE:			No flags set
 * @XB_MACHINE_PARSE_FLAG_OPTIMIZE:		Run an optimization pass on the predicate
 *
 * The flags to control the parsing behaviour.
 * }
{< private > }
type
  PXbMachineParseFlags = ^TXbMachineParseFlags;
  TXbMachineParseFlags =  Longint;
  Const
    XB_MACHINE_PARSE_FLAG_NONE = 0;
    XB_MACHINE_PARSE_FLAG_OPTIMIZE = 1 shl 0;
    XB_MACHINE_PARSE_FLAG_LAST = (1 shl 0)+1;
;
type

  TXbMachineOpcodeFixupFunc = function (self:PXbMachine; opcodes:PXbStack; user_data:Tgpointer; error:PPGError):Tgboolean;cdecl;
{ when next breaking API add @level here  }

  TXbMachineTextHandlerFunc = function (self:PXbMachine; opcodes:PXbStack; text:Pgchar; handled:Pgboolean; user_data:Tgpointer; 
               error:PPGError):Tgboolean;cdecl;
{ when next breaking API add @level here  }

  TXbMachineMethodFunc = function (self:PXbMachine; stack:PXbStack; result_unused:Pgboolean; exec_data:Tgpointer; user_data:Tgpointer; 
               error:PPGError):Tgboolean;cdecl;

function xb_machine_new:PXbMachine;cdecl;external libxmlb;
procedure xb_machine_set_debug_flags(self:PXbMachine; flags:TXbMachineDebugFlags);cdecl;external libxmlb;
{ G_DEPRECATED_FOR(xb_machine_parse_full) }
function xb_machine_parse(self:PXbMachine; text:Pgchar; text_len:Tgssize; error:PPGError):PXbStack;cdecl;external libxmlb;
function xb_machine_parse_full(self:PXbMachine; text:Pgchar; text_len:Tgssize; flags:TXbMachineParseFlags; error:PPGError):PXbStack;cdecl;external libxmlb;
function xb_machine_run(self:PXbMachine; opcodes:PXbStack; result:Pgboolean; exec_data:Tgpointer; error:PPGError):Tgboolean;cdecl;external libxmlb;
{ G_DEPRECATED_FOR(xb_machine_run_with_bindings) }
function xb_machine_run_with_bindings(self:PXbMachine; opcodes:PXbStack; bindings:PXbValueBindings; result:Pgboolean; exec_data:Tgpointer; 
           error:PPGError):Tgboolean;cdecl;external libxmlb;
procedure xb_machine_add_opcode_fixup(self:PXbMachine; opcodes_sig:Pgchar; fixup_cb:TXbMachineOpcodeFixupFunc; user_data:Tgpointer; user_data_free:TGDestroyNotify);cdecl;external libxmlb;
procedure xb_machine_add_text_handler(self:PXbMachine; handler_cb:TXbMachineTextHandlerFunc; user_data:Tgpointer; user_data_free:TGDestroyNotify);cdecl;external libxmlb;
procedure xb_machine_add_method(self:PXbMachine; name:Pgchar; n_opcodes:Tguint; method_cb:TXbMachineMethodFunc; user_data:Tgpointer; 
            user_data_free:TGDestroyNotify);cdecl;external libxmlb;
procedure xb_machine_add_operator(self:PXbMachine; str:Pgchar; name:Pgchar);cdecl;external libxmlb;
function xb_machine_opcode_func_init(self:PXbMachine; opcode:PXbOpcode; func_name:Pgchar):Tgboolean;cdecl;external libxmlb;
function xb_machine_stack_pop(self:PXbMachine; stack:PXbStack; opcode_out:PXbOpcode; error:PPGError):Tgboolean;cdecl;external libxmlb;
function xb_machine_stack_push(self:PXbMachine; stack:PXbStack; opcode_out:PPXbOpcode; error:PPGError):Tgboolean;cdecl;external libxmlb;
function xb_machine_stack_push_text(self:PXbMachine; stack:PXbStack; str:Pgchar; error:PPGError):Tgboolean;cdecl;external libxmlb;
function xb_machine_stack_push_text_static(self:PXbMachine; stack:PXbStack; str:Pgchar; error:PPGError):Tgboolean;cdecl;external libxmlb;
function xb_machine_stack_push_text_steal(self:PXbMachine; stack:PXbStack; str:Pgchar; error:PPGError):Tgboolean;cdecl;external libxmlb;
function xb_machine_stack_push_integer(self:PXbMachine; stack:PXbStack; val:Tguint32; error:PPGError):Tgboolean;cdecl;external libxmlb;
procedure xb_machine_set_stack_size(self:PXbMachine; stack_size:Tguint);cdecl;external libxmlb;
function xb_machine_get_stack_size(self:PXbMachine):Tguint;cdecl;external libxmlb;

// === Konventiert am: 1-10-25 19:42:21 ===

function XB_TYPE_MACHINE: TGType;
function XB_MACHINE(obj: Pointer): PXbMachine;
function XB_IS_MACHINE(obj: Pointer): Tgboolean;
function XB_MACHINE_CLASS(klass: Pointer): PXbMachineClass;
function XB_IS_MACHINE_CLASS(klass: Pointer): Tgboolean;
function XB_MACHINE_GET_CLASS(obj: Pointer): PXbMachineClass;

implementation

function XB_TYPE_MACHINE: TGType;
begin
  Result := xb_machine_get_type;
end;

function XB_MACHINE(obj: Pointer): PXbMachine;
begin
  Result := PXbMachine(g_type_check_instance_cast(obj, XB_TYPE_MACHINE));
end;

function XB_IS_MACHINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_MACHINE);
end;

function XB_MACHINE_CLASS(klass: Pointer): PXbMachineClass;
begin
  Result := PXbMachineClass(g_type_check_class_cast(klass, XB_TYPE_MACHINE));
end;

function XB_IS_MACHINE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_MACHINE);
end;

function XB_MACHINE_GET_CLASS(obj: Pointer): PXbMachineClass;
begin
  Result := PXbMachineClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TXbMachine = record
    parent_instance: TGObject;
  end;
  PXbMachine = ^TXbMachine;

  TXbMachineClass = record
  end;
  PXbMachineClass = ^TXbMachineClass;

function xb_machine_get_type: TGType; cdecl; external libgxxxxxxx;



end.
