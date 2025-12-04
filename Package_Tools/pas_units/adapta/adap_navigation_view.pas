unit adap_navigation_view;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

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


function adap_navigation_page_new(child:PGtkWidget; title:Pchar):PAdapNavigationPage;cdecl;external libadapta;
function adap_navigation_page_new_with_tag(child:PGtkWidget; title:Pchar; tag:Pchar):PAdapNavigationPage;cdecl;external libadapta;
function adap_navigation_page_get_child(self:PAdapNavigationPage):PGtkWidget;cdecl;external libadapta;
procedure adap_navigation_page_set_child(self:PAdapNavigationPage; child:PGtkWidget);cdecl;external libadapta;
function adap_navigation_page_get_tag(self:PAdapNavigationPage):Pchar;cdecl;external libadapta;
procedure adap_navigation_page_set_tag(self:PAdapNavigationPage; tag:Pchar);cdecl;external libadapta;
function adap_navigation_page_get_title(self:PAdapNavigationPage):Pchar;cdecl;external libadapta;
procedure adap_navigation_page_set_title(self:PAdapNavigationPage; title:Pchar);cdecl;external libadapta;
function adap_navigation_page_get_can_pop(self:PAdapNavigationPage):Tgboolean;cdecl;external libadapta;
procedure adap_navigation_page_set_can_pop(self:PAdapNavigationPage; can_pop:Tgboolean);cdecl;external libadapta;
{ was #define dname def_expr }
function ADAP_TYPE_NAVIGATION_VIEW : longint; { return type might be wrong }

{xxxxxxG_DECLARE_FINAL_TYPE (AdapNavigationView, adap_navigation_view, ADAP, NAVIGATION_VIEW, GtkWidget) }
function adap_navigation_view_new:PGtkWidget;cdecl;external libadapta;
procedure adap_navigation_view_add(self:PAdapNavigationView; page:PAdapNavigationPage);cdecl;external libadapta;
procedure adap_navigation_view_remove(self:PAdapNavigationView; page:PAdapNavigationPage);cdecl;external libadapta;
function adap_navigation_view_find_page(self:PAdapNavigationView; tag:Pchar):PAdapNavigationPage;cdecl;external libadapta;
procedure adap_navigation_view_push(self:PAdapNavigationView; page:PAdapNavigationPage);cdecl;external libadapta;
procedure adap_navigation_view_push_by_tag(self:PAdapNavigationView; tag:Pchar);cdecl;external libadapta;
function adap_navigation_view_pop(self:PAdapNavigationView):Tgboolean;cdecl;external libadapta;
function adap_navigation_view_pop_to_page(self:PAdapNavigationView; page:PAdapNavigationPage):Tgboolean;cdecl;external libadapta;
function adap_navigation_view_pop_to_tag(self:PAdapNavigationView; tag:Pchar):Tgboolean;cdecl;external libadapta;
procedure adap_navigation_view_replace(self:PAdapNavigationView; pages:PPAdapNavigationPage; n_pages:longint);cdecl;external libadapta;
procedure adap_navigation_view_replace_with_tags(self:PAdapNavigationView; tags:PPchar; n_tags:longint);cdecl;external libadapta;
function adap_navigation_view_get_visible_page(self:PAdapNavigationView):PAdapNavigationPage;cdecl;external libadapta;
function adap_navigation_view_get_previous_page(self:PAdapNavigationView; page:PAdapNavigationPage):PAdapNavigationPage;cdecl;external libadapta;
function adap_navigation_view_get_animate_transitions(self:PAdapNavigationView):Tgboolean;cdecl;external libadapta;
procedure adap_navigation_view_set_animate_transitions(self:PAdapNavigationView; animate_transitions:Tgboolean);cdecl;external libadapta;
function adap_navigation_view_get_pop_on_escape(self:PAdapNavigationView):Tgboolean;cdecl;external libadapta;
procedure adap_navigation_view_set_pop_on_escape(self:PAdapNavigationView; pop_on_escape:Tgboolean);cdecl;external libadapta;
function adap_navigation_view_get_navigation_stack(self:PAdapNavigationView):PGListModel;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:16 ===

function ADAP_TYPE_NAVIGATION_PAGE: TGType;
function ADAP_NAVIGATION_PAGE(obj: Pointer): PAdapNavigationPage;
function ADAP_IS_NAVIGATION_PAGE(obj: Pointer): Tgboolean;
function ADAP_NAVIGATION_PAGE_CLASS(klass: Pointer): PAdapNavigationPageClass;
function ADAP_IS_NAVIGATION_PAGE_CLASS(klass: Pointer): Tgboolean;
function ADAP_NAVIGATION_PAGE_GET_CLASS(obj: Pointer): PAdapNavigationPageClass;

implementation

function ADAP_TYPE_NAVIGATION_PAGE: TGType;
begin
  Result := adap_navigation_page_get_type;
end;

function ADAP_NAVIGATION_PAGE(obj: Pointer): PAdapNavigationPage;
begin
  Result := PAdapNavigationPage(g_type_check_instance_cast(obj, ADAP_TYPE_NAVIGATION_PAGE));
end;

function ADAP_IS_NAVIGATION_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_NAVIGATION_PAGE);
end;

function ADAP_NAVIGATION_PAGE_CLASS(klass: Pointer): PAdapNavigationPageClass;
begin
  Result := PAdapNavigationPageClass(g_type_check_class_cast(klass, ADAP_TYPE_NAVIGATION_PAGE));
end;

function ADAP_IS_NAVIGATION_PAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_NAVIGATION_PAGE);
end;

function ADAP_NAVIGATION_PAGE_GET_CLASS(obj: Pointer): PAdapNavigationPageClass;
begin
  Result := PAdapNavigationPageClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapNavigationPage = record
    parent_instance: TGtkWidget;
  end;
  PAdapNavigationPage = ^TAdapNavigationPage;

  TAdapNavigationPageClass = record
  end;
  PAdapNavigationPageClass = ^TAdapNavigationPageClass;

function adap_navigation_page_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function ADAP_TYPE_NAVIGATION_VIEW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_NAVIGATION_VIEW:=adap_navigation_view_get_type;
  end;


end.
