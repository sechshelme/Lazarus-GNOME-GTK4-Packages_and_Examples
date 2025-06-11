{$IFDEF read_interface}


const
  ELDBUS_CONNECTION_H = 1;

type
  PEldbus_Connection_Type = ^TEldbus_Connection_Type;
  TEldbus_Connection_Type = longint;

const
  ELDBUS_CONNECTION_TYPE_UNKNOWN = 0;
  ELDBUS_CONNECTION_TYPE_SESSION = 1;
  ELDBUS_CONNECTION_TYPE_SYSTEM = 2;
  ELDBUS_CONNECTION_TYPE_STARTER = 3;
  ELDBUS_CONNECTION_TYPE_ADDRESS = 4;
  ELDBUS_CONNECTION_TYPE_LAST = 5;

const
  ELDBUS_TIMEOUT_INFINITE = longint($7fffffff);

function eldbus_connection_get(_type: TEldbus_Connection_Type): PEldbus_Connection; cdecl; external libeldbus;
function eldbus_private_connection_get(_type: TEldbus_Connection_Type): PEldbus_Connection; cdecl; external libeldbus;
function eldbus_address_connection_get(address: pchar): PEldbus_Connection; cdecl; external libeldbus;
function eldbus_private_address_connection_get(address: pchar): PEldbus_Connection; cdecl; external libeldbus;
function eldbus_connection_ref(conn: PEldbus_Connection): PEldbus_Connection; cdecl; external libeldbus;
procedure eldbus_connection_unref(conn: PEldbus_Connection); cdecl; external libeldbus;
procedure eldbus_connection_free_cb_add(conn: PEldbus_Connection; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;
procedure eldbus_connection_free_cb_del(conn: PEldbus_Connection; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;
procedure eldbus_connection_data_set(conn: PEldbus_Connection; key: pchar; data: pointer); cdecl; external libeldbus;
function eldbus_connection_data_get(conn: PEldbus_Connection; key: pchar): pointer; cdecl; external libeldbus;
function eldbus_connection_data_del(conn: PEldbus_Connection; key: pchar): pointer; cdecl; external libeldbus;

type
  PEldbus_Connection_Event_Type = ^TEldbus_Connection_Event_Type;
  TEldbus_Connection_Event_Type = longint;

const
  ELDBUS_CONNECTION_EVENT_DEL = 0;
  ELDBUS_CONNECTION_EVENT_DISCONNECTED = 1;
  ELDBUS_CONNECTION_EVENT_LAST = 2;

type
  TEldbus_Connection_Event_Cb = procedure(data: pointer; conn: PEldbus_Connection; event_info: pointer); cdecl;

procedure eldbus_connection_event_callback_add(conn: PEldbus_Connection; _type: TEldbus_Connection_Event_Type; cb: TEldbus_Connection_Event_Cb; cb_data: pointer); cdecl; external libeldbus;
procedure eldbus_connection_event_callback_del(conn: PEldbus_Connection; _type: TEldbus_Connection_Event_Type; cb: TEldbus_Connection_Event_Cb; cb_data: pointer); cdecl; external libeldbus;
function eldbus_connection_send(conn: PEldbus_Connection; msg: PEldbus_Message; cb: TEldbus_Message_Cb; cb_data: pointer; timeout: double): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_connection_unique_name_get(conn: PEldbus_Connection): pchar; cdecl; external libeldbus;

// === Konventiert am: 10-6-25 20:00:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
