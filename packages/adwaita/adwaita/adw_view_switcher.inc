{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (AdwViewSwitcher, adw_view_switcher, ADW, VIEW_SWITCHER, GtkWidget) }
type
  PAdwViewSwitcherPolicy = ^TAdwViewSwitcherPolicy;
  TAdwViewSwitcherPolicy = longint;

const
  ADW_VIEW_SWITCHER_POLICY_NARROW = 0;
  ADW_VIEW_SWITCHER_POLICY_WIDE = 1;


type
  TAdwViewSwitcher = record
  end;
  PAdwViewSwitcher = ^TAdwViewSwitcher;

  TAdwViewSwitcherClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwViewSwitcherClass = ^TAdwViewSwitcherClass;

function adw_view_switcher_get_type: TGType; cdecl; external libadwaita;
function adw_view_switcher_new: PGtkWidget; cdecl; external libadwaita;
function adw_view_switcher_get_policy(self: PAdwViewSwitcher): TAdwViewSwitcherPolicy; cdecl; external libadwaita;
procedure adw_view_switcher_set_policy(self: PAdwViewSwitcher; policy: TAdwViewSwitcherPolicy); cdecl; external libadwaita;
function adw_view_switcher_get_stack(self: PAdwViewSwitcher): PAdwViewStack; cdecl; external libadwaita;
procedure adw_view_switcher_set_stack(self: PAdwViewSwitcher; stack: PAdwViewStack); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:49:52 ===

function ADW_TYPE_VIEW_SWITCHER: TGType;
function ADW_VIEW_SWITCHER(obj: Pointer): PAdwViewSwitcher;
function ADW_IS_VIEW_SWITCHER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_VIEW_SWITCHER: TGType;
begin
  Result := adw_view_switcher_get_type;
end;

function ADW_VIEW_SWITCHER(obj: Pointer): PAdwViewSwitcher;
begin
  Result := PAdwViewSwitcher(g_type_check_instance_cast(obj, ADW_TYPE_VIEW_SWITCHER));
end;

function ADW_IS_VIEW_SWITCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_VIEW_SWITCHER);
end;


{$ENDIF read_implementation}
