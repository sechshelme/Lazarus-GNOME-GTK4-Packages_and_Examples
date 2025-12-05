{$IFDEF read_interface}

type
  TAdapLeafletPage = record
  end;
  PAdapLeafletPage = ^TAdapLeafletPage;

  TAdapLeafletPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdapLeafletPageClass = ^TAdapLeafletPageClass;

function adap_leaflet_page_get_type: TGType; cdecl; external libadapta; deprecated;
function adap_leaflet_page_get_child(self: PAdapLeafletPage): PGtkWidget; cdecl; external libadapta; deprecated;
function adap_leaflet_page_get_name(self: PAdapLeafletPage): pchar; cdecl; external libadapta; deprecated;
procedure adap_leaflet_page_set_name(self: PAdapLeafletPage; name: pchar); cdecl; external libadapta; deprecated;
function adap_leaflet_page_get_navigatable(self: PAdapLeafletPage): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_leaflet_page_set_navigatable(self: PAdapLeafletPage; navigatable: Tgboolean); cdecl; external libadapta; deprecated;

type
  PAdapLeafletTransitionType = ^TAdapLeafletTransitionType;
  TAdapLeafletTransitionType = longint;

const
  ADAP_LEAFLET_TRANSITION_TYPE_OVER = 0;
  ADAP_LEAFLET_TRANSITION_TYPE_UNDER = 1;
  ADAP_LEAFLET_TRANSITION_TYPE_SLIDE = 2;

type
  TAdapLeaflet = record
  end;
  PAdapLeaflet = ^TAdapLeaflet;

  TAdapLeafletClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapLeafletClass = ^TAdapLeafletClass;

function adap_leaflet_get_type: TGType; cdecl; external libadapta; deprecated;
function adap_leaflet_new: PGtkWidget; cdecl; external libadapta; deprecated;
function adap_leaflet_append(self: PAdapLeaflet; child: PGtkWidget): PAdapLeafletPage; cdecl; external libadapta; deprecated;
function adap_leaflet_prepend(self: PAdapLeaflet; child: PGtkWidget): PAdapLeafletPage; cdecl; external libadapta; deprecated;
function adap_leaflet_insert_child_after(self: PAdapLeaflet; child: PGtkWidget; sibling: PGtkWidget): PAdapLeafletPage; cdecl; external libadapta; deprecated;
procedure adap_leaflet_reorder_child_after(self: PAdapLeaflet; child: PGtkWidget; sibling: PGtkWidget); cdecl; external libadapta; deprecated;
procedure adap_leaflet_remove(self: PAdapLeaflet; child: PGtkWidget); cdecl; external libadapta; deprecated;
function adap_leaflet_get_page(self: PAdapLeaflet; child: PGtkWidget): PAdapLeafletPage; cdecl; external libadapta; deprecated;
function adap_leaflet_get_can_unfold(self: PAdapLeaflet): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_can_unfold(self: PAdapLeaflet; can_unfold: Tgboolean); cdecl; external libadapta; deprecated;
function adap_leaflet_get_folded(self: PAdapLeaflet): Tgboolean; cdecl; external libadapta; deprecated;
function adap_leaflet_get_fold_threshold_policy(self: PAdapLeaflet): TAdapFoldThresholdPolicy; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_fold_threshold_policy(self: PAdapLeaflet; policy: TAdapFoldThresholdPolicy); cdecl; external libadapta; deprecated;
function adap_leaflet_get_homogeneous(self: PAdapLeaflet): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_homogeneous(self: PAdapLeaflet; homogeneous: Tgboolean); cdecl; external libadapta; deprecated;
function adap_leaflet_get_visible_child(self: PAdapLeaflet): PGtkWidget; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_visible_child(self: PAdapLeaflet; visible_child: PGtkWidget); cdecl; external libadapta; deprecated;
function adap_leaflet_get_visible_child_name(self: PAdapLeaflet): pchar; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_visible_child_name(self: PAdapLeaflet; name: pchar); cdecl; external libadapta; deprecated;
function adap_leaflet_get_transition_type(self: PAdapLeaflet): TAdapLeafletTransitionType; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_transition_type(self: PAdapLeaflet; transition: TAdapLeafletTransitionType); cdecl; external libadapta; deprecated;
function adap_leaflet_get_mode_transition_duration(self: PAdapLeaflet): Tguint; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_mode_transition_duration(self: PAdapLeaflet; duration: Tguint); cdecl; external libadapta; deprecated;
function adap_leaflet_get_child_transition_params(self: PAdapLeaflet): PAdapSpringParams; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_child_transition_params(self: PAdapLeaflet; params: PAdapSpringParams); cdecl; external libadapta; deprecated;
function adap_leaflet_get_child_transition_running(self: PAdapLeaflet): Tgboolean; cdecl; external libadapta; deprecated;
function adap_leaflet_get_can_navigate_back(self: PAdapLeaflet): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_can_navigate_back(self: PAdapLeaflet; can_navigate_back: Tgboolean); cdecl; external libadapta; deprecated;
function adap_leaflet_get_can_navigate_forward(self: PAdapLeaflet): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_leaflet_set_can_navigate_forward(self: PAdapLeaflet; can_navigate_forward: Tgboolean); cdecl; external libadapta; deprecated;
function adap_leaflet_get_adjacent_child(self: PAdapLeaflet; direction: TAdapNavigationDirection): PGtkWidget; cdecl; external libadapta; deprecated;
function adap_leaflet_navigate(self: PAdapLeaflet; direction: TAdapNavigationDirection): Tgboolean; cdecl; external libadapta; deprecated;
function adap_leaflet_get_child_by_name(self: PAdapLeaflet; name: pchar): PGtkWidget; cdecl; external libadapta; deprecated;
function adap_leaflet_get_pages(self: PAdapLeaflet): PGtkSelectionModel; cdecl; external libadapta; deprecated;

// === Konventiert am: 4-12-25 17:08:45 ===

function ADAP_TYPE_LEAFLET_PAGE: TGType;
function ADAP_LEAFLET_PAGE(obj: Pointer): PAdapLeafletPage;
function ADAP_IS_LEAFLET_PAGE(obj: Pointer): Tgboolean;

function ADAP_TYPE_LEAFLET: TGType;
function ADAP_LEAFLET(obj: Pointer): PAdapLeaflet;
function ADAP_IS_LEAFLET(obj: Pointer): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_LEAFLET_PAGE: TGType;
begin
  Result := adap_leaflet_page_get_type;
end;

function ADAP_LEAFLET_PAGE(obj: Pointer): PAdapLeafletPage;
begin
  Result := PAdapLeafletPage(g_type_check_instance_cast(obj, ADAP_TYPE_LEAFLET_PAGE));
end;

function ADAP_IS_LEAFLET_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_LEAFLET_PAGE);
end;

// ====

function ADAP_TYPE_LEAFLET: TGType;
begin
  Result := adap_leaflet_get_type;
end;

function ADAP_LEAFLET(obj: Pointer): PAdapLeaflet;
begin
  Result := PAdapLeaflet(g_type_check_instance_cast(obj, ADAP_TYPE_LEAFLET));
end;

function ADAP_IS_LEAFLET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_LEAFLET);
end;

{$ENDIF read_implementation}
