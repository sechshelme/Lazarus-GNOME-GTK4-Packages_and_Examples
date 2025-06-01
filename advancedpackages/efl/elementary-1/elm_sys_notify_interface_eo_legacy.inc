{$IFDEF read_interface}


procedure elm_sys_notify_interface_send(obj: PElm_Sys_Notify_Interface; replaces_id: dword; icon: pchar; summary: pchar; body: pchar;
  urgency: TElm_Sys_Notify_Urgency; timeout: longint; cb: TElm_Sys_Notify_Send_Cb; cb_data: pointer); cdecl; external libelementary;
procedure elm_sys_notify_interface_simple_send(obj: PElm_Sys_Notify_Interface; icon: pchar; summary: pchar; body: pchar); cdecl; external libelementary;
procedure elm_sys_notify_interface_close(obj: PElm_Sys_Notify_Interface; id: dword); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
