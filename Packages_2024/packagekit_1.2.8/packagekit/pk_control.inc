{$IFDEF read_interface}


type
  PPkControlError = ^TPkControlError;
  TPkControlError = longint;
const
  PK_CONTROL_ERROR_FAILED = 0;
  PK_CONTROL_ERROR_CANNOT_START_DAEMON = 1;

type
  PPkControlPrivate = type Pointer;

  PPkControl = ^TPkControl;
  TPkControl = record
    parent: TGObject;
    priv: PPkControlPrivate;
  end;

  PPkControlClass = ^TPkControlClass;
  TPkControlClass = record
    parent_class: TGObjectClass;
    transaction_list_changed: procedure(control: PPkControl; transaction_ids: PPgchar); cdecl;
    updates_changed: procedure(control: PPkControl); cdecl;
    repo_list_changed: procedure(control: PPkControl); cdecl;
    network_state_changed: procedure(control: PPkControl); cdecl;
    restart_schedule: procedure(control: PPkControl); cdecl;
    locked: procedure(control: PPkControl; is_locked: Tgboolean); cdecl;
    connection_changed: procedure(control: PPkControl; connected: Tgboolean); cdecl;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;


function pk_control_error_quark: TGQuark; cdecl; external libpackagekit;
function pk_control_get_type: TGType; cdecl; external libpackagekit;
function pk_control_new: PPkControl; cdecl; external libpackagekit;
procedure pk_control_get_tid_async(control: PPkControl; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_control_get_tid_finish(control: PPkControl; res: PGAsyncResult; error: PPGError): Pgchar; cdecl; external libpackagekit;
procedure pk_control_suggest_daemon_quit_async(control: PPkControl; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_control_suggest_daemon_quit_finish(control: PPkControl; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libpackagekit;
procedure pk_control_get_daemon_state_async(control: PPkControl; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_control_get_daemon_state_finish(control: PPkControl; res: PGAsyncResult; error: PPGError): Pgchar; cdecl; external libpackagekit;
procedure pk_control_set_proxy_async(control: PPkControl; proxy_http: Pgchar; proxy_ftp: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_control_set_proxy2_async(control: PPkControl; proxy_http: Pgchar; proxy_https: Pgchar; proxy_ftp: Pgchar; proxy_socks: Pgchar;
  no_proxy: Pgchar; pac: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_control_set_proxy_finish(control: PPkControl; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libpackagekit;
procedure pk_control_get_time_since_action_async(control: PPkControl; role: TPkRoleEnum; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_control_get_time_since_action_finish(control: PPkControl; res: PGAsyncResult; error: PPGError): Tguint; cdecl; external libpackagekit;
procedure pk_control_get_transaction_list_async(control: PPkControl; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_control_get_transaction_list_finish(control: PPkControl; res: PGAsyncResult; error: PPGError): PPgchar; cdecl; external libpackagekit;
procedure pk_control_can_authorize_async(control: PPkControl; action_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_control_can_authorize_finish(control: PPkControl; res: PGAsyncResult; error: PPGError): TPkAuthorizeEnum; cdecl; external libpackagekit;
procedure pk_control_get_properties_async(control: PPkControl; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_control_get_properties_finish(control: PPkControl; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libpackagekit;

function PK_CONTROL_ERROR: TGQuark;

// === Konventiert am: 7-9-26 15:03:46 ===

function PK_TYPE_CONTROL: TGType;
function PK_CONTROL(obj: Pointer): PPkControl;
function PK_CONTROL_CLASS(klass: Pointer): PPkControlClass;
function PK_IS_CONTROL(obj: Pointer): Tgboolean;
function PK_IS_CONTROL_CLASS(klass: Pointer): Tgboolean;
function PK_CONTROL_GET_CLASS(obj: Pointer): PPkControlClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_CONTROL: TGType;
begin
  PK_TYPE_CONTROL := pk_control_get_type;
end;

function PK_CONTROL(obj: Pointer): PPkControl;
begin
  Result := PPkControl(g_type_check_instance_cast(obj, PK_TYPE_CONTROL));
end;

function PK_CONTROL_CLASS(klass: Pointer): PPkControlClass;
begin
  Result := PPkControlClass(g_type_check_class_cast(klass, PK_TYPE_CONTROL));
end;

function PK_IS_CONTROL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_CONTROL);
end;

function PK_IS_CONTROL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_CONTROL);
end;

function PK_CONTROL_GET_CLASS(obj: Pointer): PPkControlClass;
begin
  Result := PPkControlClass(PGTypeInstance(obj)^.g_class);
end;


function PK_CONTROL_ERROR: TGQuark;
begin
  PK_CONTROL_ERROR := pk_control_error_quark;
end;

{$ENDIF read_implementation}
