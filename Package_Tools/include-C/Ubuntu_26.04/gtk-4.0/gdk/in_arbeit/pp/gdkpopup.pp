
unit gdkpopup;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkpopup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkpopup.h
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
PGdkPopup  = ^GdkPopup;
PGdkPopupLayout  = ^GdkPopupLayout;
PGdkSurface  = ^GdkSurface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Red Hat, Inc.
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
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdkpopuplayout.h>}
{$include <gdk/gdksurface.h>}

{ was #define dname def_expr }
function GDK_TYPE_POPUP : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GdkPopup, gdk_popup, GDK, POPUP, GObject) }
function gdk_popup_present(popup:PGdkPopup; width:longint; height:longint; layout:PGdkPopupLayout):Tgboolean;cdecl;external;
function gdk_popup_get_surface_anchor(popup:PGdkPopup):TGdkGravity;cdecl;external;
function gdk_popup_get_rect_anchor(popup:PGdkPopup):TGdkGravity;cdecl;external;
function gdk_popup_get_parent(popup:PGdkPopup):PGdkSurface;cdecl;external;
function gdk_popup_get_position_x(popup:PGdkPopup):longint;cdecl;external;
function gdk_popup_get_position_y(popup:PGdkPopup):longint;cdecl;external;
function gdk_popup_get_autohide(popup:PGdkPopup):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GDK_TYPE_POPUP : longint; { return type might be wrong }
  begin
    GDK_TYPE_POPUP:=gdk_popup_get_type;
  end;


end.
