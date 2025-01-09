unit adw_alert_dialog;

interface

uses
  fp_glib2, fp_GTK4, adw_dialog;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PAdwResponseAppearance = ^TAdwResponseAppearance;
  TAdwResponseAppearance = longint;

const
  ADW_RESPONSE_DEFAULT = 0;
  ADW_RESPONSE_SUGGESTED = 1;
  ADW_RESPONSE_DESTRUCTIVE = 2;

  {G_DECLARE_DERIVABLE_TYPE (AdwAlertDialog, adw_alert_dialog, ADW, ALERT_DIALOG, AdwDialog) }
type
  TAdwAlertDialog = record
    parent_instance: TAdwDialog;
  end;
  PAdwAlertDialog = ^TAdwAlertDialog;

  TAdwAlertDialogClass = record
    parent_class: TAdwDialogClass;
    response: procedure(self: PAdwAlertDialog; response: pchar); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwAlertDialogClass = ^TAdwAlertDialogClass;

function adw_alert_dialog_get_type: TGType; cdecl; external libadwaita;
function adw_alert_dialog_new(heading: pchar; body: pchar): PAdwDialog; cdecl; external libadwaita;
function adw_alert_dialog_get_heading(self: PAdwAlertDialog): pchar; cdecl; external libadwaita;
procedure adw_alert_dialog_set_heading(self: PAdwAlertDialog; heading: pchar); cdecl; external libadwaita;
function adw_alert_dialog_get_heading_use_markup(self: PAdwAlertDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_alert_dialog_set_heading_use_markup(self: PAdwAlertDialog; use_markup: Tgboolean); cdecl; external libadwaita;
procedure adw_alert_dialog_format_heading(self: PAdwAlertDialog; format: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_alert_dialog_format_heading(self: PAdwAlertDialog; format: pchar); cdecl; external libadwaita;
procedure adw_alert_dialog_format_heading_markup(self: PAdwAlertDialog; format: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_alert_dialog_format_heading_markup(self: PAdwAlertDialog; format: pchar); cdecl; external libadwaita;
function adw_alert_dialog_get_body(self: PAdwAlertDialog): pchar; cdecl; external libadwaita;
procedure adw_alert_dialog_set_body(self: PAdwAlertDialog; body: pchar); cdecl; external libadwaita;
function adw_alert_dialog_get_body_use_markup(self: PAdwAlertDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_alert_dialog_set_body_use_markup(self: PAdwAlertDialog; use_markup: Tgboolean); cdecl; external libadwaita;
procedure adw_alert_dialog_format_body(self: PAdwAlertDialog; format: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_alert_dialog_format_body(self: PAdwAlertDialog; format: pchar); cdecl; external libadwaita;
procedure adw_alert_dialog_format_body_markup(self: PAdwAlertDialog; format: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_alert_dialog_format_body_markup(self: PAdwAlertDialog; format: pchar); cdecl; external libadwaita;
function adw_alert_dialog_get_extra_child(self: PAdwAlertDialog): PGtkWidget; cdecl; external libadwaita;
procedure adw_alert_dialog_set_extra_child(self: PAdwAlertDialog; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_alert_dialog_add_response(self: PAdwAlertDialog; id: pchar; _label: pchar); cdecl; external libadwaita;
procedure adw_alert_dialog_add_responses(self: PAdwAlertDialog; first_id: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_alert_dialog_add_responses(self: PAdwAlertDialog; first_id: pchar); cdecl; external libadwaita;
procedure adw_alert_dialog_remove_response(self: PAdwAlertDialog; id: pchar); cdecl; external libadwaita;
function adw_alert_dialog_get_response_label(self: PAdwAlertDialog; response: pchar): pchar; cdecl; external libadwaita;
procedure adw_alert_dialog_set_response_label(self: PAdwAlertDialog; response: pchar; _label: pchar); cdecl; external libadwaita;
function adw_alert_dialog_get_response_appearance(self: PAdwAlertDialog; response: pchar): TAdwResponseAppearance; cdecl; external libadwaita;
procedure adw_alert_dialog_set_response_appearance(self: PAdwAlertDialog; response: pchar; appearance: TAdwResponseAppearance); cdecl; external libadwaita;
function adw_alert_dialog_get_response_enabled(self: PAdwAlertDialog; response: pchar): Tgboolean; cdecl; external libadwaita;
procedure adw_alert_dialog_set_response_enabled(self: PAdwAlertDialog; response: pchar; Enabled: Tgboolean); cdecl; external libadwaita;
function adw_alert_dialog_get_default_response(self: PAdwAlertDialog): pchar; cdecl; external libadwaita;
procedure adw_alert_dialog_set_default_response(self: PAdwAlertDialog; response: pchar); cdecl; external libadwaita;
function adw_alert_dialog_get_close_response(self: PAdwAlertDialog): pchar; cdecl; external libadwaita;
procedure adw_alert_dialog_set_close_response(self: PAdwAlertDialog; response: pchar); cdecl; external libadwaita;
function adw_alert_dialog_has_response(self: PAdwAlertDialog; response: pchar): Tgboolean; cdecl; external libadwaita;
procedure adw_alert_dialog_choose(self: PAdwAlertDialog; parent: PGtkWidget; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libadwaita;
function adw_alert_dialog_choose_finish(self: PAdwAlertDialog; Result: PGAsyncResult): pchar; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:14:56 ===

function ADW_TYPE_ALERT_DIALOG: TGType;
function ADW_ALERT_DIALOG(obj: Pointer): PAdwAlertDialog;
function ADW_IS_ALERT_DIALOG(obj: Pointer): Tgboolean;
function ADW_ALERT_DIALOG_CLASS(klass: Pointer): PAdwAlertDialogClass;
function ADW_IS_ALERT_DIALOG_CLASS(klass: Pointer): Tgboolean;
function ADW_ALERT_DIALOG_GET_CLASS(obj: Pointer): PAdwAlertDialogClass;

implementation

function ADW_TYPE_ALERT_DIALOG: TGType;
begin
  Result := adw_alert_dialog_get_type;
end;

function ADW_ALERT_DIALOG(obj: Pointer): PAdwAlertDialog;
begin
  Result := PAdwAlertDialog(g_type_check_instance_cast(obj, ADW_TYPE_ALERT_DIALOG));
end;

function ADW_IS_ALERT_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ALERT_DIALOG);
end;

function ADW_ALERT_DIALOG_CLASS(klass: Pointer): PAdwAlertDialogClass;
begin
  Result := PAdwAlertDialogClass(g_type_check_class_cast(klass, ADW_TYPE_ALERT_DIALOG));
end;

function ADW_IS_ALERT_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_ALERT_DIALOG);
end;

function ADW_ALERT_DIALOG_GET_CLASS(obj: Pointer): PAdwAlertDialogClass;
begin
  Result := PAdwAlertDialogClass(PGTypeInstance(obj)^.g_class);
end;


end.
