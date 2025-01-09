
unit adw_navigation_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_navigation_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_navigation_view.h
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
PAdwNavigationPage  = ^AdwNavigationPage;
PAdwNavigationPageClass  = ^AdwNavigationPageClass;
PAdwNavigationView  = ^AdwNavigationView;
Pchar  = ^char;
PGListModel  = ^GListModel;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022-2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_NAVIGATION_PAGE : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwNavigationPage, adw_navigation_page, ADW, NAVIGATION_PAGE, GtkWidget) }
{*
   * AdwNavigationPageClass::showing:
   * @self: a navigation page
   *
   * Called when the page shows at the beginning of the navigation view
   * transition.
   *
   * Since: 1.4
    }
{*
   * AdwNavigationPageClass::shown:
   * @self: a navigation page
   *
   * Called when the navigation view transition has been completed and the page
   * is fully shown.
   *
   * Since: 1.4
    }
{*
   * AdwNavigationPageClass::hiding:
   * @self: a navigation page
   *
   * Called when the page starts hiding at the beginning of the navigation view
   * transition.
   *
   * Since: 1.4
    }
{*
   * AdwNavigationPageClass::hidden:
   * @self: a navigation page
   *
   * Called when the navigation view transition has been completed and the page
   * is fully hidden.
   *
   * Since: 1.4
    }
{< private > }
type
  PAdwNavigationPageClass = ^TAdwNavigationPageClass;
  TAdwNavigationPageClass = record
      parent_class : TGtkWidgetClass;
      showing : procedure (self:PAdwNavigationPage);cdecl;
      shown : procedure (self:PAdwNavigationPage);cdecl;
      hiding : procedure (self:PAdwNavigationPage);cdecl;
      hidden : procedure (self:PAdwNavigationPage);cdecl;
      padding : array[0..7] of Tgpointer;
    end;

(* Const before type ignored *)

function adw_navigation_page_new(child:PGtkWidget; title:Pchar):PAdwNavigationPage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adw_navigation_page_new_with_tag(child:PGtkWidget; title:Pchar; tag:Pchar):PAdwNavigationPage;cdecl;external;
function adw_navigation_page_get_child(self:PAdwNavigationPage):PGtkWidget;cdecl;external;
procedure adw_navigation_page_set_child(self:PAdwNavigationPage; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adw_navigation_page_get_tag(self:PAdwNavigationPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_navigation_page_set_tag(self:PAdwNavigationPage; tag:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_navigation_page_get_title(self:PAdwNavigationPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_navigation_page_set_title(self:PAdwNavigationPage; title:Pchar);cdecl;external;
function adw_navigation_page_get_can_pop(self:PAdwNavigationPage):Tgboolean;cdecl;external;
procedure adw_navigation_page_set_can_pop(self:PAdwNavigationPage; can_pop:Tgboolean);cdecl;external;
{ was #define dname def_expr }
function ADW_TYPE_NAVIGATION_VIEW : longint; { return type might be wrong }

{xxxxxxxxxxxxxxextern }
{G_DECLARE_FINAL_TYPE (AdwNavigationView, adw_navigation_view, ADW, NAVIGATION_VIEW, GtkWidget) }
function adw_navigation_view_new:PGtkWidget;cdecl;external;
procedure adw_navigation_view_add(self:PAdwNavigationView; page:PAdwNavigationPage);cdecl;external;
procedure adw_navigation_view_remove(self:PAdwNavigationView; page:PAdwNavigationPage);cdecl;external;
(* Const before type ignored *)
function adw_navigation_view_find_page(self:PAdwNavigationView; tag:Pchar):PAdwNavigationPage;cdecl;external;
procedure adw_navigation_view_push(self:PAdwNavigationView; page:PAdwNavigationPage);cdecl;external;
(* Const before type ignored *)
procedure adw_navigation_view_push_by_tag(self:PAdwNavigationView; tag:Pchar);cdecl;external;
function adw_navigation_view_pop(self:PAdwNavigationView):Tgboolean;cdecl;external;
function adw_navigation_view_pop_to_page(self:PAdwNavigationView; page:PAdwNavigationPage):Tgboolean;cdecl;external;
(* Const before type ignored *)
function adw_navigation_view_pop_to_tag(self:PAdwNavigationView; tag:Pchar):Tgboolean;cdecl;external;
procedure adw_navigation_view_replace(self:PAdwNavigationView; pages:PPAdwNavigationPage; n_pages:longint);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure adw_navigation_view_replace_with_tags(self:PAdwNavigationView; tags:PPchar; n_tags:longint);cdecl;external;
function adw_navigation_view_get_visible_page(self:PAdwNavigationView):PAdwNavigationPage;cdecl;external;
function adw_navigation_view_get_previous_page(self:PAdwNavigationView; page:PAdwNavigationPage):PAdwNavigationPage;cdecl;external;
function adw_navigation_view_get_animate_transitions(self:PAdwNavigationView):Tgboolean;cdecl;external;
procedure adw_navigation_view_set_animate_transitions(self:PAdwNavigationView; animate_transitions:Tgboolean);cdecl;external;
function adw_navigation_view_get_pop_on_escape(self:PAdwNavigationView):Tgboolean;cdecl;external;
procedure adw_navigation_view_set_pop_on_escape(self:PAdwNavigationView; pop_on_escape:Tgboolean);cdecl;external;
function adw_navigation_view_get_navigation_stack(self:PAdwNavigationView):PGListModel;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_NAVIGATION_PAGE : longint; { return type might be wrong }
  begin
    ADW_TYPE_NAVIGATION_PAGE:=adw_navigation_page_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_NAVIGATION_VIEW : longint; { return type might be wrong }
  begin
    ADW_TYPE_NAVIGATION_VIEW:=adw_navigation_view_get_type;
  end;


end.
