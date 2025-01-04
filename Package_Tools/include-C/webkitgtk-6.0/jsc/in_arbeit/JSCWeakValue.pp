
unit JSCWeakValue;
interface

{
  Automatically converted by H2Pas 1.0.0 from JSCWeakValue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    JSCWeakValue.h
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
PJSCValue  = ^JSCValue;
PJSCWeakValue  = ^JSCWeakValue;
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
{$ifndef JSCWeakValue_h}
{$define JSCWeakValue_h}
{$include <glib-object.h>}
{$include <jsc/JSCDefines.h>}
{$include <jsc/JSCValue.h>}

{ was #define dname def_expr }
function JSC_TYPE_WEAK_VALUE : longint; { return type might be wrong }

{JSC_DECLARE_FINAL_TYPE (JSCWeakValue, jsc_weak_value, JSC, WEAK_VALUE, GObject) }
function jsc_weak_value_new(value:PJSCValue):PJSCWeakValue;cdecl;external;
function jsc_weak_value_get_value(weak_value:PJSCWeakValue):PJSCValue;cdecl;external;
{$endif}
{ JSCWeakValue_h  }

implementation

{ was #define dname def_expr }
function JSC_TYPE_WEAK_VALUE : longint; { return type might be wrong }
  begin
    JSC_TYPE_WEAK_VALUE:=jsc_weak_value_get_type;
  end;


end.
