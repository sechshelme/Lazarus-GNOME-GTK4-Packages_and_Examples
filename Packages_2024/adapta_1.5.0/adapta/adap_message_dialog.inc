{$IFDEF read_interface}


type
  TAdapMessageDialog = record
    parent_instance: TGtkWindow;
  end;
  PAdapMessageDialog = ^TAdapMessageDialog;

  TAdapMessageDialogClass = record
    parent_class: TGtkWindowClass;
    response: procedure(self: PAdapMessageDialog; response: pchar); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapMessageDialogClass = ^TAdapMessageDialogClass;

function adap_message_dialog_get_type: TGType; cdecl; external libadapta;
function adap_message_dialog_new(parent: PGtkWindow; heading: pchar; body: pchar): PGtkWidget; cdecl; external libadapta;
function adap_message_dialog_get_heading(self: PAdapMessageDialog): pchar; cdecl; external libadapta;
procedure adap_message_dialog_set_heading(self: PAdapMessageDialog; heading: pchar); cdecl; external libadapta;
function adap_message_dialog_get_heading_use_markup(self: PAdapMessageDialog): Tgboolean; cdecl; external libadapta;
procedure adap_message_dialog_set_heading_use_markup(self: PAdapMessageDialog; use_markup: Tgboolean); cdecl; external libadapta;
procedure adap_message_dialog_format_heading(self: PAdapMessageDialog; format: pchar; args: array of const); cdecl; external libadapta;
procedure adap_message_dialog_format_heading(self: PAdapMessageDialog; format: pchar); cdecl; external libadapta;
procedure adap_message_dialog_format_heading_markup(self: PAdapMessageDialog; format: pchar; args: array of const); cdecl; external libadapta;
procedure adap_message_dialog_format_heading_markup(self: PAdapMessageDialog; format: pchar); cdecl; external libadapta;
function adap_message_dialog_get_body(self: PAdapMessageDialog): pchar; cdecl; external libadapta;
procedure adap_message_dialog_set_body(self: PAdapMessageDialog; body: pchar); cdecl; external libadapta;
function adap_message_dialog_get_body_use_markup(self: PAdapMessageDialog): Tgboolean; cdecl; external libadapta;
procedure adap_message_dialog_set_body_use_markup(self: PAdapMessageDialog; use_markup: Tgboolean); cdecl; external libadapta;
procedure adap_message_dialog_format_body(self: PAdapMessageDialog; format: pchar; args: array of const); cdecl; external libadapta;
procedure adap_message_dialog_format_body(self: PAdapMessageDialog; format: pchar); cdecl; external libadapta;
procedure adap_message_dialog_format_body_markup(self: PAdapMessageDialog; format: pchar; args: array of const); cdecl; external libadapta;
procedure adap_message_dialog_format_body_markup(self: PAdapMessageDialog; format: pchar); cdecl; external libadapta;
function adap_message_dialog_get_extra_child(self: PAdapMessageDialog): PGtkWidget; cdecl; external libadapta;
procedure adap_message_dialog_set_extra_child(self: PAdapMessageDialog; child: PGtkWidget); cdecl; external libadapta;
procedure adap_message_dialog_add_response(self: PAdapMessageDialog; id: pchar; _label: pchar); cdecl; external libadapta;
procedure adap_message_dialog_remove_response(self: PAdapMessageDialog; id: pchar); cdecl; external libadapta;
procedure adap_message_dialog_add_responses(self: PAdapMessageDialog; first_id: pchar; args: array of const); cdecl; external libadapta;
procedure adap_message_dialog_add_responses(self: PAdapMessageDialog; first_id: pchar); cdecl; external libadapta;
function adap_message_dialog_get_response_label(self: PAdapMessageDialog; response: pchar): pchar; cdecl; external libadapta;
procedure adap_message_dialog_set_response_label(self: PAdapMessageDialog; response: pchar; _label: pchar); cdecl; external libadapta;
function adap_message_dialog_get_response_appearance(self: PAdapMessageDialog; response: pchar): TAdapResponseAppearance; cdecl; external libadapta;
procedure adap_message_dialog_set_response_appearance(self: PAdapMessageDialog; response: pchar; appearance: TAdapResponseAppearance); cdecl; external libadapta;
function adap_message_dialog_get_response_enabled(self: PAdapMessageDialog; response: pchar): Tgboolean; cdecl; external libadapta;
procedure adap_message_dialog_set_response_enabled(self: PAdapMessageDialog; response: pchar; enabled: Tgboolean); cdecl; external libadapta;
function adap_message_dialog_get_default_response(self: PAdapMessageDialog): pchar; cdecl; external libadapta;
procedure adap_message_dialog_set_default_response(self: PAdapMessageDialog; response: pchar); cdecl; external libadapta;
function adap_message_dialog_get_close_response(self: PAdapMessageDialog): pchar; cdecl; external libadapta;
procedure adap_message_dialog_set_close_response(self: PAdapMessageDialog; response: pchar); cdecl; external libadapta;
procedure adap_message_dialog_response(self: PAdapMessageDialog; response: pchar); cdecl; external libadapta;
function adap_message_dialog_has_response(self: PAdapMessageDialog; response: pchar): Tgboolean; cdecl; external libadapta;
procedure adap_message_dialog_choose(self: PAdapMessageDialog; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libadapta;
function adap_message_dialog_choose_finish(self: PAdapMessageDialog; result: PGAsyncResult): pchar; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:06 ===

function ADAP_TYPE_MESSAGE_DIALOG: TGType;
function ADAP_MESSAGE_DIALOG(obj: Pointer): PAdapMessageDialog;
function ADAP_IS_MESSAGE_DIALOG(obj: Pointer): Tgboolean;
function ADAP_MESSAGE_DIALOG_CLASS(klass: Pointer): PAdapMessageDialogClass;
function ADAP_IS_MESSAGE_DIALOG_CLASS(klass: Pointer): Tgboolean;
function ADAP_MESSAGE_DIALOG_GET_CLASS(obj: Pointer): PAdapMessageDialogClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_MESSAGE_DIALOG: TGType;
begin
  Result := adap_message_dialog_get_type;
end;

function ADAP_MESSAGE_DIALOG(obj: Pointer): PAdapMessageDialog;
begin
  Result := PAdapMessageDialog(g_type_check_instance_cast(obj, ADAP_TYPE_MESSAGE_DIALOG));
end;

function ADAP_IS_MESSAGE_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_MESSAGE_DIALOG);
end;

function ADAP_MESSAGE_DIALOG_CLASS(klass: Pointer): PAdapMessageDialogClass;
begin
  Result := PAdapMessageDialogClass(g_type_check_class_cast(klass, ADAP_TYPE_MESSAGE_DIALOG));
end;

function ADAP_IS_MESSAGE_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_MESSAGE_DIALOG);
end;

function ADAP_MESSAGE_DIALOG_GET_CLASS(obj: Pointer): PAdapMessageDialogClass;
begin
  Result := PAdapMessageDialogClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
