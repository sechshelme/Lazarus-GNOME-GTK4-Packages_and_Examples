{$IFDEF read_interface}

type
  PAdwToolbarStyle = ^TAdwToolbarStyle;
  TAdwToolbarStyle = longint;

const
  ADW_TOOLBAR_FLAT = 0;
  ADW_TOOLBAR_RAISED = 1;
  ADW_TOOLBAR_RAISED_BORDER = 2;

  {G_DECLARE_FINAL_TYPE (AdwToolbarView, adw_toolbar_view, ADW, TOOLBAR_VIEW, GtkWidget) }

type
  TAdwToolbarView = record
  end;
  PAdwToolbarView = ^TAdwToolbarView;

  TAdwToolbarViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwToolbarViewClass = ^TAdwToolbarViewClass;

function adw_toolbar_view_get_type: TGType; cdecl; external libadwaita;
function adw_toolbar_view_new: PGtkWidget; cdecl; external libadwaita;
function adw_toolbar_view_get_content(self: PAdwToolbarView): PGtkWidget; cdecl; external libadwaita;
procedure adw_toolbar_view_set_content(self: PAdwToolbarView; content: PGtkWidget); cdecl; external libadwaita;
procedure adw_toolbar_view_add_top_bar(self: PAdwToolbarView; widget: PGtkWidget); cdecl; external libadwaita;
procedure adw_toolbar_view_add_bottom_bar(self: PAdwToolbarView; widget: PGtkWidget); cdecl; external libadwaita;
procedure adw_toolbar_view_remove(self: PAdwToolbarView; widget: PGtkWidget); cdecl; external libadwaita;
function adw_toolbar_view_get_top_bar_style(self: PAdwToolbarView): TAdwToolbarStyle; cdecl; external libadwaita;
procedure adw_toolbar_view_set_top_bar_style(self: PAdwToolbarView; style: TAdwToolbarStyle); cdecl; external libadwaita;
function adw_toolbar_view_get_bottom_bar_style(self: PAdwToolbarView): TAdwToolbarStyle; cdecl; external libadwaita;
procedure adw_toolbar_view_set_bottom_bar_style(self: PAdwToolbarView; style: TAdwToolbarStyle); cdecl; external libadwaita;
function adw_toolbar_view_get_reveal_top_bars(self: PAdwToolbarView): Tgboolean; cdecl; external libadwaita;
procedure adw_toolbar_view_set_reveal_top_bars(self: PAdwToolbarView; reveal: Tgboolean); cdecl; external libadwaita;
function adw_toolbar_view_get_reveal_bottom_bars(self: PAdwToolbarView): Tgboolean; cdecl; external libadwaita;
procedure adw_toolbar_view_set_reveal_bottom_bars(self: PAdwToolbarView; reveal: Tgboolean); cdecl; external libadwaita;
function adw_toolbar_view_get_extend_content_to_top_edge(self: PAdwToolbarView): Tgboolean; cdecl; external libadwaita;
procedure adw_toolbar_view_set_extend_content_to_top_edge(self: PAdwToolbarView; extend: Tgboolean); cdecl; external libadwaita;
function adw_toolbar_view_get_extend_content_to_bottom_edge(self: PAdwToolbarView): Tgboolean; cdecl; external libadwaita;
procedure adw_toolbar_view_set_extend_content_to_bottom_edge(self: PAdwToolbarView; extend: Tgboolean); cdecl; external libadwaita;
function adw_toolbar_view_get_top_bar_height(self: PAdwToolbarView): longint; cdecl; external libadwaita;
function adw_toolbar_view_get_bottom_bar_height(self: PAdwToolbarView): longint; cdecl; external libadwaita;

// === Konventiert am: 8-1-25 19:21:20 ===

function ADW_TYPE_TOOLBAR_VIEW: TGType;
function ADW_TOOLBAR_VIEW(obj: Pointer): PAdwToolbarView;
function ADW_IS_TOOLBAR_VIEW(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_TOOLBAR_VIEW: TGType;
begin
  Result := adw_toolbar_view_get_type;
end;

function ADW_TOOLBAR_VIEW(obj: Pointer): PAdwToolbarView;
begin
  Result := PAdwToolbarView(g_type_check_instance_cast(obj, ADW_TYPE_TOOLBAR_VIEW));
end;

function ADW_IS_TOOLBAR_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TOOLBAR_VIEW);
end;


{$ENDIF read_implementation}
