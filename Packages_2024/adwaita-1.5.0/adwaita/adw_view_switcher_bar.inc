{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (AdwViewSwitcherBar, adw_view_switcher_bar, ADW, VIEW_SWITCHER_BAR, GtkWidget) }
type
  TAdwViewSwitcherBar = record
  end;
  PAdwViewSwitcherBar = ^TAdwViewSwitcherBar;

  TAdwViewSwitcherBarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwViewSwitcherBarClass = ^TAdwViewSwitcherBarClass;

function adw_view_switcher_bar_get_type: TGType; cdecl; external libadwaita;
function adw_view_switcher_bar_new: PGtkWidget; cdecl; external libadwaita;
function adw_view_switcher_bar_get_stack(self: PAdwViewSwitcherBar): PAdwViewStack; cdecl; external libadwaita;
procedure adw_view_switcher_bar_set_stack(self: PAdwViewSwitcherBar; stack: PAdwViewStack); cdecl; external libadwaita;
function adw_view_switcher_bar_get_reveal(self: PAdwViewSwitcherBar): Tgboolean; cdecl; external libadwaita;
procedure adw_view_switcher_bar_set_reveal(self: PAdwViewSwitcherBar; reveal: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:49:55 ===

function ADW_TYPE_VIEW_SWITCHER_BAR: TGType;
function ADW_VIEW_SWITCHER_BAR(obj: Pointer): PAdwViewSwitcherBar;
function ADW_IS_VIEW_SWITCHER_BAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_VIEW_SWITCHER_BAR: TGType;
begin
  Result := adw_view_switcher_bar_get_type;
end;

function ADW_VIEW_SWITCHER_BAR(obj: Pointer): PAdwViewSwitcherBar;
begin
  Result := PAdwViewSwitcherBar(g_type_check_instance_cast(obj, ADW_TYPE_VIEW_SWITCHER_BAR));
end;

function ADW_IS_VIEW_SWITCHER_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_VIEW_SWITCHER_BAR);
end;


{$ENDIF read_implementation}
