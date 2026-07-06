unit gtkimmulticontext;

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

type
{< private > }
  PGtkIMMulticontext = ^TGtkIMMulticontext;
  TGtkIMMulticontext = record
      object : TGtkIMContext;
      priv : PGtkIMMulticontextPrivate;
    end;

{ Padding for future expansion  }
  PGtkIMMulticontextClass = ^TGtkIMMulticontextClass;
  TGtkIMMulticontextClass = record
      parent_class : TGtkIMContextClass;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


function gtk_im_multicontext_get_type:TGType;cdecl;external libgtk4;
function gtk_im_multicontext_new:PGtkIMContext;cdecl;external libgtk4;
function gtk_im_multicontext_get_context_id(context:PGtkIMMulticontext):Pchar;cdecl;external libgtk4;
procedure gtk_im_multicontext_set_context_id(context:PGtkIMMulticontext; context_id:Pchar);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkIMMulticontext, g_object_unref) }

// === Konventiert am: 6-7-26 16:55:43 ===

function GTK_TYPE_IM_MULTICONTEXT : TGType;
function GTK_IM_MULTICONTEXT(obj : Pointer) : PGtkIMMulticontext;
function GTK_IM_MULTICONTEXT_CLASS(klass : Pointer) : PGtkIMMulticontextClass;
function GTK_IS_IM_MULTICONTEXT(obj : Pointer) : Tgboolean;
function GTK_IS_IM_MULTICONTEXT_CLASS(klass : Pointer) : Tgboolean;
function GTK_IM_MULTICONTEXT_GET_CLASS(obj : Pointer) : PGtkIMMulticontextClass;

implementation

function GTK_TYPE_IM_MULTICONTEXT : TGType;
  begin
    GTK_TYPE_IM_MULTICONTEXT:=gtk_im_multicontext_get_type;
  end;

function GTK_IM_MULTICONTEXT(obj : Pointer) : PGtkIMMulticontext;
begin
  Result := PGtkIMMulticontext(g_type_check_instance_cast(obj, GTK_TYPE_IM_MULTICONTEXT));
end;

function GTK_IM_MULTICONTEXT_CLASS(klass : Pointer) : PGtkIMMulticontextClass;
begin
  Result := PGtkIMMulticontextClass(g_type_check_class_cast(klass, GTK_TYPE_IM_MULTICONTEXT));
end;

function GTK_IS_IM_MULTICONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_IM_MULTICONTEXT);
end;

function GTK_IS_IM_MULTICONTEXT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_IM_MULTICONTEXT);
end;

function GTK_IM_MULTICONTEXT_GET_CLASS(obj : Pointer) : PGtkIMMulticontextClass;
begin
  Result := PGtkIMMulticontextClass(PGTypeInstance(obj)^.g_class);
end;



end.
