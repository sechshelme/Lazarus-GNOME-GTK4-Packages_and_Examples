{$IFDEF read_interface}


  {G_DECLARE_DERIVABLE_TYPE (AdwMessageDialog, adw_message_dialog, ADW, MESSAGE_DIALOG, GtkWindow) }
type
  TAdwMessageDialog = record
    parent_instance: TGtkWindow;
  end;
  PAdwMessageDialog = ^TAdwMessageDialog;

  TAdwMessageDialogClass = record
    parent_class: TGtkWindowClass;
    response: procedure(self: PAdwMessageDialog; response: pchar); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwMessageDialogClass = ^TAdwMessageDialogClass;

function adw_message_dialog_get_type: TGType; cdecl; external libadwaita;
function adw_message_dialog_new(parent: PGtkWindow; heading: pchar; body: pchar): PGtkWidget; cdecl; external libadwaita;
function adw_message_dialog_get_heading(self: PAdwMessageDialog): pchar; cdecl; external libadwaita;
procedure adw_message_dialog_set_heading(self: PAdwMessageDialog; heading: pchar); cdecl; external libadwaita;
function adw_message_dialog_get_heading_use_markup(self: PAdwMessageDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_message_dialog_set_heading_use_markup(self: PAdwMessageDialog; use_markup: Tgboolean); cdecl; external libadwaita;
procedure adw_message_dialog_format_heading(self: PAdwMessageDialog; format: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_message_dialog_format_heading(self: PAdwMessageDialog; format: pchar); cdecl; external libadwaita;
procedure adw_message_dialog_format_heading_markup(self: PAdwMessageDialog; format: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_message_dialog_format_heading_markup(self: PAdwMessageDialog; format: pchar); cdecl; external libadwaita;
function adw_message_dialog_get_body(self: PAdwMessageDialog): pchar; cdecl; external libadwaita;
procedure adw_message_dialog_set_body(self: PAdwMessageDialog; body: pchar); cdecl; external libadwaita;
function adw_message_dialog_get_body_use_markup(self: PAdwMessageDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_message_dialog_set_body_use_markup(self: PAdwMessageDialog; use_markup: Tgboolean); cdecl; external libadwaita;
procedure adw_message_dialog_format_body(self: PAdwMessageDialog; format: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_message_dialog_format_body(self: PAdwMessageDialog; format: pchar); cdecl; external libadwaita;
procedure adw_message_dialog_format_body_markup(self: PAdwMessageDialog; format: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_message_dialog_format_body_markup(self: PAdwMessageDialog; format: pchar); cdecl; external libadwaita;
function adw_message_dialog_get_extra_child(self: PAdwMessageDialog): PGtkWidget; cdecl; external libadwaita;
procedure adw_message_dialog_set_extra_child(self: PAdwMessageDialog; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_message_dialog_add_response(self: PAdwMessageDialog; id: pchar; _label: pchar); cdecl; external libadwaita;
procedure adw_message_dialog_remove_response(self: PAdwMessageDialog; id: pchar); cdecl; external libadwaita;
procedure adw_message_dialog_add_responses(self: PAdwMessageDialog; first_id: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_message_dialog_add_responses(self: PAdwMessageDialog; first_id: pchar); cdecl; external libadwaita;
function adw_message_dialog_get_response_label(self: PAdwMessageDialog; response: pchar): pchar; cdecl; external libadwaita;
procedure adw_message_dialog_set_response_label(self: PAdwMessageDialog; response: pchar; _label: pchar); cdecl; external libadwaita;
function adw_message_dialog_get_response_appearance(self: PAdwMessageDialog; response: pchar): TAdwResponseAppearance; cdecl; external libadwaita;
procedure adw_message_dialog_set_response_appearance(self: PAdwMessageDialog; response: pchar; appearance: TAdwResponseAppearance); cdecl; external libadwaita;
function adw_message_dialog_get_response_enabled(self: PAdwMessageDialog; response: pchar): Tgboolean; cdecl; external libadwaita;
procedure adw_message_dialog_set_response_enabled(self: PAdwMessageDialog; response: pchar; Enabled: Tgboolean); cdecl; external libadwaita;
function adw_message_dialog_get_default_response(self: PAdwMessageDialog): pchar; cdecl; external libadwaita;
procedure adw_message_dialog_set_default_response(self: PAdwMessageDialog; response: pchar); cdecl; external libadwaita;
function adw_message_dialog_get_close_response(self: PAdwMessageDialog): pchar; cdecl; external libadwaita;
procedure adw_message_dialog_set_close_response(self: PAdwMessageDialog; response: pchar); cdecl; external libadwaita;
procedure adw_message_dialog_response(self: PAdwMessageDialog; response: pchar); cdecl; external libadwaita;
function adw_message_dialog_has_response(self: PAdwMessageDialog; response: pchar): Tgboolean; cdecl; external libadwaita;
procedure adw_message_dialog_choose(self: PAdwMessageDialog; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libadwaita;
function adw_message_dialog_choose_finish(self: PAdwMessageDialog; Result: PGAsyncResult): pchar; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:15:04 ===

function ADW_TYPE_MESSAGE_DIALOG: TGType;
function ADW_MESSAGE_DIALOG(obj: Pointer): PAdwMessageDialog;
function ADW_IS_MESSAGE_DIALOG(obj: Pointer): Tgboolean;
function ADW_MESSAGE_DIALOG_CLASS(klass: Pointer): PAdwMessageDialogClass;
function ADW_IS_MESSAGE_DIALOG_CLASS(klass: Pointer): Tgboolean;
function ADW_MESSAGE_DIALOG_GET_CLASS(obj: Pointer): PAdwMessageDialogClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_MESSAGE_DIALOG: TGType;
begin
  Result := adw_message_dialog_get_type;
end;

function ADW_MESSAGE_DIALOG(obj: Pointer): PAdwMessageDialog;
begin
  Result := PAdwMessageDialog(g_type_check_instance_cast(obj, ADW_TYPE_MESSAGE_DIALOG));
end;

function ADW_IS_MESSAGE_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_MESSAGE_DIALOG);
end;

function ADW_MESSAGE_DIALOG_CLASS(klass: Pointer): PAdwMessageDialogClass;
begin
  Result := PAdwMessageDialogClass(g_type_check_class_cast(klass, ADW_TYPE_MESSAGE_DIALOG));
end;

function ADW_IS_MESSAGE_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_MESSAGE_DIALOG);
end;

function ADW_MESSAGE_DIALOG_GET_CLASS(obj: Pointer): PAdwMessageDialogClass;
begin
  Result := PAdwMessageDialogClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
