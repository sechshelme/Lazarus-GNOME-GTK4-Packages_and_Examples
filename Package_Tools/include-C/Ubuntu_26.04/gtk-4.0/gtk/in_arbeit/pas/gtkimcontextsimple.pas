unit gtkimcontextsimple;

interface

uses
  fp_glib2, fp_gtk4;

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


function gtk_im_context_simple_get_type:TGType;cdecl;external libgtk4;
function gtk_im_context_simple_new:PGtkIMContext;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gtk_im_context_simple_add_compose_file) }
procedure gtk_im_context_simple_add_table(context_simple:PGtkIMContextSimple; data:Pguint16; max_seq_len:longint; n_seqs:longint);cdecl;external libgtk4;
procedure gtk_im_context_simple_add_compose_file(context_simple:PGtkIMContextSimple; compose_file:Pchar);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkIMContextSimple, g_object_unref) }

// === Konventiert am: 6-7-26 16:37:16 ===

function GTK_TYPE_IM_CONTEXT_SIMPLE : TGType;
function GTK_IM_CONTEXT_SIMPLE(obj : Pointer) : PGtkIMContextSimple;
function GTK_IM_CONTEXT_SIMPLE_CLASS(klass : Pointer) : PGtkIMContextSimpleClass;
function GTK_IS_IM_CONTEXT_SIMPLE(obj : Pointer) : Tgboolean;
function GTK_IS_IM_CONTEXT_SIMPLE_CLASS(klass : Pointer) : Tgboolean;
function GTK_IM_CONTEXT_SIMPLE_GET_CLASS(obj : Pointer) : PGtkIMContextSimpleClass;

implementation

function GTK_TYPE_IM_CONTEXT_SIMPLE : TGType;
  begin
    GTK_TYPE_IM_CONTEXT_SIMPLE:=gtk_im_context_simple_get_type;
  end;

function GTK_IM_CONTEXT_SIMPLE(obj : Pointer) : PGtkIMContextSimple;
begin
  Result := PGtkIMContextSimple(g_type_check_instance_cast(obj, GTK_TYPE_IM_CONTEXT_SIMPLE));
end;

function GTK_IM_CONTEXT_SIMPLE_CLASS(klass : Pointer) : PGtkIMContextSimpleClass;
begin
  Result := PGtkIMContextSimpleClass(g_type_check_class_cast(klass, GTK_TYPE_IM_CONTEXT_SIMPLE));
end;

function GTK_IS_IM_CONTEXT_SIMPLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_IM_CONTEXT_SIMPLE);
end;

function GTK_IS_IM_CONTEXT_SIMPLE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_IM_CONTEXT_SIMPLE);
end;

function GTK_IM_CONTEXT_SIMPLE_GET_CLASS(obj : Pointer) : PGtkIMContextSimpleClass;
begin
  Result := PGtkIMContextSimpleClass(PGTypeInstance(obj)^.g_class);
end;



end.
