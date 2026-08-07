unit nm_secret_agent_old;

interface

uses
  fp_glib2, fp_nm, nm_core_types, nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SECRET_AGENT_OLD_IDENTIFIER = 'identifier';
  NM_SECRET_AGENT_OLD_AUTO_REGISTER = 'auto-register';
  NM_SECRET_AGENT_OLD_REGISTERED = 'registered';
  NM_SECRET_AGENT_OLD_CAPABILITIES = 'capabilities';
  NM_SECRET_AGENT_OLD_DBUS_CONNECTION = 'dbus-connection';

type
  PNMSecretAgentOld = ^TNMSecretAgentOld;

  TNMSecretAgentOld = record
    parent: TGObject;
  end;

  TNMSecretAgentOldGetSecretsFunc = procedure(agent: PNMSecretAgentOld; connection: PNMConnection; secrets: PGVariant; error: PGError; user_data: Tgpointer); cdecl;
  TNMSecretAgentOldSaveSecretsFunc = procedure(agent: PNMSecretAgentOld; connection: PNMConnection; error: PGError; user_data: Tgpointer); cdecl;
  TNMSecretAgentOldDeleteSecretsFunc = procedure(agent: PNMSecretAgentOld; connection: PNMConnection; error: PGError; user_data: Tgpointer); cdecl;

  PNMSecretAgentOldClass = ^TNMSecretAgentOldClass;

  TNMSecretAgentOldClass = record
    parent: TGObjectClass;
    get_secrets: procedure(self: PNMSecretAgentOld; connection: PNMConnection; connection_path: pchar; setting_name: pchar; hints: PPchar;
      flags: TNMSecretAgentGetSecretsFlags; callback: TNMSecretAgentOldGetSecretsFunc; user_data: Tgpointer); cdecl;
    cancel_get_secrets: procedure(self: PNMSecretAgentOld; connection_path: pchar; setting_name: pchar); cdecl;
    save_secrets: procedure(self: PNMSecretAgentOld; connection: PNMConnection; connection_path: pchar; callback: TNMSecretAgentOldSaveSecretsFunc; user_data: Tgpointer); cdecl;
    delete_secrets: procedure(self: PNMSecretAgentOld; connection: PNMConnection; connection_path: pchar; callback: TNMSecretAgentOldDeleteSecretsFunc; user_data: Tgpointer); cdecl;
    padding: array[0..7] of Tgpointer;
  end;

function nm_secret_agent_old_get_type: TGType; cdecl; external libnm;
function nm_secret_agent_old_get_dbus_connection(self: PNMSecretAgentOld): PGDBusConnection; cdecl; external libnm;
function nm_secret_agent_old_get_main_context(self: PNMSecretAgentOld): PGMainContext; cdecl; external libnm;
function nm_secret_agent_old_get_context_busy_watcher(self: PNMSecretAgentOld): PGObject; cdecl; external libnm;
function nm_secret_agent_old_get_dbus_name_owner(self: PNMSecretAgentOld): pchar; cdecl; external libnm;
function nm_secret_agent_old_get_registered(self: PNMSecretAgentOld): Tgboolean; cdecl; external libnm;

procedure nm_secret_agent_old_enable(self: PNMSecretAgentOld; enable: Tgboolean); cdecl; external libnm;
procedure nm_secret_agent_old_register_async(self: PNMSecretAgentOld; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_secret_agent_old_register_finish(self: PNMSecretAgentOld; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
procedure nm_secret_agent_old_destroy(self: PNMSecretAgentOld); cdecl; external libnm;

function nm_secret_agent_old_register(self: PNMSecretAgentOld; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
function nm_secret_agent_old_unregister(self: PNMSecretAgentOld; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_secret_agent_old_unregister_async(self: PNMSecretAgentOld; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm; deprecated;
function nm_secret_agent_old_unregister_finish(self: PNMSecretAgentOld; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;

procedure nm_secret_agent_old_get_secrets(self: PNMSecretAgentOld; connection: PNMConnection; setting_name: pchar; hints: PPchar; flags: TNMSecretAgentGetSecretsFlags;
  callback: TNMSecretAgentOldGetSecretsFunc; user_data: Tgpointer); cdecl; external libnm;
procedure nm_secret_agent_old_save_secrets(self: PNMSecretAgentOld; connection: PNMConnection; callback: TNMSecretAgentOldSaveSecretsFunc; user_data: Tgpointer); cdecl; external libnm;
procedure nm_secret_agent_old_delete_secrets(self: PNMSecretAgentOld; connection: PNMConnection; callback: TNMSecretAgentOldDeleteSecretsFunc; user_data: Tgpointer); cdecl; external libnm;

// === Konventiert am: 5-8-26 19:36:05 ===

function NM_TYPE_SECRET_AGENT_OLD: TGType;
function NM_SECRET_AGENT_OLD(obj: Pointer): PNMSecretAgentOld;
function NM_SECRET_AGENT_OLD_CLASS(klass: Pointer): PNMSecretAgentOldClass;
function NM_IS_SECRET_AGENT_OLD(obj: Pointer): Tgboolean;
function NM_IS_SECRET_AGENT_OLD_CLASS(klass: Pointer): Tgboolean;
function NM_SECRET_AGENT_OLD_GET_CLASS(obj: Pointer): PNMSecretAgentOldClass;

implementation

function NM_TYPE_SECRET_AGENT_OLD: TGType;
begin
  NM_TYPE_SECRET_AGENT_OLD := nm_secret_agent_old_get_type;
end;

function NM_SECRET_AGENT_OLD(obj: Pointer): PNMSecretAgentOld;
begin
  Result := PNMSecretAgentOld(g_type_check_instance_cast(obj, NM_TYPE_SECRET_AGENT_OLD));
end;

function NM_SECRET_AGENT_OLD_CLASS(klass: Pointer): PNMSecretAgentOldClass;
begin
  Result := PNMSecretAgentOldClass(g_type_check_class_cast(klass, NM_TYPE_SECRET_AGENT_OLD));
end;

function NM_IS_SECRET_AGENT_OLD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SECRET_AGENT_OLD);
end;

function NM_IS_SECRET_AGENT_OLD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SECRET_AGENT_OLD);
end;

function NM_SECRET_AGENT_OLD_GET_CLASS(obj: Pointer): PNMSecretAgentOldClass;
begin
  Result := PNMSecretAgentOldClass(PGTypeInstance(obj)^.g_class);
end;



end.
