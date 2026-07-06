
unit gtkimcontextsimple;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkimcontextsimple.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkimcontextsimple.h
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
PGtkIMContext  = ^GtkIMContext;
PGtkIMContextSimple  = ^GtkIMContextSimple;
PGtkIMContextSimpleClass  = ^GtkIMContextSimpleClass;
PGtkIMContextSimplePrivate  = ^GtkIMContextSimplePrivate;
Pguint16  = ^guint16;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2000 Red Hat Software
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
{$include <gtk/gtkimcontext.h>}
{
 * No longer used by GTK, just left here on the off chance that some
 * 3rd party code used this define.
  }
{*
 * GTK_MAX_COMPOSE_LEN:
 *
 * Evaluates to the maximum length of a compose sequence.
 *
 * This macro is longer used by GTK.
  }

const
  GTK_MAX_COMPOSE_LEN = 7;  

{ was #define dname def_expr }
function GTK_TYPE_IM_CONTEXT_SIMPLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_SIMPLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_SIMPLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IM_CONTEXT_SIMPLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IM_CONTEXT_SIMPLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_SIMPLE_GET_CLASS(obj : longint) : longint;

type
{< private > }
  PGtkIMContextSimple = ^TGtkIMContextSimple;
  TGtkIMContextSimple = record
      object : TGtkIMContext;
      priv : PGtkIMContextSimplePrivate;
    end;

  PGtkIMContextSimpleClass = ^TGtkIMContextSimpleClass;
  TGtkIMContextSimpleClass = record
      parent_class : TGtkIMContextClass;
    end;


function gtk_im_context_simple_get_type:TGType;cdecl;external;
function gtk_im_context_simple_new:PGtkIMContext;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gtk_im_context_simple_add_compose_file) }
procedure gtk_im_context_simple_add_table(context_simple:PGtkIMContextSimple; data:Pguint16; max_seq_len:longint; n_seqs:longint);cdecl;external;
(* Const before type ignored *)
procedure gtk_im_context_simple_add_compose_file(context_simple:PGtkIMContextSimple; compose_file:Pchar);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkIMContextSimple, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_IM_CONTEXT_SIMPLE : longint; { return type might be wrong }
  begin
    GTK_TYPE_IM_CONTEXT_SIMPLE:=gtk_im_context_simple_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_SIMPLE(obj : longint) : longint;
begin
  GTK_IM_CONTEXT_SIMPLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_IM_CONTEXT_SIMPLE,GtkIMContextSimple);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_SIMPLE_CLASS(klass : longint) : longint;
begin
  GTK_IM_CONTEXT_SIMPLE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_IM_CONTEXT_SIMPLE,GtkIMContextSimpleClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IM_CONTEXT_SIMPLE(obj : longint) : longint;
begin
  GTK_IS_IM_CONTEXT_SIMPLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_IM_CONTEXT_SIMPLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IM_CONTEXT_SIMPLE_CLASS(klass : longint) : longint;
begin
  GTK_IS_IM_CONTEXT_SIMPLE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_IM_CONTEXT_SIMPLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_SIMPLE_GET_CLASS(obj : longint) : longint;
begin
  GTK_IM_CONTEXT_SIMPLE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_IM_CONTEXT_SIMPLE,GtkIMContextSimpleClass);
end;


end.
