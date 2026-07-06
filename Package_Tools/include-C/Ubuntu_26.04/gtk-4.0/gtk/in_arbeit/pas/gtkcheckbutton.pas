unit gtkcheckbutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
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
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktogglebutton.h>}

type
  PGtkCheckButton = ^TGtkCheckButton;
  TGtkCheckButton = record
      parent_instance : TGtkWidget;
    end;

{< private > }
  PGtkCheckButtonClass = ^TGtkCheckButtonClass;
  TGtkCheckButtonClass = record
      parent_class : TGtkWidgetClass;
      toggled : procedure (check_button:PGtkCheckButton);cdecl;
      activate : procedure (check_button:PGtkCheckButton);cdecl;
      padding : array[0..6] of Tgpointer;
    end;


function gtk_check_button_get_type:TGType;cdecl;external libgtk4;
function gtk_check_button_new:PGtkWidget;cdecl;external libgtk4;
function gtk_check_button_new_with_label(_label:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_check_button_new_with_mnemonic(_label:Pchar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_check_button_set_inconsistent(check_button:PGtkCheckButton; inconsistent:Tgboolean);cdecl;external libgtk4;
function gtk_check_button_get_inconsistent(check_button:PGtkCheckButton):Tgboolean;cdecl;external libgtk4;
function gtk_check_button_get_active(self:PGtkCheckButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_check_button_set_active(self:PGtkCheckButton; setting:Tgboolean);cdecl;external libgtk4;
function gtk_check_button_get_label(self:PGtkCheckButton):Pchar;cdecl;external libgtk4;
procedure gtk_check_button_set_label(self:PGtkCheckButton; _label:Pchar);cdecl;external libgtk4;
procedure gtk_check_button_set_group(self:PGtkCheckButton; group:PGtkCheckButton);cdecl;external libgtk4;
function gtk_check_button_get_use_underline(self:PGtkCheckButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_check_button_set_use_underline(self:PGtkCheckButton; setting:Tgboolean);cdecl;external libgtk4;
function gtk_check_button_get_child(button:PGtkCheckButton):PGtkWidget;cdecl;external libgtk4;
procedure gtk_check_button_set_child(button:PGtkCheckButton; child:PGtkWidget);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCheckButton, g_object_unref) }

// === Konventiert am: 6-7-26 13:52:40 ===

function GTK_TYPE_CHECK_BUTTON : TGType;
function GTK_CHECK_BUTTON(obj : Pointer) : PGtkCheckButton;
function GTK_CHECK_BUTTON_CLASS(klass : Pointer) : PGtkCheckButtonClass;
function GTK_IS_CHECK_BUTTON(obj : Pointer) : Tgboolean;
function GTK_IS_CHECK_BUTTON_CLASS(klass : Pointer) : Tgboolean;
function GTK_CHECK_BUTTON_GET_CLASS(obj : Pointer) : PGtkCheckButtonClass;

implementation

function GTK_TYPE_CHECK_BUTTON : TGType;
  begin
    GTK_TYPE_CHECK_BUTTON:=gtk_check_button_get_type;
  end;

function GTK_CHECK_BUTTON(obj : Pointer) : PGtkCheckButton;
begin
  Result := PGtkCheckButton(g_type_check_instance_cast(obj, GTK_TYPE_CHECK_BUTTON));
end;

function GTK_CHECK_BUTTON_CLASS(klass : Pointer) : PGtkCheckButtonClass;
begin
  Result := PGtkCheckButtonClass(g_type_check_class_cast(klass, GTK_TYPE_CHECK_BUTTON));
end;

function GTK_IS_CHECK_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CHECK_BUTTON);
end;

function GTK_IS_CHECK_BUTTON_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_CHECK_BUTTON);
end;

function GTK_CHECK_BUTTON_GET_CLASS(obj : Pointer) : PGtkCheckButtonClass;
begin
  Result := PGtkCheckButtonClass(PGTypeInstance(obj)^.g_class);
end;



end.
