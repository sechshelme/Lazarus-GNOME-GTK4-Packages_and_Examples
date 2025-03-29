
unit gtksourcesearchsettings;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcesearchsettings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcesearchsettings.h
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
Pgchar  = ^gchar;
PGtkSourceSearchSettings  = ^GtkSourceSearchSettings;
PGtkSourceSearchSettingsClass  = ^GtkSourceSearchSettingsClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2013 - Sébastien Wilmet <swilmet@gnome.org>
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$include <glib-object.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SEARCH_SETTINGS : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSourceSearchSettings, gtk_source_search_settings, GTK_SOURCE, SEARCH_SETTINGS, GObject) }
{< private > }
type
  PGtkSourceSearchSettingsClass = ^TGtkSourceSearchSettingsClass;
  TGtkSourceSearchSettingsClass = record
      parent_class : TGObjectClass;
      _reserved : array[0..9] of Tgpointer;
    end;


function gtk_source_search_settings_new:PGtkSourceSearchSettings;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_search_settings_set_search_text(settings:PGtkSourceSearchSettings; search_text:Pgchar);cdecl;external;
(* Const before type ignored *)
function gtk_source_search_settings_get_search_text(settings:PGtkSourceSearchSettings):Pgchar;cdecl;external;
procedure gtk_source_search_settings_set_case_sensitive(settings:PGtkSourceSearchSettings; case_sensitive:Tgboolean);cdecl;external;
function gtk_source_search_settings_get_case_sensitive(settings:PGtkSourceSearchSettings):Tgboolean;cdecl;external;
procedure gtk_source_search_settings_set_at_word_boundaries(settings:PGtkSourceSearchSettings; at_word_boundaries:Tgboolean);cdecl;external;
function gtk_source_search_settings_get_at_word_boundaries(settings:PGtkSourceSearchSettings):Tgboolean;cdecl;external;
procedure gtk_source_search_settings_set_wrap_around(settings:PGtkSourceSearchSettings; wrap_around:Tgboolean);cdecl;external;
function gtk_source_search_settings_get_wrap_around(settings:PGtkSourceSearchSettings):Tgboolean;cdecl;external;
procedure gtk_source_search_settings_set_regex_enabled(settings:PGtkSourceSearchSettings; regex_enabled:Tgboolean);cdecl;external;
function gtk_source_search_settings_get_regex_enabled(settings:PGtkSourceSearchSettings):Tgboolean;cdecl;external;
function gtk_source_search_settings_get_visible_only(settings:PGtkSourceSearchSettings):Tgboolean;cdecl;external;
procedure gtk_source_search_settings_set_visible_only(settings:PGtkSourceSearchSettings; visible_only:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SEARCH_SETTINGS : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_SEARCH_SETTINGS:=gtk_source_search_settings_get_type;
  end;


end.
