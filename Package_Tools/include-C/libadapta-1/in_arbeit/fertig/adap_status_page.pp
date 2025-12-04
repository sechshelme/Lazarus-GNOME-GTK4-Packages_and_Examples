
unit adap_status_page;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_status_page.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_status_page.h
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
PAdapStatusPage  = ^AdapStatusPage;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_STATUS_PAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapStatusPage, adap_status_page, ADAP, STATUS_PAGE, GtkWidget) }
function adap_status_page_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_status_page_get_icon_name(self:PAdapStatusPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_status_page_set_icon_name(self:PAdapStatusPage; icon_name:Pchar);cdecl;external;
function adap_status_page_get_paintable(self:PAdapStatusPage):PGdkPaintable;cdecl;external;
procedure adap_status_page_set_paintable(self:PAdapStatusPage; paintable:PGdkPaintable);cdecl;external;
(* Const before type ignored *)
function adap_status_page_get_title(self:PAdapStatusPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_status_page_set_title(self:PAdapStatusPage; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_status_page_get_description(self:PAdapStatusPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_status_page_set_description(self:PAdapStatusPage; description:Pchar);cdecl;external;
function adap_status_page_get_child(self:PAdapStatusPage):PGtkWidget;cdecl;external;
procedure adap_status_page_set_child(self:PAdapStatusPage; child:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_STATUS_PAGE : longint; { return type might be wrong }
  begin
    ADAP_TYPE_STATUS_PAGE:=adap_status_page_get_type;
  end;


end.
