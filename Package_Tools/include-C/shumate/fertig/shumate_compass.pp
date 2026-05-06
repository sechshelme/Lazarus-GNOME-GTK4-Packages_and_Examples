
unit shumate_compass;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_compass.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_compass.h
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
PShumateCompass  = ^ShumateCompass;
PShumateViewport  = ^ShumateViewport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Collabora Ltd. (https://www.collabora.com)
 * Copyright (C) 2021 Corentin Noël <corentin.noel@collabora.com>
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
{$ifndef SHUMATE_COMPASS_H}
{$define SHUMATE_COMPASS_H}
{$include <shumate/shumate-viewport.h>}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_COMPASS : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateCompass, shumate_compass, SHUMATE, COMPASS, GtkWidget) }
function shumate_compass_new(viewport:PShumateViewport):PShumateCompass;cdecl;external;
function shumate_compass_get_viewport(compass:PShumateCompass):PShumateViewport;cdecl;external;
procedure shumate_compass_set_viewport(compass:PShumateCompass; viewport:PShumateViewport);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_COMPASS : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_COMPASS:=shumate_compass_get_type;
  end;


end.
