unit adap_view_stack;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

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
{$if !defined  (_ADAPTA_INSIDE) && !defined  (ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{G_DECLARE_FINAL_TYPE (AdapViewStackPage, adap_view_stack_page, ADAP, VIEW_STACK_PAGE, GObject) }
function adap_view_stack_page_get_child(self:PAdapViewStackPage):PGtkWidget;cdecl;external libadapta;
function adap_view_stack_page_get_name(self:PAdapViewStackPage):Pchar;cdecl;external libadapta;
procedure adap_view_stack_page_set_name(self:PAdapViewStackPage; name:Pchar);cdecl;external libadapta;
function adap_view_stack_page_get_title(self:PAdapViewStackPage):Pchar;cdecl;external libadapta;
procedure adap_view_stack_page_set_title(self:PAdapViewStackPage; title:Pchar);cdecl;external libadapta;
function adap_view_stack_page_get_use_underline(self:PAdapViewStackPage):Tgboolean;cdecl;external libadapta;
procedure adap_view_stack_page_set_use_underline(self:PAdapViewStackPage; use_underline:Tgboolean);cdecl;external libadapta;
function adap_view_stack_page_get_icon_name(self:PAdapViewStackPage):Pchar;cdecl;external libadapta;
procedure adap_view_stack_page_set_icon_name(self:PAdapViewStackPage; icon_name:Pchar);cdecl;external libadapta;
function adap_view_stack_page_get_needs_attention(self:PAdapViewStackPage):Tgboolean;cdecl;external libadapta;
procedure adap_view_stack_page_set_needs_attention(self:PAdapViewStackPage; needs_attention:Tgboolean);cdecl;external libadapta;
function adap_view_stack_page_get_badge_number(self:PAdapViewStackPage):Tguint;cdecl;external libadapta;
procedure adap_view_stack_page_set_badge_number(self:PAdapViewStackPage; badge_number:Tguint);cdecl;external libadapta;
function adap_view_stack_page_get_visible(self:PAdapViewStackPage):Tgboolean;cdecl;external libadapta;
procedure adap_view_stack_page_set_visible(self:PAdapViewStackPage; visible:Tgboolean);cdecl;external libadapta;
{ was #define dname def_expr }
function ADAP_TYPE_VIEW_STACK : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapViewStack, adap_view_stack, ADAP, VIEW_STACK, GtkWidget) }
function adap_view_stack_new:PGtkWidget;cdecl;external libadapta;
function adap_view_stack_add(self:PAdapViewStack; child:PGtkWidget):PAdapViewStackPage;cdecl;external libadapta;
function adap_view_stack_add_named(self:PAdapViewStack; child:PGtkWidget; name:Pchar):PAdapViewStackPage;cdecl;external libadapta;
function adap_view_stack_add_titled(self:PAdapViewStack; child:PGtkWidget; name:Pchar; title:Pchar):PAdapViewStackPage;cdecl;external libadapta;
function adap_view_stack_add_titled_with_icon(self:PAdapViewStack; child:PGtkWidget; name:Pchar; title:Pchar; icon_name:Pchar):PAdapViewStackPage;cdecl;external libadapta;
procedure adap_view_stack_remove(self:PAdapViewStack; child:PGtkWidget);cdecl;external libadapta;
function adap_view_stack_get_page(self:PAdapViewStack; child:PGtkWidget):PAdapViewStackPage;cdecl;external libadapta;
function adap_view_stack_get_child_by_name(self:PAdapViewStack; name:Pchar):PGtkWidget;cdecl;external libadapta;
function adap_view_stack_get_visible_child(self:PAdapViewStack):PGtkWidget;cdecl;external libadapta;
procedure adap_view_stack_set_visible_child(self:PAdapViewStack; child:PGtkWidget);cdecl;external libadapta;
function adap_view_stack_get_visible_child_name(self:PAdapViewStack):Pchar;cdecl;external libadapta;
procedure adap_view_stack_set_visible_child_name(self:PAdapViewStack; name:Pchar);cdecl;external libadapta;
function adap_view_stack_get_hhomogeneous(self:PAdapViewStack):Tgboolean;cdecl;external libadapta;
procedure adap_view_stack_set_hhomogeneous(self:PAdapViewStack; hhomogeneous:Tgboolean);cdecl;external libadapta;
function adap_view_stack_get_vhomogeneous(self:PAdapViewStack):Tgboolean;cdecl;external libadapta;
procedure adap_view_stack_set_vhomogeneous(self:PAdapViewStack; vhomogeneous:Tgboolean);cdecl;external libadapta;
function adap_view_stack_get_pages(self:PAdapViewStack):PGtkSelectionModel;cdecl;external libadapta;
{ was #define dname def_expr }
function ADAP_TYPE_VIEW_STACK_PAGES : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapViewStackPages, adap_view_stack_pages, ADAP, VIEW_STACK_PAGES, GObject) }
function adap_view_stack_pages_get_selected_page(self:PAdapViewStackPages):PAdapViewStackPage;cdecl;external libadapta;
procedure adap_view_stack_pages_set_selected_page(self:PAdapViewStackPages; page:PAdapViewStackPage);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:33 ===

function ADAP_TYPE_VIEW_STACK_PAGE: TGType;
function ADAP_VIEW_STACK_PAGE(obj: Pointer): PAdapViewStackPage;
function ADAP_IS_VIEW_STACK_PAGE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_VIEW_STACK_PAGE: TGType;
begin
  Result := adap_view_stack_page_get_type;
end;

function ADAP_VIEW_STACK_PAGE(obj: Pointer): PAdapViewStackPage;
begin
  Result := PAdapViewStackPage(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_STACK_PAGE));
end;

function ADAP_IS_VIEW_STACK_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_STACK_PAGE);
end;

type 
  TAdapViewStackPage = record
  end;
  PAdapViewStackPage = ^TAdapViewStackPage;

  TAdapViewStackPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdapViewStackPageClass = ^TAdapViewStackPageClass;

function adap_view_stack_page_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function ADAP_TYPE_VIEW_STACK : longint; { return type might be wrong }
  begin
    ADAP_TYPE_VIEW_STACK:=adap_view_stack_get_type;
  end;

{ was #define dname def_expr }
function ADAP_TYPE_VIEW_STACK_PAGES : longint; { return type might be wrong }
  begin
    ADAP_TYPE_VIEW_STACK_PAGES:=adap_view_stack_pages_get_type;
  end;


end.
