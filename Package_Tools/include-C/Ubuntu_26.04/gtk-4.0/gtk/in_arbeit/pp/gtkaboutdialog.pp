
unit gtkaboutdialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkaboutdialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkaboutdialog.h
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
PGdkPaintable  = ^GdkPaintable;
PGtkAboutDialog  = ^GtkAboutDialog;
PGtkLicense  = ^GtkLicense;
PGtkWidget  = ^GtkWidget;
PGtkWindow  = ^GtkWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit

   Copyright (C) 2001 CodeFactory AB
   Copyright (C) 2001 Anders Carlsson <andersca@codefactory.se>
   Copyright (C) 2003, 2004 Matthias Clasen <mclasen@redhat.com>

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public License as
   published by the Free Software Foundation; either version 2 of the
   License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with this library. If not, see <http://www.gnu.org/licenses/>.

   Author: Anders Carlsson <andersca@codefactory.se>
 }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwindow.h>}

{ was #define dname def_expr }
function GTK_TYPE_ABOUT_DIALOG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ABOUT_DIALOG(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ABOUT_DIALOG(object : longint) : longint;

type
{*
 * GtkLicense:
 * @GTK_LICENSE_UNKNOWN: No license specified
 * @GTK_LICENSE_CUSTOM: A license text is going to be specified by the
 *   developer
 * @GTK_LICENSE_GPL_2_0: The GNU General Public License, version 2.0 or later
 * @GTK_LICENSE_GPL_3_0: The GNU General Public License, version 3.0 or later
 * @GTK_LICENSE_LGPL_2_1: The GNU Lesser General Public License, version 2.1 or later
 * @GTK_LICENSE_LGPL_3_0: The GNU Lesser General Public License, version 3.0 or later
 * @GTK_LICENSE_BSD: The BSD standard license
 * @GTK_LICENSE_MIT_X11: The MIT/X11 standard license
 * @GTK_LICENSE_ARTISTIC: The Artistic License, version 2.0
 * @GTK_LICENSE_GPL_2_0_ONLY: The GNU General Public License, version 2.0 only
 * @GTK_LICENSE_GPL_3_0_ONLY: The GNU General Public License, version 3.0 only
 * @GTK_LICENSE_LGPL_2_1_ONLY: The GNU Lesser General Public License, version 2.1 only
 * @GTK_LICENSE_LGPL_3_0_ONLY: The GNU Lesser General Public License, version 3.0 only
 * @GTK_LICENSE_AGPL_3_0: The GNU Affero General Public License, version 3.0 or later
 * @GTK_LICENSE_AGPL_3_0_ONLY: The GNU Affero General Public License, version 3.0 only
 * @GTK_LICENSE_BSD_3: The 3-clause BSD licence
 * @GTK_LICENSE_APACHE_2_0: The Apache License, version 2.0
 * @GTK_LICENSE_MPL_2_0: The Mozilla Public License, version 2.0
 * @GTK_LICENSE_0BSD: Zero-Clause BSD license
 *
 * The type of license for an application.
 *
 * This enumeration can be expanded at later date.
  }

  PGtkLicense = ^TGtkLicense;
  TGtkLicense =  Longint;
  Const
    GTK_LICENSE_UNKNOWN = 0;
    GTK_LICENSE_CUSTOM = 1;
    GTK_LICENSE_GPL_2_0 = 2;
    GTK_LICENSE_GPL_3_0 = 3;
    GTK_LICENSE_LGPL_2_1 = 4;
    GTK_LICENSE_LGPL_3_0 = 5;
    GTK_LICENSE_BSD = 6;
    GTK_LICENSE_MIT_X11 = 7;
    GTK_LICENSE_ARTISTIC = 8;
    GTK_LICENSE_GPL_2_0_ONLY = 9;
    GTK_LICENSE_GPL_3_0_ONLY = 10;
    GTK_LICENSE_LGPL_2_1_ONLY = 11;
    GTK_LICENSE_LGPL_3_0_ONLY = 12;
    GTK_LICENSE_AGPL_3_0 = 13;
    GTK_LICENSE_AGPL_3_0_ONLY = 14;
    GTK_LICENSE_BSD_3 = 15;
    GTK_LICENSE_APACHE_2_0 = 16;
    GTK_LICENSE_MPL_2_0 = 17;
    GTK_LICENSE_0BSD = 18;
;

function gtk_about_dialog_get_type:TGType;cdecl;external;
function gtk_about_dialog_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
procedure gtk_show_about_dialog(parent:PGtkWindow; first_property_name:Pchar; args:array of const);cdecl;external;
procedure gtk_show_about_dialog(parent:PGtkWindow; first_property_name:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_program_name(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_program_name(about:PGtkAboutDialog; name:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_version(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_version(about:PGtkAboutDialog; version:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_copyright(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_copyright(about:PGtkAboutDialog; copyright:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_comments(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_comments(about:PGtkAboutDialog; comments:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_license(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_license(about:PGtkAboutDialog; license:Pchar);cdecl;external;
procedure gtk_about_dialog_set_license_type(about:PGtkAboutDialog; license_type:TGtkLicense);cdecl;external;
function gtk_about_dialog_get_license_type(about:PGtkAboutDialog):TGtkLicense;cdecl;external;
function gtk_about_dialog_get_wrap_license(about:PGtkAboutDialog):Tgboolean;cdecl;external;
procedure gtk_about_dialog_set_wrap_license(about:PGtkAboutDialog; wrap_license:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_system_information(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_system_information(about:PGtkAboutDialog; system_information:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_website(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_website(about:PGtkAboutDialog; website:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_website_label(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_website_label(about:PGtkAboutDialog; website_label:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_about_dialog_get_authors(about:PGtkAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_authors(about:PGtkAboutDialog; authors:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_about_dialog_get_documenters(about:PGtkAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_documenters(about:PGtkAboutDialog; documenters:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_about_dialog_get_artists(about:PGtkAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_artists(about:PGtkAboutDialog; artists:PPchar);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_translator_credits(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_translator_credits(about:PGtkAboutDialog; translator_credits:Pchar);cdecl;external;
function gtk_about_dialog_get_logo(about:PGtkAboutDialog):PGdkPaintable;cdecl;external;
procedure gtk_about_dialog_set_logo(about:PGtkAboutDialog; logo:PGdkPaintable);cdecl;external;
(* Const before type ignored *)
function gtk_about_dialog_get_logo_icon_name(about:PGtkAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_about_dialog_set_logo_icon_name(about:PGtkAboutDialog; icon_name:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_about_dialog_add_credit_section(about:PGtkAboutDialog; section_name:Pchar; people:PPchar);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkAboutDialog, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_ABOUT_DIALOG : longint; { return type might be wrong }
  begin
    GTK_TYPE_ABOUT_DIALOG:=gtk_about_dialog_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ABOUT_DIALOG(object : longint) : longint;
begin
  GTK_ABOUT_DIALOG:=G_TYPE_CHECK_INSTANCE_CAST(object,GTK_TYPE_ABOUT_DIALOG,GtkAboutDialog);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ABOUT_DIALOG(object : longint) : longint;
begin
  GTK_IS_ABOUT_DIALOG:=G_TYPE_CHECK_INSTANCE_TYPE(object,GTK_TYPE_ABOUT_DIALOG);
end;


end.
