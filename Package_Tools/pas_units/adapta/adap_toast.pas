unit adap_toast;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAdapToastPriority = ^TAdapToastPriority;
  TAdapToastPriority = longint;

const
  ADAP_TOAST_PRIORITY_NORMAL = 0;
  ADAP_TOAST_PRIORITY_HIGH = 1;

type
  TAdapToast = record
  end;
  PAdapToast = ^TAdapToast;

  TAdapToastClass = record
    parent_class: TGObjectClass;
  end;
  PAdapToastClass = ^TAdapToastClass;

function adap_toast_get_type: TGType; cdecl; external libadapta;
function adap_toast_new(title: pchar): PAdapToast; cdecl; external libadapta;
function adap_toast_new_format(format: pchar; args: array of const): PAdapToast; cdecl; external libadapta;
function adap_toast_new_format(format: pchar): PAdapToast; cdecl; external libadapta;
function adap_toast_get_title(self: PAdapToast): pchar; cdecl; external libadapta;
procedure adap_toast_set_title(self: PAdapToast; title: pchar); cdecl; external libadapta;
function adap_toast_get_button_label(self: PAdapToast): pchar; cdecl; external libadapta;
procedure adap_toast_set_button_label(self: PAdapToast; button_label: pchar); cdecl; external libadapta;
function adap_toast_get_action_name(self: PAdapToast): pchar; cdecl; external libadapta;
procedure adap_toast_set_action_name(self: PAdapToast; action_name: pchar); cdecl; external libadapta;
function adap_toast_get_action_target_value(self: PAdapToast): PGVariant; cdecl; external libadapta;
procedure adap_toast_set_action_target_value(self: PAdapToast; action_target: PGVariant); cdecl; external libadapta;
procedure adap_toast_set_action_target(self: PAdapToast; format_string: pchar; args: array of const); cdecl; external libadapta;
procedure adap_toast_set_action_target(self: PAdapToast; format_string: pchar); cdecl; external libadapta;
procedure adap_toast_set_detailed_action_name(self: PAdapToast; detailed_action_name: pchar); cdecl; external libadapta;
function adap_toast_get_priority(self: PAdapToast): TAdapToastPriority; cdecl; external libadapta;
procedure adap_toast_set_priority(self: PAdapToast; priority: TAdapToastPriority); cdecl; external libadapta;
function adap_toast_get_timeout(self: PAdapToast): Tguint; cdecl; external libadapta;
procedure adap_toast_set_timeout(self: PAdapToast; timeout: Tguint); cdecl; external libadapta;
function adap_toast_get_custom_title(self: PAdapToast): PGtkWidget; cdecl; external libadapta;
procedure adap_toast_set_custom_title(self: PAdapToast; widget: PGtkWidget); cdecl; external libadapta;
function adap_toast_get_use_markup(self: PAdapToast): Tgboolean; cdecl; external libadapta;
procedure adap_toast_set_use_markup(self: PAdapToast; use_markup: Tgboolean); cdecl; external libadapta;
procedure adap_toast_dismiss(self: PAdapToast); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:44 ===

function ADAP_TYPE_TOAST: TGType;
function ADAP_TOAST(obj: Pointer): PAdapToast;
function ADAP_IS_TOAST(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TOAST: TGType;
begin
  Result := adap_toast_get_type;
end;

function ADAP_TOAST(obj: Pointer): PAdapToast;
begin
  Result := PAdapToast(g_type_check_instance_cast(obj, ADAP_TYPE_TOAST));
end;

function ADAP_IS_TOAST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TOAST);
end;


end.
