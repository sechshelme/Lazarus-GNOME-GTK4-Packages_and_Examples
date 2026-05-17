

  {$IFDEF read_struct}
type
  Pmongoc_apm_callbacks_t = type Pointer;
  Pmongoc_apm_command_started_t = type Pointer;
  Pmongoc_apm_command_succeeded_t = type Pointer;
  Pmongoc_apm_command_failed_t = type Pointer;

  Pmongoc_apm_server_changed_t = type Pointer;
  Pmongoc_apm_server_opening_t = type Pointer;
  Pmongoc_apm_server_closed_t = type Pointer;
  Pmongoc_apm_topology_changed_t = type Pointer;
  Pmongoc_apm_topology_opening_t = type Pointer;
  Pmongoc_apm_topology_closed_t = type Pointer;
  Pmongoc_apm_server_heartbeat_started_t = type Pointer;
  Pmongoc_apm_server_heartbeat_succeeded_t = type Pointer;
  Pmongoc_apm_server_heartbeat_failed_t = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_function}
function mongoc_apm_command_started_get_command(event: Pmongoc_apm_command_started_t): Pbson_t; cdecl; external libmongoc;
function mongoc_apm_command_started_get_database_name(event: Pmongoc_apm_command_started_t): pchar; cdecl; external libmongoc;
function mongoc_apm_command_started_get_command_name(event: Pmongoc_apm_command_started_t): pchar; cdecl; external libmongoc;
function mongoc_apm_command_started_get_request_id(event: Pmongoc_apm_command_started_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_started_get_operation_id(event: Pmongoc_apm_command_started_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_started_get_host(event: Pmongoc_apm_command_started_t): Pmongoc_host_list_t; cdecl; external libmongoc;
function mongoc_apm_command_started_get_server_id(event: Pmongoc_apm_command_started_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_apm_command_started_get_service_id(event: Pmongoc_apm_command_started_t): Pbson_oid_t; cdecl; external libmongoc;
function mongoc_apm_command_started_get_server_connection_id(event: Pmongoc_apm_command_started_t): Tint32_t; cdecl; external libmongoc; deprecated;
function mongoc_apm_command_started_get_server_connection_id_int64(event: Pmongoc_apm_command_started_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_started_get_context(event: Pmongoc_apm_command_started_t): pointer; cdecl; external libmongoc;

function mongoc_apm_command_succeeded_get_duration(event: Pmongoc_apm_command_succeeded_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_reply(event: Pmongoc_apm_command_succeeded_t): Pbson_t; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_command_name(event: Pmongoc_apm_command_succeeded_t): pchar; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_request_id(event: Pmongoc_apm_command_succeeded_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_operation_id(event: Pmongoc_apm_command_succeeded_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_host(event: Pmongoc_apm_command_succeeded_t): Pmongoc_host_list_t; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_server_id(event: Pmongoc_apm_command_succeeded_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_service_id(event: Pmongoc_apm_command_succeeded_t): Pbson_oid_t; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_server_connection_id(event: Pmongoc_apm_command_succeeded_t): Tint32_t; cdecl; external libmongoc; deprecated;
function mongoc_apm_command_succeeded_get_server_connection_id_int64(event: Pmongoc_apm_command_succeeded_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_succeeded_get_context(event: Pmongoc_apm_command_succeeded_t): pointer; cdecl; external libmongoc;

function mongoc_apm_command_failed_get_duration(event: Pmongoc_apm_command_failed_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_failed_get_command_name(event: Pmongoc_apm_command_failed_t): pchar; cdecl; external libmongoc;

procedure mongoc_apm_command_failed_get_error(event: Pmongoc_apm_command_failed_t; error: Pbson_error_t); cdecl; external libmongoc;
function mongoc_apm_command_failed_get_reply(event: Pmongoc_apm_command_failed_t): Pbson_t; cdecl; external libmongoc;
function mongoc_apm_command_failed_get_request_id(event: Pmongoc_apm_command_failed_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_failed_get_operation_id(event: Pmongoc_apm_command_failed_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_failed_get_host(event: Pmongoc_apm_command_failed_t): Pmongoc_host_list_t; cdecl; external libmongoc;
function mongoc_apm_command_failed_get_server_id(event: Pmongoc_apm_command_failed_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_apm_command_failed_get_service_id(event: Pmongoc_apm_command_failed_t): Pbson_oid_t; cdecl; external libmongoc;
function mongoc_apm_command_failed_get_server_connection_id(event: Pmongoc_apm_command_failed_t): Tint32_t; cdecl; external libmongoc; deprecated;
function mongoc_apm_command_failed_get_server_connection_id_int64(event: Pmongoc_apm_command_failed_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_command_failed_get_context(event: Pmongoc_apm_command_failed_t): pointer; cdecl; external libmongoc;

function mongoc_apm_server_changed_get_host(event: Pmongoc_apm_server_changed_t): Pmongoc_host_list_t; cdecl; external libmongoc;
procedure mongoc_apm_server_changed_get_topology_id(event: Pmongoc_apm_server_changed_t; topology_id: Pbson_oid_t); cdecl; external libmongoc;
function mongoc_apm_server_changed_get_previous_description(event: Pmongoc_apm_server_changed_t): Pmongoc_server_description_t; cdecl; external libmongoc;
function mongoc_apm_server_changed_get_new_description(event: Pmongoc_apm_server_changed_t): Pmongoc_server_description_t; cdecl; external libmongoc;
function mongoc_apm_server_changed_get_context(event: Pmongoc_apm_server_changed_t): pointer; cdecl; external libmongoc;

function mongoc_apm_server_opening_get_host(event: Pmongoc_apm_server_opening_t): Pmongoc_host_list_t; cdecl; external libmongoc;
procedure mongoc_apm_server_opening_get_topology_id(event: Pmongoc_apm_server_opening_t; topology_id: Pbson_oid_t); cdecl; external libmongoc;
function mongoc_apm_server_opening_get_context(event: Pmongoc_apm_server_opening_t): pointer; cdecl; external libmongoc;

function mongoc_apm_server_closed_get_host(event: Pmongoc_apm_server_closed_t): Pmongoc_host_list_t; cdecl; external libmongoc;
procedure mongoc_apm_server_closed_get_topology_id(event: Pmongoc_apm_server_closed_t; topology_id: Pbson_oid_t); cdecl; external libmongoc;
function mongoc_apm_server_closed_get_context(event: Pmongoc_apm_server_closed_t): pointer; cdecl; external libmongoc;

procedure mongoc_apm_topology_changed_get_topology_id(event: Pmongoc_apm_topology_changed_t; topology_id: Pbson_oid_t); cdecl; external libmongoc;
function mongoc_apm_topology_changed_get_previous_description(event: Pmongoc_apm_topology_changed_t): Pmongoc_topology_description_t; cdecl; external libmongoc;
function mongoc_apm_topology_changed_get_new_description(event: Pmongoc_apm_topology_changed_t): Pmongoc_topology_description_t; cdecl; external libmongoc;
function mongoc_apm_topology_changed_get_context(event: Pmongoc_apm_topology_changed_t): pointer; cdecl; external libmongoc;

procedure mongoc_apm_topology_opening_get_topology_id(event: Pmongoc_apm_topology_opening_t; topology_id: Pbson_oid_t); cdecl; external libmongoc;
function mongoc_apm_topology_opening_get_context(event: Pmongoc_apm_topology_opening_t): pointer; cdecl; external libmongoc;

procedure mongoc_apm_topology_closed_get_topology_id(event: Pmongoc_apm_topology_closed_t; topology_id: Pbson_oid_t); cdecl; external libmongoc;
function mongoc_apm_topology_closed_get_context(event: Pmongoc_apm_topology_closed_t): pointer; cdecl; external libmongoc;

function mongoc_apm_server_heartbeat_started_get_host(event: Pmongoc_apm_server_heartbeat_started_t): Pmongoc_host_list_t; cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_started_get_context(event: Pmongoc_apm_server_heartbeat_started_t): pointer; cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_started_get_awaited(event: Pmongoc_apm_server_heartbeat_started_t): boolean; cdecl; external libmongoc;

function mongoc_apm_server_heartbeat_succeeded_get_duration(event: Pmongoc_apm_server_heartbeat_succeeded_t): Tint64_t; cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_succeeded_get_reply(event: Pmongoc_apm_server_heartbeat_succeeded_t): Pbson_t; cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_succeeded_get_host(event: Pmongoc_apm_server_heartbeat_succeeded_t): Pmongoc_host_list_t; cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_succeeded_get_context(event: Pmongoc_apm_server_heartbeat_succeeded_t): pointer; cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_succeeded_get_awaited(event: Pmongoc_apm_server_heartbeat_succeeded_t): boolean; cdecl; external libmongoc;

function mongoc_apm_server_heartbeat_failed_get_duration(event: Pmongoc_apm_server_heartbeat_failed_t): Tint64_t; cdecl; external libmongoc;
procedure mongoc_apm_server_heartbeat_failed_get_error(event: Pmongoc_apm_server_heartbeat_failed_t; error: Pbson_error_t); cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_failed_get_host(event: Pmongoc_apm_server_heartbeat_failed_t): Pmongoc_host_list_t; cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_failed_get_context(event: Pmongoc_apm_server_heartbeat_failed_t): pointer; cdecl; external libmongoc;
function mongoc_apm_server_heartbeat_failed_get_awaited(event: Pmongoc_apm_server_heartbeat_failed_t): boolean; cdecl; external libmongoc;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  Tmongoc_apm_command_started_cb_t = procedure(event: Pmongoc_apm_command_started_t); cdecl;
  Tmongoc_apm_command_succeeded_cb_t = procedure(event: Pmongoc_apm_command_succeeded_t); cdecl;
  Tmongoc_apm_command_failed_cb_t = procedure(event: Pmongoc_apm_command_failed_t); cdecl;
  Tmongoc_apm_server_changed_cb_t = procedure(event: Pmongoc_apm_server_changed_t); cdecl;
  Tmongoc_apm_server_opening_cb_t = procedure(event: Pmongoc_apm_server_opening_t); cdecl;
  Tmongoc_apm_server_closed_cb_t = procedure(event: Pmongoc_apm_server_closed_t); cdecl;
  Tmongoc_apm_topology_changed_cb_t = procedure(event: Pmongoc_apm_topology_changed_t); cdecl;
  Tmongoc_apm_topology_opening_cb_t = procedure(event: Pmongoc_apm_topology_opening_t); cdecl;
  Tmongoc_apm_topology_closed_cb_t = procedure(event: Pmongoc_apm_topology_closed_t); cdecl;
  Tmongoc_apm_server_heartbeat_started_cb_t = procedure(event: Pmongoc_apm_server_heartbeat_started_t); cdecl;
  Tmongoc_apm_server_heartbeat_succeeded_cb_t = procedure(event: Pmongoc_apm_server_heartbeat_succeeded_t); cdecl;
  Tmongoc_apm_server_heartbeat_failed_cb_t = procedure(event: Pmongoc_apm_server_heartbeat_failed_t); cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_function}
function mongoc_apm_callbacks_new: Pmongoc_apm_callbacks_t; cdecl; external libmongoc;
procedure mongoc_apm_callbacks_destroy(callbacks: Pmongoc_apm_callbacks_t); cdecl; external libmongoc;
procedure mongoc_apm_set_command_started_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_command_started_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_command_succeeded_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_command_succeeded_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_command_failed_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_command_failed_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_server_changed_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_server_changed_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_server_opening_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_server_opening_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_server_closed_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_server_closed_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_topology_changed_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_topology_changed_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_topology_opening_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_topology_opening_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_topology_closed_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_topology_closed_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_server_heartbeat_started_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_server_heartbeat_started_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_server_heartbeat_succeeded_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_server_heartbeat_succeeded_cb_t); cdecl; external libmongoc;
procedure mongoc_apm_set_server_heartbeat_failed_cb(callbacks: Pmongoc_apm_callbacks_t; cb: Tmongoc_apm_server_heartbeat_failed_cb_t); cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:16:34 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
