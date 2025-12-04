
unit adap_navigation_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_navigation_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_navigation_view.h
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
PAdapNavigationPage  = ^AdapNavigationPage;
PAdapNavigationPageClass  = ^AdapNavigationPageClass;
PAdapNavigationView  = ^AdapNavigationView;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_NAVIGATION_PAGE : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapNavigationPage, adap_navigation_page, ADAP, NAVIGATION_PAGE, GtkWidget) }
{*
   * AdapNavigationPageClass::showing:
   * @self: a navigation page
   *
   * Called when the page shows at the beginning of the navigation view
   * transition.
   *
   * Since: 1.4
    }
{*
   * AdapNavigationPageClass::shown:
   * @self: a navigation page
   *
   * Called when the navigation view transition has been completed and the page
   * is fully shown.
   *
   * Since: 1.4
    }
{*
   * AdapNavigationPageClass::hiding:
   * @self: a navigation page
   *
   * Called when the page starts hiding at the beginning of the navigation view
   * transition.
   *
   * Since: 1.4
    }
{*
   * AdapNavigationPageClass::hidden:
   * @self: a navigation page
   *
   * Called when the navigation view transition has been completed and the page
   * is fully hidden.
   *
   * Since: 1.4
    }
{< private > }
type
  PAdapNavigationPageClass = ^TAdapNavigationPageClass;
  TAdapNavigationPageClass = record
      parent_class : TGtkWidgetClass;
      showing : procedure (self:PAdapNavigationPage);cdecl;
      shown : procedure (self:PAdapNavigationPage);cdecl;
      hiding : procedure (self:PAdapNavigationPage);cdecl;
      hidden : procedure (self:PAdapNavigationPage);cdecl;
      padding : array[0..7] of Tgpointer;
    end;

(* Const before type ignored *)

function adap_navigation_page_new(child:PGtkWidget; title:Pchar):PAdapNavigationPage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adap_navigation_page_new_with_tag(child:PGtkWidget; title:Pchar; tag:Pchar):PAdapNavigationPage;cdecl;external;
function adap_navigation_page_get_child(self:PAdapNavigationPage):PGtkWidget;cdecl;external;
procedure adap_navigation_page_set_child(self:PAdapNavigationPage; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adap_navigation_page_get_tag(self:PAdapNavigationPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_navigation_page_set_tag(self:PAdapNavigationPage; tag:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_navigation_page_get_title(self:PAdapNavigationPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_navigation_page_set_title(self:PAdapNavigationPage; title:Pchar);cdecl;external;
function adap_navigation_page_get_can_pop(self:PAdapNavigationPage):Tgboolean;cdecl;external;
procedure adap_navigation_page_set_can_pop(self:PAdapNavigationPage; can_pop:Tgboolean);cdecl;external;
{ was #define dname def_expr }
function ADAP_TYPE_NAVIGATION_VIEW : longint; { return type might be wrong }

{xxxxxxG_DECLARE_FINAL_TYPE (AdapNavigationView, adap_navigation_view, ADAP, NAVIGATION_VIEW, GtkWidget) }
function adap_navigation_view_new:PGtkWidget;cdecl;external;
procedure adap_navigation_view_add(self:PAdapNavigationView; page:PAdapNavigationPage);cdecl;external;
procedure adap_navigation_view_remove(self:PAdapNavigationView; page:PAdapNavigationPage);cdecl;external;
(* Const before type ignored *)
function adap_navigation_view_find_page(self:PAdapNavigationView; tag:Pchar):PAdapNavigationPage;cdecl;external;
procedure adap_navigation_view_push(self:PAdapNavigationView; page:PAdapNavigationPage);cdecl;external;
(* Const before type ignored *)
procedure adap_navigation_view_push_by_tag(self:PAdapNavigationView; tag:Pchar);cdecl;external;
function adap_navigation_view_pop(self:PAdapNavigationView):Tgboolean;cdecl;external;
function adap_navigation_view_pop_to_page(self:PAdapNavigationView; page:PAdapNavigationPage):Tgboolean;cdecl;external;
(* Const before type ignored *)
function adap_navigation_view_pop_to_tag(self:PAdapNavigationView; tag:Pchar):Tgboolean;cdecl;external;
procedure adap_navigation_view_replace(self:PAdapNavigationView; pages:PPAdapNavigationPage; n_pages:longint);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure adap_navigation_view_replace_with_tags(self:PAdapNavigationView; tags:PPchar; n_tags:longint);cdecl;external;
function adap_navigation_view_get_visible_page(self:PAdapNavigationView):PAdapNavigationPage;cdecl;external;
function adap_navigation_view_get_previous_page(self:PAdapNavigationView; page:PAdapNavigationPage):PAdapNavigationPage;cdecl;external;
function adap_navigation_view_get_animate_transitions(self:PAdapNavigationView):Tgboolean;cdecl;external;
procedure adap_navigation_view_set_animate_transitions(self:PAdapNavigationView; animate_transitions:Tgboolean);cdecl;external;
function adap_navigation_view_get_pop_on_escape(self:PAdapNavigationView):Tgboolean;cdecl;external;
procedure adap_navigation_view_set_pop_on_escape(self:PAdapNavigationView; pop_on_escape:Tgboolean);cdecl;external;
function adap_navigation_view_get_navigation_stack(self:PAdapNavigationView):PGListModel;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_NAVIGATION_PAGE : longint; { return type might be wrong }
  begin
    ADAP_TYPE_NAVIGATION_PAGE:=adap_navigation_page_get_type;
  end;

{ was #define dname def_expr }
function ADAP_TYPE_NAVIGATION_VIEW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_NAVIGATION_VIEW:=adap_navigation_view_get_type;
  end;


end.
