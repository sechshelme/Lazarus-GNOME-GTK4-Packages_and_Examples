
unit gtksourceregion;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourceregion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourceregion.h
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
PGtkSourceRegion  = ^GtkSourceRegion;
PGtkSourceRegionClass  = ^GtkSourceRegionClass;
PGtkSourceRegionIter  = ^GtkSourceRegionIter;
PGtkTextBuffer  = ^GtkTextBuffer;
PGtkTextIter  = ^GtkTextIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2002 Gustavo Giráldez <gustavo.giraldez@gmx.net>
 * Copyright 2016 Sébastien Wilmet <swilmet@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$include <gtk/gtk.h>}
{$include "gtksourceversion.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_REGION : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSourceRegion, gtk_source_region, GTK_SOURCE, REGION, GObject) }
{< private > }
type
  PGtkSourceRegionClass = ^TGtkSourceRegionClass;
  TGtkSourceRegionClass = record
      parent_class : TGObjectClass;
      _reserved : array[0..9] of Tgpointer;
    end;

{*
 * GtkSourceRegionIter:
 *
 * An opaque datatype.
 *
 * Ignore all its fields and initialize the iter with [method@Region.get_start_region_iter].
  }
{< private > }
  PGtkSourceRegionIter = ^TGtkSourceRegionIter;
  TGtkSourceRegionIter = record
      dummy1 : Tgpointer;
      dummy2 : Tguint32;
      dummy3 : Tgpointer;
    end;


function gtk_source_region_new(buffer:PGtkTextBuffer):PGtkSourceRegion;cdecl;external;
function gtk_source_region_get_buffer(region:PGtkSourceRegion):PGtkTextBuffer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_region_add_subregion(region:PGtkSourceRegion; _start:PGtkTextIter; _end:PGtkTextIter);cdecl;external;
procedure gtk_source_region_add_region(region:PGtkSourceRegion; region_to_add:PGtkSourceRegion);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_region_subtract_subregion(region:PGtkSourceRegion; _start:PGtkTextIter; _end:PGtkTextIter);cdecl;external;
procedure gtk_source_region_subtract_region(region:PGtkSourceRegion; region_to_subtract:PGtkSourceRegion);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_region_intersect_subregion(region:PGtkSourceRegion; _start:PGtkTextIter; _end:PGtkTextIter):PGtkSourceRegion;cdecl;external;
function gtk_source_region_intersect_region(region1:PGtkSourceRegion; region2:PGtkSourceRegion):PGtkSourceRegion;cdecl;external;
function gtk_source_region_is_empty(region:PGtkSourceRegion):Tgboolean;cdecl;external;
function gtk_source_region_get_bounds(region:PGtkSourceRegion; start:PGtkTextIter; end:PGtkTextIter):Tgboolean;cdecl;external;
procedure gtk_source_region_get_start_region_iter(region:PGtkSourceRegion; iter:PGtkSourceRegionIter);cdecl;external;
function gtk_source_region_iter_is_end(iter:PGtkSourceRegionIter):Tgboolean;cdecl;external;
function gtk_source_region_iter_next(iter:PGtkSourceRegionIter):Tgboolean;cdecl;external;
function gtk_source_region_iter_get_subregion(iter:PGtkSourceRegionIter; start:PGtkTextIter; end:PGtkTextIter):Tgboolean;cdecl;external;
function gtk_source_region_to_string(region:PGtkSourceRegion):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_REGION : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_REGION:=gtk_source_region_get_type;
  end;


end.
