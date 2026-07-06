
unit gtkpopoverbin;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkpopoverbin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkpopoverbin.h
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
PGMenuModel  = ^GMenuModel;
PGtkPopoverBin  = ^GtkPopoverBin;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkpopoverbin.h: A single-child container with a popover
 *
 * SPDX-FileCopyrightText: 2025  Emmanuele Bassi
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtkpopover.h>}

{ was #define dname def_expr }
function GTK_TYPE_POPOVER_BIN : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkPopoverBin, gtk_popover_bin, GTK, POPOVER_BIN, GtkWidget) }
function gtk_popover_bin_new:PGtkWidget;cdecl;external;
procedure gtk_popover_bin_set_child(self:PGtkPopoverBin; child:PGtkWidget);cdecl;external;
function gtk_popover_bin_get_child(self:PGtkPopoverBin):PGtkWidget;cdecl;external;
procedure gtk_popover_bin_set_menu_model(self:PGtkPopoverBin; model:PGMenuModel);cdecl;external;
function gtk_popover_bin_get_menu_model(self:PGtkPopoverBin):PGMenuModel;cdecl;external;
procedure gtk_popover_bin_set_popover(self:PGtkPopoverBin; popover:PGtkWidget);cdecl;external;
function gtk_popover_bin_get_popover(self:PGtkPopoverBin):PGtkWidget;cdecl;external;
procedure gtk_popover_bin_popup(self:PGtkPopoverBin);cdecl;external;
procedure gtk_popover_bin_popdown(self:PGtkPopoverBin);cdecl;external;
procedure gtk_popover_bin_set_handle_input(self:PGtkPopoverBin; handle_input:Tgboolean);cdecl;external;
function gtk_popover_bin_get_handle_input(self:PGtkPopoverBin):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_POPOVER_BIN : longint; { return type might be wrong }
  begin
    GTK_TYPE_POPOVER_BIN:=gtk_popover_bin_get_type;
  end;


end.
