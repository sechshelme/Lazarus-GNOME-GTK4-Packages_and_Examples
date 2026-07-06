
unit gtkpopovermenu;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkpopovermenu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkpopovermenu.h
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
PGMenuModel  = ^GMenuModel;
PGtkPopoverMenu  = ^GtkPopoverMenu;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright © 2014 Red Hat, Inc.
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
{$include <gtk/gtkpopover.h>}

{ was #define dname def_expr }
function GTK_TYPE_POPOVER_MENU : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_POPOVER_MENU(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_POPOVER_MENU(o : longint) : longint;

type

function gtk_popover_menu_get_type:TGType;cdecl;external;
function gtk_popover_menu_new_from_model(model:PGMenuModel):PGtkWidget;cdecl;external;
function gtk_popover_menu_new_from_model_full(model:PGMenuModel; flags:TGtkPopoverMenuFlags):PGtkWidget;cdecl;external;
procedure gtk_popover_menu_set_menu_model(popover:PGtkPopoverMenu; model:PGMenuModel);cdecl;external;
function gtk_popover_menu_get_menu_model(popover:PGtkPopoverMenu):PGMenuModel;cdecl;external;
procedure gtk_popover_menu_set_flags(popover:PGtkPopoverMenu; flags:TGtkPopoverMenuFlags);cdecl;external;
function gtk_popover_menu_get_flags(popover:PGtkPopoverMenu):TGtkPopoverMenuFlags;cdecl;external;
(* Const before type ignored *)
function gtk_popover_menu_add_child(popover:PGtkPopoverMenu; child:PGtkWidget; id:Pchar):Tgboolean;cdecl;external;
function gtk_popover_menu_remove_child(popover:PGtkPopoverMenu; child:PGtkWidget):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPopoverMenu, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_POPOVER_MENU : longint; { return type might be wrong }
  begin
    GTK_TYPE_POPOVER_MENU:=gtk_popover_menu_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_POPOVER_MENU(o : longint) : longint;
begin
  GTK_POPOVER_MENU:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_POPOVER_MENU,GtkPopoverMenu);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_POPOVER_MENU(o : longint) : longint;
begin
  GTK_IS_POPOVER_MENU:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_POPOVER_MENU);
end;


end.
