unit eldbus_freedesktop;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, Eldbus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ELDBUS_FREEDESKTOP_H = 1;

  ELDBUS_NAME_REQUEST_FLAG_ALLOW_REPLACEMENT = $1;
  ELDBUS_NAME_REQUEST_FLAG_REPLACE_EXISTING = $2;
  ELDBUS_NAME_REQUEST_FLAG_DO_NOT_QUEUE = $4;
  ELDBUS_NAME_REQUEST_REPLY_PRIMARY_OWNER = 1;
  ELDBUS_NAME_REQUEST_REPLY_IN_QUEUE = 2;
  ELDBUS_NAME_REQUEST_REPLY_EXISTS = 3;
  ELDBUS_NAME_REQUEST_REPLY_ALREADY_OWNER = 4;

function eldbus_name_request(conn: PEldbus_Connection; bus: pchar; flags: dword; cb: TEldbus_Message_Cb; cb_data: pointer): PEldbus_Pending; cdecl; external libeldbus;

const
  ELDBUS_NAME_RELEASE_REPLY_RELEASED = 1;
  ELDBUS_NAME_RELEASE_REPLY_NON_EXISTENT = 2;
  ELDBUS_NAME_RELEASE_REPLY_NOT_OWNER = 3;

function eldbus_name_release(conn: PEldbus_Connection; bus: pchar; cb: TEldbus_Message_Cb; cb_data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_name_owner_get(conn: PEldbus_Connection; bus: pchar; cb: TEldbus_Message_Cb; cb_data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_name_owner_has(conn: PEldbus_Connection; bus: pchar; cb: TEldbus_Message_Cb; cb_data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_names_list(conn: PEldbus_Connection; cb: TEldbus_Message_Cb; cb_data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_names_activatable_list(conn: PEldbus_Connection; cb: TEldbus_Message_Cb; cb_data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_hello(conn: PEldbus_Connection; cb: TEldbus_Message_Cb; cb_data: pointer): PEldbus_Pending; cdecl; external libeldbus;

const
  ELDBUS_NAME_START_REPLY_SUCCESS = 1;
  ELDBUS_NAME_START_REPLY_ALREADY_RUNNING = 2;

function eldbus_name_start(conn: PEldbus_Connection; bus: pchar; flags: dword; cb: TEldbus_Message_Cb; cb_data: pointer): PEldbus_Pending; cdecl; external libeldbus;

type
  TEldbus_Name_Owner_Changed_Cb = procedure(data: pointer; bus: pchar; old_id: pchar; new_id: pchar); cdecl;

procedure eldbus_name_owner_changed_callback_add(conn: PEldbus_Connection; bus: pchar; cb: TEldbus_Name_Owner_Changed_Cb; cb_data: pointer; allow_initial_call: TEina_Bool); cdecl; external libeldbus;
procedure eldbus_name_owner_changed_callback_del(conn: PEldbus_Connection; bus: pchar; cb: TEldbus_Name_Owner_Changed_Cb; cb_data: pointer); cdecl; external libeldbus;
function eldbus_object_peer_ping(obj: PEldbus_Object; cb: TEldbus_Message_Cb; data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_object_peer_machine_id_get(obj: PEldbus_Object; cb: TEldbus_Message_Cb; data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_object_introspect(obj: PEldbus_Object; cb: TEldbus_Message_Cb; data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_properties_monitor(proxy: PEldbus_Proxy; enable: TEina_Bool): TEina_Bool; cdecl; external libeldbus;
function eldbus_proxy_property_get(proxy: PEldbus_Proxy; name: pchar; cb: TEldbus_Message_Cb; data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_property_set(proxy: PEldbus_Proxy; name: pchar; sig: pchar; value: pointer; cb: TEldbus_Message_Cb;
  data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_property_value_set(proxy: PEldbus_Proxy; name: pchar; sig: pchar; value: PEina_Value; cb: TEldbus_Message_Cb;
  data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_property_get_all(proxy: PEldbus_Proxy; cb: TEldbus_Message_Cb; data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_properties_changed_callback_add(proxy: PEldbus_Proxy; cb: TEldbus_Signal_Cb; data: pointer): PEldbus_Signal_Handler; cdecl; external libeldbus;
function eldbus_proxy_property_local_get(proxy: PEldbus_Proxy; name: pchar): PEina_Value; cdecl; external libeldbus;
function eldbus_proxy_property_local_get_all(proxy: PEldbus_Proxy): PEina_Hash; cdecl; external libeldbus;
function eldbus_object_managed_objects_get(obj: PEldbus_Object; cb: TEldbus_Message_Cb; data: pointer): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_object_manager_interfaces_added(obj: PEldbus_Object; cb: TEldbus_Signal_Cb; cb_data: pointer): PEldbus_Signal_Handler; cdecl; external libeldbus;
function eldbus_object_manager_interfaces_removed(obj: PEldbus_Object; cb: TEldbus_Signal_Cb; cb_data: pointer): PEldbus_Signal_Handler; cdecl; external libeldbus;

// === Konventiert am: 11-6-25 13:09:27 ===


implementation



end.
