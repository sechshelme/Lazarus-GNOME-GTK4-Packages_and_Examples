{$IFDEF read_interface}


{G_DECLARE_FINAL_TYPE (AdwNavigationSplitView, adw_navigation_split_view, ADW, NAVIGATION_SPLIT_VIEW, GtkWidget) }
type
  TAdwNavigationSplitView = record
  end;
  PAdwNavigationSplitView = ^TAdwNavigationSplitView;

  TAdwNavigationSplitViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwNavigationSplitViewClass = ^TAdwNavigationSplitViewClass;

function adw_navigation_split_view_get_type: TGType; cdecl; external libadwaita;
function adw_navigation_split_view_new:PGtkWidget;cdecl;external libadwaita;
function adw_navigation_split_view_get_sidebar(self:PAdwNavigationSplitView):PAdwNavigationPage;cdecl;external libadwaita;
procedure adw_navigation_split_view_set_sidebar(self:PAdwNavigationSplitView; sidebar:PAdwNavigationPage);cdecl;external libadwaita;
function adw_navigation_split_view_get_content(self:PAdwNavigationSplitView):PAdwNavigationPage;cdecl;external libadwaita;
procedure adw_navigation_split_view_set_content(self:PAdwNavigationSplitView; content:PAdwNavigationPage);cdecl;external libadwaita;
function adw_navigation_split_view_get_collapsed(self:PAdwNavigationSplitView):Tgboolean;cdecl;external libadwaita;
procedure adw_navigation_split_view_set_collapsed(self:PAdwNavigationSplitView; collapsed:Tgboolean);cdecl;external libadwaita;
function adw_navigation_split_view_get_show_content(self:PAdwNavigationSplitView):Tgboolean;cdecl;external libadwaita;
procedure adw_navigation_split_view_set_show_content(self:PAdwNavigationSplitView; show_content:Tgboolean);cdecl;external libadwaita;
function adw_navigation_split_view_get_min_sidebar_width(self:PAdwNavigationSplitView):Tdouble;cdecl;external libadwaita;
procedure adw_navigation_split_view_set_min_sidebar_width(self:PAdwNavigationSplitView; width:Tdouble);cdecl;external libadwaita;
function adw_navigation_split_view_get_max_sidebar_width(self:PAdwNavigationSplitView):Tdouble;cdecl;external libadwaita;
procedure adw_navigation_split_view_set_max_sidebar_width(self:PAdwNavigationSplitView; width:Tdouble);cdecl;external libadwaita;
function adw_navigation_split_view_get_sidebar_width_fraction(self:PAdwNavigationSplitView):Tdouble;cdecl;external libadwaita;
procedure adw_navigation_split_view_set_sidebar_width_fraction(self:PAdwNavigationSplitView; fraction:Tdouble);cdecl;external libadwaita;
function adw_navigation_split_view_get_sidebar_width_unit(self:PAdwNavigationSplitView):TAdwLengthUnit;cdecl;external libadwaita;
procedure adw_navigation_split_view_set_sidebar_width_unit(self:PAdwNavigationSplitView; unit_:TAdwLengthUnit);cdecl;external libadwaita;

// === Konventiert am: 9-1-25 19:57:25 ===

function ADW_TYPE_NAVIGATION_SPLIT_VIEW: TGType;
function ADW_NAVIGATION_SPLIT_VIEW(obj: Pointer): PAdwNavigationSplitView;
function ADW_IS_NAVIGATION_SPLIT_VIEW(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_NAVIGATION_SPLIT_VIEW: TGType;
begin
  Result := adw_navigation_split_view_get_type;
end;

function ADW_NAVIGATION_SPLIT_VIEW(obj: Pointer): PAdwNavigationSplitView;
begin
  Result := PAdwNavigationSplitView(g_type_check_instance_cast(obj, ADW_TYPE_NAVIGATION_SPLIT_VIEW));
end;

function ADW_IS_NAVIGATION_SPLIT_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_NAVIGATION_SPLIT_VIEW);
end;


{$ENDIF read_implementation}
