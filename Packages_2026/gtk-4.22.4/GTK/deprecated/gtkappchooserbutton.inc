

  {$IFDEF read_struct}
type
  PGtkAppChooserButton = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_app_chooser_button_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_app_chooser_button_new(content_type: pchar): PGtkWidget; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_button_append_separator(self: PGtkAppChooserButton); cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_button_append_custom_item(self: PGtkAppChooserButton; name: pchar; _label: pchar; icon: PGIcon); cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_button_set_active_custom_item(self: PGtkAppChooserButton; name: pchar); cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_button_set_show_dialog_item(self: PGtkAppChooserButton; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_button_get_show_dialog_item(self: PGtkAppChooserButton): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_button_set_heading(self: PGtkAppChooserButton; heading: pchar); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_button_get_heading(self: PGtkAppChooserButton): pchar; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_button_set_show_default_item(self: PGtkAppChooserButton; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_button_get_show_default_item(self: PGtkAppChooserButton): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_app_chooser_button_get_modal(self: PGtkAppChooserButton): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_button_set_modal(self: PGtkAppChooserButton; modal: Tgboolean); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:33:32 ===

function GTK_TYPE_APP_CHOOSER_BUTTON: TGType;
function GTK_APP_CHOOSER_BUTTON(obj: Pointer): PGtkAppChooserButton;
function GTK_IS_APP_CHOOSER_BUTTON(obj: Pointer): Tgboolean;
{$ENDIF read_function}


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
