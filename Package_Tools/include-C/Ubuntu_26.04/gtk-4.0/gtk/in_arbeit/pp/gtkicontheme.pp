
unit gtkicontheme;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkicontheme.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkicontheme.h
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
PGIcon  = ^GIcon;
PGtkIconLookupFlags  = ^GtkIconLookupFlags;
PGtkIconPaintable  = ^GtkIconPaintable;
PGtkIconTheme  = ^GtkIconTheme;
PGtkIconThemeError  = ^GtkIconThemeError;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GtkIconTheme - a loader for icon themes
 * gtk-icon-loader.h Copyright (C) 2002, 2003 Red Hat, Inc.
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
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}
{$include <gtk/gtkiconpaintable.h>}
type

{ was #define dname def_expr }
function GTK_TYPE_ICON_THEME : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ICON_THEME(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ICON_THEME(obj : longint) : longint;

{*
 * GtkIconLookupFlags:
 * @GTK_ICON_LOOKUP_FORCE_REGULAR: Try to always load regular icons, even
 *   when symbolic icon names are given
 * @GTK_ICON_LOOKUP_FORCE_SYMBOLIC: Try to always load symbolic icons, even
 *   when regular icon names are given
 * @GTK_ICON_LOOKUP_PRELOAD: Starts loading the texture in the background
 *   so it is ready when later needed.
 *
 * Used to specify options for gtk_icon_theme_lookup_icon().
  }
{*
 * GTK_ICON_LOOKUP_NONE:
 *
 * Perform a regular lookup.
 *
 * Since: 4.18
  }
type
  PGtkIconLookupFlags = ^TGtkIconLookupFlags;
  TGtkIconLookupFlags =  Longint;
  Const
    GTK_ICON_LOOKUP_NONE = 0;
    GTK_ICON_LOOKUP_FORCE_REGULAR = 1 shl 0;
    GTK_ICON_LOOKUP_FORCE_SYMBOLIC = 1 shl 1;
    GTK_ICON_LOOKUP_PRELOAD = 1 shl 2;
;
{*
 * GTK_ICON_THEME_ERROR:
 *
 * The `GQuark` used for `GtkIconThemeError` errors.
  }

{ was #define dname def_expr }
function GTK_ICON_THEME_ERROR : longint; { return type might be wrong }

{*
 * GtkIconThemeError:
 * @GTK_ICON_THEME_NOT_FOUND: The icon specified does not exist in the theme
 * @GTK_ICON_THEME_FAILED: An unspecified error occurred.
 *
 * Error codes for `GtkIconTheme` operations.
 * }
type
  PGtkIconThemeError = ^TGtkIconThemeError;
  TGtkIconThemeError =  Longint;
  Const
    GTK_ICON_THEME_NOT_FOUND = 0;
    GTK_ICON_THEME_FAILED = 1;
;

function gtk_icon_theme_error_quark:TGQuark;cdecl;external;
function gtk_icon_theme_get_type:TGType;cdecl;external;
function gtk_icon_theme_new:PGtkIconTheme;cdecl;external;
function gtk_icon_theme_get_for_display(display:PGdkDisplay):PGtkIconTheme;cdecl;external;
function gtk_icon_theme_get_display(self:PGtkIconTheme):PGdkDisplay;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure gtk_icon_theme_set_search_path(self:PGtkIconTheme; path:PPchar);cdecl;external;
function gtk_icon_theme_get_search_path(self:PGtkIconTheme):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_icon_theme_add_search_path(self:PGtkIconTheme; path:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure gtk_icon_theme_set_resource_path(self:PGtkIconTheme; path:PPchar);cdecl;external;
function gtk_icon_theme_get_resource_path(self:PGtkIconTheme):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_icon_theme_add_resource_path(self:PGtkIconTheme; path:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_icon_theme_set_theme_name(self:PGtkIconTheme; theme_name:Pchar);cdecl;external;
function gtk_icon_theme_get_theme_name(self:PGtkIconTheme):Pchar;cdecl;external;
(* Const before type ignored *)
function gtk_icon_theme_has_icon(self:PGtkIconTheme; icon_name:Pchar):Tgboolean;cdecl;external;
function gtk_icon_theme_has_gicon(self:PGtkIconTheme; gicon:PGIcon):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_icon_theme_get_icon_sizes(self:PGtkIconTheme; icon_name:Pchar):Plongint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_icon_theme_lookup_icon(self:PGtkIconTheme; icon_name:Pchar; fallbacks:PPchar; size:longint; scale:longint; 
           direction:TGtkTextDirection; flags:TGtkIconLookupFlags):PGtkIconPaintable;cdecl;external;
function gtk_icon_theme_lookup_by_gicon(self:PGtkIconTheme; icon:PGIcon; size:longint; scale:longint; direction:TGtkTextDirection; 
           flags:TGtkIconLookupFlags):PGtkIconPaintable;cdecl;external;
function gtk_icon_theme_get_icon_names(self:PGtkIconTheme):^Pchar;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkIconTheme, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_ICON_THEME : longint; { return type might be wrong }
  begin
    GTK_TYPE_ICON_THEME:=gtk_icon_theme_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ICON_THEME(obj : longint) : longint;
begin
  GTK_ICON_THEME:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_ICON_THEME,GtkIconTheme);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ICON_THEME(obj : longint) : longint;
begin
  GTK_IS_ICON_THEME:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_ICON_THEME);
end;

{ was #define dname def_expr }
function GTK_ICON_THEME_ERROR : longint; { return type might be wrong }
  begin
    GTK_ICON_THEME_ERROR:=gtk_icon_theme_error_quark;
  end;


end.
