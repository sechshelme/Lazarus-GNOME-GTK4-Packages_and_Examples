{$IFDEF read_interface}


type
  TAdapOverlaySplitView = record
  end;
  PAdapOverlaySplitView = ^TAdapOverlaySplitView;

  TAdapOverlaySplitViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapOverlaySplitViewClass = ^TAdapOverlaySplitViewClass;

function adap_overlay_split_view_get_type: TGType; cdecl; external libadapta;
function adap_overlay_split_view_new: PGtkWidget; cdecl; external libadapta;
function adap_overlay_split_view_get_sidebar(self: PAdapOverlaySplitView): PGtkWidget; cdecl; external libadapta;
procedure adap_overlay_split_view_set_sidebar(self: PAdapOverlaySplitView; sidebar: PGtkWidget); cdecl; external libadapta;
function adap_overlay_split_view_get_content(self: PAdapOverlaySplitView): PGtkWidget; cdecl; external libadapta;
procedure adap_overlay_split_view_set_content(self: PAdapOverlaySplitView; content: PGtkWidget); cdecl; external libadapta;
function adap_overlay_split_view_get_collapsed(self: PAdapOverlaySplitView): Tgboolean; cdecl; external libadapta;
procedure adap_overlay_split_view_set_collapsed(self: PAdapOverlaySplitView; collapsed: Tgboolean); cdecl; external libadapta;
function adap_overlay_split_view_get_sidebar_position(self: PAdapOverlaySplitView): TGtkPackType; cdecl; external libadapta;
procedure adap_overlay_split_view_set_sidebar_position(self: PAdapOverlaySplitView; position: TGtkPackType); cdecl; external libadapta;
function adap_overlay_split_view_get_show_sidebar(self: PAdapOverlaySplitView): Tgboolean; cdecl; external libadapta;
procedure adap_overlay_split_view_set_show_sidebar(self: PAdapOverlaySplitView; show_sidebar: Tgboolean); cdecl; external libadapta;
function adap_overlay_split_view_get_pin_sidebar(self: PAdapOverlaySplitView): Tgboolean; cdecl; external libadapta;
procedure adap_overlay_split_view_set_pin_sidebar(self: PAdapOverlaySplitView; pin_sidebar: Tgboolean); cdecl; external libadapta;
function adap_overlay_split_view_get_enable_show_gesture(self: PAdapOverlaySplitView): Tgboolean; cdecl; external libadapta;
procedure adap_overlay_split_view_set_enable_show_gesture(self: PAdapOverlaySplitView; enable_show_gesture: Tgboolean); cdecl; external libadapta;
function adap_overlay_split_view_get_enable_hide_gesture(self: PAdapOverlaySplitView): Tgboolean; cdecl; external libadapta;
procedure adap_overlay_split_view_set_enable_hide_gesture(self: PAdapOverlaySplitView; enable_hide_gesture: Tgboolean); cdecl; external libadapta;
function adap_overlay_split_view_get_min_sidebar_width(self: PAdapOverlaySplitView): double; cdecl; external libadapta;
procedure adap_overlay_split_view_set_min_sidebar_width(self: PAdapOverlaySplitView; width: double); cdecl; external libadapta;
function adap_overlay_split_view_get_max_sidebar_width(self: PAdapOverlaySplitView): double; cdecl; external libadapta;
procedure adap_overlay_split_view_set_max_sidebar_width(self: PAdapOverlaySplitView; width: double); cdecl; external libadapta;
function adap_overlay_split_view_get_sidebar_width_fraction(self: PAdapOverlaySplitView): double; cdecl; external libadapta;
procedure adap_overlay_split_view_set_sidebar_width_fraction(self: PAdapOverlaySplitView; fraction: double); cdecl; external libadapta;
function adap_overlay_split_view_get_sidebar_width_unit(self: PAdapOverlaySplitView): TAdapLengthUnit; cdecl; external libadapta;
procedure adap_overlay_split_view_set_sidebar_width_unit(self: PAdapOverlaySplitView; unit_: TAdapLengthUnit); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:19 ===

function ADAP_TYPE_OVERLAY_SPLIT_VIEW: TGType;
function ADAP_OVERLAY_SPLIT_VIEW(obj: Pointer): PAdapOverlaySplitView;
function ADAP_IS_OVERLAY_SPLIT_VIEW(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_OVERLAY_SPLIT_VIEW: TGType;
begin
  Result := adap_overlay_split_view_get_type;
end;

function ADAP_OVERLAY_SPLIT_VIEW(obj: Pointer): PAdapOverlaySplitView;
begin
  Result := PAdapOverlaySplitView(g_type_check_instance_cast(obj, ADAP_TYPE_OVERLAY_SPLIT_VIEW));
end;

function ADAP_IS_OVERLAY_SPLIT_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_OVERLAY_SPLIT_VIEW);
end;


{$ENDIF read_implementation}
