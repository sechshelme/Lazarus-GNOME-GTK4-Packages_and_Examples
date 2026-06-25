
unit gbinding;
interface

{
  Automatically converted by H2Pas 1.0.0 from gbinding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gbinding.h
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
PGBinding  = ^GBinding;
PGBindingFlags  = ^GBindingFlags;
Pgchar  = ^gchar;
PGClosure  = ^GClosure;
PGObject  = ^GObject;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gbinding.h: Binding for object properties
 *
 * Copyright (C) 2010  Intel Corp.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Emmanuele Bassi <ebassi@linux.intel.com>
  }
{$ifndef __G_BINDING_H__}
{$define __G_BINDING_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <gobject/gobject.h>}

{ was #define dname def_expr }
function G_TYPE_BINDING_FLAGS : longint; { return type might be wrong }

{ was #define dname def_expr }
function G_TYPE_BINDING : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BINDING(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_BINDING(obj : longint) : longint;

type
{*
 * GBindingTransformFunc:
 * @binding: a #GBinding
 * @from_value: the #GValue containing the value to transform
 * @to_value: the #GValue in which to store the transformed value
 * @user_data: data passed to the transform function
 *
 * A function to be called to transform @from_value to @to_value.
 *
 * If this is the @transform_to function of a binding, then @from_value
 * is the @source_property on the @source object, and @to_value is the
 * @target_property on the @target object. If this is the
 * @transform_from function of a %G_BINDING_BIDIRECTIONAL binding,
 * then those roles are reversed.
 *
 * Returns: %TRUE if the transformation was successful, and %FALSE
 *   otherwise
 *
 * Since: 2.26
  }
(* Const before type ignored *)

  TGBindingTransformFunc = function (binding:PGBinding; from_value:PGValue; to_value:PGValue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GBindingFlags:
 * @G_BINDING_DEFAULT: The default binding; if the source property
 *   changes, the target property is updated with its value.
 * @G_BINDING_BIDIRECTIONAL: Bidirectional binding; if either the
 *   property of the source or the property of the target changes,
 *   the other is updated.
 * @G_BINDING_SYNC_CREATE: Synchronize the values of the source and
 *   target properties when creating the binding; the direction of
 *   the synchronization is always from the source to the target.
 * @G_BINDING_INVERT_BOOLEAN: If the two properties being bound are
 *   booleans, setting one to %TRUE will result in the other being
 *   set to %FALSE and vice versa. This flag will only work for
 *   boolean properties, and cannot be used when passing custom
 *   transformation functions to g_object_bind_property_full().
 *
 * Flags to be passed to g_object_bind_property() or
 * g_object_bind_property_full().
 *
 * This enumeration can be extended at later date.
 *
 * Since: 2.26
  }
{< prefix=G_BINDING > }

  PGBindingFlags = ^TGBindingFlags;
  TGBindingFlags =  Longint;
  Const
    G_BINDING_DEFAULT = 0;
    G_BINDING_BIDIRECTIONAL = 1 shl 0;
    G_BINDING_SYNC_CREATE = 1 shl 1;
    G_BINDING_INVERT_BOOLEAN = 1 shl 2;
;

function g_binding_flags_get_type:TGType;cdecl;external;
function g_binding_get_type:TGType;cdecl;external;
function g_binding_get_flags(binding:PGBinding):TGBindingFlags;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_68_FOR(g_binding_dup_source) }
function g_binding_get_source(binding:PGBinding):PGObject;cdecl;external;
function g_binding_dup_source(binding:PGBinding):PGObject;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_68_FOR(g_binding_dup_target) }
function g_binding_get_target(binding:PGBinding):PGObject;cdecl;external;
function g_binding_dup_target(binding:PGBinding):PGObject;cdecl;external;
(* Const before type ignored *)
function g_binding_get_source_property(binding:PGBinding):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_binding_get_target_property(binding:PGBinding):Pgchar;cdecl;external;
procedure g_binding_unbind(binding:PGBinding);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_object_bind_property(source:Tgpointer; source_property:Pgchar; target:Tgpointer; target_property:Pgchar; flags:TGBindingFlags):PGBinding;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_object_bind_property_full(source:Tgpointer; source_property:Pgchar; target:Tgpointer; target_property:Pgchar; flags:TGBindingFlags; 
           transform_to:TGBindingTransformFunc; transform_from:TGBindingTransformFunc; user_data:Tgpointer; notify:TGDestroyNotify):PGBinding;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_object_bind_property_with_closures(source:Tgpointer; source_property:Pgchar; target:Tgpointer; target_property:Pgchar; flags:TGBindingFlags; 
           transform_to:PGClosure; transform_from:PGClosure):PGBinding;cdecl;external;
{$endif}
{ __G_BINDING_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_BINDING_FLAGS : longint; { return type might be wrong }
  begin
    G_TYPE_BINDING_FLAGS:=g_binding_flags_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_BINDING : longint; { return type might be wrong }
  begin
    G_TYPE_BINDING:=g_binding_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BINDING(obj : longint) : longint;
begin
  G_BINDING:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_BINDING,GBinding);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_BINDING(obj : longint) : longint;
begin
  G_IS_BINDING:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_BINDING);
end;


end.
