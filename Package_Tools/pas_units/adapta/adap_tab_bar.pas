unit adap_tab_bar;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_tab_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapTabBar = record
  end;
  PAdapTabBar = ^TAdapTabBar;

  TAdapTabBarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapTabBarClass = ^TAdapTabBarClass;

function adap_tab_bar_get_type: TGType; cdecl; external libadapta;
function adap_tab_bar_new: PAdapTabBar; cdecl; external libadapta;
function adap_tab_bar_get_view(self: PAdapTabBar): PAdapTabView; cdecl; external libadapta;
procedure adap_tab_bar_set_view(self: PAdapTabBar; view: PAdapTabView); cdecl; external libadapta;
function adap_tab_bar_get_start_action_widget(self: PAdapTabBar): PGtkWidget; cdecl; external libadapta;
procedure adap_tab_bar_set_start_action_widget(self: PAdapTabBar; widget: PGtkWidget); cdecl; external libadapta;
function adap_tab_bar_get_end_action_widget(self: PAdapTabBar): PGtkWidget; cdecl; external libadapta;
procedure adap_tab_bar_set_end_action_widget(self: PAdapTabBar; widget: PGtkWidget); cdecl; external libadapta;
function adap_tab_bar_get_autohide(self: PAdapTabBar): Tgboolean; cdecl; external libadapta;
procedure adap_tab_bar_set_autohide(self: PAdapTabBar; autohide: Tgboolean); cdecl; external libadapta;
function adap_tab_bar_get_tabs_revealed(self: PAdapTabBar): Tgboolean; cdecl; external libadapta;
function adap_tab_bar_get_expand_tabs(self: PAdapTabBar): Tgboolean; cdecl; external libadapta;
procedure adap_tab_bar_set_expand_tabs(self: PAdapTabBar; expand_tabs: Tgboolean); cdecl; external libadapta;
function adap_tab_bar_get_inverted(self: PAdapTabBar): Tgboolean; cdecl; external libadapta;
procedure adap_tab_bar_set_inverted(self: PAdapTabBar; inverted: Tgboolean); cdecl; external libadapta;
procedure adap_tab_bar_setup_extra_drop_target(self: PAdapTabBar; actions: TGdkDragAction; types: PGType; n_types: Tgsize); cdecl; external libadapta;
function adap_tab_bar_get_extra_drag_preferred_action(self: PAdapTabBar): TGdkDragAction; cdecl; external libadapta;
function adap_tab_bar_get_extra_drag_preload(self: PAdapTabBar): Tgboolean; cdecl; external libadapta;
procedure adap_tab_bar_set_extra_drag_preload(self: PAdapTabBar; preload: Tgboolean); cdecl; external libadapta;
function adap_tab_bar_get_is_overflowing(self: PAdapTabBar): Tgboolean; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:59 ===

function ADAP_TYPE_TAB_BAR: TGType;
function ADAP_TAB_BAR(obj: Pointer): PAdapTabBar;
function ADAP_IS_TAB_BAR(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TAB_BAR: TGType;
begin
  Result := adap_tab_bar_get_type;
end;

function ADAP_TAB_BAR(obj: Pointer): PAdapTabBar;
begin
  Result := PAdapTabBar(g_type_check_instance_cast(obj, ADAP_TYPE_TAB_BAR));
end;

function ADAP_IS_TAB_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TAB_BAR);
end;


end.
