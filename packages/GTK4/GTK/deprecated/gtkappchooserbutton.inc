
{$IFDEF read_interface}


type
  TGtkAppChooserButton = record
  end;
  PGtkAppChooserButton = ^TGtkAppChooserButton;

function gtk_app_chooser_button_get_type: TGType; cdecl; external libgtk4;
function gtk_app_chooser_button_new(content_type: PChar): PGtkWidget; cdecl; external libgtk4;
procedure gtk_app_chooser_button_append_separator(self: PGtkAppChooserButton); cdecl; external libgtk4;
procedure gtk_app_chooser_button_append_custom_item(self: PGtkAppChooserButton; Name: PChar; _label: PChar; icon: PGIcon); cdecl; external libgtk4;
procedure gtk_app_chooser_button_set_active_custom_item(self: PGtkAppChooserButton; Name: PChar); cdecl; external libgtk4;
procedure gtk_app_chooser_button_set_show_dialog_item(self: PGtkAppChooserButton; setting: Tgboolean); cdecl; external libgtk4;
function gtk_app_chooser_button_get_show_dialog_item(self: PGtkAppChooserButton): Tgboolean; cdecl; external libgtk4;
procedure gtk_app_chooser_button_set_heading(self: PGtkAppChooserButton; heading: PChar); cdecl; external libgtk4;
function gtk_app_chooser_button_get_heading(self: PGtkAppChooserButton): PChar; cdecl; external libgtk4;
procedure gtk_app_chooser_button_set_show_default_item(self: PGtkAppChooserButton; setting: Tgboolean); cdecl; external libgtk4;
function gtk_app_chooser_button_get_show_default_item(self: PGtkAppChooserButton): Tgboolean; cdecl; external libgtk4;
function gtk_app_chooser_button_get_modal(self: PGtkAppChooserButton): Tgboolean; cdecl; external libgtk4;
procedure gtk_app_chooser_button_set_modal(self: PGtkAppChooserButton; modal: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 29-7-24 14:55:41 ===

function GTK_TYPE_APP_CHOOSER_BUTTON: TGType;
function GTK_APP_CHOOSER_BUTTON(obj: Pointer): PGtkAppChooserButton;
function GTK_IS_APP_CHOOSER_BUTTON(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_APP_CHOOSER_BUTTON: TGType;
begin
  GTK_TYPE_APP_CHOOSER_BUTTON := gtk_app_chooser_button_get_type;
end;

function GTK_APP_CHOOSER_BUTTON(obj: Pointer): PGtkAppChooserButton;
begin
  Result := PGtkAppChooserButton(g_type_check_instance_cast(obj, GTK_TYPE_APP_CHOOSER_BUTTON));
end;

function GTK_IS_APP_CHOOSER_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_APP_CHOOSER_BUTTON);
end;



{$ENDIF read_implementation}
