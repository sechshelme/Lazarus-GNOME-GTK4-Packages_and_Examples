unit adap_tab_overview;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_tab_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapTabOverview = record
  end;
  PAdapTabOverview = ^TAdapTabOverview;

  TAdapTabOverviewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapTabOverviewClass = ^TAdapTabOverviewClass;

function adap_tab_overview_get_type: TGType; cdecl; external libadapta;
function adap_tab_overview_new: PGtkWidget; cdecl; external libadapta;
function adap_tab_overview_get_view(self: PAdapTabOverview): PAdapTabView; cdecl; external libadapta;
procedure adap_tab_overview_set_view(self: PAdapTabOverview; view: PAdapTabView); cdecl; external libadapta;
function adap_tab_overview_get_child(self: PAdapTabOverview): PGtkWidget; cdecl; external libadapta;
procedure adap_tab_overview_set_child(self: PAdapTabOverview; child: PGtkWidget); cdecl; external libadapta;
function adap_tab_overview_get_open(self: PAdapTabOverview): Tgboolean; cdecl; external libadapta;
procedure adap_tab_overview_set_open(self: PAdapTabOverview; open: Tgboolean); cdecl; external libadapta;
function adap_tab_overview_get_inverted(self: PAdapTabOverview): Tgboolean; cdecl; external libadapta;
procedure adap_tab_overview_set_inverted(self: PAdapTabOverview; inverted: Tgboolean); cdecl; external libadapta;
function adap_tab_overview_get_enable_search(self: PAdapTabOverview): Tgboolean; cdecl; external libadapta;
procedure adap_tab_overview_set_enable_search(self: PAdapTabOverview; enable_search: Tgboolean); cdecl; external libadapta;
function adap_tab_overview_get_search_active(self: PAdapTabOverview): Tgboolean; cdecl; external libadapta;
function adap_tab_overview_get_enable_new_tab(self: PAdapTabOverview): Tgboolean; cdecl; external libadapta;
procedure adap_tab_overview_set_enable_new_tab(self: PAdapTabOverview; enable_new_tab: Tgboolean); cdecl; external libadapta;
function adap_tab_overview_get_secondary_menu(self: PAdapTabOverview): PGMenuModel; cdecl; external libadapta;
procedure adap_tab_overview_set_secondary_menu(self: PAdapTabOverview; secondary_menu: PGMenuModel); cdecl; external libadapta;
function adap_tab_overview_get_show_start_title_buttons(self: PAdapTabOverview): Tgboolean; cdecl; external libadapta;
procedure adap_tab_overview_set_show_start_title_buttons(self: PAdapTabOverview; show_start_title_buttons: Tgboolean); cdecl; external libadapta;
function adap_tab_overview_get_show_end_title_buttons(self: PAdapTabOverview): Tgboolean; cdecl; external libadapta;
procedure adap_tab_overview_set_show_end_title_buttons(self: PAdapTabOverview; show_end_title_buttons: Tgboolean); cdecl; external libadapta;
procedure adap_tab_overview_setup_extra_drop_target(self: PAdapTabOverview; actions: TGdkDragAction; types: PGType; n_types: Tgsize); cdecl; external libadapta;
function adap_tab_overview_get_extra_drag_preferred_action(self: PAdapTabOverview): TGdkDragAction; cdecl; external libadapta;
function adap_tab_overview_get_extra_drag_preload(self: PAdapTabOverview): Tgboolean; cdecl; external libadapta;
procedure adap_tab_overview_set_extra_drag_preload(self: PAdapTabOverview; preload: Tgboolean); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:54 ===

function ADAP_TYPE_TAB_OVERVIEW: TGType;
function ADAP_TAB_OVERVIEW(obj: Pointer): PAdapTabOverview;
function ADAP_IS_TAB_OVERVIEW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TAB_OVERVIEW: TGType;
begin
  Result := adap_tab_overview_get_type;
end;

function ADAP_TAB_OVERVIEW(obj: Pointer): PAdapTabOverview;
begin
  Result := PAdapTabOverview(g_type_check_instance_cast(obj, ADAP_TYPE_TAB_OVERVIEW));
end;

function ADAP_IS_TAB_OVERVIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TAB_OVERVIEW);
end;


end.
