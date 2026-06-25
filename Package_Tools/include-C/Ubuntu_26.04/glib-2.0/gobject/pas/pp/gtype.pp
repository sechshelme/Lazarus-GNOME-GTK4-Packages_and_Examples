
unit gtype;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtype.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtype.h
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
Pc_type  = ^c_type;
Pgchar  = ^gchar;
Pgint  = ^gint;
PGInterfaceInfo  = ^GInterfaceInfo;
PGType  = ^GType;
PGTypeClass  = ^GTypeClass;
PGTypeCValue  = ^GTypeCValue;
PGTypeDebugFlags  = ^GTypeDebugFlags;
PGTypeFlags  = ^GTypeFlags;
PGTypeFundamentalFlags  = ^GTypeFundamentalFlags;
PGTypeFundamentalInfo  = ^GTypeFundamentalInfo;
PGTypeInfo  = ^GTypeInfo;
PGTypeInstance  = ^GTypeInstance;
PGTypeInterface  = ^GTypeInterface;
PGTypePlugin  = ^GTypePlugin;
PGTypeQuery  = ^GTypeQuery;
PGTypeValueCollectFunc  = ^GTypeValueCollectFunc;
PGTypeValueLCopyFunc  = ^GTypeValueLCopyFunc;
PGTypeValueTable  = ^GTypeValueTable;
Pguint  = ^guint;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 1998-1999, 2000-2001 Tim Janik and Red Hat, Inc.
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
  }
{$ifndef __G_TYPE_H__}
{$define __G_TYPE_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include  <glib.h>}
{$include <gobject/gobject-visibility.h>}
{ Basic Type Macros
  }
{*
 * G_TYPE_FUNDAMENTAL:
 * @type: A #GType value.
 * 
 * The fundamental type which is the ancestor of @type.
 *
 * Fundamental types are types that serve as ultimate bases for the derived types, 
 * thus they are the roots of distinct inheritance hierarchies.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_TYPE_FUNDAMENTAL(_type : longint) : longint;

{*
 * G_TYPE_FUNDAMENTAL_SHIFT:
 *
 * Shift value used in converting numbers to type IDs.
  }
const
  G_TYPE_FUNDAMENTAL_SHIFT = 2;  
{*
 * G_TYPE_FUNDAMENTAL_MAX: (value 1020)
 * 
 * An integer constant that represents the number of identifiers reserved
 * for types that are assigned at compile-time.
  }
  G_TYPE_FUNDAMENTAL_MAX = 255 shl G_TYPE_FUNDAMENTAL_SHIFT;  
{ Constant fundamental types,
  }
{*
 * G_TYPE_INVALID:
 * 
 * An invalid #GType used as error return value in some functions which return
 * a #GType. 
  }

{ was #define dname def_expr }
function G_TYPE_INVALID : longint; { return type might be wrong }

{*
 * G_TYPE_NONE:
 * 
 * A fundamental type which is used as a replacement for the C
 * void return type.
  }
{ was #define dname def_expr }
function G_TYPE_NONE : longint; { return type might be wrong }

{*
 * G_TYPE_INTERFACE:
 * 
 * The fundamental type from which all interfaces are derived.
  }
{ was #define dname def_expr }
function G_TYPE_INTERFACE : longint; { return type might be wrong }

{*
 * G_TYPE_CHAR:
 * 
 * The fundamental type corresponding to #gchar.
 *
 * The type designated by %G_TYPE_CHAR is unconditionally an 8-bit signed integer.
 * This may or may not be the same type a the C type "gchar".
  }
{ was #define dname def_expr }
function G_TYPE_CHAR : longint; { return type might be wrong }

{*
 * G_TYPE_UCHAR:
 * 
 * The fundamental type corresponding to #guchar.
  }
{ was #define dname def_expr }
function G_TYPE_UCHAR : longint; { return type might be wrong }

{*
 * G_TYPE_BOOLEAN:
 * 
 * The fundamental type corresponding to #gboolean.
  }
{ was #define dname def_expr }
function G_TYPE_BOOLEAN : longint; { return type might be wrong }

{*
 * G_TYPE_INT:
 * 
 * The fundamental type corresponding to #gint.
  }
{ was #define dname def_expr }
function G_TYPE_INT : longint; { return type might be wrong }

{*
 * G_TYPE_UINT:
 * 
 * The fundamental type corresponding to #guint.
  }
{ was #define dname def_expr }
function G_TYPE_UINT : longint; { return type might be wrong }

{*
 * G_TYPE_LONG:
 * 
 * The fundamental type corresponding to #glong.
  }
{ was #define dname def_expr }
function G_TYPE_LONG : longint; { return type might be wrong }

{*
 * G_TYPE_ULONG:
 * 
 * The fundamental type corresponding to #gulong.
  }
{ was #define dname def_expr }
function G_TYPE_ULONG : longint; { return type might be wrong }

{*
 * G_TYPE_INT64:
 * 
 * The fundamental type corresponding to #gint64.
  }
{ was #define dname def_expr }
function G_TYPE_INT64 : longint; { return type might be wrong }

{*
 * G_TYPE_UINT64:
 * 
 * The fundamental type corresponding to #guint64.
  }
{ was #define dname def_expr }
function G_TYPE_UINT64 : longint; { return type might be wrong }

{*
 * G_TYPE_ENUM:
 * 
 * The fundamental type from which all enumeration types are derived.
  }
{ was #define dname def_expr }
function G_TYPE_ENUM : longint; { return type might be wrong }

{*
 * G_TYPE_FLAGS:
 * 
 * The fundamental type from which all flags types are derived.
  }
{ was #define dname def_expr }
function G_TYPE_FLAGS : longint; { return type might be wrong }

{*
 * G_TYPE_FLOAT:
 * 
 * The fundamental type corresponding to #gfloat.
  }
{ was #define dname def_expr }
function G_TYPE_FLOAT : longint; { return type might be wrong }

{*
 * G_TYPE_DOUBLE:
 * 
 * The fundamental type corresponding to #gdouble.
  }
{ was #define dname def_expr }
function G_TYPE_DOUBLE : longint; { return type might be wrong }

{*
 * G_TYPE_STRING:
 * 
 * The fundamental type corresponding to nul-terminated C strings.
  }
{ was #define dname def_expr }
function G_TYPE_STRING : longint; { return type might be wrong }

{*
 * G_TYPE_POINTER:
 * 
 * The fundamental type corresponding to #gpointer.
  }
{ was #define dname def_expr }
function G_TYPE_POINTER : longint; { return type might be wrong }

{*
 * G_TYPE_BOXED:
 * 
 * The fundamental type from which all boxed types are derived.
  }
{ was #define dname def_expr }
function G_TYPE_BOXED : longint; { return type might be wrong }

{*
 * G_TYPE_PARAM:
 * 
 * The fundamental type from which all #GParamSpec types are derived.
  }
{ was #define dname def_expr }
function G_TYPE_PARAM : longint; { return type might be wrong }

{*
 * G_TYPE_OBJECT:
 * 
 * The fundamental type for #GObject.
  }
{ was #define dname def_expr }
function G_TYPE_OBJECT : longint; { return type might be wrong }

{*
 * G_TYPE_VARIANT:
 *
 * The fundamental type corresponding to #GVariant.
 *
 * All floating #GVariant instances passed through the #GType system are
 * consumed.
 * 
 * Note that callbacks in closures, and signal handlers
 * for signals of return type %G_TYPE_VARIANT, must never return floating
 * variants.
 *
 * Note: GLib 2.24 did include a boxed type with this name. It was replaced
 * with this fundamental type in 2.26.
 *
 * Since: 2.26
  }
{ was #define dname def_expr }
function G_TYPE_VARIANT : longint; { return type might be wrong }

{ Reserved fundamental type numbers to create new fundamental
 * type IDs with G_TYPE_MAKE_FUNDAMENTAL().
 *
 * Open an issue on https://gitlab.gnome.org/GNOME/glib/issues/new for
 * reservations.
  }
{*
 * G_TYPE_MAKE_FUNDAMENTAL:
 * @x: the fundamental type number.
 * 
 * Get the type ID for the fundamental type number @x.
 *
 * Use g_type_fundamental_next() instead of this macro to create new fundamental 
 * types.
 *
 * Returns: the GType
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_TYPE_MAKE_FUNDAMENTAL(x : longint) : TGType;

{*
 * G_TYPE_RESERVED_GLIB_FIRST:
 * 
 * First fundamental type number to create a new fundamental type id with
 * G_TYPE_MAKE_FUNDAMENTAL() reserved for GLib.
  }
const
  G_TYPE_RESERVED_GLIB_FIRST = 22;  
{*
 * G_TYPE_RESERVED_GLIB_LAST:
 * 
 * Last fundamental type number reserved for GLib.
  }
  G_TYPE_RESERVED_GLIB_LAST = 31;  
{*
 * G_TYPE_RESERVED_BSE_FIRST:
 * 
 * First fundamental type number to create a new fundamental type id with
 * G_TYPE_MAKE_FUNDAMENTAL() reserved for BSE.
  }
  G_TYPE_RESERVED_BSE_FIRST = 32;  
{*
 * G_TYPE_RESERVED_BSE_LAST:
 * 
 * Last fundamental type number reserved for BSE.
  }
  G_TYPE_RESERVED_BSE_LAST = 48;  
{*
 * G_TYPE_RESERVED_USER_FIRST:
 * 
 * First available fundamental type number to create new fundamental 
 * type id with G_TYPE_MAKE_FUNDAMENTAL().
  }
  G_TYPE_RESERVED_USER_FIRST = 49;  
{ Type Checking Macros
  }
{*
 * G_TYPE_IS_FUNDAMENTAL:
 * @type: A #GType value
 * 
 * Checks if @type is a fundamental type.
 *
 * Returns: %TRUE is @type is fundamental
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_TYPE_IS_FUNDAMENTAL(_type : longint) : longint;

{*
 * G_TYPE_IS_DERIVED:
 * @type: A #GType value
 * 
 * Checks if @type is derived (or in object-oriented terminology:
 * inherited) from another type (this holds true for all non-fundamental
 * types).
 *
 * Returns: %TRUE if @type is derived
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DERIVED(_type : longint) : longint;

{*
 * G_TYPE_IS_INTERFACE:
 * @type: A #GType value
 * 
 * Checks if @type is an interface type.
 *
 * An interface type provides a pure API, the implementation
 * of which is provided by another type (which is then said to conform
 * to the interface).  GLib interfaces are somewhat analogous to Java
 * interfaces and C++ classes containing only pure virtual functions, 
 * with the difference that GType interfaces are not derivable (but see
 * g_type_interface_add_prerequisite() for an alternative).
 *
 * Returns: %TRUE if @type is an interface
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_INTERFACE(_type : longint) : longint;

{*
 * G_TYPE_IS_CLASSED:
 * @type: A #GType value
 * 
 * Checks if @type is a classed type.
 *
 * A classed type has an associated #GTypeClass which can be derived to store
 * class-wide virtual function pointers and data for all instances of the type.
 * This allows for subclassing. All #GObjects are classed; none of the scalar
 * fundamental types built into GLib are classed.
 *
 * Interfaces are not classed: while their #GTypeInterface struct could be
 * considered similar to #GTypeClass, and classes can derive interfaces,
 * #GTypeInterface doesn’t allow for subclassing.
 *
 * Returns: %TRUE if @type is classed
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_CLASSED(_type : longint) : longint;

{*
 * G_TYPE_IS_INSTANTIATABLE:
 * @type: A #GType value
 * 
 * Checks if @type can be instantiated.  Instantiation is the
 * process of creating an instance (object) of this type.
 *
 * Returns: %TRUE if @type is instantiatable
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_INSTANTIATABLE(_type : longint) : longint;

{*
 * G_TYPE_IS_DERIVABLE:
 * @type: A #GType value
 * 
 * Checks if @type is a derivable type.  A derivable type can
 * be used as the base class of a flat (single-level) class hierarchy.
 *
 * Returns: %TRUE if @type is derivable
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DERIVABLE(_type : longint) : longint;

{*
 * G_TYPE_IS_DEEP_DERIVABLE:
 * @type: A #GType value
 * 
 * Checks if @type is a deep derivable type.  A deep derivable type
 * can be used as the base class of a deep (multi-level) class hierarchy.
 *
 * Returns: %TRUE if @type is deep derivable
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DEEP_DERIVABLE(_type : longint) : longint;

{*
 * G_TYPE_IS_ABSTRACT:
 * @type: A #GType value
 * 
 * Checks if @type is an abstract type.  An abstract type cannot be
 * instantiated and is normally used as an abstract base class for
 * derived classes.
 *
 * Returns: %TRUE if @type is abstract
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_ABSTRACT(_type : longint) : longint;

{*
 * G_TYPE_IS_VALUE_ABSTRACT:
 * @type: A #GType value
 * 
 * Checks if @type is an abstract value type.  An abstract value type introduces
 * a value table, but can't be used for g_value_init() and is normally used as
 * an abstract base type for derived value types.
 *
 * Returns: %TRUE if @type is an abstract value type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_VALUE_ABSTRACT(_type : longint) : longint;

{*
 * G_TYPE_IS_VALUE_TYPE:
 * @type: A #GType value
 * 
 * Checks if @type is a value type and can be used with g_value_init(). 
 *
 * Returns: %TRUE if @type is a value type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_VALUE_TYPE(_type : longint) : longint;

{*
 * G_TYPE_HAS_VALUE_TABLE:
 * @type: A #GType value
 * 
 * Checks if @type has a #GTypeValueTable.
 *
 * Returns: %TRUE if @type has a value table
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_HAS_VALUE_TABLE(_type : longint) : longint;

{*
 * G_TYPE_IS_FINAL:
 * @type: a #GType value
 *
 * Checks if @type is a final type. A final type cannot be derived any
 * further.
 *
 * Returns: %TRUE if @type is final
 *
 * Since: 2.70
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_FINAL(_type : longint) : longint;

{*
 * G_TYPE_IS_DEPRECATED:
 * @type: a #GType value
 *
 * Checks if @type is deprecated. Instantiating a deprecated type will
 * trigger a warning if running with `G_ENABLE_DIAGNOSTIC=1`.
 *
 * Returns: %TRUE if the type is deprecated
 *
 * Since: 2.76
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DEPRECATED(_type : longint) : longint;

{ Typedefs
  }
{*
 * GType:
 * 
 * A numerical value which represents the unique identifier of a registered
 * type.
  }
{$if     GLIB_SIZEOF_VOID_P > GLIB_SIZEOF_SIZE_T}
type
  PGType = ^TGType;
  TGType = Tguintptr;
(*** was #elif ****){$else     GLIB_SIZEOF_SIZE_T != GLIB_SIZEOF_LONG || !defined (G_CXX_STD_VERSION)}
type
  PGType = ^TGType;
  TGType = Tgsize;
{$else}
{ for historic reasons, C++ on non-Morello/CHERI systems links against gulong GTypes  }
type
  PGType = ^TGType;
  TGType = Tgulong;
{$endif}
type

  PGTypeCValue = ^TGTypeCValue;
  TGTypeCValue = TGTypeCValue;
{ Basic Type Structures
  }
{*
 * GTypeClass:
 * 
 * An opaque structure used as the base of all classes.
  }
{< private > }
  PGTypeClass = ^TGTypeClass;
  TGTypeClass = record
      g_type : TGType;
    end;

{*
 * GTypeInstance:
 * 
 * An opaque structure used as the base of all type instances.
  }
{< private > }
  PGTypeInstance = ^TGTypeInstance;
  TGTypeInstance = record
      g_class : PGTypeClass;
    end;

{*
 * GTypeInterface:
 * 
 * An opaque structure used as the base of all interface types.
  }
{< private > }
{ iface type  }
  PGTypeInterface = ^TGTypeInterface;
  TGTypeInterface = record
      g_type : TGType;
      g_instance_type : TGType;
    end;

{*
 * GTypeQuery:
 * @type: the #GType value of the type
 * @type_name: the name of the type
 * @class_size: the size of the class structure
 * @instance_size: the size of the instance structure
 * 
 * A structure holding information for a specific type.
 *
 * See also: g_type_query()
  }
(* Const before type ignored *)
  PGTypeQuery = ^TGTypeQuery;
  TGTypeQuery = record
      _type : TGType;
      type_name : Pgchar;
      class_size : Tguint;
      instance_size : Tguint;
    end;

{ Casts, checks and accessors for structured types
 * usage of these macros is reserved to type implementations only
  }
{< protected > }
{*
 * G_TYPE_CHECK_INSTANCE:
 * @instance: Location of a #GTypeInstance structure
 * 
 * Checks if @instance is a valid #GTypeInstance structure,
 * otherwise issues a warning and returns %FALSE. %NULL is not a valid
 * #GTypeInstance.
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: %TRUE if @instance is valid
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_TYPE_CHECK_INSTANCE(instance : longint) : longint;

{*
 * G_TYPE_CHECK_INSTANCE_CAST:
 * @instance: (nullable): Location of a #GTypeInstance structure
 * @g_type: The type to be returned
 * @c_type: The corresponding C type of @g_type
 * 
 * Checks that @instance is an instance of the type identified by @g_type
 * and issues a warning if this is not the case. Returns @instance casted 
 * to a pointer to @c_type.
 *
 * No warning will be issued if @instance is %NULL, and %NULL will be returned.
 * 
 * This macro should only be used in type implementations.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_INSTANCE_CAST(instance,g_type,c_type : longint) : longint;

{*
 * G_TYPE_CHECK_INSTANCE_TYPE:
 * @instance: (nullable): Location of a #GTypeInstance structure.
 * @g_type: The type to be checked
 * 
 * Checks if @instance is an instance of the type identified by @g_type. If
 * @instance is %NULL, %FALSE will be returned.
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: %TRUE if @instance is an instance of @g_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_INSTANCE_TYPE(instance,g_type : longint) : longint;

{*
 * G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE:
 * @instance: (nullable): Location of a #GTypeInstance structure.
 * @g_type: The fundamental type to be checked
 *
 * Checks if @instance is an instance of the fundamental type identified by @g_type.
 * If @instance is %NULL, %FALSE will be returned.
 *
 * This macro should only be used in type implementations.
 *
 * Returns: %TRUE if @instance is an instance of @g_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE(instance,g_type : longint) : longint;

{*
 * G_TYPE_INSTANCE_GET_CLASS:
 * @instance: Location of the #GTypeInstance structure
 * @g_type: The #GType of the class to be returned
 * @c_type: The C type of the class structure
 * 
 * Get the class structure of a given @instance, casted
 * to a specified ancestor type @g_type of the instance.
 * 
 * Note that while calling a GInstanceInitFunc(), the class pointer
 * gets modified, so it might not always return the expected pointer.
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: a pointer to the class structure
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_INSTANCE_GET_CLASS(instance,g_type,c_type : longint) : longint;

{*
 * G_TYPE_INSTANCE_GET_INTERFACE:
 * @instance: Location of the #GTypeInstance structure
 * @g_type: The #GType of the interface to be returned
 * @c_type: The C type of the interface structure
 * 
 * Get the interface structure for interface @g_type of a given @instance.
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: a pointer to the interface structure
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_INSTANCE_GET_INTERFACE(instance,g_type,c_type : longint) : longint;

{*
 * G_TYPE_CHECK_CLASS_CAST:
 * @g_class: Location of a #GTypeClass structure
 * @g_type: The type to be returned
 * @c_type: The corresponding C type of class structure of @g_type
 * 
 * Checks that @g_class is a class structure of the type identified by @g_type
 * and issues a warning if this is not the case. Returns @g_class casted 
 * to a pointer to @c_type. %NULL is not a valid class structure.
 * 
 * This macro should only be used in type implementations.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_CLASS_CAST(g_class,g_type,c_type : longint) : longint;

{*
 * G_TYPE_CHECK_CLASS_TYPE:
 * @g_class: (nullable): Location of a #GTypeClass structure
 * @g_type: The type to be checked
 * 
 * Checks if @g_class is a class structure of the type identified by 
 * @g_type. If @g_class is %NULL, %FALSE will be returned.
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: %TRUE if @g_class is a class structure of @g_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_CLASS_TYPE(g_class,g_type : longint) : longint;

{*
 * G_TYPE_CHECK_VALUE:
 * @value: a #GValue
 * 
 * Checks if @value has been initialized to hold values
 * of a value type.
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: %TRUE if @value is initialized
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_VALUE(value : longint) : longint;

{*
 * G_TYPE_CHECK_VALUE_TYPE:
 * @value: a #GValue
 * @g_type: The type to be checked
 * 
 * Checks if @value has been initialized to hold values
 * of type @g_type. 
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: %TRUE if @value has been initialized to hold values of type @g_type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_VALUE_TYPE(value,g_type : longint) : longint;

{*
 * G_TYPE_FROM_INSTANCE:
 * @instance: Location of a valid #GTypeInstance structure
 * 
 * Get the type identifier from a given @instance structure. 
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: the #GType
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_FROM_INSTANCE(instance : longint) : longint;

{*
 * G_TYPE_FROM_CLASS:
 * @g_class: Location of a valid #GTypeClass structure
 * 
 * Get the type identifier from a given @class structure.
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: the #GType
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_FROM_CLASS(g_class : longint) : longint;

{*
 * G_TYPE_FROM_INTERFACE:
 * @g_iface: Location of a valid #GTypeInterface structure
 * 
 * Get the type identifier from a given @interface structure.
 * 
 * This macro should only be used in type implementations.
 *
 * Returns: the #GType
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_FROM_INTERFACE(g_iface : longint) : longint;

{*
 * G_TYPE_INSTANCE_GET_PRIVATE:
 * @instance: the instance of a type deriving from @private_type
 * @g_type: the type identifying which private data to retrieve
 * @c_type: The C type for the private structure
 * 
 * Gets the private structure for a particular type.
 *
 * The private structure must have been registered in the
 * class_init function with g_type_class_add_private().
 * 
 * This macro should only be used in type implementations.
 * 
 * Since: 2.4
 * Deprecated: 2.58: Use G_ADD_PRIVATE() and the generated
 *   `your_type_get_instance_private()` function instead
 * Returns: (not nullable): a pointer to the private data structure
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_TYPE_INSTANCE_GET_PRIVATE(instance,g_type,c_type : longint) : Pc_type;

{*
 * G_TYPE_CLASS_GET_PRIVATE:
 * @klass: the class of a type deriving from @private_type
 * @g_type: the type identifying which private data to retrieve
 * @c_type: The C type for the private structure
 * 
 * Gets the private class structure for a particular type.
 *
 * The private structure must have been registered in the
 * get_type() function with g_type_add_class_private().
 * 
 * This macro should only be used in type implementations.
 * 
 * Since: 2.24
 * Returns: (not nullable): a pointer to the private data structure
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_TYPE_CLASS_GET_PRIVATE(klass,g_type,c_type : longint) : Pc_type;

{*
 * GTypeDebugFlags:
 * @G_TYPE_DEBUG_NONE: Print no messages
 * @G_TYPE_DEBUG_OBJECTS: Print messages about object bookkeeping
 * @G_TYPE_DEBUG_SIGNALS: Print messages about signal emissions
 * @G_TYPE_DEBUG_MASK: Mask covering all debug flags
 * @G_TYPE_DEBUG_INSTANCE_COUNT: Keep a count of instances of each type
 *
 * These flags used to be passed to g_type_init_with_debug_flags() which
 * is now deprecated.
 *
 * If you need to enable debugging features, use the `GOBJECT_DEBUG`
 * environment variable.
 *
 * Deprecated: 2.36: g_type_init() is now done automatically
  }
{< skip > }
type
  PGTypeDebugFlags = ^TGTypeDebugFlags;
  TGTypeDebugFlags =  Longint;
  Const
    G_TYPE_DEBUG_NONE = 0;
    G_TYPE_DEBUG_OBJECTS = 1 shl 0;
    G_TYPE_DEBUG_SIGNALS = 1 shl 1;
    G_TYPE_DEBUG_INSTANCE_COUNT = 1 shl 2;
    G_TYPE_DEBUG_MASK = $07;
;
{ --- prototypes ---  }
{xxxxxGLIB_DEPRECATED_IN_2_36 }

procedure g_type_init;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_36 }
procedure g_type_init_with_debug_flags(debug_flags:TGTypeDebugFlags);cdecl;external;
(* Const before type ignored *)
function g_type_name(_type:TGType):Pgchar;cdecl;external;
function g_type_qname(_type:TGType):TGQuark;cdecl;external;
(* Const before type ignored *)
function g_type_from_name(name:Pgchar):TGType;cdecl;external;
function g_type_parent(_type:TGType):TGType;cdecl;external;
function g_type_depth(_type:TGType):Tguint;cdecl;external;
function g_type_next_base(leaf_type:TGType; root_type:TGType):TGType;cdecl;external;
function g_type_is_a(_type:TGType; is_a_type:TGType):Tgboolean;cdecl;external;
function g_type_class_get(_type:TGType):Tgpointer;cdecl;external;
function g_type_class_ref(_type:TGType):Tgpointer;cdecl;external;
function g_type_class_peek(_type:TGType):Tgpointer;cdecl;external;
function g_type_class_peek_static(_type:TGType):Tgpointer;cdecl;external;
procedure g_type_class_unref(g_class:Tgpointer);cdecl;external;
function g_type_class_peek_parent(g_class:Tgpointer):Tgpointer;cdecl;external;
function g_type_interface_peek(instance_class:Tgpointer; iface_type:TGType):Tgpointer;cdecl;external;
function g_type_interface_peek_parent(g_iface:Tgpointer):Tgpointer;cdecl;external;
function g_type_default_interface_get(g_type:TGType):Tgpointer;cdecl;external;
function g_type_default_interface_ref(g_type:TGType):Tgpointer;cdecl;external;
function g_type_default_interface_peek(g_type:TGType):Tgpointer;cdecl;external;
procedure g_type_default_interface_unref(g_iface:Tgpointer);cdecl;external;
{ g_free() the returned arrays  }
function g_type_children(_type:TGType; n_children:Pguint):PGType;cdecl;external;
function g_type_interfaces(_type:TGType; n_interfaces:Pguint):PGType;cdecl;external;
{ per-type _static_ data  }
procedure g_type_set_qdata(_type:TGType; quark:TGQuark; data:Tgpointer);cdecl;external;
function g_type_get_qdata(_type:TGType; quark:TGQuark):Tgpointer;cdecl;external;
procedure g_type_query(_type:TGType; query:PGTypeQuery);cdecl;external;
function g_type_get_instance_count(_type:TGType):longint;cdecl;external;
{ --- type registration ---  }
{*
 * GBaseInitFunc:
 * @g_class: (type GObject.TypeClass): The #GTypeClass structure to initialize
 * 
 * A callback function used by the type system to do base initialization
 * of the class structures of derived types.
 *
 * This function is called as part of the initialization process of all derived
 * classes and should reallocate or reset all dynamic class members copied over
 * from the parent class.
 *
 * For example, class members (such as strings) that are not sufficiently
 * handled by a plain memory copy of the parent class into the derived class
 * have to be altered. See GClassInitFunc() for a discussion of the class
 * initialization process.
  }
type

  TGBaseInitFunc = procedure (g_class:Tgpointer);cdecl;
{*
 * GBaseFinalizeFunc:
 * @g_class: (type GObject.TypeClass): The #GTypeClass structure to finalize
 * 
 * A callback function used by the type system to finalize those portions
 * of a derived types class structure that were setup from the corresponding
 * GBaseInitFunc() function.
 *
 * Class finalization basically works the inverse way in which class
 * initialization is performed.
 *
 * See GClassInitFunc() for a discussion of the class initialization process.
  }

  TGBaseFinalizeFunc = procedure (g_class:Tgpointer);cdecl;
{*
 * GClassInitFunc:
 * @g_class: (type GObject.TypeClass): The #GTypeClass structure to initialize.
 * @class_data: The @class_data member supplied via the #GTypeInfo structure.
 * 
 * A callback function used by the type system to initialize the class
 * of a specific type.
 *
 * This function should initialize all static class members.
 *
 * The initialization process of a class involves:
 * 
 * - Copying common members from the parent class over to the
 *   derived class structure.
 * - Zero initialization of the remaining members not copied
 *   over from the parent class.
 * - Invocation of the GBaseInitFunc() initializers of all parent
 *   types and the class' type.
 * - Invocation of the class' GClassInitFunc() initializer.
 *
 * Since derived classes are partially initialized through a memory copy
 * of the parent class, the general rule is that GBaseInitFunc() and
 * GBaseFinalizeFunc() should take care of necessary reinitialization
 * and release of those class members that were introduced by the type
 * that specified these GBaseInitFunc()/GBaseFinalizeFunc().
 * GClassInitFunc() should only care about initializing static
 * class members, while dynamic class members (such as allocated strings
 * or reference counted resources) are better handled by a GBaseInitFunc()
 * for this type, so proper initialization of the dynamic class members
 * is performed for class initialization of derived types as well.
 *
 * An example may help to correspond the intend of the different class
 * initializers:
 * 
 * |[<!-- language="C" -->
 * typedef struct 
 *   GObjectClass parent_class;
 *   gint         static_integer;
 *   gchar       *dynamic_string;
 *  TypeAClass;
 * static void
 * type_a_base_class_init (TypeAClass *class)
 * 
 *   class->dynamic_string = g_strdup ("some string");
 * 
 * static void
 * type_a_base_class_finalize (TypeAClass *class)
 * 
 *   g_free (class->dynamic_string);
 * 
 * static void
 * type_a_class_init (TypeAClass *class)
 * 
 *   class->static_integer = 42;
 * 
 * 
 * typedef struct 
 *   TypeAClass   parent_class;
 *   gfloat       static_float;
 *   GString     *dynamic_gstring;
 *  TypeBClass;
 * static void
 * type_b_base_class_init (TypeBClass *class)
 * 
 *   class->dynamic_gstring = g_string_new ("some other string");
 * 
 * static void
 * type_b_base_class_finalize (TypeBClass *class)
 * 
 *   g_string_free (class->dynamic_gstring);
 * 
 * static void
 * type_b_class_init (TypeBClass *class)
 * 
 *   class->static_float = 3.14159265358979323846;
 * 
 * ]|
 *
 * Initialization of TypeBClass will first cause initialization of
 * TypeAClass (derived classes reference their parent classes, see
 * g_type_class_ref() on this).
 *
 * Initialization of TypeAClass roughly involves zero-initializing its fields,
 * then calling its GBaseInitFunc() type_a_base_class_init() to allocate
 * its dynamic members (dynamic_string), and finally calling its GClassInitFunc()
 * type_a_class_init() to initialize its static members (static_integer).
 * The first step in the initialization process of TypeBClass is then
 * a plain memory copy of the contents of TypeAClass into TypeBClass and 
 * zero-initialization of the remaining fields in TypeBClass.
 * The dynamic members of TypeAClass within TypeBClass now need
 * reinitialization which is performed by calling type_a_base_class_init()
 * with an argument of TypeBClass.
 *
 * After that, the GBaseInitFunc() of TypeBClass, type_b_base_class_init()
 * is called to allocate the dynamic members of TypeBClass (dynamic_gstring),
 * and finally the GClassInitFunc() of TypeBClass, type_b_class_init(),
 * is called to complete the initialization process with the static members
 * (static_float).
 *
 * Corresponding finalization counter parts to the GBaseInitFunc() functions
 * have to be provided to release allocated resources at class finalization
 * time.
  }

  TGClassInitFunc = procedure (g_class:Tgpointer; class_data:Tgpointer);cdecl;
{*
 * GClassFinalizeFunc:
 * @g_class: (type GObject.TypeClass): The #GTypeClass structure to finalize
 * @class_data: The @class_data member supplied via the #GTypeInfo structure
 * 
 * A callback function used by the type system to finalize a class.
 *
 * This function is rarely needed, as dynamically allocated class resources
 * should be handled by GBaseInitFunc() and GBaseFinalizeFunc().
 *
 * Also, specification of a GClassFinalizeFunc() in the #GTypeInfo
 * structure of a static type is invalid, because classes of static types
 * will never be finalized (they are artificially kept alive when their
 * reference count drops to zero).
  }

  TGClassFinalizeFunc = procedure (g_class:Tgpointer; class_data:Tgpointer);cdecl;
{*
 * GInstanceInitFunc:
 * @instance: The instance to initialize
 * @g_class: (type GObject.TypeClass): The class of the type the instance is
 *    created for
 * 
 * A callback function used by the type system to initialize a new
 * instance of a type.
 *
 * This function initializes all instance members and allocates any resources
 * required by it.
 *
 * Initialization of a derived instance involves calling all its parent
 * types instance initializers, so the class member of the instance
 * is altered during its initialization to always point to the class that
 * belongs to the type the current initializer was introduced for.
 *
 * The extended members of @instance are guaranteed to have been filled with
 * zeros before this function is called.
  }

  TGInstanceInitFunc = procedure (instance:PGTypeInstance; g_class:Tgpointer);cdecl;
{*
 * GInterfaceInitFunc:
 * @g_iface: (type GObject.TypeInterface): The interface structure to initialize
 * @iface_data: The @interface_data supplied via the #GInterfaceInfo structure
 * 
 * A callback function used by the type system to initialize a new
 * interface.
 *
 * This function should initialize all internal data and* allocate any
 * resources required by the interface.
 *
 * The members of @iface_data are guaranteed to have been filled with
 * zeros before this function is called.
  }

  TGInterfaceInitFunc = procedure (g_iface:Tgpointer; iface_data:Tgpointer);cdecl;
{*
 * GInterfaceFinalizeFunc:
 * @g_iface: (type GObject.TypeInterface): The interface structure to finalize
 * @iface_data: The @interface_data supplied via the #GInterfaceInfo structure
 * 
 * A callback function used by the type system to finalize an interface.
 *
 * This function should destroy any internal data and release any resources
 * allocated by the corresponding GInterfaceInitFunc() function.
  }

  TGInterfaceFinalizeFunc = procedure (g_iface:Tgpointer; iface_data:Tgpointer);cdecl;
{*
 * GTypeClassCacheFunc:
 * @cache_data: data that was given to the g_type_add_class_cache_func() call
 * @g_class: (type GObject.TypeClass): The #GTypeClass structure which is
 *    unreferenced
 * 
 * A callback function which is called when the reference count of a class 
 * drops to zero.
 *
 * It may use g_type_class_ref() to prevent the class from being freed. You
 * should not call g_type_class_unref() from a #GTypeClassCacheFunc function
 * to prevent infinite recursion, use g_type_class_unref_uncached() instead.
 * 
 * The functions have to check the class id passed in to figure 
 * whether they actually want to cache the class of this type, since all
 * classes are routed through the same #GTypeClassCacheFunc chain.
 * 
 * Returns: %TRUE to stop further #GTypeClassCacheFuncs from being 
 *  called, %FALSE to continue
  }

  TGTypeClassCacheFunc = function (cache_data:Tgpointer; g_class:PGTypeClass):Tgboolean;cdecl;
{*
 * GTypeInterfaceCheckFunc:
 * @check_data: data passed to g_type_add_interface_check()
 * @g_iface: (type GObject.TypeInterface): the interface that has been
 *    initialized
 * 
 * A callback called after an interface vtable is initialized.
 *
 * See g_type_add_interface_check().
 * 
 * Since: 2.4
  }

  TGTypeInterfaceCheckFunc = procedure (check_data:Tgpointer; g_iface:Tgpointer);cdecl;
{*
 * GTypeFundamentalFlags:
 * @G_TYPE_FLAG_CLASSED: Indicates a classed type
 * @G_TYPE_FLAG_INSTANTIATABLE: Indicates an instantiatable type (implies classed)
 * @G_TYPE_FLAG_DERIVABLE: Indicates a flat derivable type
 * @G_TYPE_FLAG_DEEP_DERIVABLE: Indicates a deep derivable type (implies derivable)
 * 
 * Bit masks used to check or determine specific characteristics of a
 * fundamental type.
  }
{< skip > }
{ There is no G_TYPE_FUNDAMENTAL_FLAGS_NONE: this is implemented to use
   * the same bits as GTypeFlags  }

  PGTypeFundamentalFlags = ^TGTypeFundamentalFlags;
  TGTypeFundamentalFlags =  Longint;
  Const
    G_TYPE_FLAG_CLASSED = 1 shl 0;
    G_TYPE_FLAG_INSTANTIATABLE = 1 shl 1;
    G_TYPE_FLAG_DERIVABLE = 1 shl 2;
    G_TYPE_FLAG_DEEP_DERIVABLE = 1 shl 3;
;
{*
 * GTypeFlags:
 * @G_TYPE_FLAG_NONE: No special flags. Since: 2.74
 * @G_TYPE_FLAG_ABSTRACT: Indicates an abstract type. No instances can be
 *  created for an abstract type
 * @G_TYPE_FLAG_VALUE_ABSTRACT: Indicates an abstract value type, i.e. a type
 *  that introduces a value table, but can't be used for
 *  g_value_init()
 * @G_TYPE_FLAG_FINAL: Indicates a final type. A final type is a non-derivable
 *  leaf node in a deep derivable type hierarchy tree. Since: 2.70
 * @G_TYPE_FLAG_DEPRECATED: The type is deprecated and may be removed in a
 *  future version. A warning will be emitted if it is instantiated while
 *  running with `G_ENABLE_DIAGNOSTIC=1`. Since 2.76
 * 
 * Bit masks used to check or determine characteristics of a type.
  }
{< skip > }
type
  PGTypeFlags = ^TGTypeFlags;
  TGTypeFlags =  Longint;
  Const
    G_TYPE_FLAG_NONE = 0;
    G_TYPE_FLAG_ABSTRACT = 1 shl 4;
    G_TYPE_FLAG_VALUE_ABSTRACT = 1 shl 5;
    G_TYPE_FLAG_FINAL = 1 shl 6;
    G_TYPE_FLAG_DEPRECATED = 1 shl 7;
;
{*
 * GTypeInfo:
 * @class_size: Size of the class structure (required for interface, classed and instantiatable types)
 * @base_init: Location of the base initialization function (optional)
 * @base_finalize: Location of the base finalization function (optional)
 * @class_init: Location of the class initialization function for
 *  classed and instantiatable types. Location of the default vtable 
 *  initialization function for interface types. (optional) This function
 *  is used both to fill in virtual functions in the class or default vtable, 
 *  and to do type-specific setup such as registering signals and object
 *  properties.
 * @class_finalize: Location of the class finalization function for
 *  classed and instantiatable types. Location of the default vtable
 *  finalization function for interface types. (optional)
 * @class_data: User-supplied data passed to the class init/finalize functions
 * @instance_size: Size of the instance (object) structure (required for instantiatable types only)
 * @n_preallocs: Prior to GLib 2.10, it specified the number of pre-allocated (cached) instances to reserve memory for (0 indicates no caching). Since GLib 2.10 this field is ignored.
 * @instance_init: Location of the instance initialization function (optional, for instantiatable types only)
 * @value_table: A #GTypeValueTable function table for generic handling of GValues
 *  of this type (usually only useful for fundamental types)
 * 
 * This structure is used to provide the type system with the information
 * required to initialize and destruct (finalize) a type's class and
 * its instances.
 *
 * The initialized structure is passed to the g_type_register_static() function
 * (or is copied into the provided #GTypeInfo structure in the
 * g_type_plugin_complete_type_info()). The type system will perform a deep
 * copy of this structure, so its memory does not need to be persistent
 * across invocation of g_type_register_static().
  }
{ interface types, classed types, instantiated types  }
{ interface types, classed types, instantiated types  }
{ instantiated types  }
{ value handling  }
(* Const before type ignored *)
type
  PGTypeInfo = ^TGTypeInfo;
  TGTypeInfo = record
      class_size : Tguint16;
      base_init : TGBaseInitFunc;
      base_finalize : TGBaseFinalizeFunc;
      class_init : TGClassInitFunc;
      class_finalize : TGClassFinalizeFunc;
      class_data : Tgconstpointer;
      instance_size : Tguint16;
      n_preallocs : Tguint16;
      instance_init : TGInstanceInitFunc;
      value_table : PGTypeValueTable;
    end;

{*
 * GTypeFundamentalInfo:
 * @type_flags: #GTypeFundamentalFlags describing the characteristics of the fundamental type
 * 
 * A structure that provides information to the type system which is
 * used specifically for managing fundamental types.  
  }
  PGTypeFundamentalInfo = ^TGTypeFundamentalInfo;
  TGTypeFundamentalInfo = record
      type_flags : TGTypeFundamentalFlags;
    end;

{*
 * GInterfaceInfo:
 * @interface_init: location of the interface initialization function
 * @interface_finalize: location of the interface finalization function
 * @interface_data: user-supplied data passed to the interface init/finalize functions
 * 
 * A structure that provides information to the type system which is
 * used specifically for managing interface types.
  }
  PGInterfaceInfo = ^TGInterfaceInfo;
  TGInterfaceInfo = record
      interface_init : TGInterfaceInitFunc;
      interface_finalize : TGInterfaceFinalizeFunc;
      interface_data : Tgpointer;
    end;

{*
 * GTypeValueInitFunc:
 * @value: the value to initialize
 *
 * Initializes the value contents by setting the fields of the `value->data`
 * array.
 *
 * The data array of the #GValue passed into this function was zero-filled
 * with `memset()`, so no care has to be taken to free any old contents.
 * For example, in the case of a string value that may never be %NULL, the
 * implementation might look like:
 *
 * |[<!-- language="C" -->
 * value->data[0].v_pointer = g_strdup ("");
 * ]|
 *
 * Since: 2.78
  }

  TGTypeValueInitFunc = procedure (value:PGValue);cdecl;
{*
 * GTypeValueFreeFunc:
 * @value: the value to free
 *
 * Frees any old contents that might be left in the `value->data` array of
 * the given value.
 *
 * No resources may remain allocated through the #GValue contents after this
 * function returns. E.g. for our above string type:
 *
 * |[<!-- language="C" -->
 * // only free strings without a specific flag for static storage
 * if (!(value->data[1].v_uint & G_VALUE_NOCOPY_CONTENTS))
 *   g_free (value->data[0].v_pointer);
 * ]|
 *
 * Since: 2.78
  }

  TGTypeValueFreeFunc = procedure (value:PGValue);cdecl;
{*
 * GTypeValueCopyFunc:
 * @src_value: the value to copy
 * @dest_value: (out): the location of the copy
 *
 * Copies the content of a #GValue into another.
 *
 * The @dest_value is a #GValue with zero-filled data section and @src_value
 * is a properly initialized #GValue of same type, or derived type.
 *
 * The purpose of this function is to copy the contents of @src_value
 * into @dest_value in a way, that even after @src_value has been freed, the
 * contents of @dest_value remain valid. String type example:
 *
 * |[<!-- language="C" -->
 * dest_value->data[0].v_pointer = g_strdup (src_value->data[0].v_pointer);
 * ]|
 *
 * Since: 2.78
  }
(* Const before type ignored *)

  TGTypeValueCopyFunc = procedure (src_value:PGValue; dest_value:PGValue);cdecl;
{*
 * GTypeValuePeekPointerFunc:
 * @value: the value to peek
 *
 * If the value contents fit into a pointer, such as objects or strings,
 * return this pointer, so the caller can peek at the current contents.
 *
 * To extend on our above string example:
 *
 * |[<!-- language="C" -->
 * return value->data[0].v_pointer;
 * ]|
 *
 * Returns: (transfer none): a pointer to the value contents
 *
 * Since: 2.78
  }
(* Const before type ignored *)

  TGTypeValuePeekPointerFunc = function (value:PGValue):Tgpointer;cdecl;
{*
 * GTypeValueCollectFunc:
 * @value: the value to initialize
 * @n_collect_values: the number of collected values
 * @collect_values: (array length=n_collect_values): the collected values
 * @collect_flags: optional flags
 *
 * This function is responsible for converting the values collected from
 * a variadic argument list into contents suitable for storage in a #GValue.
 *
 * This function should setup @value similar to #GTypeValueInitFunc; e.g.
 * for a string value that does not allow `NULL` pointers, it needs to either
 * emit an error, or do an implicit conversion by storing an empty string.
 *
 * The @value passed in to this function has a zero-filled data array, so
 * just like for #GTypeValueInitFunc it is guaranteed to not contain any old
 * contents that might need freeing.
 *
 * The @n_collect_values argument is the string length of the `collect_format`
 * field of #GTypeValueTable, and `collect_values` is an array of #GTypeCValue
 * with length of @n_collect_values, containing the collected values according
 * to `collect_format`.
 *
 * The @collect_flags argument provided as a hint by the caller. It may
 * contain the flag %G_VALUE_NOCOPY_CONTENTS indicating that the collected
 * value contents may be considered ‘static’ for the duration of the @value
 * lifetime. Thus an extra copy of the contents stored in @collect_values is
 * not required for assignment to @value.
 *
 * For our above string example, we continue with:
 *
 * |[<!-- language="C" -->
 * if (!collect_values[0].v_pointer)
 *   value->data[0].v_pointer = g_strdup ("");
 * else if (collect_flags & G_VALUE_NOCOPY_CONTENTS)
 *   
 *     value->data[0].v_pointer = collect_values[0].v_pointer;
 *     // keep a flag for the value_free() implementation to not free this string
 *     value->data[1].v_uint = G_VALUE_NOCOPY_CONTENTS;
 *   
 * else
 *   value->data[0].v_pointer = g_strdup (collect_values[0].v_pointer);
 * return NULL;
 * ]|
 *
 * It should be noted, that it is generally a bad idea to follow the
 * %G_VALUE_NOCOPY_CONTENTS hint for reference counted types. Due to
 * reentrancy requirements and reference count assertions performed
 * by the signal emission code, reference counts should always be
 * incremented for reference counted contents stored in the `value->data`
 * array. To deviate from our string example for a moment, and taking
 * a look at an exemplary implementation for `GTypeValueTable.collect_value()`
 * of `GObject`:
 *
 * |[<!-- language="C" -->
 * GObject *object = G_OBJECT (collect_values[0].v_pointer);
 * g_return_val_if_fail (object != NULL,
 *    g_strdup_printf ("Object %p passed as invalid NULL pointer", object));
 * // never honour G_VALUE_NOCOPY_CONTENTS for ref-counted types
 * value->data[0].v_pointer = g_object_ref (object);
 * return NULL;
 * ]|
 *
 * The reference count for valid objects is always incremented, regardless
 * of `collect_flags`. For invalid objects, the example returns a newly
 * allocated string without altering `value`.
 *
 * Upon success, `collect_value()` needs to return `NULL`. If, however,
 * an error condition occurred, `collect_value()` should return a newly
 * allocated string containing an error diagnostic.
 *
 * The calling code makes no assumptions about the `value` contents being
 * valid upon error returns, `value` is simply thrown away without further
 * freeing. As such, it is a good idea to not allocate `GValue` contents
 * prior to returning an error; however, `collect_values()` is not obliged
 * to return a correctly setup @value for error returns, simply because
 * any non-`NULL` return is considered a fatal programming error, and
 * further program behaviour is undefined.
 *
 * Returns: (transfer full) (nullable): `NULL` on success, otherwise a
 *   newly allocated error string on failure
 *
 * Since: 2.78
  }

  PGTypeValueCollectFunc = ^TGTypeValueCollectFunc;
  TGTypeValueCollectFunc = function (value:PGValue; n_collect_values:Tguint; collect_values:PGTypeCValue; collect_flags:Tguint):Pgchar;cdecl;
{*
 * GTypeValueLCopyFunc:
 * @value: the value to lcopy
 * @n_collect_values: the number of collected values
 * @collect_values: (array length=n_collect_values): the collected
 *   locations for storage
 * @collect_flags: optional flags
 *
 * This function is responsible for storing the `value`
 * contents into arguments passed through a variadic argument list which
 * got collected into `collect_values` according to `lcopy_format`.
 *
 * The `n_collect_values` argument equals the string length of
 * `lcopy_format`, and `collect_flags` may contain %G_VALUE_NOCOPY_CONTENTS.
 *
 * In contrast to #GTypeValueCollectFunc, this function is obliged to always
 * properly support %G_VALUE_NOCOPY_CONTENTS.
 *
 * Similar to #GTypeValueCollectFunc the function may prematurely abort by
 * returning a newly allocated string describing an error condition. To
 * complete the string example:
 *
 * |[<!-- language="C" -->
 * gchar **string_p = collect_values[0].v_pointer;
 * g_return_val_if_fail (string_p != NULL,
 *   g_strdup ("string location passed as NULL"));
 *
 * if (collect_flags & G_VALUE_NOCOPY_CONTENTS)
 *   *string_p = value->data[0].v_pointer;
 * else
 *   *string_p = g_strdup (value->data[0].v_pointer);
 * ]|
 *
 * And an illustrative version of this function for reference-counted
 * types:
 *
 * |[<!-- language="C" -->
 * GObject **object_p = collect_values[0].v_pointer;
 * g_return_val_if_fail (object_p != NULL,
 *   g_strdup ("object location passed as NULL"));
 *
 * if (value->data[0].v_pointer == NULL)
 *   *object_p = NULL;
 * else if (collect_flags & G_VALUE_NOCOPY_CONTENTS) // always honour
 *   *object_p = value->data[0].v_pointer;
 * else
 *   *object_p = g_object_ref (value->data[0].v_pointer);
 *
 * return NULL;
 * ]|
 *
 * Returns: (transfer full) (nullable): `NULL` on success, otherwise
 *   a newly allocated error string on failure
 *
 * Since: 2.78
  }
(* Const before type ignored *)

  PGTypeValueLCopyFunc = ^TGTypeValueLCopyFunc;
  TGTypeValueLCopyFunc = function (value:PGValue; n_collect_values:Tguint; collect_values:PGTypeCValue; collect_flags:Tguint):Pgchar;cdecl;
{*
 * GTypeValueTable:
 * @value_init: Function to initialize a GValue
 * @value_free: Function to free a GValue
 * @value_copy: Function to copy a GValue
 * @value_peek_pointer: Function to peek the contents of a GValue if they fit
 *   into a pointer
 * @collect_format: A string format describing how to collect the contents of
 *   this value bit-by-bit. Each character in the format represents
 *   an argument to be collected, and the characters themselves indicate
 *   the type of the argument. Currently supported arguments are:
 *
 *   - `'i'`: Integers, passed as `collect_values[].v_int`
 *   - `'l'`: Longs, passed as `collect_values[].v_long`
 *   - `'d'`: Doubles, passed as `collect_values[].v_double`
 *   - `'p'`: Pointers, passed as `collect_values[].v_pointer`
 *
 *   It should be noted that for variable argument list construction,
 *   ANSI C promotes every type smaller than an integer to an int, and
 *   floats to doubles. So for collection of short int or char, `'i'`
 *   needs to be used, and for collection of floats `'d'`.
 * @collect_value: Function to initialize a GValue from the values
 *   collected from variadic arguments
 * @lcopy_format: Format description of the arguments to collect for @lcopy_value,
 *   analogous to @collect_format. Usually, @lcopy_format string consists
 *   only of `'p'`s to provide lcopy_value() with pointers to storage locations.
 * @lcopy_value: Function to store the contents of a value into the
 *   locations collected from variadic arguments
 *
 * The #GTypeValueTable provides the functions required by the #GValue
 * implementation, to serve as a container for values of a type.
  }
(* Const before type ignored *)
(* Const before type ignored *)
  PGTypeValueTable = ^TGTypeValueTable;
  TGTypeValueTable = record
      value_init : TGTypeValueInitFunc;cdecl;
      value_free : TGTypeValueFreeFunc;
      value_copy : TGTypeValueCopyFunc;
      value_peek_pointer : TGTypeValuePeekPointerFunc;
      collect_format : Pgchar;
      collect_value : TGTypeValueCollectFunc;
      lcopy_format : Pgchar;
      lcopy_value : TGTypeValueLCopyFunc;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function g_type_register_static(parent_type:TGType; type_name:Pgchar; info:PGTypeInfo; flags:TGTypeFlags):TGType;cdecl;external;
(* Const before type ignored *)
function g_type_register_static_simple(parent_type:TGType; type_name:Pgchar; class_size:Tguint; class_init:TGClassInitFunc; instance_size:Tguint; 
           instance_init:TGInstanceInitFunc; flags:TGTypeFlags):TGType;cdecl;external;
(* Const before type ignored *)
function g_type_register_dynamic(parent_type:TGType; type_name:Pgchar; plugin:PGTypePlugin; flags:TGTypeFlags):TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_type_register_fundamental(type_id:TGType; type_name:Pgchar; info:PGTypeInfo; finfo:PGTypeFundamentalInfo; flags:TGTypeFlags):TGType;cdecl;external;
(* Const before type ignored *)
procedure g_type_add_interface_static(instance_type:TGType; interface_type:TGType; info:PGInterfaceInfo);cdecl;external;
procedure g_type_add_interface_dynamic(instance_type:TGType; interface_type:TGType; plugin:PGTypePlugin);cdecl;external;
procedure g_type_interface_add_prerequisite(interface_type:TGType; prerequisite_type:TGType);cdecl;external;
function g_type_interface_prerequisites(interface_type:TGType; n_prerequisites:Pguint):PGType;cdecl;external;
function g_type_interface_instantiatable_prerequisite(interface_type:TGType):TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_58 }
procedure g_type_class_add_private(g_class:Tgpointer; private_size:Tgsize);cdecl;external;
function g_type_add_instance_private(class_type:TGType; private_size:Tgsize):Tgint;cdecl;external;
function g_type_instance_get_private(instance:PGTypeInstance; private_type:TGType):Tgpointer;cdecl;external;
procedure g_type_class_adjust_private_offset(g_class:Tgpointer; private_size_or_offset:Pgint);cdecl;external;
procedure g_type_add_class_private(class_type:TGType; private_size:Tgsize);cdecl;external;
function g_type_class_get_private(klass:PGTypeClass; private_type:TGType):Tgpointer;cdecl;external;
function g_type_class_get_instance_private_offset(g_class:Tgpointer):Tgint;cdecl;external;
procedure g_type_ensure(_type:TGType);cdecl;external;
function g_type_get_type_registration_serial:Tguint;cdecl;external;
{ we need to have this macro under conditional expansion, as it references
 * a function that has been added in 2.38. see bug:
 * https://bugzilla.gnome.org/show_bug.cgi?id=703191
  }
{ This was defined before we had _G_DEFINE_TYPE_EXTENDED_WITH_PRELUDE in
 * gtype-private.h, it's simplest to keep it.
  }
{ Only use this in non-C++ on GCC >= 2.7, except for Darwin/ppc64.
 * See https://bugzilla.gnome.org/show_bug.cgi?id=647145
  }
{ --- protected (for fundamental type implementations) ---  }
function g_type_get_plugin(_type:TGType):PGTypePlugin;cdecl;external;
function g_type_interface_get_plugin(instance_type:TGType; interface_type:TGType):PGTypePlugin;cdecl;external;
function g_type_fundamental_next:TGType;cdecl;external;
function g_type_fundamental(type_id:TGType):TGType;cdecl;external;
function g_type_create_instance(_type:TGType):PGTypeInstance;cdecl;external;
procedure g_type_free_instance(instance:PGTypeInstance);cdecl;external;
procedure g_type_add_class_cache_func(cache_data:Tgpointer; cache_func:TGTypeClassCacheFunc);cdecl;external;
procedure g_type_remove_class_cache_func(cache_data:Tgpointer; cache_func:TGTypeClassCacheFunc);cdecl;external;
procedure g_type_class_unref_uncached(g_class:Tgpointer);cdecl;external;
procedure g_type_add_interface_check(check_data:Tgpointer; check_func:TGTypeInterfaceCheckFunc);cdecl;external;
procedure g_type_remove_interface_check(check_data:Tgpointer; check_func:TGTypeInterfaceCheckFunc);cdecl;external;
function g_type_value_table_peek(_type:TGType):PGTypeValueTable;cdecl;external;
{< private > }
function g_type_check_instance(instance:PGTypeInstance):Tgboolean;cdecl;external;
function g_type_check_instance_cast(instance:PGTypeInstance; iface_type:TGType):PGTypeInstance;cdecl;external;
function g_type_check_instance_is_a(instance:PGTypeInstance; iface_type:TGType):Tgboolean;cdecl;external;
function g_type_check_instance_is_fundamentally_a(instance:PGTypeInstance; fundamental_type:TGType):Tgboolean;cdecl;external;
function g_type_check_class_cast(g_class:PGTypeClass; is_a_type:TGType):PGTypeClass;cdecl;external;
function g_type_check_class_is_a(g_class:PGTypeClass; is_a_type:TGType):Tgboolean;cdecl;external;
function g_type_check_is_value_type(_type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_type_check_value(value:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_type_check_value_holds(value:PGValue; _type:TGType):Tgboolean;cdecl;external;
function g_type_test_flags(_type:TGType; flags:Tguint):Tgboolean;cdecl;external;
{ --- debugging functions ---  }
(* Const before type ignored *)
function g_type_name_from_instance(instance:PGTypeInstance):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_type_name_from_class(g_class:PGTypeClass):Pgchar;cdecl;external;
{*
 * G_TYPE_FLAG_RESERVED_ID_BIT:
 * 
 * A bit in the type number that's supposed to be left untouched.
  }
{ was #define dname def_expr }
function G_TYPE_FLAG_RESERVED_ID_BIT : TGType;  

{*
 * GPOINTER_TO_TYPE:
 * @p: The pointer to convert to a #GType
 *
 * This macro should be used instead of GPOINTER_TO_SIZE() to ensure
 * portability since #GType is not guaranteed to be the same as #gsize.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GPOINTER_TO_TYPE(p : longint) : TGType;

{*
 * GTYPE_TO_POINTER:
 * @t: The #GType to convert to a pointer
 *
 * This macro should be used instead of GSIZE_TO_POINTER() to ensure
 * portability since #GType is not guaranteed to be the same as #gsize.
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GTYPE_TO_POINTER(t : longint) : Tgpointer;

{$endif}
{ __G_TYPE_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_FUNDAMENTAL(_type : longint) : longint;
begin
  G_TYPE_FUNDAMENTAL:=g_type_fundamental(_type);
end;

{ was #define dname def_expr }
function G_TYPE_INVALID : longint; { return type might be wrong }
  begin
    G_TYPE_INVALID:=G_TYPE_MAKE_FUNDAMENTAL(0);
  end;

{ was #define dname def_expr }
function G_TYPE_NONE : longint; { return type might be wrong }
  begin
    G_TYPE_NONE:=G_TYPE_MAKE_FUNDAMENTAL(1);
  end;

{ was #define dname def_expr }
function G_TYPE_INTERFACE : longint; { return type might be wrong }
  begin
    G_TYPE_INTERFACE:=G_TYPE_MAKE_FUNDAMENTAL(2);
  end;

{ was #define dname def_expr }
function G_TYPE_CHAR : longint; { return type might be wrong }
  begin
    G_TYPE_CHAR:=G_TYPE_MAKE_FUNDAMENTAL(3);
  end;

{ was #define dname def_expr }
function G_TYPE_UCHAR : longint; { return type might be wrong }
  begin
    G_TYPE_UCHAR:=G_TYPE_MAKE_FUNDAMENTAL(4);
  end;

{ was #define dname def_expr }
function G_TYPE_BOOLEAN : longint; { return type might be wrong }
  begin
    G_TYPE_BOOLEAN:=G_TYPE_MAKE_FUNDAMENTAL(5);
  end;

{ was #define dname def_expr }
function G_TYPE_INT : longint; { return type might be wrong }
  begin
    G_TYPE_INT:=G_TYPE_MAKE_FUNDAMENTAL(6);
  end;

{ was #define dname def_expr }
function G_TYPE_UINT : longint; { return type might be wrong }
  begin
    G_TYPE_UINT:=G_TYPE_MAKE_FUNDAMENTAL(7);
  end;

{ was #define dname def_expr }
function G_TYPE_LONG : longint; { return type might be wrong }
  begin
    G_TYPE_LONG:=G_TYPE_MAKE_FUNDAMENTAL(8);
  end;

{ was #define dname def_expr }
function G_TYPE_ULONG : longint; { return type might be wrong }
  begin
    G_TYPE_ULONG:=G_TYPE_MAKE_FUNDAMENTAL(9);
  end;

{ was #define dname def_expr }
function G_TYPE_INT64 : longint; { return type might be wrong }
  begin
    G_TYPE_INT64:=G_TYPE_MAKE_FUNDAMENTAL(10);
  end;

{ was #define dname def_expr }
function G_TYPE_UINT64 : longint; { return type might be wrong }
  begin
    G_TYPE_UINT64:=G_TYPE_MAKE_FUNDAMENTAL(11);
  end;

{ was #define dname def_expr }
function G_TYPE_ENUM : longint; { return type might be wrong }
  begin
    G_TYPE_ENUM:=G_TYPE_MAKE_FUNDAMENTAL(12);
  end;

{ was #define dname def_expr }
function G_TYPE_FLAGS : longint; { return type might be wrong }
  begin
    G_TYPE_FLAGS:=G_TYPE_MAKE_FUNDAMENTAL(13);
  end;

{ was #define dname def_expr }
function G_TYPE_FLOAT : longint; { return type might be wrong }
  begin
    G_TYPE_FLOAT:=G_TYPE_MAKE_FUNDAMENTAL(14);
  end;

{ was #define dname def_expr }
function G_TYPE_DOUBLE : longint; { return type might be wrong }
  begin
    G_TYPE_DOUBLE:=G_TYPE_MAKE_FUNDAMENTAL(15);
  end;

{ was #define dname def_expr }
function G_TYPE_STRING : longint; { return type might be wrong }
  begin
    G_TYPE_STRING:=G_TYPE_MAKE_FUNDAMENTAL(16);
  end;

{ was #define dname def_expr }
function G_TYPE_POINTER : longint; { return type might be wrong }
  begin
    G_TYPE_POINTER:=G_TYPE_MAKE_FUNDAMENTAL(17);
  end;

{ was #define dname def_expr }
function G_TYPE_BOXED : longint; { return type might be wrong }
  begin
    G_TYPE_BOXED:=G_TYPE_MAKE_FUNDAMENTAL(18);
  end;

{ was #define dname def_expr }
function G_TYPE_PARAM : longint; { return type might be wrong }
  begin
    G_TYPE_PARAM:=G_TYPE_MAKE_FUNDAMENTAL(19);
  end;

{ was #define dname def_expr }
function G_TYPE_OBJECT : longint; { return type might be wrong }
  begin
    G_TYPE_OBJECT:=G_TYPE_MAKE_FUNDAMENTAL(20);
  end;

{ was #define dname def_expr }
function G_TYPE_VARIANT : longint; { return type might be wrong }
  begin
    G_TYPE_VARIANT:=G_TYPE_MAKE_FUNDAMENTAL(21);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_TYPE_MAKE_FUNDAMENTAL(x : longint) : TGType;
begin
  G_TYPE_MAKE_FUNDAMENTAL:=TGType(x shl G_TYPE_FUNDAMENTAL_SHIFT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_FUNDAMENTAL(_type : longint) : longint;
begin
  G_TYPE_IS_FUNDAMENTAL:=_type<=G_TYPE_FUNDAMENTAL_MAX;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DERIVED(_type : longint) : longint;
begin
  G_TYPE_IS_DERIVED:=_type>G_TYPE_FUNDAMENTAL_MAX;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_INTERFACE(_type : longint) : longint;
begin
  G_TYPE_IS_INTERFACE:=(G_TYPE_FUNDAMENTAL(_type))=G_TYPE_INTERFACE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_CLASSED(_type : longint) : longint;
begin
  G_TYPE_IS_CLASSED:=g_type_test_flags(_type,G_TYPE_FLAG_CLASSED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_INSTANTIATABLE(_type : longint) : longint;
begin
  G_TYPE_IS_INSTANTIATABLE:=g_type_test_flags(_type,G_TYPE_FLAG_INSTANTIATABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DERIVABLE(_type : longint) : longint;
begin
  G_TYPE_IS_DERIVABLE:=g_type_test_flags(_type,G_TYPE_FLAG_DERIVABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DEEP_DERIVABLE(_type : longint) : longint;
begin
  G_TYPE_IS_DEEP_DERIVABLE:=g_type_test_flags(_type,G_TYPE_FLAG_DEEP_DERIVABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_ABSTRACT(_type : longint) : longint;
begin
  G_TYPE_IS_ABSTRACT:=g_type_test_flags(_type,G_TYPE_FLAG_ABSTRACT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_VALUE_ABSTRACT(_type : longint) : longint;
begin
  G_TYPE_IS_VALUE_ABSTRACT:=g_type_test_flags(_type,G_TYPE_FLAG_VALUE_ABSTRACT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_VALUE_TYPE(_type : longint) : longint;
begin
  G_TYPE_IS_VALUE_TYPE:=g_type_check_is_value_type(_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_HAS_VALUE_TABLE(_type : longint) : longint;
begin
  G_TYPE_HAS_VALUE_TABLE:=(g_type_value_table_peek(_type))<>NULL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_FINAL(_type : longint) : longint;
begin
  G_TYPE_IS_FINAL:=g_type_test_flags(_type,G_TYPE_FLAG_FINAL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DEPRECATED(_type : longint) : longint;
begin
  G_TYPE_IS_DEPRECATED:=g_type_test_flags(_type,G_TYPE_FLAG_DEPRECATED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_INSTANCE(instance : longint) : longint;
begin
  G_TYPE_CHECK_INSTANCE:=_G_TYPE_CHI(PGTypeInstance(instance));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_INSTANCE_CAST(instance,g_type,c_type : longint) : longint;
begin
  G_TYPE_CHECK_INSTANCE_CAST:=_G_TYPE_CIC(instance,g_type,c_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_INSTANCE_TYPE(instance,g_type : longint) : longint;
begin
  G_TYPE_CHECK_INSTANCE_TYPE:=_G_TYPE_CIT(instance,g_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE(instance,g_type : longint) : longint;
begin
  G_TYPE_CHECK_INSTANCE_FUNDAMENTAL_TYPE:=_G_TYPE_CIFT(instance,g_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_INSTANCE_GET_CLASS(instance,g_type,c_type : longint) : longint;
begin
  G_TYPE_INSTANCE_GET_CLASS:=_G_TYPE_IGC(instance,g_type,c_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_INSTANCE_GET_INTERFACE(instance,g_type,c_type : longint) : longint;
begin
  G_TYPE_INSTANCE_GET_INTERFACE:=_G_TYPE_IGI(instance,g_type,c_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_CLASS_CAST(g_class,g_type,c_type : longint) : longint;
begin
  G_TYPE_CHECK_CLASS_CAST:=_G_TYPE_CCC(g_class,g_type,c_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_CLASS_TYPE(g_class,g_type : longint) : longint;
begin
  G_TYPE_CHECK_CLASS_TYPE:=_G_TYPE_CCT(g_class,g_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_VALUE(value : longint) : longint;
begin
  G_TYPE_CHECK_VALUE:=_G_TYPE_CHV(value);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_CHECK_VALUE_TYPE(value,g_type : longint) : longint;
begin
  G_TYPE_CHECK_VALUE_TYPE:=_G_TYPE_CVH(value,g_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_FROM_INSTANCE(instance : longint) : longint;
begin
  G_TYPE_FROM_INSTANCE:=G_TYPE_FROM_CLASS((PGTypeInstance(instance))^.g_class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_FROM_CLASS(g_class : longint) : longint;
begin
  G_TYPE_FROM_CLASS:=(PGTypeClass(g_class))^.g_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_FROM_INTERFACE(g_iface : longint) : longint;
begin
  G_TYPE_FROM_INTERFACE:=(PGTypeInterface(g_iface))^.g_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_TYPE_INSTANCE_GET_PRIVATE(instance,g_type,c_type : longint) : Pc_type;
begin
  G_TYPE_INSTANCE_GET_PRIVATE:=Pc_type(g_type_instance_get_private(PGTypeInstance(instance),g_type));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_TYPE_CLASS_GET_PRIVATE(klass,g_type,c_type : longint) : Pc_type;
begin
  G_TYPE_CLASS_GET_PRIVATE:=Pc_type(g_type_class_get_private(PGTypeClass(klass),g_type));
end;

{ was #define dname def_expr }
function G_TYPE_FLAG_RESERVED_ID_BIT : TGType;
  begin
    G_TYPE_FLAG_RESERVED_ID_BIT:=TGType(1 shl 0);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GPOINTER_TO_TYPE(p : longint) : TGType;
begin
  GPOINTER_TO_TYPE:=TGType(Tguintptr(p));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GTYPE_TO_POINTER(t : longint) : Tgpointer;
begin
  GTYPE_TO_POINTER:=Tgpointer(Tguintptr(t));
end;


end.
