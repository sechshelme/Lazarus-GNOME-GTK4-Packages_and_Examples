{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwViewSwitcherTitle, adw_view_switcher_title, ADW, VIEW_SWITCHER_TITLE, GtkWidget) }
type
  TAdwViewSwitcherTitle = record
  end;
  PAdwViewSwitcherTitle = ^TAdwViewSwitcherTitle;

  TAdwViewSwitcherTitleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwViewSwitcherTitleClass = ^TAdwViewSwitcherTitleClass;

function adw_view_switcher_title_get_type: TGType; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_view_switcher_title_new: PGtkWidget; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_view_switcher_title_get_stack(self: PAdwViewSwitcherTitle): PAdwViewStack; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_view_switcher_title_set_stack(self: PAdwViewSwitcherTitle; stack: PAdwViewStack); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_view_switcher_title_get_title(self: PAdwViewSwitcherTitle): pchar; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_view_switcher_title_set_title(self: PAdwViewSwitcherTitle; title: pchar); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_view_switcher_title_get_subtitle(self: PAdwViewSwitcherTitle): pchar; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_view_switcher_title_set_subtitle(self: PAdwViewSwitcherTitle; subtitle: pchar); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_view_switcher_title_get_view_switcher_enabled(self: PAdwViewSwitcherTitle): Tgboolean; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_view_switcher_title_set_view_switcher_enabled(self: PAdwViewSwitcherTitle; Enabled: Tgboolean); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_view_switcher_title_get_title_visible(self: PAdwViewSwitcherTitle): Tgboolean; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4

// === Konventiert am: 10-1-25 13:55:32 ===

function ADW_TYPE_VIEW_SWITCHER_TITLE: TGType; deprecated; // ADW_DEPRECATED_IN_1_4
function ADW_VIEW_SWITCHER_TITLE(obj: Pointer): PAdwViewSwitcherTitle; deprecated; // ADW_DEPRECATED_IN_1_4
function ADW_IS_VIEW_SWITCHER_TITLE(obj: Pointer): Tgboolean; deprecated; // ADW_DEPRECATED_IN_1_4

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_VIEW_SWITCHER_TITLE: TGType;
begin
  Result := adw_view_switcher_title_get_type;
end;

function ADW_VIEW_SWITCHER_TITLE(obj: Pointer): PAdwViewSwitcherTitle;
begin
  Result := PAdwViewSwitcherTitle(g_type_check_instance_cast(obj, ADW_TYPE_VIEW_SWITCHER_TITLE));
end;

function ADW_IS_VIEW_SWITCHER_TITLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_VIEW_SWITCHER_TITLE);
end;


{$ENDIF read_implementation}
