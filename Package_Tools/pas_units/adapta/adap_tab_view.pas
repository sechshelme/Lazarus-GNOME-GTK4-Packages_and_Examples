unit adap_tab_view;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Purism SPC
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
{$include "adap-enums.h"}
{< flags > }type
  PAdapTabViewShortcuts = ^TAdapTabViewShortcuts;
  TAdapTabViewShortcuts =  Longint;
  Const
    ADAP_TAB_VIEW_SHORTCUT_NONE = 0;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_TAB = 1 shl 0;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_TAB = 1 shl 1;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_PAGE_UP = 1 shl 2;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_PAGE_DOWN = 1 shl 3;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_HOME = 1 shl 4;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_END = 1 shl 5;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_UP = 1 shl 6;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_DOWN = 1 shl 7;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_HOME = 1 shl 8;
    ADAP_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_END = 1 shl 9;
    ADAP_TAB_VIEW_SHORTCUT_ALT_DIGITS = 1 shl 10;
    ADAP_TAB_VIEW_SHORTCUT_ALT_ZERO = 1 shl 11;
    ADAP_TAB_VIEW_SHORTCUT_ALL_SHORTCUTS = $FFF;
;

{G_DECLARE_FINAL_TYPE (AdapTabPage, adap_tab_page, ADAP, TAB_PAGE, GObject) }
function adap_tab_page_get_child(self:PAdapTabPage):PGtkWidget;cdecl;external libadapta;
function adap_tab_page_get_parent(self:PAdapTabPage):PAdapTabPage;cdecl;external libadapta;
function adap_tab_page_get_selected(self:PAdapTabPage):Tgboolean;cdecl;external libadapta;
function adap_tab_page_get_pinned(self:PAdapTabPage):Tgboolean;cdecl;external libadapta;
function adap_tab_page_get_title(self:PAdapTabPage):Pchar;cdecl;external libadapta;
procedure adap_tab_page_set_title(self:PAdapTabPage; title:Pchar);cdecl;external libadapta;
function adap_tab_page_get_tooltip(self:PAdapTabPage):Pchar;cdecl;external libadapta;
procedure adap_tab_page_set_tooltip(self:PAdapTabPage; tooltip:Pchar);cdecl;external libadapta;
function adap_tab_page_get_icon(self:PAdapTabPage):PGIcon;cdecl;external libadapta;
procedure adap_tab_page_set_icon(self:PAdapTabPage; icon:PGIcon);cdecl;external libadapta;
function adap_tab_page_get_loading(self:PAdapTabPage):Tgboolean;cdecl;external libadapta;
procedure adap_tab_page_set_loading(self:PAdapTabPage; loading:Tgboolean);cdecl;external libadapta;
function adap_tab_page_get_indicator_icon(self:PAdapTabPage):PGIcon;cdecl;external libadapta;
procedure adap_tab_page_set_indicator_icon(self:PAdapTabPage; indicator_icon:PGIcon);cdecl;external libadapta;
function adap_tab_page_get_indicator_tooltip(self:PAdapTabPage):Pchar;cdecl;external libadapta;
procedure adap_tab_page_set_indicator_tooltip(self:PAdapTabPage; tooltip:Pchar);cdecl;external libadapta;
function adap_tab_page_get_indicator_activatable(self:PAdapTabPage):Tgboolean;cdecl;external libadapta;
procedure adap_tab_page_set_indicator_activatable(self:PAdapTabPage; activatable:Tgboolean);cdecl;external libadapta;
function adap_tab_page_get_needs_attention(self:PAdapTabPage):Tgboolean;cdecl;external libadapta;
procedure adap_tab_page_set_needs_attention(self:PAdapTabPage; needs_attention:Tgboolean);cdecl;external libadapta;
function adap_tab_page_get_keyword(self:PAdapTabPage):Pchar;cdecl;external libadapta;
procedure adap_tab_page_set_keyword(self:PAdapTabPage; keyword:Pchar);cdecl;external libadapta;
function adap_tab_page_get_thumbnail_xalign(self:PAdapTabPage):single;cdecl;external libadapta;
procedure adap_tab_page_set_thumbnail_xalign(self:PAdapTabPage; xalign:single);cdecl;external libadapta;
function adap_tab_page_get_thumbnail_yalign(self:PAdapTabPage):single;cdecl;external libadapta;
procedure adap_tab_page_set_thumbnail_yalign(self:PAdapTabPage; yalign:single);cdecl;external libadapta;
function adap_tab_page_get_live_thumbnail(self:PAdapTabPage):Tgboolean;cdecl;external libadapta;
procedure adap_tab_page_set_live_thumbnail(self:PAdapTabPage; live_thumbnail:Tgboolean);cdecl;external libadapta;
procedure adap_tab_page_invalidate_thumbnail(self:PAdapTabPage);cdecl;external libadapta;
{ was #define dname def_expr }
function ADAP_TYPE_TAB_VIEW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapTabView, adap_tab_view, ADAP, TAB_VIEW, GtkWidget) }
function adap_tab_view_new:PAdapTabView;cdecl;external libadapta;
function adap_tab_view_get_n_pages(self:PAdapTabView):longint;cdecl;external libadapta;
function adap_tab_view_get_n_pinned_pages(self:PAdapTabView):longint;cdecl;external libadapta;
function adap_tab_view_get_is_transferring_page(self:PAdapTabView):Tgboolean;cdecl;external libadapta;
function adap_tab_view_get_selected_page(self:PAdapTabView):PAdapTabPage;cdecl;external libadapta;
procedure adap_tab_view_set_selected_page(self:PAdapTabView; selected_page:PAdapTabPage);cdecl;external libadapta;
function adap_tab_view_select_previous_page(self:PAdapTabView):Tgboolean;cdecl;external libadapta;
function adap_tab_view_select_next_page(self:PAdapTabView):Tgboolean;cdecl;external libadapta;
function adap_tab_view_get_default_icon(self:PAdapTabView):PGIcon;cdecl;external libadapta;
procedure adap_tab_view_set_default_icon(self:PAdapTabView; default_icon:PGIcon);cdecl;external libadapta;
function adap_tab_view_get_menu_model(self:PAdapTabView):PGMenuModel;cdecl;external libadapta;
procedure adap_tab_view_set_menu_model(self:PAdapTabView; menu_model:PGMenuModel);cdecl;external libadapta;
function adap_tab_view_get_shortcuts(self:PAdapTabView):TAdapTabViewShortcuts;cdecl;external libadapta;
procedure adap_tab_view_set_shortcuts(self:PAdapTabView; shortcuts:TAdapTabViewShortcuts);cdecl;external libadapta;
procedure adap_tab_view_add_shortcuts(self:PAdapTabView; shortcuts:TAdapTabViewShortcuts);cdecl;external libadapta;
procedure adap_tab_view_remove_shortcuts(self:PAdapTabView; shortcuts:TAdapTabViewShortcuts);cdecl;external libadapta;
procedure adap_tab_view_set_page_pinned(self:PAdapTabView; page:PAdapTabPage; pinned:Tgboolean);cdecl;external libadapta;
function adap_tab_view_get_page(self:PAdapTabView; child:PGtkWidget):PAdapTabPage;cdecl;external libadapta;
function adap_tab_view_get_nth_page(self:PAdapTabView; position:longint):PAdapTabPage;cdecl;external libadapta;
function adap_tab_view_get_page_position(self:PAdapTabView; page:PAdapTabPage):longint;cdecl;external libadapta;
function adap_tab_view_add_page(self:PAdapTabView; child:PGtkWidget; parent:PAdapTabPage):PAdapTabPage;cdecl;external libadapta;
function adap_tab_view_insert(self:PAdapTabView; child:PGtkWidget; position:longint):PAdapTabPage;cdecl;external libadapta;
function adap_tab_view_prepend(self:PAdapTabView; child:PGtkWidget):PAdapTabPage;cdecl;external libadapta;
function adap_tab_view_append(self:PAdapTabView; child:PGtkWidget):PAdapTabPage;cdecl;external libadapta;
function adap_tab_view_insert_pinned(self:PAdapTabView; child:PGtkWidget; position:longint):PAdapTabPage;cdecl;external libadapta;
function adap_tab_view_prepend_pinned(self:PAdapTabView; child:PGtkWidget):PAdapTabPage;cdecl;external libadapta;
function adap_tab_view_append_pinned(self:PAdapTabView; child:PGtkWidget):PAdapTabPage;cdecl;external libadapta;
procedure adap_tab_view_close_page(self:PAdapTabView; page:PAdapTabPage);cdecl;external libadapta;
procedure adap_tab_view_close_page_finish(self:PAdapTabView; page:PAdapTabPage; confirm:Tgboolean);cdecl;external libadapta;
procedure adap_tab_view_close_other_pages(self:PAdapTabView; page:PAdapTabPage);cdecl;external libadapta;
procedure adap_tab_view_close_pages_before(self:PAdapTabView; page:PAdapTabPage);cdecl;external libadapta;
procedure adap_tab_view_close_pages_after(self:PAdapTabView; page:PAdapTabPage);cdecl;external libadapta;
function adap_tab_view_reorder_page(self:PAdapTabView; page:PAdapTabPage; position:longint):Tgboolean;cdecl;external libadapta;
function adap_tab_view_reorder_backward(self:PAdapTabView; page:PAdapTabPage):Tgboolean;cdecl;external libadapta;
function adap_tab_view_reorder_forward(self:PAdapTabView; page:PAdapTabPage):Tgboolean;cdecl;external libadapta;
function adap_tab_view_reorder_first(self:PAdapTabView; page:PAdapTabPage):Tgboolean;cdecl;external libadapta;
function adap_tab_view_reorder_last(self:PAdapTabView; page:PAdapTabPage):Tgboolean;cdecl;external libadapta;
procedure adap_tab_view_transfer_page(self:PAdapTabView; page:PAdapTabPage; other_view:PAdapTabView; position:longint);cdecl;external libadapta;
function adap_tab_view_get_pages(self:PAdapTabView):PGtkSelectionModel;cdecl;external libadapta;
procedure adap_tab_view_invalidate_thumbnails(self:PAdapTabView);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:50 ===

function ADAP_TYPE_TAB_PAGE: TGType;
function ADAP_TAB_PAGE(obj: Pointer): PAdapTabPage;
function ADAP_IS_TAB_PAGE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TAB_PAGE: TGType;
begin
  Result := adap_tab_page_get_type;
end;

function ADAP_TAB_PAGE(obj: Pointer): PAdapTabPage;
begin
  Result := PAdapTabPage(g_type_check_instance_cast(obj, ADAP_TYPE_TAB_PAGE));
end;

function ADAP_IS_TAB_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TAB_PAGE);
end;

type 
  TAdapTabPage = record
  end;
  PAdapTabPage = ^TAdapTabPage;

  TAdapTabPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdapTabPageClass = ^TAdapTabPageClass;

function adap_tab_page_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function ADAP_TYPE_TAB_VIEW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_TAB_VIEW:=adap_tab_view_get_type;
  end;


end.
