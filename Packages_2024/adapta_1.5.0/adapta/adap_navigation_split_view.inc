{$IFDEF read_interface}


type
  TAdapNavigationSplitView = record
  end;
  PAdapNavigationSplitView = ^TAdapNavigationSplitView;

  TAdapNavigationSplitViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapNavigationSplitViewClass = ^TAdapNavigationSplitViewClass;

function adap_navigation_split_view_get_type: TGType; cdecl; external libadapta;
function adap_navigation_split_view_new:PGtkWidget;cdecl;external libadapta;
function adap_navigation_split_view_get_sidebar(self:PAdapNavigationSplitView):PAdapNavigationPage;cdecl;external libadapta;
procedure adap_navigation_split_view_set_sidebar(self:PAdapNavigationSplitView; sidebar:PAdapNavigationPage);cdecl;external libadapta;
function adap_navigation_split_view_get_content(self:PAdapNavigationSplitView):PAdapNavigationPage;cdecl;external libadapta;
procedure adap_navigation_split_view_set_content(self:PAdapNavigationSplitView; content:PAdapNavigationPage);cdecl;external libadapta;
function adap_navigation_split_view_get_collapsed(self:PAdapNavigationSplitView):Tgboolean;cdecl;external libadapta;
procedure adap_navigation_split_view_set_collapsed(self:PAdapNavigationSplitView; collapsed:Tgboolean);cdecl;external libadapta;
function adap_navigation_split_view_get_show_content(self:PAdapNavigationSplitView):Tgboolean;cdecl;external libadapta;
procedure adap_navigation_split_view_set_show_content(self:PAdapNavigationSplitView; show_content:Tgboolean);cdecl;external libadapta;
function adap_navigation_split_view_get_min_sidebar_width(self:PAdapNavigationSplitView):double;cdecl;external libadapta;
procedure adap_navigation_split_view_set_min_sidebar_width(self:PAdapNavigationSplitView; width:double);cdecl;external libadapta;
function adap_navigation_split_view_get_max_sidebar_width(self:PAdapNavigationSplitView):double;cdecl;external libadapta;
procedure adap_navigation_split_view_set_max_sidebar_width(self:PAdapNavigationSplitView; width:double);cdecl;external libadapta;
function adap_navigation_split_view_get_sidebar_width_fraction(self:PAdapNavigationSplitView):double;cdecl;external libadapta;
procedure adap_navigation_split_view_set_sidebar_width_fraction(self:PAdapNavigationSplitView; fraction:double);cdecl;external libadapta;
function adap_navigation_split_view_get_sidebar_width_unit(self:PAdapNavigationSplitView):TAdapLengthUnit;cdecl;external libadapta;
procedure adap_navigation_split_view_set_sidebar_width_unit(self:PAdapNavigationSplitView; unit_:TAdapLengthUnit);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:13 ===

function ADAP_TYPE_NAVIGATION_SPLIT_VIEW: TGType;
function ADAP_NAVIGATION_SPLIT_VIEW(obj: Pointer): PAdapNavigationSplitView;
function ADAP_IS_NAVIGATION_SPLIT_VIEW(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_NAVIGATION_SPLIT_VIEW: TGType;
begin
  Result := adap_navigation_split_view_get_type;
end;

function ADAP_NAVIGATION_SPLIT_VIEW(obj: Pointer): PAdapNavigationSplitView;
begin
  Result := PAdapNavigationSplitView(g_type_check_instance_cast(obj, ADAP_TYPE_NAVIGATION_SPLIT_VIEW));
end;

function ADAP_IS_NAVIGATION_SPLIT_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_NAVIGATION_SPLIT_VIEW);
end;


{$ENDIF read_implementation}
