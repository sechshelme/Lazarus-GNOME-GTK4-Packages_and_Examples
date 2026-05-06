
unit shumate_license;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_license.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_license.h
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
PShumateLicense  = ^ShumateLicense;
PShumateMapSource  = ^ShumateMapSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011-2013 Jiri Techet <techet@gmail.com>
 * Copyright (C) 2019 Marcus Lundblad <ml@update.uu.se>
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$if !defined (__SHUMATE_SHUMATE_H_INSIDE__) && !defined (SHUMATE_COMPILATION)}
{$error "Only <shumate/shumate.h> can be included directly."}
{$endif}
{$ifndef SHUMATE_LICENSE_H}
{$define SHUMATE_LICENSE_H}
{$include <shumate/shumate-map-source.h>}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_LICENSE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateLicense, shumate_license, SHUMATE, LICENSE, GtkWidget) }
function shumate_license_new:PShumateLicense;cdecl;external;
(* Const before type ignored *)
procedure shumate_license_set_extra_text(license:PShumateLicense; text:Pchar);cdecl;external;
(* Const before type ignored *)
function shumate_license_get_extra_text(license:PShumateLicense):Pchar;cdecl;external;
procedure shumate_license_set_xalign(license:PShumateLicense; xalign:single);cdecl;external;
function shumate_license_get_xalign(license:PShumateLicense):single;cdecl;external;
procedure shumate_license_append_map_source(license:PShumateLicense; map_source:PShumateMapSource);cdecl;external;
procedure shumate_license_prepend_map_source(license:PShumateLicense; map_source:PShumateMapSource);cdecl;external;
procedure shumate_license_remove_map_source(license:PShumateLicense; map_source:PShumateMapSource);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_LICENSE : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_LICENSE:=shumate_license_get_type;
  end;


end.
