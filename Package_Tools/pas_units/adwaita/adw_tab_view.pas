unit adw_tab_view;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PAdwTabViewShortcuts = ^TAdwTabViewShortcuts;
  TAdwTabViewShortcuts = longint;

const
  ADW_TAB_VIEW_SHORTCUT_NONE = 0;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_TAB = 1 shl 0;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_TAB = 1 shl 1;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_PAGE_UP = 1 shl 2;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_PAGE_DOWN = 1 shl 3;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_HOME = 1 shl 4;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_END = 1 shl 5;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_UP = 1 shl 6;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_DOWN = 1 shl 7;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_HOME = 1 shl 8;
  ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_END = 1 shl 9;
  ADW_TAB_VIEW_SHORTCUT_ALT_DIGITS = 1 shl 10;
  ADW_TAB_VIEW_SHORTCUT_ALT_ZERO = 1 shl 11;
  ADW_TAB_VIEW_SHORTCUT_ALL_SHORTCUTS = $FFF;


  {G_DECLARE_FINAL_TYPE (AdwTabPage, adw_tab_page, ADW, TAB_PAGE, GObject) }
type
  TAdwTabPage = record
  end;
  PAdwTabPage = ^TAdwTabPage;

  TAdwTabPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdwTabPageClass = ^TAdwTabPageClass;

function adw_tab_page_get_type: TGType; cdecl; external libadwaita;
function adw_tab_page_get_child(self: PAdwTabPage): PGtkWidget; cdecl; external libadwaita;
function adw_tab_page_get_parent(self: PAdwTabPage): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_page_get_selected(self: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
function adw_tab_page_get_pinned(self: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
function adw_tab_page_get_title(self: PAdwTabPage): pchar; cdecl; external libadwaita;
procedure adw_tab_page_set_title(self: PAdwTabPage; title: pchar); cdecl; external libadwaita;
function adw_tab_page_get_tooltip(self: PAdwTabPage): pchar; cdecl; external libadwaita;
procedure adw_tab_page_set_tooltip(self: PAdwTabPage; tooltip: pchar); cdecl; external libadwaita;
function adw_tab_page_get_icon(self: PAdwTabPage): PGIcon; cdecl; external libadwaita;
procedure adw_tab_page_set_icon(self: PAdwTabPage; icon: PGIcon); cdecl; external libadwaita;
function adw_tab_page_get_loading(self: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_page_set_loading(self: PAdwTabPage; loading: Tgboolean); cdecl; external libadwaita;
function adw_tab_page_get_indicator_icon(self: PAdwTabPage): PGIcon; cdecl; external libadwaita;
procedure adw_tab_page_set_indicator_icon(self: PAdwTabPage; indicator_icon: PGIcon); cdecl; external libadwaita;
function adw_tab_page_get_indicator_tooltip(self: PAdwTabPage): pchar; cdecl; external libadwaita;
procedure adw_tab_page_set_indicator_tooltip(self: PAdwTabPage; tooltip: pchar); cdecl; external libadwaita;
function adw_tab_page_get_indicator_activatable(self: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_page_set_indicator_activatable(self: PAdwTabPage; activatable: Tgboolean); cdecl; external libadwaita;
function adw_tab_page_get_needs_attention(self: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_page_set_needs_attention(self: PAdwTabPage; needs_attention: Tgboolean); cdecl; external libadwaita;
function adw_tab_page_get_keyword(self: PAdwTabPage): pchar; cdecl; external libadwaita;
procedure adw_tab_page_set_keyword(self: PAdwTabPage; keyword: pchar); cdecl; external libadwaita;
function adw_tab_page_get_thumbnail_xalign(self: PAdwTabPage): single; cdecl; external libadwaita;
procedure adw_tab_page_set_thumbnail_xalign(self: PAdwTabPage; xalign: single); cdecl; external libadwaita;
function adw_tab_page_get_thumbnail_yalign(self: PAdwTabPage): single; cdecl; external libadwaita;
procedure adw_tab_page_set_thumbnail_yalign(self: PAdwTabPage; yalign: single); cdecl; external libadwaita;
function adw_tab_page_get_live_thumbnail(self: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_page_set_live_thumbnail(self: PAdwTabPage; live_thumbnail: Tgboolean); cdecl; external libadwaita;
procedure adw_tab_page_invalidate_thumbnail(self: PAdwTabPage); cdecl; external libadwaita;

{G_DECLARE_FINAL_TYPE (AdwTabView, adw_tab_view, ADW, TAB_VIEW, GtkWidget) }
type
  TAdwTabView = record
  end;
  PAdwTabView = ^TAdwTabView;

  TAdwTabViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwTabViewClass = ^TAdwTabViewClass;

function adw_tab_view_get_type: TGType; cdecl; external libadwaita;
function adw_tab_view_new: PAdwTabView; cdecl; external libadwaita;
function adw_tab_view_get_n_pages(self: PAdwTabView): longint; cdecl; external libadwaita;
function adw_tab_view_get_n_pinned_pages(self: PAdwTabView): longint; cdecl; external libadwaita;
function adw_tab_view_get_is_transferring_page(self: PAdwTabView): Tgboolean; cdecl; external libadwaita;
function adw_tab_view_get_selected_page(self: PAdwTabView): PAdwTabPage; cdecl; external libadwaita;
procedure adw_tab_view_set_selected_page(self: PAdwTabView; selected_page: PAdwTabPage); cdecl; external libadwaita;
function adw_tab_view_select_previous_page(self: PAdwTabView): Tgboolean; cdecl; external libadwaita;
function adw_tab_view_select_next_page(self: PAdwTabView): Tgboolean; cdecl; external libadwaita;
function adw_tab_view_get_default_icon(self: PAdwTabView): PGIcon; cdecl; external libadwaita;
procedure adw_tab_view_set_default_icon(self: PAdwTabView; default_icon: PGIcon); cdecl; external libadwaita;
function adw_tab_view_get_menu_model(self: PAdwTabView): PGMenuModel; cdecl; external libadwaita;
procedure adw_tab_view_set_menu_model(self: PAdwTabView; menu_model: PGMenuModel); cdecl; external libadwaita;
function adw_tab_view_get_shortcuts(self: PAdwTabView): TAdwTabViewShortcuts; cdecl; external libadwaita;
procedure adw_tab_view_set_shortcuts(self: PAdwTabView; shortcuts: TAdwTabViewShortcuts); cdecl; external libadwaita;
procedure adw_tab_view_add_shortcuts(self: PAdwTabView; shortcuts: TAdwTabViewShortcuts); cdecl; external libadwaita;
procedure adw_tab_view_remove_shortcuts(self: PAdwTabView; shortcuts: TAdwTabViewShortcuts); cdecl; external libadwaita;
procedure adw_tab_view_set_page_pinned(self: PAdwTabView; page: PAdwTabPage; pinned: Tgboolean); cdecl; external libadwaita;
function adw_tab_view_get_page(self: PAdwTabView; child: PGtkWidget): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_view_get_nth_page(self: PAdwTabView; position: longint): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_view_get_page_position(self: PAdwTabView; page: PAdwTabPage): longint; cdecl; external libadwaita;
function adw_tab_view_add_page(self: PAdwTabView; child: PGtkWidget; parent: PAdwTabPage): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_view_insert(self: PAdwTabView; child: PGtkWidget; position: longint): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_view_prepend(self: PAdwTabView; child: PGtkWidget): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_view_append(self: PAdwTabView; child: PGtkWidget): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_view_insert_pinned(self: PAdwTabView; child: PGtkWidget; position: longint): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_view_prepend_pinned(self: PAdwTabView; child: PGtkWidget): PAdwTabPage; cdecl; external libadwaita;
function adw_tab_view_append_pinned(self: PAdwTabView; child: PGtkWidget): PAdwTabPage; cdecl; external libadwaita;
procedure adw_tab_view_close_page(self: PAdwTabView; page: PAdwTabPage); cdecl; external libadwaita;
procedure adw_tab_view_close_page_finish(self: PAdwTabView; page: PAdwTabPage; confirm: Tgboolean); cdecl; external libadwaita;
procedure adw_tab_view_close_other_pages(self: PAdwTabView; page: PAdwTabPage); cdecl; external libadwaita;
procedure adw_tab_view_close_pages_before(self: PAdwTabView; page: PAdwTabPage); cdecl; external libadwaita;
procedure adw_tab_view_close_pages_after(self: PAdwTabView; page: PAdwTabPage); cdecl; external libadwaita;
function adw_tab_view_reorder_page(self: PAdwTabView; page: PAdwTabPage; position: longint): Tgboolean; cdecl; external libadwaita;
function adw_tab_view_reorder_backward(self: PAdwTabView; page: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
function adw_tab_view_reorder_forward(self: PAdwTabView; page: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
function adw_tab_view_reorder_first(self: PAdwTabView; page: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
function adw_tab_view_reorder_last(self: PAdwTabView; page: PAdwTabPage): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_view_transfer_page(self: PAdwTabView; page: PAdwTabPage; other_view: PAdwTabView; position: longint); cdecl; external libadwaita;
function adw_tab_view_get_pages(self: PAdwTabView): PGtkSelectionModel; cdecl; external libadwaita;
procedure adw_tab_view_invalidate_thumbnails(self: PAdwTabView); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 17:43:41 ===

function ADW_TYPE_TAB_PAGE: TGType;
function ADW_TAB_PAGE(obj: Pointer): PAdwTabPage;
function ADW_IS_TAB_PAGE(obj: Pointer): Tgboolean;

function ADW_TYPE_TAB_VIEW: TGType;
function ADW_TAB_VIEW(obj: Pointer): PAdwTabView;
function ADW_IS_TAB_VIEW(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_TAB_PAGE: TGType;
begin
  Result := adw_tab_page_get_type;
end;

function ADW_TAB_PAGE(obj: Pointer): PAdwTabPage;
begin
  Result := PAdwTabPage(g_type_check_instance_cast(obj, ADW_TYPE_TAB_PAGE));
end;

function ADW_IS_TAB_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TAB_PAGE);
end;

// ====

function ADW_TYPE_TAB_VIEW: TGType;
begin
  Result := adw_tab_view_get_type;
end;

function ADW_TAB_VIEW(obj: Pointer): PAdwTabView;
begin
  Result := PAdwTabView(g_type_check_instance_cast(obj, ADW_TYPE_TAB_VIEW));
end;

function ADW_IS_TAB_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TAB_VIEW);
end;

end.
