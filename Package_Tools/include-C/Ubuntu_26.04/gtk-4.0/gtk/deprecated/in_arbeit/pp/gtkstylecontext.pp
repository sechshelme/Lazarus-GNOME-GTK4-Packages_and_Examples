
unit gtkstylecontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkstylecontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkstylecontext.h
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
PGdkDisplay  = ^GdkDisplay;
PGdkRGBA  = ^GdkRGBA;
PGtkBorder  = ^GtkBorder;
PGtkStyleContext  = ^GtkStyleContext;
PGtkStyleContextClass  = ^GtkStyleContextClass;
PGtkStyleContextPrintFlags  = ^GtkStyleContextPrintFlags;
PGtkStyleProvider  = ^GtkStyleProvider;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2010 Carlos Garnacho <carlosg@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/css/gtkcss.h>}
{$include <gtk/gtkborder.h>}
{$include <gtk/gtkstyleprovider.h>}
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_STYLE_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STYLE_CONTEXT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STYLE_CONTEXT_CLASS(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_STYLE_CONTEXT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_STYLE_CONTEXT_CLASS(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STYLE_CONTEXT_GET_CLASS(o : longint) : longint;

type
  PGtkStyleContext = ^TGtkStyleContext;
  TGtkStyleContext = record
      parent_object : TGObject;
    end;

{ Padding for future expansion  }
  PGtkStyleContextClass = ^TGtkStyleContextClass;
  TGtkStyleContextClass = record
      parent_class : TGObjectClass;
      changed : procedure (context:PGtkStyleContext);cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


function gtk_style_context_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_add_provider(context:PGtkStyleContext; provider:PGtkStyleProvider; priority:Tguint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_remove_provider(context:PGtkStyleContext; provider:PGtkStyleProvider);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_save(context:PGtkStyleContext);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_restore(context:PGtkStyleContext);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_set_state(context:PGtkStyleContext; flags:TGtkStateFlags);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_style_context_get_state(context:PGtkStyleContext):TGtkStateFlags;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_set_scale(context:PGtkStyleContext; scale:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_style_context_get_scale(context:PGtkStyleContext):longint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
procedure gtk_style_context_add_class(context:PGtkStyleContext; class_name:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
procedure gtk_style_context_remove_class(context:PGtkStyleContext; class_name:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_style_context_has_class(context:PGtkStyleContext; class_name:Pchar):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_set_display(context:PGtkStyleContext; display:PGdkDisplay);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_style_context_get_display(context:PGtkStyleContext):PGdkDisplay;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_style_context_lookup_color(context:PGtkStyleContext; color_name:Pchar; color:PGdkRGBA):Tgboolean;cdecl;external;
{ Some helper functions to retrieve most common properties  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_get_color(context:PGtkStyleContext; color:PGdkRGBA);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_get_border(context:PGtkStyleContext; border:PGtkBorder);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_get_padding(context:PGtkStyleContext; padding:PGtkBorder);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_get_margin(context:PGtkStyleContext; margin:PGtkBorder);cdecl;external;
type
  PGtkStyleContextPrintFlags = ^TGtkStyleContextPrintFlags;
  TGtkStyleContextPrintFlags =  Longint;
  Const
    GTK_STYLE_CONTEXT_PRINT_NONE = 0;
    GTK_STYLE_CONTEXT_PRINT_RECURSE = 1 shl 0;
    GTK_STYLE_CONTEXT_PRINT_SHOW_STYLE = 1 shl 1;
    GTK_STYLE_CONTEXT_PRINT_SHOW_CHANGE = 1 shl 2;
;
{xxxxxGLIB_DEPRECATED_IN_4_10 }

function gtk_style_context_to_string(context:PGtkStyleContext; flags:TGtkStyleContextPrintFlags):Pchar;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStyleContext, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_STYLE_CONTEXT : longint; { return type might be wrong }
  begin
    GTK_TYPE_STYLE_CONTEXT:=gtk_style_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STYLE_CONTEXT(o : longint) : longint;
begin
  GTK_STYLE_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_STYLE_CONTEXT,GtkStyleContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STYLE_CONTEXT_CLASS(c : longint) : longint;
begin
  GTK_STYLE_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(c,GTK_TYPE_STYLE_CONTEXT,GtkStyleContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_STYLE_CONTEXT(o : longint) : longint;
begin
  GTK_IS_STYLE_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_STYLE_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_STYLE_CONTEXT_CLASS(c : longint) : longint;
begin
  GTK_IS_STYLE_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(c,GTK_TYPE_STYLE_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STYLE_CONTEXT_GET_CLASS(o : longint) : longint;
begin
  GTK_STYLE_CONTEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_STYLE_CONTEXT,GtkStyleContextClass);
end;


end.
