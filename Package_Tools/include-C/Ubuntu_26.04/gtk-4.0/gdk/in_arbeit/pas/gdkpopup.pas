unit gdkpopup;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_INTERFACE (GdkPopup, gdk_popup, GDK, POPUP, GObject) }
function gdk_popup_present(popup:PGdkPopup; width:longint; height:longint; layout:PGdkPopupLayout):Tgboolean;cdecl;external libgtk4;
function gdk_popup_get_surface_anchor(popup:PGdkPopup):TGdkGravity;cdecl;external libgtk4;
function gdk_popup_get_rect_anchor(popup:PGdkPopup):TGdkGravity;cdecl;external libgtk4;
function gdk_popup_get_parent(popup:PGdkPopup):PGdkSurface;cdecl;external libgtk4;
function gdk_popup_get_position_x(popup:PGdkPopup):longint;cdecl;external libgtk4;
function gdk_popup_get_position_y(popup:PGdkPopup):longint;cdecl;external libgtk4;
function gdk_popup_get_autohide(popup:PGdkPopup):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:23:28 ===

function GDK_TYPE_POPUP: TGType;
function GDK_POPUP(obj: Pointer): PGdkPopup;
function GDK_IS_POPUP(obj: Pointer): Tgboolean;
function GDK_POPUP_GET_IFACE(obj: Pointer): PGdkPopupInterface;

implementation

function GDK_TYPE_POPUP: TGType;
begin
  Result := gdk_popup_get_type;
end;

function GDK_POPUP(obj: Pointer): PGdkPopup;
begin
  Result := PGdkPopup(g_type_check_instance_cast(obj, GDK_TYPE_POPUP));
end;

function GDK_IS_POPUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_POPUP);
end;

function GDK_POPUP_GET_IFACE(obj: Pointer): PGdkPopupInterface;
begin
  Result := g_type_interface_peek(obj, GDK_TYPE_POPUP);
end;

type 
  TGdkPopup = record
  end;
  PGdkPopup = ^TGdkPopup;

  TGdkPopupInterface = record
  end;
  PGdkPopupInterface = ^TGdkPopupInterface;

function gdk_popup_get_type: TGType; cdecl; external libgxxxxxxx;



end.
