
unit adw_status_page;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_status_page.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_status_page.h
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
PAdwStatusPage  = ^AdwStatusPage;
Pchar  = ^char;
PGdkPaintable  = ^GdkPaintable;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Andrei Lișiță <andreii.lisita@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_STATUS_PAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwStatusPage, adw_status_page, ADW, STATUS_PAGE, GtkWidget) }
function adw_status_page_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_status_page_get_icon_name(self:PAdwStatusPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_status_page_set_icon_name(self:PAdwStatusPage; icon_name:Pchar);cdecl;external;
function adw_status_page_get_paintable(self:PAdwStatusPage):PGdkPaintable;cdecl;external;
procedure adw_status_page_set_paintable(self:PAdwStatusPage; paintable:PGdkPaintable);cdecl;external;
(* Const before type ignored *)
function adw_status_page_get_title(self:PAdwStatusPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_status_page_set_title(self:PAdwStatusPage; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_status_page_get_description(self:PAdwStatusPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_status_page_set_description(self:PAdwStatusPage; description:Pchar);cdecl;external;
function adw_status_page_get_child(self:PAdwStatusPage):PGtkWidget;cdecl;external;
procedure adw_status_page_set_child(self:PAdwStatusPage; child:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_STATUS_PAGE : longint; { return type might be wrong }
  begin
    ADW_TYPE_STATUS_PAGE:=adw_status_page_get_type;
  end;


end.
