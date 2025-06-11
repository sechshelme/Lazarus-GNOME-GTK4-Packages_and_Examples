{$IFDEF read_interface}


const
  ELDBUS_PROXY_H = 1;

function eldbus_proxy_get(obj: PEldbus_Object; iface: pchar): PEldbus_Proxy; cdecl; external libeldbus;
function eldbus_proxy_ref(proxy: PEldbus_Proxy): PEldbus_Proxy; cdecl; external libeldbus;
procedure eldbus_proxy_unref(proxy: PEldbus_Proxy); cdecl; external libeldbus;
function eldbus_proxy_object_get(proxy: PEldbus_Proxy): PEldbus_Object; cdecl; external libeldbus;
function eldbus_proxy_interface_get(proxy: PEldbus_Proxy): pchar; cdecl; external libeldbus;
procedure eldbus_proxy_data_set(proxy: PEldbus_Proxy; key: pchar; data: pointer); cdecl; external libeldbus;
function eldbus_proxy_data_get(proxy: PEldbus_Proxy; key: pchar): pointer; cdecl; external libeldbus;
function eldbus_proxy_data_del(proxy: PEldbus_Proxy; key: pchar): pointer; cdecl; external libeldbus;
procedure eldbus_proxy_free_cb_add(proxy: PEldbus_Proxy; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;
procedure eldbus_proxy_free_cb_del(proxy: PEldbus_Proxy; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;
function eldbus_proxy_method_call_new(proxy: PEldbus_Proxy; member: pchar): PEldbus_Message; cdecl; external libeldbus;
function eldbus_proxy_send(proxy: PEldbus_Proxy; msg: PEldbus_Message; cb: TEldbus_Message_Cb; cb_data: pointer; timeout: double): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_send_and_block(proxy: PEldbus_Proxy; msg: PEldbus_Message; timeout: double): PEldbus_Message; cdecl; external libeldbus;
function eldbus_proxy_call(proxy: PEldbus_Proxy; member: pchar; cb: TEldbus_Message_Cb; cb_data: pointer; timeout: double;
  signature: pchar; args: array of const): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_call(proxy: PEldbus_Proxy; member: pchar; cb: TEldbus_Message_Cb; cb_data: pointer; timeout: double;
  signature: pchar): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_vcall(proxy: PEldbus_Proxy; member: pchar; cb: TEldbus_Message_Cb; cb_data: pointer; timeout: double;
  signature: pchar; ap: Tva_list): PEldbus_Pending; cdecl; external libeldbus;
function eldbus_proxy_signal_handler_add(proxy: PEldbus_Proxy; member: pchar; cb: TEldbus_Signal_Cb; cb_data: pointer): PEldbus_Signal_Handler; cdecl; external libeldbus;

type
  PEldbus_Proxy_Event_Type = ^TEldbus_Proxy_Event_Type;
  TEldbus_Proxy_Event_Type = longint;

const
  ELDBUS_PROXY_EVENT_PROPERTY_CHANGED = 0;
  ELDBUS_PROXY_EVENT_PROPERTY_REMOVED = 1;
  ELDBUS_PROXY_EVENT_DEL = 2;
  ELDBUS_PROXY_EVENT_PROPERTY_LOADED = 3;
  ELDBUS_PROXY_EVENT_LAST = 4;

type
  TEldbus_Proxy_Event_Property_Changed = record
    name: pchar;
    proxy: PEldbus_Proxy;
    value: PEina_Value;
  end;
  PEldbus_Proxy_Event_Property_Changed = ^TEldbus_Proxy_Event_Property_Changed;

  TEldbus_Proxy_Event_Property_Loaded = record
    proxy: PEldbus_Proxy;
  end;
  PEldbus_Proxy_Event_Property_Loaded = ^TEldbus_Proxy_Event_Property_Loaded;

  TEldbus_Proxy_Event_Property_Removed = record
    iface: pchar;
    proxy: PEldbus_Proxy;
    name: pchar;
  end;
  PEldbus_Proxy_Event_Property_Removed = ^TEldbus_Proxy_Event_Property_Removed;

  TEldbus_Proxy_Event_Cb = procedure(data: pointer; proxy: PEldbus_Proxy; event_info: pointer); cdecl;

procedure eldbus_proxy_event_callback_add(proxy: PEldbus_Proxy; _type: TEldbus_Proxy_Event_Type; cb: TEldbus_Proxy_Event_Cb; cb_data: pointer); cdecl; external libeldbus;
procedure eldbus_proxy_event_callback_del(proxy: PEldbus_Proxy; _type: TEldbus_Proxy_Event_Type; cb: TEldbus_Proxy_Event_Cb; cb_data: pointer); cdecl; external libeldbus;

// === Konventiert am: 10-6-25 19:52:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
