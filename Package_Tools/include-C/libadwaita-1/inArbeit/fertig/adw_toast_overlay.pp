
unit adw_toast_overlay;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_toast_overlay.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_toast_overlay.h
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
PAdwToast  = ^AdwToast;
PAdwToastOverlay  = ^AdwToastOverlay;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include "adw-toast.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_TOAST_OVERLAY : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwToastOverlay, adw_toast_overlay, ADW, TOAST_OVERLAY, GtkWidget) }
function adw_toast_overlay_new:PGtkWidget;cdecl;external;
function adw_toast_overlay_get_child(self:PAdwToastOverlay):PGtkWidget;cdecl;external;
procedure adw_toast_overlay_set_child(self:PAdwToastOverlay; child:PGtkWidget);cdecl;external;
procedure adw_toast_overlay_add_toast(self:PAdwToastOverlay; toast:PAdwToast);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_TOAST_OVERLAY : longint; { return type might be wrong }
  begin
    ADW_TYPE_TOAST_OVERLAY:=adw_toast_overlay_get_type;
  end;


end.
