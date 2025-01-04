
unit JSCException;
interface

{
  Automatically converted by H2Pas 1.0.0 from JSCException.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    JSCException.h
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
PJSCContext  = ^JSCContext;
PJSCException  = ^JSCException;
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
{$ifndef JSCException_h}
{$define JSCException_h}
{$include <glib-object.h>}
{$include <jsc/JSCDefines.h>}

{ was #define dname def_expr }
function JSC_TYPE_EXCEPTION : longint; { return type might be wrong }

{JSC_DECLARE_FINAL_TYPE (JSCException, jsc_exception, JSC, EXCEPTION, GObject) }
type
(* Const before type ignored *)

function jsc_exception_new(context:PJSCContext; message:Pchar):PJSCException;cdecl;external;
(* Const before type ignored *)
function jsc_exception_new_printf(context:PJSCContext; format:Pchar; args:array of const):PJSCException;cdecl;external;
function jsc_exception_new_printf(context:PJSCContext; format:Pchar):PJSCException;cdecl;external;
(* Const before type ignored *)
function jsc_exception_new_vprintf(context:PJSCContext; format:Pchar; args:Tva_list):PJSCException;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jsc_exception_new_with_name(context:PJSCContext; name:Pchar; message:Pchar):PJSCException;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jsc_exception_new_with_name_printf(context:PJSCContext; name:Pchar; format:Pchar; args:array of const):PJSCException;cdecl;external;
function jsc_exception_new_with_name_printf(context:PJSCContext; name:Pchar; format:Pchar):PJSCException;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jsc_exception_new_with_name_vprintf(context:PJSCContext; name:Pchar; format:Pchar; args:Tva_list):PJSCException;cdecl;external;
(* Const before type ignored *)
function jsc_exception_get_name(exception:PJSCException):Pchar;cdecl;external;
(* Const before type ignored *)
function jsc_exception_get_message(exception:PJSCException):Pchar;cdecl;external;
function jsc_exception_get_line_number(exception:PJSCException):Tguint;cdecl;external;
function jsc_exception_get_column_number(exception:PJSCException):Tguint;cdecl;external;
(* Const before type ignored *)
function jsc_exception_get_source_uri(exception:PJSCException):Pchar;cdecl;external;
(* Const before type ignored *)
function jsc_exception_get_backtrace_string(exception:PJSCException):Pchar;cdecl;external;
function jsc_exception_to_string(exception:PJSCException):Pchar;cdecl;external;
function jsc_exception_report(exception:PJSCException):Pchar;cdecl;external;
{$endif}
{ JSCException_h  }

implementation

{ was #define dname def_expr }
function JSC_TYPE_EXCEPTION : longint; { return type might be wrong }
  begin
    JSC_TYPE_EXCEPTION:=jsc_exception_get_type;
  end;


end.
