unit adw_tab_bar;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4, adw_tab_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwTabBar, adw_tab_bar, ADW, TAB_BAR, GtkWidget) }
type
  TAdwTabBar = record
  end;
  PAdwTabBar = ^TAdwTabBar;

  TAdwTabBarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwTabBarClass = ^TAdwTabBarClass;

function adw_tab_bar_get_type: TGType; cdecl; external libadwaita;
function adw_tab_bar_new: PAdwTabBar; cdecl; external libadwaita;
function adw_tab_bar_get_view(self: PAdwTabBar): PAdwTabView; cdecl; external libadwaita;
procedure adw_tab_bar_set_view(self: PAdwTabBar; view: PAdwTabView); cdecl; external libadwaita;
function adw_tab_bar_get_start_action_widget(self: PAdwTabBar): PGtkWidget; cdecl; external libadwaita;
procedure adw_tab_bar_set_start_action_widget(self: PAdwTabBar; widget: PGtkWidget); cdecl; external libadwaita;
function adw_tab_bar_get_end_action_widget(self: PAdwTabBar): PGtkWidget; cdecl; external libadwaita;
procedure adw_tab_bar_set_end_action_widget(self: PAdwTabBar; widget: PGtkWidget); cdecl; external libadwaita;
function adw_tab_bar_get_autohide(self: PAdwTabBar): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_bar_set_autohide(self: PAdwTabBar; autohide: Tgboolean); cdecl; external libadwaita;
function adw_tab_bar_get_tabs_revealed(self: PAdwTabBar): Tgboolean; cdecl; external libadwaita;
function adw_tab_bar_get_expand_tabs(self: PAdwTabBar): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_bar_set_expand_tabs(self: PAdwTabBar; expand_tabs: Tgboolean); cdecl; external libadwaita;
function adw_tab_bar_get_inverted(self: PAdwTabBar): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_bar_set_inverted(self: PAdwTabBar; inverted: Tgboolean); cdecl; external libadwaita;
procedure adw_tab_bar_setup_extra_drop_target(self: PAdwTabBar; actions: TGdkDragAction; types: PGType; n_types: Tgsize); cdecl; external libadwaita;
function adw_tab_bar_get_extra_drag_preferred_action(self: PAdwTabBar): TGdkDragAction; cdecl; external libadwaita;
function adw_tab_bar_get_extra_drag_preload(self: PAdwTabBar): Tgboolean; cdecl; external libadwaita;
procedure adw_tab_bar_set_extra_drag_preload(self: PAdwTabBar; preload: Tgboolean); cdecl; external libadwaita;
function adw_tab_bar_get_is_overflowing(self: PAdwTabBar): Tgboolean; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:43:25 ===

function ADW_TYPE_TAB_BAR: TGType;
function ADW_TAB_BAR(obj: Pointer): PAdwTabBar;
function ADW_IS_TAB_BAR(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_TAB_BAR: TGType;
begin
  Result := adw_tab_bar_get_type;
end;

function ADW_TAB_BAR(obj: Pointer): PAdwTabBar;
begin
  Result := PAdwTabBar(g_type_check_instance_cast(obj, ADW_TYPE_TAB_BAR));
end;

function ADW_IS_TAB_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TAB_BAR);
end;


end.
