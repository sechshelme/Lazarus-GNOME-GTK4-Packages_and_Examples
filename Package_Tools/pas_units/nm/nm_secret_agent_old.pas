unit nm_secret_agent_old;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2010 - 2011 Red Hat, Inc.
  }
{$ifndef __NM_SECRET_AGENT_OLD_H__}
{$define __NM_SECRET_AGENT_OLD_H__}

const
  NM_SECRET_AGENT_OLD_IDENTIFIER = 'identifier';  
  NM_SECRET_AGENT_OLD_AUTO_REGISTER = 'auto-register';  
  NM_SECRET_AGENT_OLD_REGISTERED = 'registered';  
  NM_SECRET_AGENT_OLD_CAPABILITIES = 'capabilities';  
  NM_SECRET_AGENT_OLD_DBUS_CONNECTION = 'dbus-connection';  
{*
 * NMSecretAgentOld:
  }
type
  PNMSecretAgentOld = ^TNMSecretAgentOld;
  TNMSecretAgentOld = record
      parent : TGObject;
    end;
{*
 * NMSecretAgentOldGetSecretsFunc:
 * @agent: the secret agent object
 * @connection: (transfer none): the connection for which secrets were requested,
 * note that this object will be unrefed after the callback has returned, use
 * g_object_ref()/g_object_unref() if you want to use this object after the callback
 * has returned
 * @secrets: the #GVariant of type %NM_VARIANT_TYPE_CONNECTION containing the requested
 * secrets (as created by nm_connection_to_dbus() for example).  Each key in @secrets
 * should be the name of a #NMSetting object (like "802-11-wireless-security")
 * and each value should be an %NM_VARIANT_TYPE_SETTING variant.  The sub-dicts
 * map string:value, where the string is the setting property name (like "psk")
 * and the value is the secret
 * @error: if the secrets request failed, give a descriptive error here
 * @user_data: caller-specific data to be passed to the function
 *
 * Called as a result of a request by NM to retrieve secrets.  When the
 * #NMSecretAgentOld subclass has finished retrieving secrets and is ready to
 * return them, or to return an error, this function should be called with
 * those secrets or the error.
 *
 * To easily create the dictionary to return the Wi-Fi PSK, you could do
 * something like this:
 * <example>
 *  <title>Creating a secrets dictionary</title>
 *  <programlisting>
 *   NMConnection *secrets;
 *   NMSettingWirelessSecurity *s_wsec;
 *   GVariant *secrets_dict;
 *
 *   secrets = nm_simple_connection_new ();
 *   s_wsec = (NMSettingWirelessSecurity *) nm_setting_wireless_security_new ();
 *   g_object_set (G_OBJECT (s_wsec),
 *                 NM_SETTING_WIRELESS_SECURITY_PSK, "my really cool PSK",
 *                 NULL);
 *   nm_connection_add_setting (secrets, NM_SETTING (s_wsec));
 *   secrets_dict = nm_connection_to_dbus (secrets, NM_CONNECTION_SERIALIZE_ALL);
 *
 *   (call the NMSecretAgentOldGetSecretsFunc with secrets_dict)
 *
 *   g_object_unref (secrets);
 *   g_variant_unref (secrets_dict);
 *  </programlisting>
 * </example>
  }

  TNMSecretAgentOldGetSecretsFunc = procedure (agent:PNMSecretAgentOld; connection:PNMConnection; secrets:PGVariant; error:PGError; user_data:Tgpointer);cdecl;
{*
 * NMSecretAgentOldSaveSecretsFunc:
 * @agent: the secret agent object
 * @connection: (transfer none): the connection for which secrets were to be saved,
 * note that this object will be unrefed after the callback has returned, use
 * g_object_ref()/g_object_unref() if you want to use this object after the callback
 * has returned
 * @error: if the saving secrets failed, give a descriptive error here
 * @user_data: caller-specific data to be passed to the function
 *
 * Called as a result of a request by NM to save secrets.  When the
 * #NMSecretAgentOld subclass has finished saving the secrets, this function
 * should be called.
  }

  TNMSecretAgentOldSaveSecretsFunc = procedure (agent:PNMSecretAgentOld; connection:PNMConnection; error:PGError; user_data:Tgpointer);cdecl;
{*
 * NMSecretAgentOldDeleteSecretsFunc:
 * @agent: the secret agent object
 * @connection: (transfer none): the connection for which secrets were to be deleted,
 * note that this object will be unrefed after the callback has returned, use
 * g_object_ref()/g_object_unref() if you want to use this object after the callback
 * has returned
 * @error: if the deleting secrets failed, give a descriptive error here
 * @user_data: caller-specific data to be passed to the function
 *
 * Called as a result of a request by NM to delete secrets.  When the
 * #NMSecretAgentOld subclass has finished deleting the secrets, this function
 * should be called.
  }

  TNMSecretAgentOldDeleteSecretsFunc = procedure (agent:PNMSecretAgentOld; connection:PNMConnection; error:PGError; user_data:Tgpointer);cdecl;
{ Virtual methods for subclasses  }
{ Called when the subclass should retrieve and return secrets.  Subclass
     * must copy or reference any arguments it may require after returning from
     * this method, as the arguments will freed (except for 'self', 'callback',
     * and 'user_data' of course).
     *
     * Before version 1.24, if the request is canceled, the callback
     * should still be called, but with the NM_SECRET_AGENT_ERROR_AGENT_CANCELED
     * error. Since 1.24, invoking the callback has no effect during cancellation
     * and may be omitted.
      }
{ Called when the subclass should cancel an outstanding request to
     * get secrets for a given connection.
     *
     * Before version 1.24, canceling the request MUST call the callback that was
     * passed along with the initial get_secrets call, sending the NM_SECRET_AGENT_ERROR/
     * NM_SECRET_AGENT_ERROR_AGENT_CANCELED error to that callback. Since 1.24,
     * the get_secrets callback will be ignored during cancellation and may be omitted.
      }
{ Called when the subclass should save the secrets contained in the
     * connection to backing storage.  Subclass must copy or reference any
     * arguments it may require after returning from this method, as the
     * arguments will freed (except for 'self', 'callback', and 'user_data'
     * of course).
      }
{ Called when the subclass should delete the secrets contained in the
     * connection from backing storage.  Subclass must copy or reference any
     * arguments it may require after returning from this method, as the
     * arguments will freed (except for 'self', 'callback', and 'user_data'
     * of course).
      }
{< private > }

  PNMSecretAgentOldClass = ^TNMSecretAgentOldClass;
  TNMSecretAgentOldClass = record
      parent : TGObjectClass;
      get_secrets : procedure (self:PNMSecretAgentOld; connection:PNMConnection; connection_path:Pchar; setting_name:Pchar; hints:PPchar; 
                    flags:TNMSecretAgentGetSecretsFlags; callback:TNMSecretAgentOldGetSecretsFunc; user_data:Tgpointer);cdecl;
      cancel_get_secrets : procedure (self:PNMSecretAgentOld; connection_path:Pchar; setting_name:Pchar);cdecl;
      save_secrets : procedure (self:PNMSecretAgentOld; connection:PNMConnection; connection_path:Pchar; callback:TNMSecretAgentOldSaveSecretsFunc; user_data:Tgpointer);cdecl;
      delete_secrets : procedure (self:PNMSecretAgentOld; connection:PNMConnection; connection_path:Pchar; callback:TNMSecretAgentOldDeleteSecretsFunc; user_data:Tgpointer);cdecl;
      padding : array[0..7] of Tgpointer;
    end;

function nm_secret_agent_old_get_type:TGType;cdecl;external libnm;
function nm_secret_agent_old_get_dbus_connection(self:PNMSecretAgentOld):PGDBusConnection;cdecl;external libnm;
function nm_secret_agent_old_get_main_context(self:PNMSecretAgentOld):PGMainContext;cdecl;external libnm;
function nm_secret_agent_old_get_context_busy_watcher(self:PNMSecretAgentOld):PGObject;cdecl;external libnm;
function nm_secret_agent_old_get_dbus_name_owner(self:PNMSecretAgentOld):Pchar;cdecl;external libnm;
function nm_secret_agent_old_get_registered(self:PNMSecretAgentOld):Tgboolean;cdecl;external libnm;
{*************************************************************************** }
procedure nm_secret_agent_old_enable(self:PNMSecretAgentOld; enable:Tgboolean);cdecl;external libnm;
procedure nm_secret_agent_old_register_async(self:PNMSecretAgentOld; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libnm;
function nm_secret_agent_old_register_finish(self:PNMSecretAgentOld; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libnm;
procedure nm_secret_agent_old_destroy(self:PNMSecretAgentOld);cdecl;external libnm;
{*************************************************************************** }
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_secret_agent_old_enable) }
function nm_secret_agent_old_register(self:PNMSecretAgentOld; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_secret_agent_old_enable) }
function nm_secret_agent_old_unregister(self:PNMSecretAgentOld; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_secret_agent_old_enable) }
procedure nm_secret_agent_old_unregister_async(self:PNMSecretAgentOld; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_secret_agent_old_enable) }
function nm_secret_agent_old_unregister_finish(self:PNMSecretAgentOld; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libnm;
{*************************************************************************** }
procedure nm_secret_agent_old_get_secrets(self:PNMSecretAgentOld; connection:PNMConnection; setting_name:Pchar; hints:PPchar; flags:TNMSecretAgentGetSecretsFlags; 
            callback:TNMSecretAgentOldGetSecretsFunc; user_data:Tgpointer);cdecl;external libnm;
procedure nm_secret_agent_old_save_secrets(self:PNMSecretAgentOld; connection:PNMConnection; callback:TNMSecretAgentOldSaveSecretsFunc; user_data:Tgpointer);cdecl;external libnm;
procedure nm_secret_agent_old_delete_secrets(self:PNMSecretAgentOld; connection:PNMConnection; callback:TNMSecretAgentOldDeleteSecretsFunc; user_data:Tgpointer);cdecl;external libnm;
{$endif}
{ __NM_SECRET_AGENT_OLD_H__  }

// === Konventiert am: 19-4-26 19:28:26 ===

function NM_TYPE_SECRET_AGENT_OLD : TGType;
function NM_SECRET_AGENT_OLD(obj : Pointer) : PNMSecretAgentOld;
function NM_SECRET_AGENT_OLD_CLASS(klass : Pointer) : PNMSecretAgentOldClass;
function NM_IS_SECRET_AGENT_OLD(obj : Pointer) : Tgboolean;
function NM_IS_SECRET_AGENT_OLD_CLASS(klass : Pointer) : Tgboolean;
function NM_SECRET_AGENT_OLD_GET_CLASS(obj : Pointer) : PNMSecretAgentOldClass;

implementation

function NM_TYPE_SECRET_AGENT_OLD : TGType;
  begin
    NM_TYPE_SECRET_AGENT_OLD:=nm_secret_agent_old_get_type;
  end;

function NM_SECRET_AGENT_OLD(obj : Pointer) : PNMSecretAgentOld;
begin
  Result := PNMSecretAgentOld(g_type_check_instance_cast(obj, NM_TYPE_SECRET_AGENT_OLD));
end;

function NM_SECRET_AGENT_OLD_CLASS(klass : Pointer) : PNMSecretAgentOldClass;
begin
  Result := PNMSecretAgentOldClass(g_type_check_class_cast(klass, NM_TYPE_SECRET_AGENT_OLD));
end;

function NM_IS_SECRET_AGENT_OLD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SECRET_AGENT_OLD);
end;

function NM_IS_SECRET_AGENT_OLD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SECRET_AGENT_OLD);
end;

function NM_SECRET_AGENT_OLD_GET_CLASS(obj : Pointer) : PNMSecretAgentOldClass;
begin
  Result := PNMSecretAgentOldClass(PGTypeInstance(obj)^.g_class);
end;



end.
