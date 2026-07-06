unit gtkbuilder;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2006-2007 Async Open Source,
 *                         Johan Dahlin <jdahlin@async.com.br>
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
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkbuilderscope.h>}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_BUILDER_ERROR : longint; { return type might be wrong }

type
{*
 * GtkBuilderError:
 * @GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION: A type-func attribute didn’t name
 *  a function that returns a `GType`.
 * @GTK_BUILDER_ERROR_UNHANDLED_TAG: The input contained a tag that `GtkBuilder`
 *  can’t handle.
 * @GTK_BUILDER_ERROR_MISSING_ATTRIBUTE: An attribute that is required by
 *  `GtkBuilder` was missing.
 * @GTK_BUILDER_ERROR_INVALID_ATTRIBUTE: `GtkBuilder` found an attribute that
 *  it doesn’t understand.
 * @GTK_BUILDER_ERROR_INVALID_TAG: `GtkBuilder` found a tag that
 *  it doesn’t understand.
 * @GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE: A required property value was
 *  missing.
 * @GTK_BUILDER_ERROR_INVALID_VALUE: `GtkBuilder` couldn’t parse
 *  some attribute value.
 * @GTK_BUILDER_ERROR_VERSION_MISMATCH: The input file requires a newer version
 *  of GTK.
 * @GTK_BUILDER_ERROR_DUPLICATE_ID: An object id occurred twice.
 * @GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED: A specified object type is of the same type or
 *  derived from the type of the composite class being extended with builder XML.
 * @GTK_BUILDER_ERROR_TEMPLATE_MISMATCH: The wrong type was specified in a composite class’s template XML
 * @GTK_BUILDER_ERROR_INVALID_PROPERTY: The specified property is unknown for the object class.
 * @GTK_BUILDER_ERROR_INVALID_SIGNAL: The specified signal is unknown for the object class.
 * @GTK_BUILDER_ERROR_INVALID_ID: An object id is unknown.
 * @GTK_BUILDER_ERROR_INVALID_FUNCTION: A function could not be found. This often happens
 *   when symbols are set to be kept private. Compiling code with -rdynamic or using the
 *   `gmodule-export-2.0` pkgconfig module can fix this problem.
 *
 * Error codes that identify various errors that can occur while using
 * `GtkBuilder`.
  }

  PGtkBuilderError = ^TGtkBuilderError;
  TGtkBuilderError =  Longint;
  Const
    GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION = 0;
    GTK_BUILDER_ERROR_UNHANDLED_TAG = 1;
    GTK_BUILDER_ERROR_MISSING_ATTRIBUTE = 2;
    GTK_BUILDER_ERROR_INVALID_ATTRIBUTE = 3;
    GTK_BUILDER_ERROR_INVALID_TAG = 4;
    GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE = 5;
    GTK_BUILDER_ERROR_INVALID_VALUE = 6;
    GTK_BUILDER_ERROR_VERSION_MISMATCH = 7;
    GTK_BUILDER_ERROR_DUPLICATE_ID = 8;
    GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED = 9;
    GTK_BUILDER_ERROR_TEMPLATE_MISMATCH = 10;
    GTK_BUILDER_ERROR_INVALID_PROPERTY = 11;
    GTK_BUILDER_ERROR_INVALID_SIGNAL = 12;
    GTK_BUILDER_ERROR_INVALID_ID = 13;
    GTK_BUILDER_ERROR_INVALID_FUNCTION = 14;
;

function gtk_builder_error_quark:TGQuark;cdecl;external libgtk4;
function gtk_builder_get_type:TGType;cdecl;external libgtk4;
function gtk_builder_new:PGtkBuilder;cdecl;external libgtk4;
function gtk_builder_add_from_file(builder:PGtkBuilder; filename:Pchar; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_builder_add_from_resource(builder:PGtkBuilder; resource_path:Pchar; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_builder_add_from_string(builder:PGtkBuilder; buffer:Pchar; length:Tgssize; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_builder_add_objects_from_file(builder:PGtkBuilder; filename:Pchar; object_ids:PPchar; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_builder_add_objects_from_resource(builder:PGtkBuilder; resource_path:Pchar; object_ids:PPchar; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_builder_add_objects_from_string(builder:PGtkBuilder; buffer:Pchar; length:Tgssize; object_ids:PPchar; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_builder_get_object(builder:PGtkBuilder; name:Pchar):PGObject;cdecl;external libgtk4;
function gtk_builder_get_objects(builder:PGtkBuilder):PGSList;cdecl;external libgtk4;
procedure gtk_builder_expose_object(builder:PGtkBuilder; name:Pchar; object:PGObject);cdecl;external libgtk4;
function gtk_builder_get_current_object(builder:PGtkBuilder):PGObject;cdecl;external libgtk4;
procedure gtk_builder_set_current_object(builder:PGtkBuilder; current_object:PGObject);cdecl;external libgtk4;
procedure gtk_builder_set_translation_domain(builder:PGtkBuilder; domain:Pchar);cdecl;external libgtk4;
function gtk_builder_get_translation_domain(builder:PGtkBuilder):Pchar;cdecl;external libgtk4;
function gtk_builder_get_scope(builder:PGtkBuilder):PGtkBuilderScope;cdecl;external libgtk4;
procedure gtk_builder_set_scope(builder:PGtkBuilder; scope:PGtkBuilderScope);cdecl;external libgtk4;
function gtk_builder_get_type_from_name(builder:PGtkBuilder; type_name:Pchar):TGType;cdecl;external libgtk4;
function gtk_builder_value_from_string(builder:PGtkBuilder; pspec:PGParamSpec; _string:Pchar; value:PGValue; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_builder_value_from_string_type(builder:PGtkBuilder; _type:TGType; _string:Pchar; value:PGValue; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_builder_new_from_file(filename:Pchar):PGtkBuilder;cdecl;external libgtk4;
function gtk_builder_new_from_resource(resource_path:Pchar):PGtkBuilder;cdecl;external libgtk4;
function gtk_builder_new_from_string(_string:Pchar; length:Tgssize):PGtkBuilder;cdecl;external libgtk4;
function gtk_builder_create_closure(builder:PGtkBuilder; function_name:Pchar; flags:TGtkBuilderClosureFlags; object:PGObject; error:PPGError):PGClosure;cdecl;external libgtk4;
{*
 * GTK_BUILDER_WARN_INVALID_CHILD_TYPE:
 * @object: the `GtkBuildable` on which the warning occurred
 * @type: the unexpected type value
 *
 * This macro should be used to emit a warning about and unexpected @type value
 * in a `GtkBuildable` add_child implementation.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_BUILDER_WARN_INVALID_CHILD_TYPE(object,_type : longint) : longint;

function gtk_builder_extend_with_template(builder:PGtkBuilder; object:PGObject; template_type:TGType; buffer:Pchar; length:Tgssize; 
           error:PPGError):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkBuilder, g_object_unref) }

// === Konventiert am: 6-7-26 13:53:56 ===

function GTK_TYPE_BUILDER : TGType;
function GTK_BUILDER(obj : Pointer) : PGtkBuilder;
function GTK_BUILDER_CLASS(klass : Pointer) : PGtkBuilderClass;
function GTK_IS_BUILDER(obj : Pointer) : Tgboolean;
function GTK_IS_BUILDER_CLASS(klass : Pointer) : Tgboolean;
function GTK_BUILDER_GET_CLASS(obj : Pointer) : PGtkBuilderClass;

implementation

function GTK_TYPE_BUILDER : TGType;
  begin
    GTK_TYPE_BUILDER:=gtk_builder_get_type;
  end;

function GTK_BUILDER(obj : Pointer) : PGtkBuilder;
begin
  Result := PGtkBuilder(g_type_check_instance_cast(obj, GTK_TYPE_BUILDER));
end;

function GTK_BUILDER_CLASS(klass : Pointer) : PGtkBuilderClass;
begin
  Result := PGtkBuilderClass(g_type_check_class_cast(klass, GTK_TYPE_BUILDER));
end;

function GTK_IS_BUILDER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_BUILDER);
end;

function GTK_IS_BUILDER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_BUILDER);
end;

function GTK_BUILDER_GET_CLASS(obj : Pointer) : PGtkBuilderClass;
begin
  Result := PGtkBuilderClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function GTK_BUILDER_ERROR : longint; { return type might be wrong }
  begin
    GTK_BUILDER_ERROR:=gtk_builder_error_quark;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_BUILDER_WARN_INVALID_CHILD_TYPE(object,_type : longint) : longint;
begin
  GTK_BUILDER_WARN_INVALID_CHILD_TYPE:=g_warning(''%s' is not a valid child type of '%s'',_type,g_type_name(G_OBJECT_TYPE(object)));
end;


end.
