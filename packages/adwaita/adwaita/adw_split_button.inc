{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwSplitButton, adw_split_button, ADW, SPLIT_BUTTON, GtkWidget) }
type
  TAdwSplitButton = record
  end;
  PAdwSplitButton = ^TAdwSplitButton;

  TAdwSplitButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwSplitButtonClass = ^TAdwSplitButtonClass;

function adw_split_button_get_type: TGType; cdecl; external libadwaita;
function adw_split_button_new: PGtkWidget; cdecl; external libadwaita;
function adw_split_button_get_label(self: PAdwSplitButton): pchar; cdecl; external libadwaita;
procedure adw_split_button_set_label(self: PAdwSplitButton; _label: pchar); cdecl; external libadwaita;
function adw_split_button_get_use_underline(self: PAdwSplitButton): Tgboolean; cdecl; external libadwaita;
procedure adw_split_button_set_use_underline(self: PAdwSplitButton; use_underline: Tgboolean); cdecl; external libadwaita;
function adw_split_button_get_icon_name(self: PAdwSplitButton): pchar; cdecl; external libadwaita;
procedure adw_split_button_set_icon_name(self: PAdwSplitButton; icon_name: pchar); cdecl; external libadwaita;
function adw_split_button_get_child(self: PAdwSplitButton): PGtkWidget; cdecl; external libadwaita;
procedure adw_split_button_set_child(self: PAdwSplitButton; child: PGtkWidget); cdecl; external libadwaita;
function adw_split_button_get_can_shrink(self: PAdwSplitButton): Tgboolean; cdecl; external libadwaita;
procedure adw_split_button_set_can_shrink(self: PAdwSplitButton; can_shrink: Tgboolean); cdecl; external libadwaita;
function adw_split_button_get_menu_model(self: PAdwSplitButton): PGMenuModel; cdecl; external libadwaita;
procedure adw_split_button_set_menu_model(self: PAdwSplitButton; menu_model: PGMenuModel); cdecl; external libadwaita;
function adw_split_button_get_popover(self: PAdwSplitButton): PGtkPopover; cdecl; external libadwaita;
procedure adw_split_button_set_popover(self: PAdwSplitButton; popover: PGtkPopover); cdecl; external libadwaita;
function adw_split_button_get_direction(self: PAdwSplitButton): TGtkArrowType; cdecl; external libadwaita;
procedure adw_split_button_set_direction(self: PAdwSplitButton; direction: TGtkArrowType); cdecl; external libadwaita;
function adw_split_button_get_dropdown_tooltip(self: PAdwSplitButton): pchar; cdecl; external libadwaita;
procedure adw_split_button_set_dropdown_tooltip(self: PAdwSplitButton; tooltip: pchar); cdecl; external libadwaita;
procedure adw_split_button_popup(self: PAdwSplitButton); cdecl; external libadwaita;
procedure adw_split_button_popdown(self: PAdwSplitButton); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:04:12 ===

function ADW_TYPE_SPLIT_BUTTON: TGType;
function ADW_SPLIT_BUTTON(obj: Pointer): PAdwSplitButton;
function ADW_IS_SPLIT_BUTTON(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_SPLIT_BUTTON: TGType;
begin
  Result := adw_split_button_get_type;
end;

function ADW_SPLIT_BUTTON(obj: Pointer): PAdwSplitButton;
begin
  Result := PAdwSplitButton(g_type_check_instance_cast(obj, ADW_TYPE_SPLIT_BUTTON));
end;

function ADW_IS_SPLIT_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_SPLIT_BUTTON);
end;


{$ENDIF read_implementation}
