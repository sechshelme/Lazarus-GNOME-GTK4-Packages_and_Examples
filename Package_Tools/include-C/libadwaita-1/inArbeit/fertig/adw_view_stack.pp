
unit adw_view_stack;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_view_stack.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_view_stack.h
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
PAdwViewStack  = ^AdwViewStack;
PAdwViewStackPage  = ^AdwViewStackPage;
PAdwViewStackPages  = ^AdwViewStackPages;
Pchar  = ^char;
PGtkSelectionModel  = ^GtkSelectionModel;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2013 Red Hat, Inc.
 * Copyright (C) 2021 Frederick Schenk
 *
 * Author: Alexander Larsson <alexl@redhat.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Based on gtkstack.h
 * https://gitlab.gnome.org/GNOME/gtk/-/blob/ba44668478b7184bec02609f292691b85a2c6cdd/gtk/gtkstack.h
  }
(** unsupported pragma#pragma once*)
{$if !defined  (_ADWAITA_INSIDE) && !defined  (ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_VIEW_STACK_PAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwViewStackPage, adw_view_stack_page, ADW, VIEW_STACK_PAGE, GObject) }
function adw_view_stack_page_get_child(self:PAdwViewStackPage):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_view_stack_page_get_name(self:PAdwViewStackPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_view_stack_page_set_name(self:PAdwViewStackPage; name:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_view_stack_page_get_title(self:PAdwViewStackPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_view_stack_page_set_title(self:PAdwViewStackPage; title:Pchar);cdecl;external;
function adw_view_stack_page_get_use_underline(self:PAdwViewStackPage):Tgboolean;cdecl;external;
procedure adw_view_stack_page_set_use_underline(self:PAdwViewStackPage; use_underline:Tgboolean);cdecl;external;
(* Const before type ignored *)
function adw_view_stack_page_get_icon_name(self:PAdwViewStackPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_view_stack_page_set_icon_name(self:PAdwViewStackPage; icon_name:Pchar);cdecl;external;
function adw_view_stack_page_get_needs_attention(self:PAdwViewStackPage):Tgboolean;cdecl;external;
procedure adw_view_stack_page_set_needs_attention(self:PAdwViewStackPage; needs_attention:Tgboolean);cdecl;external;
function adw_view_stack_page_get_badge_number(self:PAdwViewStackPage):Tguint;cdecl;external;
procedure adw_view_stack_page_set_badge_number(self:PAdwViewStackPage; badge_number:Tguint);cdecl;external;
function adw_view_stack_page_get_visible(self:PAdwViewStackPage):Tgboolean;cdecl;external;
procedure adw_view_stack_page_set_visible(self:PAdwViewStackPage; visible:Tgboolean);cdecl;external;
{ was #define dname def_expr }
function ADW_TYPE_VIEW_STACK : longint; { return type might be wrong }

{ xxxxxxxxxxextern }
{G_DECLARE_FINAL_TYPE (AdwViewStack, adw_view_stack, ADW, VIEW_STACK, GtkWidget) }
function adw_view_stack_new:PGtkWidget;cdecl;external;
function adw_view_stack_add(self:PAdwViewStack; child:PGtkWidget):PAdwViewStackPage;cdecl;external;
(* Const before type ignored *)
function adw_view_stack_add_named(self:PAdwViewStack; child:PGtkWidget; name:Pchar):PAdwViewStackPage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adw_view_stack_add_titled(self:PAdwViewStack; child:PGtkWidget; name:Pchar; title:Pchar):PAdwViewStackPage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function adw_view_stack_add_titled_with_icon(self:PAdwViewStack; child:PGtkWidget; name:Pchar; title:Pchar; icon_name:Pchar):PAdwViewStackPage;cdecl;external;
procedure adw_view_stack_remove(self:PAdwViewStack; child:PGtkWidget);cdecl;external;
function adw_view_stack_get_page(self:PAdwViewStack; child:PGtkWidget):PAdwViewStackPage;cdecl;external;
(* Const before type ignored *)
function adw_view_stack_get_child_by_name(self:PAdwViewStack; name:Pchar):PGtkWidget;cdecl;external;
function adw_view_stack_get_visible_child(self:PAdwViewStack):PGtkWidget;cdecl;external;
procedure adw_view_stack_set_visible_child(self:PAdwViewStack; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adw_view_stack_get_visible_child_name(self:PAdwViewStack):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_view_stack_set_visible_child_name(self:PAdwViewStack; name:Pchar);cdecl;external;
function adw_view_stack_get_hhomogeneous(self:PAdwViewStack):Tgboolean;cdecl;external;
procedure adw_view_stack_set_hhomogeneous(self:PAdwViewStack; hhomogeneous:Tgboolean);cdecl;external;
function adw_view_stack_get_vhomogeneous(self:PAdwViewStack):Tgboolean;cdecl;external;
procedure adw_view_stack_set_vhomogeneous(self:PAdwViewStack; vhomogeneous:Tgboolean);cdecl;external;
function adw_view_stack_get_pages(self:PAdwViewStack):PGtkSelectionModel;cdecl;external;
{ was #define dname def_expr }
function ADW_TYPE_VIEW_STACK_PAGES : longint; { return type might be wrong }

{ xxxxxxxxxxxextern }
{G_DECLARE_FINAL_TYPE (AdwViewStackPages, adw_view_stack_pages, ADW, VIEW_STACK_PAGES, GObject) }
function adw_view_stack_pages_get_selected_page(self:PAdwViewStackPages):PAdwViewStackPage;cdecl;external;
procedure adw_view_stack_pages_set_selected_page(self:PAdwViewStackPages; page:PAdwViewStackPage);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_VIEW_STACK_PAGE : longint; { return type might be wrong }
  begin
    ADW_TYPE_VIEW_STACK_PAGE:=adw_view_stack_page_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_VIEW_STACK : longint; { return type might be wrong }
  begin
    ADW_TYPE_VIEW_STACK:=adw_view_stack_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_VIEW_STACK_PAGES : longint; { return type might be wrong }
  begin
    ADW_TYPE_VIEW_STACK_PAGES:=adw_view_stack_pages_get_type;
  end;


end.
