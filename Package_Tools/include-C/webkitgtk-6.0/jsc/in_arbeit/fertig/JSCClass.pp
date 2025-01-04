
unit JSCClass;
interface

{
  Automatically converted by H2Pas 1.0.0 from JSCClass.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    JSCClass.h
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
Pgchar  = ^gchar;
PGType  = ^GType;
PJSCClass  = ^JSCClass;
PJSCClassEnumeratePropertiesFunction  = ^JSCClassEnumeratePropertiesFunction;
PJSCClassGetPropertyFunction  = ^JSCClassGetPropertyFunction;
PJSCClassVTable  = ^JSCClassVTable;
PJSCContext  = ^JSCContext;
PJSCValue  = ^JSCValue;
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
{$ifndef JSCClass_h}
{$define JSCClass_h}
{$include <glib-object.h>}
{$include <jsc/JSCDefines.h>}
{$include <jsc/JSCValue.h>}

{ was #define dname def_expr }
function JSC_TYPE_CLASS : longint; { return type might be wrong }

{JSC_DECLARE_FINAL_TYPE (JSCClass, jsc_class, JSC, CLASS, GObject) }
type
(* Const before type ignored *)

  PJSCClassGetPropertyFunction = ^TJSCClassGetPropertyFunction;
  TJSCClassGetPropertyFunction = function (jsc_class:PJSCClass; context:PJSCContext; instance:Tgpointer; name:Pchar):PJSCValue;cdecl;
(* Const before type ignored *)

  TJSCClassSetPropertyFunction = function (jsc_class:PJSCClass; context:PJSCContext; instance:Tgpointer; name:Pchar; value:PJSCValue):Tgboolean;cdecl;
(* Const before type ignored *)

  TJSCClassHasPropertyFunction = function (jsc_class:PJSCClass; context:PJSCContext; instance:Tgpointer; name:Pchar):Tgboolean;cdecl;
(* Const before type ignored *)

  TJSCClassDeletePropertyFunction = function (jsc_class:PJSCClass; context:PJSCContext; instance:Tgpointer; name:Pchar):Tgboolean;cdecl;

  PJSCClassEnumeratePropertiesFunction = ^TJSCClassEnumeratePropertiesFunction;
  TJSCClassEnumeratePropertiesFunction = function (jsc_class:PJSCClass; context:PJSCContext; instance:Tgpointer):PPgchar;cdecl;
{< private > }

  PJSCClassVTable = ^TJSCClassVTable;
  TJSCClassVTable = record
      get_property : TJSCClassGetPropertyFunction;
      set_property : TJSCClassSetPropertyFunction;
      has_property : TJSCClassHasPropertyFunction;
      delete_property : TJSCClassDeletePropertyFunction;
      enumerate_properties : TJSCClassEnumeratePropertiesFunction;
      _jsc_reserved0 : procedure ;cdecl;
      _jsc_reserved1 : procedure ;cdecl;
      _jsc_reserved2 : procedure ;cdecl;
      _jsc_reserved3 : procedure ;cdecl;
      _jsc_reserved4 : procedure ;cdecl;
      _jsc_reserved5 : procedure ;cdecl;
      _jsc_reserved6 : procedure ;cdecl;
      _jsc_reserved7 : procedure ;cdecl;
    end;
(* Const before type ignored *)

function jsc_class_get_name(jsc_class:PJSCClass):Pchar;cdecl;external;
function jsc_class_get_parent(jsc_class:PJSCClass):PJSCClass;cdecl;external;
(* Const before type ignored *)
function jsc_class_add_constructor(jsc_class:PJSCClass; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
           return_type:TGType; n_params:Tguint; args:array of const):PJSCValue;cdecl;external;
function jsc_class_add_constructor(jsc_class:PJSCClass; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
           return_type:TGType; n_params:Tguint):PJSCValue;cdecl;external;
(* Const before type ignored *)
function jsc_class_add_constructorv(jsc_class:PJSCClass; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
           return_type:TGType; n_parameters:Tguint; parameter_types:PGType):PJSCValue;cdecl;external;
(* Const before type ignored *)
function jsc_class_add_constructor_variadic(jsc_class:PJSCClass; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
           return_type:TGType):PJSCValue;cdecl;external;
(* Const before type ignored *)
procedure jsc_class_add_method(jsc_class:PJSCClass; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
            return_type:TGType; n_params:Tguint; args:array of const);cdecl;external;
procedure jsc_class_add_method(jsc_class:PJSCClass; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
            return_type:TGType; n_params:Tguint);cdecl;external;
(* Const before type ignored *)
procedure jsc_class_add_methodv(jsc_class:PJSCClass; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
            return_type:TGType; n_parameters:Tguint; parameter_types:PGType);cdecl;external;
(* Const before type ignored *)
procedure jsc_class_add_method_variadic(jsc_class:PJSCClass; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
            return_type:TGType);cdecl;external;
(* Const before type ignored *)
procedure jsc_class_add_property(jsc_class:PJSCClass; name:Pchar; property_type:TGType; getter:TGCallback; setter:TGCallback; 
            user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
{$endif}
{ JSCClass_h  }

implementation

{ was #define dname def_expr }
function JSC_TYPE_CLASS : longint; { return type might be wrong }
  begin
    JSC_TYPE_CLASS:=jsc_class_get_type;
  end;


end.
