{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwOverlaySplitView, adw_overlay_split_view, ADW, OVERLAY_SPLIT_VIEW, GtkWidget) }
type
  TAdwOverlaySplitView = record
  end;
  PAdwOverlaySplitView = ^TAdwOverlaySplitView;

  TAdwOverlaySplitViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwOverlaySplitViewClass = ^TAdwOverlaySplitViewClass;

function adw_overlay_split_view_get_type: TGType; cdecl; external libadwaita;
function adw_overlay_split_view_new: PGtkWidget; cdecl; external libadwaita;
function adw_overlay_split_view_get_sidebar(self: PAdwOverlaySplitView): PGtkWidget; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_sidebar(self: PAdwOverlaySplitView; sidebar: PGtkWidget); cdecl; external libadwaita;
function adw_overlay_split_view_get_content(self: PAdwOverlaySplitView): PGtkWidget; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_content(self: PAdwOverlaySplitView; content: PGtkWidget); cdecl; external libadwaita;
function adw_overlay_split_view_get_collapsed(self: PAdwOverlaySplitView): Tgboolean; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_collapsed(self: PAdwOverlaySplitView; collapsed: Tgboolean); cdecl; external libadwaita;
function adw_overlay_split_view_get_sidebar_position(self: PAdwOverlaySplitView): TGtkPackType; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_sidebar_position(self: PAdwOverlaySplitView; position: TGtkPackType); cdecl; external libadwaita;
function adw_overlay_split_view_get_show_sidebar(self: PAdwOverlaySplitView): Tgboolean; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_show_sidebar(self: PAdwOverlaySplitView; show_sidebar: Tgboolean); cdecl; external libadwaita;
function adw_overlay_split_view_get_pin_sidebar(self: PAdwOverlaySplitView): Tgboolean; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_pin_sidebar(self: PAdwOverlaySplitView; pin_sidebar: Tgboolean); cdecl; external libadwaita;
function adw_overlay_split_view_get_enable_show_gesture(self: PAdwOverlaySplitView): Tgboolean; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_enable_show_gesture(self: PAdwOverlaySplitView; enable_show_gesture: Tgboolean); cdecl; external libadwaita;
function adw_overlay_split_view_get_enable_hide_gesture(self: PAdwOverlaySplitView): Tgboolean; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_enable_hide_gesture(self: PAdwOverlaySplitView; enable_hide_gesture: Tgboolean); cdecl; external libadwaita;
function adw_overlay_split_view_get_min_sidebar_width(self: PAdwOverlaySplitView): double; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_min_sidebar_width(self: PAdwOverlaySplitView; Width: double); cdecl; external libadwaita;
function adw_overlay_split_view_get_max_sidebar_width(self: PAdwOverlaySplitView): double; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_max_sidebar_width(self: PAdwOverlaySplitView; Width: double); cdecl; external libadwaita;
function adw_overlay_split_view_get_sidebar_width_fraction(self: PAdwOverlaySplitView): double; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_sidebar_width_fraction(self: PAdwOverlaySplitView; fraction: double); cdecl; external libadwaita;
function adw_overlay_split_view_get_sidebar_width_unit(self: PAdwOverlaySplitView): TAdwLengthUnit; cdecl; external libadwaita;
procedure adw_overlay_split_view_set_sidebar_width_unit(self: PAdwOverlaySplitView; unit_: TAdwLengthUnit); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:46:31 ===

function ADW_TYPE_OVERLAY_SPLIT_VIEW: TGType;
function ADW_OVERLAY_SPLIT_VIEW(obj: Pointer): PAdwOverlaySplitView;
function ADW_IS_OVERLAY_SPLIT_VIEW(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_OVERLAY_SPLIT_VIEW: TGType;
begin
  Result := adw_overlay_split_view_get_type;
end;

function ADW_OVERLAY_SPLIT_VIEW(obj: Pointer): PAdwOverlaySplitView;
begin
  Result := PAdwOverlaySplitView(g_type_check_instance_cast(obj, ADW_TYPE_OVERLAY_SPLIT_VIEW));
end;

function ADW_IS_OVERLAY_SPLIT_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_OVERLAY_SPLIT_VIEW);
end;


{$ENDIF read_implementation}
