
unit adap_toast_overlay;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_toast_overlay.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_toast_overlay.h
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
PAdapToast  = ^AdapToast;
PAdapToastOverlay  = ^AdapToastOverlay;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include "adap-toast.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_TOAST_OVERLAY : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapToastOverlay, adap_toast_overlay, ADAP, TOAST_OVERLAY, GtkWidget) }
function adap_toast_overlay_new:PGtkWidget;cdecl;external;
function adap_toast_overlay_get_child(self:PAdapToastOverlay):PGtkWidget;cdecl;external;
procedure adap_toast_overlay_set_child(self:PAdapToastOverlay; child:PGtkWidget);cdecl;external;
procedure adap_toast_overlay_add_toast(self:PAdapToastOverlay; toast:PAdapToast);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_TOAST_OVERLAY : longint; { return type might be wrong }
  begin
    ADAP_TYPE_TOAST_OVERLAY:=adap_toast_overlay_get_type;
  end;


end.
