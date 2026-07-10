

  {$IFDEF read_struct}
type
  PGtkInfoBar = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_info_bar_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_info_bar_new: PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_info_bar_new_with_buttons(first_button_text: pchar): PGtkWidget; cdecl; varargs; external libgtk4; deprecated;
procedure gtk_info_bar_add_action_widget(info_bar: PGtkInfoBar; child: PGtkWidget; response_id: longint); cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_remove_action_widget(info_bar: PGtkInfoBar; widget: PGtkWidget); cdecl; external libgtk4; deprecated;
function gtk_info_bar_add_button(info_bar: PGtkInfoBar; button_text: pchar; response_id: longint): PGtkWidget; cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_add_buttons(info_bar: PGtkInfoBar; first_button_text: pchar); cdecl; varargs; external libgtk4; deprecated;
procedure gtk_info_bar_add_child(info_bar: PGtkInfoBar; widget: PGtkWidget); cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_remove_child(info_bar: PGtkInfoBar; widget: PGtkWidget); cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_set_response_sensitive(info_bar: PGtkInfoBar; response_id: longint; setting: Tgboolean); cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_set_default_response(info_bar: PGtkInfoBar; response_id: longint); cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_response(info_bar: PGtkInfoBar; response_id: longint); cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_set_message_type(info_bar: PGtkInfoBar; message_type: TGtkMessageType); cdecl; external libgtk4; deprecated;
function gtk_info_bar_get_message_type(info_bar: PGtkInfoBar): TGtkMessageType; cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_set_show_close_button(info_bar: PGtkInfoBar; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_info_bar_get_show_close_button(info_bar: PGtkInfoBar): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_info_bar_set_revealed(info_bar: PGtkInfoBar; revealed: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_info_bar_get_revealed(info_bar: PGtkInfoBar): Tgboolean; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:45:10 ===

function GTK_TYPE_INFO_BAR: TGType;
function GTK_INFO_BAR(obj: Pointer): PGtkInfoBar;
function GTK_IS_INFO_BAR(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_INFO_BAR: TGType;
begin
  GTK_TYPE_INFO_BAR := gtk_info_bar_get_type;
end;

function GTK_INFO_BAR(obj: Pointer): PGtkInfoBar;
begin
  Result := PGtkInfoBar(g_type_check_instance_cast(obj, GTK_TYPE_INFO_BAR));
end;

function GTK_IS_INFO_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_INFO_BAR);
end;



{$ENDIF read_implementation}
