{$IFDEF read_interface}


const
  ELDBUS_SIGNAL_HANDLER_H = 1;

function eldbus_signal_handler_add(conn: PEldbus_Connection; sender: pchar; path: pchar; iface: pchar; member: pchar;
  cb: TEldbus_Signal_Cb; cb_data: pointer): PEldbus_Signal_Handler; cdecl; external libeldbus;
function eldbus_signal_handler_ref(handler: PEldbus_Signal_Handler): PEldbus_Signal_Handler; cdecl; external libeldbus;
procedure eldbus_signal_handler_unref(handler: PEldbus_Signal_Handler); cdecl; external libeldbus;
procedure eldbus_signal_handler_del(handler: PEldbus_Signal_Handler); cdecl; external libeldbus;
function eldbus_signal_handler_match_extra_set(sh: PEldbus_Signal_Handler; args: array of const): TEina_Bool; cdecl; external libeldbus;
function eldbus_signal_handler_match_extra_set(sh: PEldbus_Signal_Handler): TEina_Bool; cdecl; external libeldbus;
function eldbus_signal_handler_match_extra_vset(sh: PEldbus_Signal_Handler; ap: Tva_list): TEina_Bool; cdecl; external libeldbus;
procedure eldbus_signal_handler_free_cb_add(handler: PEldbus_Signal_Handler; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;
procedure eldbus_signal_handler_free_cb_del(handler: PEldbus_Signal_Handler; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;
function eldbus_signal_handler_sender_get(handler: PEldbus_Signal_Handler): pchar; cdecl; external libeldbus;
function eldbus_signal_handler_path_get(handler: PEldbus_Signal_Handler): pchar; cdecl; external libeldbus;
function eldbus_signal_handler_interface_get(handler: PEldbus_Signal_Handler): pchar; cdecl; external libeldbus;
function eldbus_signal_handler_member_get(handler: PEldbus_Signal_Handler): pchar; cdecl; external libeldbus;
function eldbus_signal_handler_match_get(handler: PEldbus_Signal_Handler): pchar; cdecl; external libeldbus;
function eldbus_signal_handler_connection_get(handler: PEldbus_Signal_Handler): PEldbus_Connection; cdecl; external libeldbus;

// === Konventiert am: 10-6-25 20:13:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
