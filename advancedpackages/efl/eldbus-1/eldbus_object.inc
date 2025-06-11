{$IFDEF read_interface}


const
  ELDBUS_OBJECT_H = 1;

function eldbus_object_get(conn: PEldbus_Connection; bus: pchar; path: pchar): PEldbus_Object; cdecl; external libeldbus;
function eldbus_object_ref(obj: PEldbus_Object): PEldbus_Object; cdecl; external libeldbus;
procedure eldbus_object_unref(obj: PEldbus_Object); cdecl; external libeldbus;
procedure eldbus_object_free_cb_add(obj: PEldbus_Object; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;
procedure eldbus_object_free_cb_del(obj: PEldbus_Object; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;

type
  PEldbus_Object_Event_Type = ^TEldbus_Object_Event_Type;
  TEldbus_Object_Event_Type = longint;

const
  ELDBUS_OBJECT_EVENT_IFACE_ADDED = 0;
  ELDBUS_OBJECT_EVENT_IFACE_REMOVED = 1;
  ELDBUS_OBJECT_EVENT_PROPERTY_CHANGED = 2;
  ELDBUS_OBJECT_EVENT_PROPERTY_REMOVED = 3;
  ELDBUS_OBJECT_EVENT_DEL = 4;
  ELDBUS_OBJECT_EVENT_LAST = 5;

type
  TEldbus_Object_Event_Interface_Added = record
    iface: pchar;
    proxy: PEldbus_Proxy;
  end;
  PEldbus_Object_Event_Interface_Added = ^TEldbus_Object_Event_Interface_Added;

  TEldbus_Object_Event_Interface_Removed = record
    iface: pchar;
  end;
  PEldbus_Object_Event_Interface_Removed = ^TEldbus_Object_Event_Interface_Removed;

  TEldbus_Object_Event_Property_Changed = record
    iface: pchar;
    proxy: PEldbus_Proxy;
    name: pchar;
    value: PEina_Value;
  end;
  PEldbus_Object_Event_Property_Changed = ^TEldbus_Object_Event_Property_Changed;

  TEldbus_Object_Event_Property_Removed = record
    iface: pchar;
    proxy: PEldbus_Proxy;
    name: pchar;
  end;
  PEldbus_Object_Event_Property_Removed = ^TEldbus_Object_Event_Property_Removed;

  TEldbus_Object_Event_Cb = procedure(data: pointer; obj: PEldbus_Object; event_info: pointer); cdecl;

procedure eldbus_object_event_callback_add(obj: PEldbus_Object; _type: TEldbus_Object_Event_Type; cb: TEldbus_Object_Event_Cb; cb_data: pointer); cdecl; external libeldbus;
procedure eldbus_object_event_callback_del(obj: PEldbus_Object; _type: TEldbus_Object_Event_Type; cb: TEldbus_Object_Event_Cb; cb_data: pointer); cdecl; external libeldbus;
function eldbus_object_connection_get(obj: PEldbus_Object): PEldbus_Connection; cdecl; external libeldbus;
function eldbus_object_bus_name_get(obj: PEldbus_Object): pchar; cdecl; external libeldbus;
function eldbus_object_path_get(obj: PEldbus_Object): pchar; cdecl; external libeldbus;
function eldbus_object_send(obj: PEldbus_Object; msg: PEldbus_Message; cb: TEldbus_Message_Cb; cb_data: pointer; timeout: double): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_object_signal_handler_add(obj: PEldbus_Object; iface: pchar; member: pchar; cb: TEldbus_Signal_Cb; cb_data: pointer): PEldbus_Signal_Handler; cdecl; external libeldbus;
function eldbus_object_method_call_new(obj: PEldbus_Object; iface: pchar; member: pchar): PEldbus_Message; cdecl; external libeldbus;

// === Konventiert am: 10-6-25 19:55:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
