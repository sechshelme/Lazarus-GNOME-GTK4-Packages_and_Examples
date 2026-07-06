unit gtkstack;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * Author: Alexander Larsson <alexl@redhat.com>
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtkselectionmodel.h>}

type

{ was #define dname def_expr }
function GTK_TYPE_STACK_PAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STACK_PAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_STACK_PAGE(obj : longint) : longint;

type

  PGtkStackTransitionType = ^TGtkStackTransitionType;
  TGtkStackTransitionType =  Longint;
  Const
    GTK_STACK_TRANSITION_TYPE_NONE = 0;
    GTK_STACK_TRANSITION_TYPE_CROSSFADE = 1;
    GTK_STACK_TRANSITION_TYPE_SLIDE_RIGHT = 2;
    GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT = 3;
    GTK_STACK_TRANSITION_TYPE_SLIDE_UP = 4;
    GTK_STACK_TRANSITION_TYPE_SLIDE_DOWN = 5;
    GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT_RIGHT = 6;
    GTK_STACK_TRANSITION_TYPE_SLIDE_UP_DOWN = 7;
    GTK_STACK_TRANSITION_TYPE_OVER_UP = 8;
    GTK_STACK_TRANSITION_TYPE_OVER_DOWN = 9;
    GTK_STACK_TRANSITION_TYPE_OVER_LEFT = 10;
    GTK_STACK_TRANSITION_TYPE_OVER_RIGHT = 11;
    GTK_STACK_TRANSITION_TYPE_UNDER_UP = 12;
    GTK_STACK_TRANSITION_TYPE_UNDER_DOWN = 13;
    GTK_STACK_TRANSITION_TYPE_UNDER_LEFT = 14;
    GTK_STACK_TRANSITION_TYPE_UNDER_RIGHT = 15;
    GTK_STACK_TRANSITION_TYPE_OVER_UP_DOWN = 16;
    GTK_STACK_TRANSITION_TYPE_OVER_DOWN_UP = 17;
    GTK_STACK_TRANSITION_TYPE_OVER_LEFT_RIGHT = 18;
    GTK_STACK_TRANSITION_TYPE_OVER_RIGHT_LEFT = 19;
    GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT = 20;
    GTK_STACK_TRANSITION_TYPE_ROTATE_RIGHT = 21;
    GTK_STACK_TRANSITION_TYPE_ROTATE_LEFT_RIGHT = 22;
;

function gtk_stack_page_get_type:TGType;cdecl;external libgtk4;
function gtk_stack_page_get_child(self:PGtkStackPage):PGtkWidget;cdecl;external libgtk4;
function gtk_stack_page_get_visible(self:PGtkStackPage):Tgboolean;cdecl;external libgtk4;
procedure gtk_stack_page_set_visible(self:PGtkStackPage; visible:Tgboolean);cdecl;external libgtk4;
function gtk_stack_page_get_needs_attention(self:PGtkStackPage):Tgboolean;cdecl;external libgtk4;
procedure gtk_stack_page_set_needs_attention(self:PGtkStackPage; setting:Tgboolean);cdecl;external libgtk4;
function gtk_stack_page_get_use_underline(self:PGtkStackPage):Tgboolean;cdecl;external libgtk4;
procedure gtk_stack_page_set_use_underline(self:PGtkStackPage; setting:Tgboolean);cdecl;external libgtk4;
function gtk_stack_page_get_name(self:PGtkStackPage):Pchar;cdecl;external libgtk4;
procedure gtk_stack_page_set_name(self:PGtkStackPage; setting:Pchar);cdecl;external libgtk4;
function gtk_stack_page_get_title(self:PGtkStackPage):Pchar;cdecl;external libgtk4;
procedure gtk_stack_page_set_title(self:PGtkStackPage; setting:Pchar);cdecl;external libgtk4;
function gtk_stack_page_get_icon_name(self:PGtkStackPage):Pchar;cdecl;external libgtk4;
procedure gtk_stack_page_set_icon_name(self:PGtkStackPage; setting:Pchar);cdecl;external libgtk4;
function gtk_stack_get_type:TGType;cdecl;external libgtk4;
function gtk_stack_new:PGtkWidget;cdecl;external libgtk4;
function gtk_stack_add_child(stack:PGtkStack; child:PGtkWidget):PGtkStackPage;cdecl;external libgtk4;
function gtk_stack_add_named(stack:PGtkStack; child:PGtkWidget; name:Pchar):PGtkStackPage;cdecl;external libgtk4;
function gtk_stack_add_titled(stack:PGtkStack; child:PGtkWidget; name:Pchar; title:Pchar):PGtkStackPage;cdecl;external libgtk4;
procedure gtk_stack_remove(stack:PGtkStack; child:PGtkWidget);cdecl;external libgtk4;
function gtk_stack_get_page(stack:PGtkStack; child:PGtkWidget):PGtkStackPage;cdecl;external libgtk4;
function gtk_stack_get_child_by_name(stack:PGtkStack; name:Pchar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_stack_set_visible_child(stack:PGtkStack; child:PGtkWidget);cdecl;external libgtk4;
function gtk_stack_get_visible_child(stack:PGtkStack):PGtkWidget;cdecl;external libgtk4;
procedure gtk_stack_set_visible_child_name(stack:PGtkStack; name:Pchar);cdecl;external libgtk4;
function gtk_stack_get_visible_child_name(stack:PGtkStack):Pchar;cdecl;external libgtk4;
procedure gtk_stack_set_visible_child_full(stack:PGtkStack; name:Pchar; transition:TGtkStackTransitionType);cdecl;external libgtk4;
procedure gtk_stack_set_hhomogeneous(stack:PGtkStack; hhomogeneous:Tgboolean);cdecl;external libgtk4;
function gtk_stack_get_hhomogeneous(stack:PGtkStack):Tgboolean;cdecl;external libgtk4;
procedure gtk_stack_set_vhomogeneous(stack:PGtkStack; vhomogeneous:Tgboolean);cdecl;external libgtk4;
function gtk_stack_get_vhomogeneous(stack:PGtkStack):Tgboolean;cdecl;external libgtk4;
procedure gtk_stack_set_transition_duration(stack:PGtkStack; duration:Tguint);cdecl;external libgtk4;
function gtk_stack_get_transition_duration(stack:PGtkStack):Tguint;cdecl;external libgtk4;
procedure gtk_stack_set_transition_type(stack:PGtkStack; transition:TGtkStackTransitionType);cdecl;external libgtk4;
function gtk_stack_get_transition_type(stack:PGtkStack):TGtkStackTransitionType;cdecl;external libgtk4;
function gtk_stack_get_transition_running(stack:PGtkStack):Tgboolean;cdecl;external libgtk4;
procedure gtk_stack_set_interpolate_size(stack:PGtkStack; interpolate_size:Tgboolean);cdecl;external libgtk4;
function gtk_stack_get_interpolate_size(stack:PGtkStack):Tgboolean;cdecl;external libgtk4;
function gtk_stack_get_pages(stack:PGtkStack):PGtkSelectionModel;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStack, g_object_unref) }
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStackPage, g_object_unref) }

// === Konventiert am: 6-7-26 16:06:30 ===

function GTK_TYPE_STACK : TGType;
function GTK_STACK(obj : Pointer) : PGtkStack;
function GTK_IS_STACK(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_STACK : TGType;
  begin
    GTK_TYPE_STACK:=gtk_stack_get_type;
  end;

function GTK_STACK(obj : Pointer) : PGtkStack;
begin
  Result := PGtkStack(g_type_check_instance_cast(obj, GTK_TYPE_STACK));
end;

function GTK_IS_STACK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_STACK);
end;


{ was #define dname def_expr }
function GTK_TYPE_STACK_PAGE : longint; { return type might be wrong }
  begin
    GTK_TYPE_STACK_PAGE:=gtk_stack_page_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STACK_PAGE(obj : longint) : longint;
begin
  GTK_STACK_PAGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_STACK_PAGE,GtkStackPage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_STACK_PAGE(obj : longint) : longint;
begin
  GTK_IS_STACK_PAGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_STACK_PAGE);
end;


end.
