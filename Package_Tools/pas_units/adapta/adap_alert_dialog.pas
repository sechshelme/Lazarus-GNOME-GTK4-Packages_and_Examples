unit adap_alert_dialog;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_dialog;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAdapResponseAppearance = ^TAdapResponseAppearance;
  TAdapResponseAppearance = longint;

const
  ADAP_RESPONSE_DEFAULT = 0;
  ADAP_RESPONSE_SUGGESTED = 1;
  ADAP_RESPONSE_DESTRUCTIVE = 2;

type
  TAdapAlertDialog = record
    parent_instance: TAdapDialog;
  end;
  PAdapAlertDialog = ^TAdapAlertDialog;

  TAdapAlertDialogClass = record
    parent_class: TAdapDialogClass;
    response: procedure(self: PAdapAlertDialog; response: pchar); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapAlertDialogClass = ^TAdapAlertDialogClass;

function adap_alert_dialog_get_type: TGType; cdecl; external libadapta;
function adap_alert_dialog_new(heading: pchar; body: pchar): PAdapDialog; cdecl; external libadapta;
function adap_alert_dialog_get_heading(self: PAdapAlertDialog): pchar; cdecl; external libadapta;
procedure adap_alert_dialog_set_heading(self: PAdapAlertDialog; heading: pchar); cdecl; external libadapta;
function adap_alert_dialog_get_heading_use_markup(self: PAdapAlertDialog): Tgboolean; cdecl; external libadapta;
procedure adap_alert_dialog_set_heading_use_markup(self: PAdapAlertDialog; use_markup: Tgboolean); cdecl; external libadapta;
procedure adap_alert_dialog_format_heading(self: PAdapAlertDialog; format: pchar; args: array of const); cdecl; external libadapta;
procedure adap_alert_dialog_format_heading(self: PAdapAlertDialog; format: pchar); cdecl; external libadapta;
procedure adap_alert_dialog_format_heading_markup(self: PAdapAlertDialog; format: pchar; args: array of const); cdecl; external libadapta;
procedure adap_alert_dialog_format_heading_markup(self: PAdapAlertDialog; format: pchar); cdecl; external libadapta;
function adap_alert_dialog_get_body(self: PAdapAlertDialog): pchar; cdecl; external libadapta;
procedure adap_alert_dialog_set_body(self: PAdapAlertDialog; body: pchar); cdecl; external libadapta;
function adap_alert_dialog_get_body_use_markup(self: PAdapAlertDialog): Tgboolean; cdecl; external libadapta;
procedure adap_alert_dialog_set_body_use_markup(self: PAdapAlertDialog; use_markup: Tgboolean); cdecl; external libadapta;
procedure adap_alert_dialog_format_body(self: PAdapAlertDialog; format: pchar; args: array of const); cdecl; external libadapta;
procedure adap_alert_dialog_format_body(self: PAdapAlertDialog; format: pchar); cdecl; external libadapta;
procedure adap_alert_dialog_format_body_markup(self: PAdapAlertDialog; format: pchar; args: array of const); cdecl; external libadapta;
procedure adap_alert_dialog_format_body_markup(self: PAdapAlertDialog; format: pchar); cdecl; external libadapta;
function adap_alert_dialog_get_extra_child(self: PAdapAlertDialog): PGtkWidget; cdecl; external libadapta;
procedure adap_alert_dialog_set_extra_child(self: PAdapAlertDialog; child: PGtkWidget); cdecl; external libadapta;
procedure adap_alert_dialog_add_response(self: PAdapAlertDialog; id: pchar; _label: pchar); cdecl; external libadapta;
procedure adap_alert_dialog_add_responses(self: PAdapAlertDialog; first_id: pchar; args: array of const); cdecl; external libadapta;
procedure adap_alert_dialog_add_responses(self: PAdapAlertDialog; first_id: pchar); cdecl; external libadapta;
procedure adap_alert_dialog_remove_response(self: PAdapAlertDialog; id: pchar); cdecl; external libadapta;
function adap_alert_dialog_get_response_label(self: PAdapAlertDialog; response: pchar): pchar; cdecl; external libadapta;
procedure adap_alert_dialog_set_response_label(self: PAdapAlertDialog; response: pchar; _label: pchar); cdecl; external libadapta;
function adap_alert_dialog_get_response_appearance(self: PAdapAlertDialog; response: pchar): TAdapResponseAppearance; cdecl; external libadapta;
procedure adap_alert_dialog_set_response_appearance(self: PAdapAlertDialog; response: pchar; appearance: TAdapResponseAppearance); cdecl; external libadapta;
function adap_alert_dialog_get_response_enabled(self: PAdapAlertDialog; response: pchar): Tgboolean; cdecl; external libadapta;
procedure adap_alert_dialog_set_response_enabled(self: PAdapAlertDialog; response: pchar; enabled: Tgboolean); cdecl; external libadapta;
function adap_alert_dialog_get_default_response(self: PAdapAlertDialog): pchar; cdecl; external libadapta;
procedure adap_alert_dialog_set_default_response(self: PAdapAlertDialog; response: pchar); cdecl; external libadapta;
function adap_alert_dialog_get_close_response(self: PAdapAlertDialog): pchar; cdecl; external libadapta;
procedure adap_alert_dialog_set_close_response(self: PAdapAlertDialog; response: pchar); cdecl; external libadapta;
function adap_alert_dialog_has_response(self: PAdapAlertDialog; response: pchar): Tgboolean; cdecl; external libadapta;
procedure adap_alert_dialog_choose(self: PAdapAlertDialog; parent: PGtkWidget; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libadapta;
function adap_alert_dialog_choose_finish(self: PAdapAlertDialog; result: PGAsyncResult): pchar; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:00:06 ===

function ADAP_TYPE_ALERT_DIALOG: TGType;
function ADAP_ALERT_DIALOG(obj: Pointer): PAdapAlertDialog;
function ADAP_IS_ALERT_DIALOG(obj: Pointer): Tgboolean;
function ADAP_ALERT_DIALOG_CLASS(klass: Pointer): PAdapAlertDialogClass;
function ADAP_IS_ALERT_DIALOG_CLASS(klass: Pointer): Tgboolean;
function ADAP_ALERT_DIALOG_GET_CLASS(obj: Pointer): PAdapAlertDialogClass;

implementation

function ADAP_TYPE_ALERT_DIALOG: TGType;
begin
  Result := adap_alert_dialog_get_type;
end;

function ADAP_ALERT_DIALOG(obj: Pointer): PAdapAlertDialog;
begin
  Result := PAdapAlertDialog(g_type_check_instance_cast(obj, ADAP_TYPE_ALERT_DIALOG));
end;

function ADAP_IS_ALERT_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ALERT_DIALOG);
end;

function ADAP_ALERT_DIALOG_CLASS(klass: Pointer): PAdapAlertDialogClass;
begin
  Result := PAdapAlertDialogClass(g_type_check_class_cast(klass, ADAP_TYPE_ALERT_DIALOG));
end;

function ADAP_IS_ALERT_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_ALERT_DIALOG);
end;

function ADAP_ALERT_DIALOG_GET_CLASS(obj: Pointer): PAdapAlertDialogClass;
begin
  Result := PAdapAlertDialogClass(PGTypeInstance(obj)^.g_class);
end;


end.
