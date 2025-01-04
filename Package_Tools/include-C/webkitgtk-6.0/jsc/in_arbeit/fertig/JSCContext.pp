
unit JSCContext;
interface

{
  Automatically converted by H2Pas 1.0.0 from JSCContext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    JSCContext.h
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
PJSCCheckSyntaxMode  = ^JSCCheckSyntaxMode;
PJSCCheckSyntaxResult  = ^JSCCheckSyntaxResult;
PJSCClass  = ^JSCClass;
PJSCClassVTable  = ^JSCClassVTable;
PJSCContext  = ^JSCContext;
PJSCException  = ^JSCException;
PJSCValue  = ^JSCValue;
PJSCVirtualMachine  = ^JSCVirtualMachine;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__JSC_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <jsc/jsc.h> can be included directly."}
{$endif}
{$ifndef JSCContext_h}
{$define JSCContext_h}
{$include <glib-object.h>}
{$include <jsc/JSCDefines.h>}
{$include <jsc/JSCException.h>}
{$include <jsc/JSCClass.h>}
{$include <jsc/JSCValue.h>}
{$include <jsc/JSCVirtualMachine.h>}

{ was #define dname def_expr }
function JSC_TYPE_CONTEXT : longint; { return type might be wrong }

{JSC_DECLARE_FINAL_TYPE (JSCContext, jsc_context, JSC, CONTEXT, GObject) }
type

  TJSCExceptionHandler = procedure (context:PJSCContext; exception:PJSCException; user_data:Tgpointer);cdecl;

  PJSCCheckSyntaxMode = ^TJSCCheckSyntaxMode;
  TJSCCheckSyntaxMode =  Longint;
  Const
    JSC_CHECK_SYNTAX_MODE_SCRIPT = 0;
    JSC_CHECK_SYNTAX_MODE_MODULE = 1;
;
type
  PJSCCheckSyntaxResult = ^TJSCCheckSyntaxResult;
  TJSCCheckSyntaxResult =  Longint;
  Const
    JSC_CHECK_SYNTAX_RESULT_SUCCESS = 0;
    JSC_CHECK_SYNTAX_RESULT_RECOVERABLE_ERROR = 1;
    JSC_CHECK_SYNTAX_RESULT_IRRECOVERABLE_ERROR = 2;
    JSC_CHECK_SYNTAX_RESULT_UNTERMINATED_LITERAL_ERROR = 3;
    JSC_CHECK_SYNTAX_RESULT_OUT_OF_MEMORY_ERROR = 4;
    JSC_CHECK_SYNTAX_RESULT_STACK_OVERFLOW_ERROR = 5;
;

function jsc_context_new:PJSCContext;cdecl;external;
function jsc_context_new_with_virtual_machine(vm:PJSCVirtualMachine):PJSCContext;cdecl;external;
function jsc_context_get_virtual_machine(context:PJSCContext):PJSCVirtualMachine;cdecl;external;
function jsc_context_get_exception(context:PJSCContext):PJSCException;cdecl;external;
(* Const before type ignored *)
procedure jsc_context_throw(context:PJSCContext; error_message:Pchar);cdecl;external;
(* Const before type ignored *)
procedure jsc_context_throw_printf(context:PJSCContext; format:Pchar; args:array of const);cdecl;external;
procedure jsc_context_throw_printf(context:PJSCContext; format:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure jsc_context_throw_with_name(context:PJSCContext; error_name:Pchar; error_message:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure jsc_context_throw_with_name_printf(context:PJSCContext; error_name:Pchar; format:Pchar; args:array of const);cdecl;external;
procedure jsc_context_throw_with_name_printf(context:PJSCContext; error_name:Pchar; format:Pchar);cdecl;external;
procedure jsc_context_throw_exception(context:PJSCContext; exception:PJSCException);cdecl;external;
procedure jsc_context_clear_exception(context:PJSCContext);cdecl;external;
procedure jsc_context_push_exception_handler(context:PJSCContext; handler:TJSCExceptionHandler; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
procedure jsc_context_pop_exception_handler(context:PJSCContext);cdecl;external;
function jsc_context_get_current:PJSCContext;cdecl;external;
(* Const before type ignored *)
function jsc_context_evaluate(context:PJSCContext; code:Pchar; length:Tgssize):PJSCValue;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jsc_context_evaluate_with_source_uri(context:PJSCContext; code:Pchar; length:Tgssize; uri:Pchar; line_number:Tguint):PJSCValue;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jsc_context_evaluate_in_object(context:PJSCContext; code:Pchar; length:Tgssize; object_instance:Tgpointer; object_class:PJSCClass; 
           uri:Pchar; line_number:Tguint; object:PPJSCValue):PJSCValue;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jsc_context_check_syntax(context:PJSCContext; code:Pchar; length:Tgssize; mode:TJSCCheckSyntaxMode; uri:Pchar; 
           line_number:dword; exception:PPJSCException):TJSCCheckSyntaxResult;cdecl;external;
function jsc_context_get_global_object(context:PJSCContext):PJSCValue;cdecl;external;
(* Const before type ignored *)
procedure jsc_context_set_value(context:PJSCContext; name:Pchar; value:PJSCValue);cdecl;external;
(* Const before type ignored *)
function jsc_context_get_value(context:PJSCContext; name:Pchar):PJSCValue;cdecl;external;
(* Const before type ignored *)
function jsc_context_register_class(context:PJSCContext; name:Pchar; parent_class:PJSCClass; vtable:PJSCClassVTable; destroy_notify:TGDestroyNotify):PJSCClass;cdecl;external;
{$endif}
{ JSCContext_h  }

implementation

{ was #define dname def_expr }
function JSC_TYPE_CONTEXT : longint; { return type might be wrong }
  begin
    JSC_TYPE_CONTEXT:=jsc_context_get_type;
  end;


end.
