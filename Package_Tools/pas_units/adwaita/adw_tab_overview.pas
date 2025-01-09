unit adw_tab_overview;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4, adw_tab_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwTabOverview, adw_tab_overview, ADW, TAB_OVERVIEW, GtkWidget) }
type
  TAdwTabOverview = record
  end;
  PAdwTabOverview = ^TAdwTabOverview;

  TAdwTabOverviewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwTabOverviewClass = ^TAdwTabOverviewClass;

function adw_tab_overview_get_type: TGType; cdecl; external libadwaita;
function adw_tab_overview_new: PGtkWidget; cdecl; external libadwaita;
function adw_tab_overview_get_view(self: PAdwTabOverview): PAdwTabView; cdecl; external libadwaita;
procedure adw_tab_overview_set_view(self: PAdwTabOverview; view: PAdwTabView); cdecl; external libadwaita;
function adw_tab_overview_get_child(self: PAdwTabOverview): PGtkWidget; cdecl; external libadwaita;
procedure adw_tab_overview_set_child(self: PAdwTabOverview; child: PGtkWidget); cdecl; external libadwaita;
function adw_tab_overview_get_open(self: PAdwTabOverview): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_overview_set_open(self: PAdwTabOverview; Open: Tgboolean); cdecl; external libadwaita;
function adw_tab_overview_get_inverted(self: PAdwTabOverview): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_overview_set_inverted(self: PAdwTabOverview; inverted: Tgboolean); cdecl; external libadwaita;
function adw_tab_overview_get_enable_search(self: PAdwTabOverview): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_overview_set_enable_search(self: PAdwTabOverview; enable_search: Tgboolean); cdecl; external libadwaita;
function adw_tab_overview_get_search_active(self: PAdwTabOverview): Tgboolean; cdecl; external libadwaita;
function adw_tab_overview_get_enable_new_tab(self: PAdwTabOverview): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_overview_set_enable_new_tab(self: PAdwTabOverview; enable_new_tab: Tgboolean); cdecl; external libadwaita;
function adw_tab_overview_get_secondary_menu(self: PAdwTabOverview): PGMenuModel; cdecl; external libadwaita;
procedure adw_tab_overview_set_secondary_menu(self: PAdwTabOverview; secondary_menu: PGMenuModel); cdecl; external libadwaita;
function adw_tab_overview_get_show_start_title_buttons(self: PAdwTabOverview): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_overview_set_show_start_title_buttons(self: PAdwTabOverview; show_start_title_buttons: Tgboolean); cdecl; external libadwaita;
function adw_tab_overview_get_show_end_title_buttons(self: PAdwTabOverview): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_overview_set_show_end_title_buttons(self: PAdwTabOverview; show_end_title_buttons: Tgboolean); cdecl; external libadwaita;
procedure adw_tab_overview_setup_extra_drop_target(self: PAdwTabOverview; actions: TGdkDragAction; types: PGType; n_types: Tgsize); cdecl; external libadwaita;
function adw_tab_overview_get_extra_drag_preferred_action(self: PAdwTabOverview): TGdkDragAction; cdecl; external libadwaita;
function adw_tab_overview_get_extra_drag_preload(self: PAdwTabOverview): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_overview_set_extra_drag_preload(self: PAdwTabOverview; preload: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:46:34 ===

function ADW_TYPE_TAB_OVERVIEW: TGType;
function ADW_TAB_OVERVIEW(obj: Pointer): PAdwTabOverview;
function ADW_IS_TAB_OVERVIEW(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_TAB_OVERVIEW: TGType;
begin
  Result := adw_tab_overview_get_type;
end;

function ADW_TAB_OVERVIEW(obj: Pointer): PAdwTabOverview;
begin
  Result := PAdwTabOverview(g_type_check_instance_cast(obj, ADW_TYPE_TAB_OVERVIEW));
end;

function ADW_IS_TAB_OVERVIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TAB_OVERVIEW);
end;


end.
