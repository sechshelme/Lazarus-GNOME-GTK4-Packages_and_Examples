{$IFDEF read_interface}


type
  PEcore_Con_Eet = ^TEcore_Con_Eet;
  TEcore_Con_Eet = TEo;

  TEcore_Con_Reply = record
  end;
  PEcore_Con_Reply = ^TEcore_Con_Reply;

type
  TEcore_Con_Eet_Data_Cb = procedure(data: pointer; reply: PEcore_Con_Reply; protocol_name: pchar; value: pointer); cdecl;
  TEcore_Con_Eet_Raw_Data_Cb = procedure(data: pointer; reply: PEcore_Con_Reply; protocol_name: pchar; section: pchar; value: pointer; length: Tsize_t); cdecl;
  TEcore_Con_Eet_Client_Cb = function(data: pointer; reply: PEcore_Con_Reply; conn: PEcore_Con_Client): TEina_Bool; cdecl;
  TEcore_Con_Eet_Server_Cb = function(data: pointer; reply: PEcore_Con_Reply; conn: PEcore_Con_Server): TEina_Bool; cdecl;

{$ifdef EFL_BETA_API_SUPPORT}
function ecore_con_eet_server_new(server: PEcore_Con_Server): PEcore_Con_Eet; cdecl; external libecore_con;
function ecore_con_eet_client_new(server: PEcore_Con_Server): PEcore_Con_Eet; cdecl; external libecore_con;
procedure ecore_con_eet_server_free(server: PEcore_Con_Eet); cdecl; external libecore_con;
procedure ecore_con_eet_register(ece: PEcore_Con_Eet; name: pchar; edd: PEet_Data_Descriptor); cdecl; external libecore_con;
procedure ecore_con_eet_data_callback_add(ece: PEcore_Con_Eet; name: pchar; func: TEcore_Con_Eet_Data_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_data_callback_del(ece: PEcore_Con_Eet; name: pchar); cdecl; external libecore_con;
procedure ecore_con_eet_raw_data_callback_add(ece: PEcore_Con_Eet; name: pchar; func: TEcore_Con_Eet_Raw_Data_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_raw_data_callback_del(ece: PEcore_Con_Eet; name: pchar); cdecl; external libecore_con;
procedure ecore_con_eet_client_connect_callback_add(ece: PEcore_Con_Eet; func: TEcore_Con_Eet_Client_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_client_connect_callback_del(ece: PEcore_Con_Eet; func: TEcore_Con_Eet_Client_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_client_disconnect_callback_add(ece: PEcore_Con_Eet; func: TEcore_Con_Eet_Client_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_client_disconnect_callback_del(ece: PEcore_Con_Eet; func: TEcore_Con_Eet_Client_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_server_connect_callback_add(ece: PEcore_Con_Eet; func: TEcore_Con_Eet_Server_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_server_connect_callback_del(ece: PEcore_Con_Eet; func: TEcore_Con_Eet_Server_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_server_disconnect_callback_add(ece: PEcore_Con_Eet; func: TEcore_Con_Eet_Server_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_server_disconnect_callback_del(ece: PEcore_Con_Eet; func: TEcore_Con_Eet_Server_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_data_set(ece: PEcore_Con_Eet; data: pointer); cdecl; external libecore_con;
function ecore_con_eet_data_get(ece: PEcore_Con_Eet): pointer; cdecl; external libecore_con;
function ecore_con_eet_reply(reply: PEcore_Con_Reply): PEcore_Con_Eet; cdecl; external libecore_con;
procedure ecore_con_eet_send(reply: PEcore_Con_Reply; protocol_name: pchar; value: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_raw_send(reply: PEcore_Con_Reply; protocol_name: pchar; section: pchar; value: pointer; length: dword); cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 17:03:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
