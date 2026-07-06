
unit gtkstacksidebar;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkstacksidebar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkstacksidebar.h
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
PGtkStack  = ^GtkStack;
PGtkStackSidebar  = ^GtkStackSidebar;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2014 Intel Corporation
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
 * Author:
 *      Ikey Doherty <michael.i.doherty@intel.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkstack.h>}

{ was #define dname def_expr }
function GTK_TYPE_STACK_SIDEBAR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STACK_SIDEBAR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_STACK_SIDEBAR(obj : longint) : longint;

type

function gtk_stack_sidebar_get_type:TGType;cdecl;external;
function gtk_stack_sidebar_new:PGtkWidget;cdecl;external;
procedure gtk_stack_sidebar_set_stack(self:PGtkStackSidebar; stack:PGtkStack);cdecl;external;
function gtk_stack_sidebar_get_stack(self:PGtkStackSidebar):PGtkStack;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStackSidebar, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_STACK_SIDEBAR : longint; { return type might be wrong }
  begin
    GTK_TYPE_STACK_SIDEBAR:=gtk_stack_sidebar_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_STACK_SIDEBAR(obj : longint) : longint;
begin
  GTK_STACK_SIDEBAR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_STACK_SIDEBAR,GtkStackSidebar);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_STACK_SIDEBAR(obj : longint) : longint;
begin
  GTK_IS_STACK_SIDEBAR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_STACK_SIDEBAR);
end;


end.
