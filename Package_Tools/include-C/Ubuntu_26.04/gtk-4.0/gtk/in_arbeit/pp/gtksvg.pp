
unit gtksvg;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksvg.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksvg.h
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
Pdword  = ^dword;
PGBytes  = ^GBytes;
PGdkFrameClock  = ^GdkFrameClock;
PGError  = ^GError;
PGtkSvg  = ^GtkSvg;
PGtkSvgError  = ^GtkSvgError;
PGtkSvgFeatures  = ^GtkSvgFeatures;
PGtkSvgLocation  = ^GtkSvgLocation;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2025 Red Hat, Inc
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gsk/gsk.h>}
{$include <gtk/gtksnapshot.h>}
{$include <gtk/gtkenums.h>}

{ was #define dname def_expr }
function GTK_TYPE_SVG : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSvg, gtk_svg, GTK, SVG, GObject) }
function gtk_svg_new:PGtkSvg;cdecl;external;
function gtk_svg_new_from_bytes(bytes:PGBytes):PGtkSvg;cdecl;external;
(* Const before type ignored *)
function gtk_svg_new_from_resource(path:Pchar):PGtkSvg;cdecl;external;
procedure gtk_svg_load_from_bytes(self:PGtkSvg; bytes:PGBytes);cdecl;external;
(* Const before type ignored *)
procedure gtk_svg_load_from_resource(self:PGtkSvg; path:Pchar);cdecl;external;
function gtk_svg_serialize(self:PGtkSvg):PGBytes;cdecl;external;
(* Const before type ignored *)
function gtk_svg_write_to_file(self:PGtkSvg; filename:Pchar; error:PPGError):Tgboolean;cdecl;external;
procedure gtk_svg_set_weight(self:PGtkSvg; weight:Tdouble);cdecl;external;
function gtk_svg_get_weight(self:PGtkSvg):Tdouble;cdecl;external;
procedure gtk_svg_set_state(self:PGtkSvg; state:dword);cdecl;external;
function gtk_svg_get_state(self:PGtkSvg):dword;cdecl;external;
(* Const before type ignored *)
function gtk_svg_get_state_names(self:PGtkSvg; length:Pdword):^Pchar;cdecl;external;
procedure gtk_svg_set_frame_clock(self:PGtkSvg; clock:PGdkFrameClock);cdecl;external;
procedure gtk_svg_play(self:PGtkSvg);cdecl;external;
procedure gtk_svg_pause(self:PGtkSvg);cdecl;external;
{*
 * GtkSvgFeatures:
 * @GTK_SVG_ANIMATIONS: Whether to run animations. If disabled,
 *   state changes are applied without transitions
 * @GTK_SVG_SYSTEM_RESOURCES: Whether to use system resources,
 *   such as fonts. If disabled, only embedded fonts are used
 * @GTK_SVG_EXTERNAL_RESOURCES: Whether to load external
 *   resources, such as images. If disabled, only embedded
 *   images are loaded
 * @GTK_SVG_EXTENSIONS: Whether to allow gpa extensions, such
 *   as states and transitions
 * @GTK_SVG_TRADITIONAL_SYMBOLIC: This feature is meant for
 *   compatibility with old symbolic icons. If this is enabled,
 *   fill and stroke attributes are ignored. The used colors
 *   are derived from symbolic style classes if present, and
 *   the default fill color is the symbolic foreground color.
 *
 * Features of the SVG renderer that can be enabled or disabled.
 *
 * By default, all features except `GTK_SVG_TRADITIONAL_SYMBOLIC`
 * are enabled.
 *
 * New values may be added in the future.
 *
 * Since: 4.22
  }
type
  PGtkSvgFeatures = ^TGtkSvgFeatures;
  TGtkSvgFeatures =  Longint;
  Const
    GTK_SVG_ANIMATIONS = 1 shl 0;
    GTK_SVG_SYSTEM_RESOURCES = 1 shl 1;
    GTK_SVG_EXTERNAL_RESOURCES = 1 shl 2;
    GTK_SVG_EXTENSIONS = 1 shl 3;
    GTK_SVG_TRADITIONAL_SYMBOLIC = 1 shl 4;
;
{*
 * GTK_SVG_DEFAULT_FEATURES:
 *
 * The `GtkSvgFeatures` that are enabled by default.
 *
 * Since: 4.22
  }
  GTK_SVG_DEFAULT_FEATURES = ((GTK_SVG_ANIMATIONS or GTK_SVG_SYSTEM_RESOURCES) or GTK_SVG_EXTERNAL_RESOURCES) or GTK_SVG_EXTENSIONS;  

procedure gtk_svg_set_features(self:PGtkSvg; features:TGtkSvgFeatures);cdecl;external;
function gtk_svg_get_features(self:PGtkSvg):TGtkSvgFeatures;cdecl;external;
type
  PGtkSvgError = ^TGtkSvgError;
  TGtkSvgError =  Longint;
  Const
    GTK_SVG_ERROR_INVALID_SYNTAX = 0;
    GTK_SVG_ERROR_INVALID_ELEMENT = 1;
    GTK_SVG_ERROR_INVALID_ATTRIBUTE = 2;
    GTK_SVG_ERROR_MISSING_ATTRIBUTE = 3;
    GTK_SVG_ERROR_INVALID_REFERENCE = 4;
    GTK_SVG_ERROR_FAILED_UPDATE = 5;
    GTK_SVG_ERROR_FAILED_RENDERING = 6;
    GTK_SVG_ERROR_IGNORED_ELEMENT = 7;
    GTK_SVG_ERROR_LIMITS_EXCEEDED = 8;
    GTK_SVG_ERROR_NOT_IMPLEMENTED = 9;
;
type
  PGtkSvgLocation = ^TGtkSvgLocation;
  TGtkSvgLocation = record
      bytes : Tsize_t;
      lines : Tsize_t;
      line_chars : Tsize_t;
    end;

{ was #define dname def_expr }
function GTK_SVG_ERROR : longint; { return type might be wrong }

function gtk_svg_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_svg_error_get_element(error:PGError):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_svg_error_get_attribute(error:PGError):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_svg_error_get_start(error:PGError):PGtkSvgLocation;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_svg_error_get_end(error:PGError):PGtkSvgLocation;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_SVG : longint; { return type might be wrong }
  begin
    GTK_TYPE_SVG:=gtk_svg_get_type;
  end;

{ was #define dname def_expr }
function GTK_SVG_ERROR : longint; { return type might be wrong }
  begin
    GTK_SVG_ERROR:=gtk_svg_error_quark;
  end;


end.
