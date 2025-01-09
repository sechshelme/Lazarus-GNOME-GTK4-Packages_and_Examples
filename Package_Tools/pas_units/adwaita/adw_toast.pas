unit adw_toast;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PAdwToastPriority = ^TAdwToastPriority;
  TAdwToastPriority = longint;

const
  ADW_TOAST_PRIORITY_NORMAL = 0;
  ADW_TOAST_PRIORITY_HIGH = 1;

  {G_DECLARE_FINAL_TYPE (AdwToast, adw_toast, ADW, TOAST, GObject) }
type
  TAdwToast = record
  end;
  PAdwToast = ^TAdwToast;

  TAdwToastClass = record
    parent_class: TGObjectClass;
  end;
  PAdwToastClass = ^TAdwToastClass;

function adw_toast_get_type: TGType; cdecl; external libadwaita;
function adw_toast_new(title: pchar): PAdwToast; cdecl; external libadwaita;
function adw_toast_new_format(format: pchar; args: array of const): PAdwToast; cdecl; external libadwaita;
function adw_toast_new_format(format: pchar): PAdwToast; cdecl; external libadwaita;
function adw_toast_get_title(self: PAdwToast): pchar; cdecl; external libadwaita;
procedure adw_toast_set_title(self: PAdwToast; title: pchar); cdecl; external libadwaita;
function adw_toast_get_button_label(self: PAdwToast): pchar; cdecl; external libadwaita;
procedure adw_toast_set_button_label(self: PAdwToast; button_label: pchar); cdecl; external libadwaita;
function adw_toast_get_action_name(self: PAdwToast): pchar; cdecl; external libadwaita;
procedure adw_toast_set_action_name(self: PAdwToast; action_name: pchar); cdecl; external libadwaita;
function adw_toast_get_action_target_value(self: PAdwToast): PGVariant; cdecl; external libadwaita;
procedure adw_toast_set_action_target_value(self: PAdwToast; action_target: PGVariant); cdecl; external libadwaita;
procedure adw_toast_set_action_target(self: PAdwToast; format_string: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_toast_set_action_target(self: PAdwToast; format_string: pchar); cdecl; external libadwaita;
procedure adw_toast_set_detailed_action_name(self: PAdwToast; detailed_action_name: pchar); cdecl; external libadwaita;
function adw_toast_get_priority(self: PAdwToast): TAdwToastPriority; cdecl; external libadwaita;
procedure adw_toast_set_priority(self: PAdwToast; priority: TAdwToastPriority); cdecl; external libadwaita;
function adw_toast_get_timeout(self: PAdwToast): Tguint; cdecl; external libadwaita;
procedure adw_toast_set_timeout(self: PAdwToast; timeout: Tguint); cdecl; external libadwaita;
function adw_toast_get_custom_title(self: PAdwToast): PGtkWidget; cdecl; external libadwaita;
procedure adw_toast_set_custom_title(self: PAdwToast; widget: PGtkWidget); cdecl; external libadwaita;
function adw_toast_get_use_markup(self: PAdwToast): Tgboolean; cdecl; external libadwaita;
procedure adw_toast_set_use_markup(self: PAdwToast; use_markup: Tgboolean); cdecl; external libadwaita;
procedure adw_toast_dismiss(self: PAdwToast); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 20:09:11 ===

function ADW_TYPE_TOAST: TGType;
function ADW_TOAST(obj: Pointer): PAdwToast;
function ADW_IS_TOAST(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_TOAST: TGType;
begin
  Result := adw_toast_get_type;
end;

function ADW_TOAST(obj: Pointer): PAdwToast;
begin
  Result := PAdwToast(g_type_check_instance_cast(obj, ADW_TYPE_TOAST));
end;

function ADW_IS_TOAST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TOAST);
end;


end.
