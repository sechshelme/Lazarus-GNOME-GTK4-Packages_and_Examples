unit gtkstylecontext;

interface

uses
  fp_glib2, fp_gtk4;

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


function gtk_style_context_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_add_provider(context:PGtkStyleContext; provider:PGtkStyleProvider; priority:Tguint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_remove_provider(context:PGtkStyleContext; provider:PGtkStyleProvider);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_save(context:PGtkStyleContext);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_restore(context:PGtkStyleContext);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_set_state(context:PGtkStyleContext; flags:TGtkStateFlags);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_style_context_get_state(context:PGtkStyleContext):TGtkStateFlags;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_set_scale(context:PGtkStyleContext; scale:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_style_context_get_scale(context:PGtkStyleContext):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_add_class(context:PGtkStyleContext; class_name:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_remove_class(context:PGtkStyleContext; class_name:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_style_context_has_class(context:PGtkStyleContext; class_name:Pchar):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_set_display(context:PGtkStyleContext; display:PGdkDisplay);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_style_context_get_display(context:PGtkStyleContext):PGdkDisplay;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_style_context_lookup_color(context:PGtkStyleContext; color_name:Pchar; color:PGdkRGBA):Tgboolean;cdecl;external libgtk4;
{ Some helper functions to retrieve most common properties  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_get_color(context:PGtkStyleContext; color:PGdkRGBA);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_get_border(context:PGtkStyleContext; border:PGtkBorder);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_get_padding(context:PGtkStyleContext; padding:PGtkBorder);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_style_context_get_margin(context:PGtkStyleContext; margin:PGtkBorder);cdecl;external libgtk4;
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

function gtk_style_context_to_string(context:PGtkStyleContext; flags:TGtkStyleContextPrintFlags):Pchar;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStyleContext, g_object_unref) }

// === Konventiert am: 9-7-26 19:49:18 ===

function GTK_TYPE_STYLE_CONTEXT : TGType;
function GTK_STYLE_CONTEXT(obj : Pointer) : PGtkStyleContext;
function GTK_STYLE_CONTEXT_CLASS(klass : Pointer) : PGtkStyleContextClass;
function GTK_IS_STYLE_CONTEXT(obj : Pointer) : Tgboolean;
function GTK_IS_STYLE_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
function GTK_STYLE_CONTEXT_GET_CLASS(obj : Pointer) : PGtkStyleContextClass;

implementation

function GTK_TYPE_STYLE_CONTEXT : TGType;
  begin
    GTK_TYPE_STYLE_CONTEXT:=gtk_style_context_get_type;
  end;

function GTK_STYLE_CONTEXT(obj : Pointer) : PGtkStyleContext;
begin
  Result := PGtkStyleContext(g_type_check_instance_cast(obj, GTK_TYPE_STYLE_CONTEXT));
end;

function GTK_STYLE_CONTEXT_CLASS(klass : Pointer) : PGtkStyleContextClass;
begin
  Result := PGtkStyleContextClass(g_type_check_class_cast(klass, GTK_TYPE_STYLE_CONTEXT));
end;

function GTK_IS_STYLE_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_STYLE_CONTEXT);
end;

function GTK_IS_STYLE_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_STYLE_CONTEXT);
end;

function GTK_STYLE_CONTEXT_GET_CLASS(obj : Pointer) : PGtkStyleContextClass;
begin
  Result := PGtkStyleContextClass(PGTypeInstance(obj)^.g_class);
end;



end.
